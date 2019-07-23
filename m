From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Jul 2019 19:26:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: bump version to 4.90
References: <20180127225123.28166-1-bernd.kuhls@t-online.de>
 <20180127225123.28166-2-bernd.kuhls@t-online.de>
 <20180129232524.5fadcbd8@windsurf.lan>
Message-ID: <jisj0gxhh6.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Mon, 29 Jan 2018 23:25:24 +0100 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sat, 27 Jan 2018 23:51:23 +0100, Bernd Kuhls wrote:
> 
>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> -EXIM_DEPENDENCIES += openssl
>> +EXIM_DEPENDENCIES += host-openssl openssl
> 
> This looks suspicious. Why are you bringing host-openssl when target
> OpenSSL support is enabled ? Is the OpenSSL support in the macro_predef
> program needed for target SSL support to work ? What does OpenSSL
> support in macro_predef actually brings ?

If you try to build exim with this defconfig

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_EXIM=y

without the buildroot package host-openssl and without a libssl-dev 
package installed on your host machine the exim build will fail:

/usr/bin/gcc -DMACRO_PREDEF macro_predef.c
In file included from hash.h:14,
                 from exim.h:485,
                 from macro_predef.c:11:
sha_ver.h:37:12: fatal error: openssl/ssl.h: No such file or directory

because macro_predef also has the an optional dependency on openssl:
https://github.com/Exim/exim/blob/exim-4.92%2Bfixes/src/src/
macro_predef.c#L130

>> +# We need the host version of macro_predef during the build, before
>> +# building it we need to prepare the makefile.
>>  # "The -j (parallel) flag must not be used with make"
>>  # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
>>  define EXIM_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) makefile
>> +	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
>> +		CC=$(HOSTCC) \
>> +		LNCC=$(HOSTCC) \
>> +		CFLAGS="$(HOST_CFLAGS)" \
>> +		LFLAGS="-fPIC $(HOST_LDFLAGS)"
> 
> Meh, this is not nice. Perhaps we could submit a patch upstream that
> adds support for CC_FOR_BUILD, CFLAGS_FOR_BUILD, LFLAGS_FOR_BUILD, so
> that we don't need a separate build step. This could be useful for
> other projects.

Sorry, but this is beyond the scope of the time I am willing to invest in 
buildroot.

Sent new bump: http://patchwork.ozlabs.org/patch/1135814/

Please note that on July, 25th new security-related patches will be 
published as version bump to 4.92.1:
https://lists.exim.org/lurker/message/20190722.100208.85ae994c.en.html

Regards, Bernd
