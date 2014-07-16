From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 16 Jul 2014 10:49:05 +0200
Subject: [Buildroot] [PATCH 1/1] google-breakpad: Integration into
 Makefile and Config.in
In-Reply-To: <20140715205659.GH3351@free.fr>
References: <1405418443-29638-1-git-send-email-pascal.huerst@gmail.com>
 <1405418443-29638-2-git-send-email-pascal.huerst@gmail.com>
 <20140715205659.GH3351@free.fr>
Message-ID: <53C63C81.7000305@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann, all,

On 15.07.2014 22:57, Yann E. MORIN wrote:
> Pascal, All,
> 
> On 2014-07-15 12:00 +0200, Pascal Huerst spake thusly:
>> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
>> ---
>>  Config.in                                  | 28 ++++++++++++++++++++++++++++
>>  package/google-breakpad/gen-syms.sh        | 25 +++++++++++++++++++++++++
>>  package/google-breakpad/google-breakpad.mk |  8 ++++++++
>>  3 files changed, 61 insertions(+)
>>  create mode 100755 package/google-breakpad/gen-syms.sh
>>
> [--SNIP--]
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
> 
> Why do you use eval here?

If I remove eval it does not work, but I don't know why?

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
>> index bf857ba..622f7a6 100644
>> --- a/package/google-breakpad/google-breakpad.mk
>> +++ b/package/google-breakpad/google-breakpad.mk
>> @@ -14,5 +14,13 @@ GOOGLE_BREAKPAD_INSTALL_STAGING = YES
>>  GOOGLE_BREAKPAD_LICENSE = BSD-3c
>>  GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
>>  
>> +#ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
> 
> Did you forget to un-comment this line?

Oh... you're right, fixed that.

>> +define GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
>> +	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
>> +		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
>> +endef
>> +TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
>> +#endif
> 
> Ditto.

yes, again!

> Regards,
> Yann E. MORIN.
> 
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
