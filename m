From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Thu, 31 Jul 2014 11:12:47 +0200
Subject: [Buildroot] [PATCH V7 1/1] google-breakpad: Integration into
 Makefile and Config.in
In-Reply-To: <20140729230335.GD5846@free.fr>
References: <1406124545-17915-1-git-send-email-pascal.huerst@gmail.com>
 <1406124545-17915-2-git-send-email-pascal.huerst@gmail.com>
 <20140729230335.GD5846@free.fr>
Message-ID: <53DA088F.3020608@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann, all,

On 30.07.2014 01:03, Yann E. MORIN wrote:
> On 2014-07-23 16:09 +0200, Pascal Huerst spake thusly:
> I'll be shepherding this patch, since it still needs a bit of work.

Thanks a lot, people seem to have quite different opinions and sometimes
I don't understand why one solution is so much better than an other one...

> For example, there is no host package for google breakpad, so it does
> not work for me as I do not have googlebreakpad install on my host.

I thought it has, since in google-breakpad.mk it says:

26 $(eval $(host-autotools-package))

and in my current version I have at least:

output/host/usr/bin/minidump-2-core
output/host/usr/bin/minidump_dump
output/host/usr/bin/minidump_stackwalk
output/host/usr/bin/minidump_upload

I only need minidump_stackwalk, to process minidumps. So that looked ok
to me.

> Also, I now know why you need this eval in the script. I do not like it,
> so I'll try to come up with an alternative solution. Still, I have one
> question: do you expect that one would enter shell wildcards in the list
> of files to "breakpadize"?

Originally I wanted to be able to use wildcards and took the stripping
mechanism (BR2_STRIP_EXCLUDE_FILES) as an example, but people didn't
like it, so I adapted it. But actually I would say it's better to be
able to use wildcards.

We are not using breakpad in production yet, but are integrating and
maybe we'll find out later, that wildcards are useless, but for now, I
would say, why not...

I also found out that `make install` does not install the headers and
*.pc files. I'm in contact with the folks from breakpad to get this
fixed. But this means that a version boost will also be needed as soon
as that patch is upstream.

regards
pascal


> It's a bit late here, now, so I'll continue tomorrow evening (GMT+2).
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  Config.in                                  | 28 ++++++++++++++++++++++++++++
>>  package/google-breakpad/gen-syms.sh        | 25 +++++++++++++++++++++++++
>>  package/google-breakpad/google-breakpad.mk |  8 ++++++++
>>  3 files changed, 61 insertions(+)
>>  create mode 100755 package/google-breakpad/gen-syms.sh
>>
>> diff --git a/Config.in b/Config.in
>> index b169678..432ec28 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -484,6 +484,34 @@ config BR2_OPTIMIZE_S
>>  
>>  endchoice
>>  
>> +config BR2_GOOGLE_BREAKPAD_ENABLE
>> +	bool "Enable google-breakpad support"
>> +	select BR2_PACKAGE_GOOGLE_BREAKPAD
>> +	help
>> +	  This option will enable the use of google breakpad, a library and tool
>> +	  suite that allows you to distribute an application to users with
>> +	  compiler-provided debugging information removed, record crashes in
>> +	  compact "minidump" files, send them back to your server and produce
>> +	  C and C++ stack traces from these minidumps.  Breakpad can also write
>> +	  minidumps on request for programs that have not crashed.
>> +
>> +if BR2_GOOGLE_BREAKPAD_ENABLE
>> +
>> +config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
>> +	string "List of executables and libraries to extract symbols from"
>> +	default ""
>> +	help
>> +	  You may specify a space-separated list of binaries and libraries
>> +	  with full paths relative to $(TARGET_DIR) of which debug symbols 
>> +	  will be dumped for further use with google breakpad.
>> +
>> +	  A directory structure that can be used by minidump-stackwalk will
>> +	  be created at:
>> +
>> +	  $(STAGING_DIR)/usr/share/google-breakpad-symbols
>> +
>> +endif
>> +
>>  config BR2_ENABLE_SSP
>>  	bool "build code with Stack Smashing Protection"
>>  	depends on BR2_TOOLCHAIN_HAS_SSP
>> diff --git a/package/google-breakpad/gen-syms.sh b/package/google-breakpad/gen-syms.sh
>> new file mode 100755
>> index 0000000..f29c8fe
>> --- /dev/null
>> +++ b/package/google-breakpad/gen-syms.sh
>> @@ -0,0 +1,25 @@
>> +#!/bin/sh
>> +STAGING_DIR="${1}"
>> +TARGET_DIR="${2}"
>> +shift 2
>> +
>> +SYMBOLS_DIR="${STAGING_DIR}/usr/share/google-breakpad-symbols"
>> +rm -rf "${SYMBOLS_DIR}"
>> +mkdir -p "${SYMBOLS_DIR}"
>> +
>> +for FILE in $(eval ls "${TARGET_DIR}/${@}"); do
>> +	if [ -d "${FILE}" ]; then
>> +		printf "Error: '%s' is a directory\n" "${FILE}" >&2
>> +		exit 1
>> +	fi
>> +	if dump_syms "${FILE}" > "${SYMBOLS_DIR}/tmp.sym" 2>/dev/null; then
>> +		HASH=$(head -n1 "${SYMBOLS_DIR}/tmp.sym" | cut -d ' ' -f 4);
>> +		FILENAME=$(basename "$FILE");
>> +		mkdir -p "${SYMBOLS_DIR}/${FILENAME}/${HASH}"
>> +		mv "${SYMBOLS_DIR}/tmp.sym" "${SYMBOLS_DIR}/${FILENAME}/${HASH}/${FILENAME}.sym";
>> +	else
>> +		printf "Error dumping symbols for: '%s'\n" "${FILE}" >&2
>> +		exit 1
>> +	fi
>> +done
>> +rm -rf "${SYMBOLS_DIR}/tmp"
>> diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
>> index bf857ba..8dea916 100644
>> --- a/package/google-breakpad/google-breakpad.mk
>> +++ b/package/google-breakpad/google-breakpad.mk
>> @@ -14,5 +14,13 @@ GOOGLE_BREAKPAD_INSTALL_STAGING = YES
>>  GOOGLE_BREAKPAD_LICENSE = BSD-3c
>>  GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
>>  
>> +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
>> +define GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
>> +	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
>> +		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
>> +endef
>> +TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
>> +endif
>> +
>>  $(eval $(autotools-package))
>>  $(eval $(host-autotools-package))
>> -- 
>> 1.9.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
