From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 7 Apr 2019 23:55:38 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static build
 failure due to missing -latomic
In-Reply-To: <699842f1-d9e3-dd02-4770-e8a10499194b@micronovasrl.com>
References: <20190404153904.69693-1-giulio.benetti@micronovasrl.com>
 <20190404224539.2d79cf30@windsurf>
 <699842f1-d9e3-dd02-4770-e8a10499194b@micronovasrl.com>
Message-ID: <e6f8db91-43e0-fc56-d071-1804616b2d61@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 05/04/2019 00:32, Giulio Benetti ha scritto:
> Hello
> 
> Il 04/04/2019 22:45, Thomas Petazzoni ha scritto:
>> Hello Giulio,
>>
>> On Thu,  4 Apr 2019 17:39:04 +0200
>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>
>>> +# Uses __atomic_fetch_add_4. In adbd.mk Makefile there is no hunk to the end of
>>> +# linking command. So need to add -latomic to LIBS using sed to provide
>>> +# -latomic at the correct place in the linking command.
>>> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>>> +define ANDROID_TOOLS_FIX_MAKEFILE
>>> +	$(SED) 's/-lz -lcrypt/-lz -lcrypt -latomic/' $(@D)/debian/makefiles/adbd.mk
>>> +endef
>>> +ANDROID_TOOLS_POST_PATCH_HOOKS = ANDROID_TOOLS_FIX_MAKEFILE
>>> +endif
>>
>> Instead of this, please do regular patch on adbd.mk that does this:
>>
>> -LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`

In current version there is not glib-2.0 or gio-2.0, do I add them 
anyway as follows?

>> +LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto` -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
>>
>> and that's it.
>>
>> Also, adding host-pkgconf to ANDROID_TOOLS_DEPENDENCIES when adbd is
>> selected would be necessary (but it should already be needed anyway, as
>> pkg-config is already used to detect glib).

Sure, I've checked it's needed otherwise my distro's pkgconfig will be 
used(checked it to understand how it works).

Thanks
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
