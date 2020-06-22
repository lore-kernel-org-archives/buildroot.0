From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 22 Jun 2020 13:59:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/irrlicht: fix libraries linking
In-Reply-To: <20200621200215.GG2351@scaer>
References: <20200621131038.1031282-1-b.bilas@grinn-global.com>
 <20200621200215.GG2351@scaer>
Message-ID: <3a1c2db4-b753-a567-6bef-a85fb5b45175@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On 21.06.2020 22:02, Yann E. MORIN wrote:
> Bartosz, All,
>
> On 2020-06-21 15:10 +0200, Bartosz Bilas spake thusly:
>> Fixes:
>>   /home/bartekk/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/bartekk/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libIrrlicht.so: undefined reference to `XSetSelectionOwner'
> [--SNIP--]
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> [--SNIP--]
>> +diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
>> +index 9a1bdbc..85eb264 100644
>> +--- a/source/Irrlicht/Makefile
>> ++++ b/source/Irrlicht/Makefile
>> +@@ -88,7 +88,7 @@ STATIC_LIB = libIrrlicht.a
>> + LIB_PATH = ../../lib/$(SYSTEM)
>> + INSTALL_DIR = /usr/local/lib
>> + sharedlib install: SHARED_LIB = libIrrlicht.so
>> +-sharedlib: LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
>> ++sharedlib: override LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
> That's definitely incorrect: we do not want to use a library path that
> points to the host system libraries.
>
> I wonder why our paranoid wrapper does not catches that... :-/
> So far, it would not catch it, because the LDFLAGS are from the command
> line, so the -L/usr/X11R6/lib is not used. But with your patch, it would
> be used now...
>
>> + staticlib sharedlib: CXXINCS += -I/usr/X11R6/include
> Ditto, we do not want to use include paths that points to the host
> system headers.
I didn't want to combine everything in one patch therefore there is a 
second one there.
>
> Ah, I got it now: the wrapper only checks for a select list of known
> host paths, but neither /usr/X11R6/include nor /usr/X11R6/lib are in
> that list...
>
> But now I see that your second patch does fix that for the linker, but
> that's not our paranoid wrapper doing the check, but really the
> cross linker ld.
>
> Sigh... We need to expand our wrapper with those two paths...
>
> Anyway: you should merge the two patches together into a single one, and
> explain the above in thecommit log.
Should I split the makefile patches to the separate ones or just do 
everything in one? I mean adding override flag and removing those 
obsolete host paths.
>
> Also, could you investigate removing the CXXINCS += -I/usr/X11R6/include
> line too? Normally, we should have the proper search paths already.
Sure, I guess I did it but I've forgotten to include it in a patch :/
>
> Oh, and one last point: in a post-commit message (after the --- line),
> add a note that irrlicht uses CRLF line endings, and that the patch
> will have to be fixed when applying, because patchwork drops all the
> CR and keeps on LF.
>
> Care to respin, please?
Yes, I'll do that :)
>
> In the meantime, I'll send a patch to extend the list of unsafe paths in
> our toolchain wrapper...
Good ;)
>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
>> + #OSX specific options
>> +--
>> +2.27.0
>> +
>> diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
>> index bd82815cde..e12d802ee7 100644
>> --- a/package/irrlicht/irrlicht.mk
>> +++ b/package/irrlicht/irrlicht.mk
>> @@ -38,12 +38,14 @@ ifeq ($(BR2_STATIC_LIBS),)
>>   IRRLICHT_CONF_OPTS += sharedlib
>>   endif
>>   
>> +# set correct path for libraries linking
>> +IRRLICHT_CONF_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib"
>>   # Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
>>   # While linking an application with libIrrlicht.so, we get an undefined reference to
>>   # png_init_filter_functions_neon.
>>   # Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c,
>>   # so disable NEON support completely.
>> -IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0"
>> +IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0 -I$(STAGING_DIR)/usr/include/X11"
>>   
>>   define IRRLICHT_BUILD_CMDS
>>   	$(TARGET_MAKE_ENV)
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
Best
Bartek
