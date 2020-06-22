From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 22 Jun 2020 22:23:35 +0200
Subject: [Buildroot] [PATCH v2] package/irrlicht: fix libraries linking
In-Reply-To: <20200622212642.1be946f3@windsurf.home>
References: <20200622184515.312030-1-b.bilas@grinn-global.com>
 <20200622212642.1be946f3@windsurf.home>
Message-ID: <46d65bc1-310b-c21a-22e7-11df0ef164b7@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 22.06.2020 21:26, Thomas Petazzoni wrote:
> On Mon, 22 Jun 2020 20:45:15 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>>   .../0003-makefile-override-LDFLAGS.patch      | 29 ++++++++++++++++
>>   ...obsolete-X11R6-lib-include-directori.patch | 33 +++++++++++++++++++
>>   package/irrlicht/irrlicht.mk                  |  4 ++-
>>   3 files changed, 65 insertions(+), 1 deletion(-)
>>   create mode 100644 package/irrlicht/0003-makefile-override-LDFLAGS.patch
>>   create mode 100644 package/irrlicht/0004-makefile-remove-obsolete-X11R6-lib-include-directori.patch
>>
>> diff --git a/package/irrlicht/0003-makefile-override-LDFLAGS.patch b/package/irrlicht/0003-makefile-override-LDFLAGS.patch
>> new file mode 100644
>> index 0000000000..16c38d5baa
>> --- /dev/null
>> +++ b/package/irrlicht/0003-makefile-override-LDFLAGS.patch
>> @@ -0,0 +1,29 @@
>> +From f597ac417f0eefab8f388afe617a0d07d08d87bb Mon Sep 17 00:00:00 2001
>> +From: Bartosz Bilas <b.bilas@grinn-global.com>
>> +Date: Sun, 21 Jun 2020 12:57:47 +0200
>> +Subject: [PATCH] makefile: override LDFLAGS
>> +
>> +That's needed to fix proper linking to X11 libraries
>> +within package makefile.
>> +
>> +Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> +---
>> + source/Irrlicht/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
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
> Why here are you changing the LDFLAGS to override LDFLAGS.
>
>
>> +diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
>> +index fed6c7e..b323237 100644
>> +--- a/source/Irrlicht/Makefile
>> ++++ b/source/Irrlicht/Makefile
>> +@@ -88,8 +88,7 @@ STATIC_LIB = libIrrlicht.a
>> + LIB_PATH = ../../lib/$(SYSTEM)
>> + INSTALL_DIR = /usr/local/lib
>> + sharedlib install: SHARED_LIB = libIrrlicht.so
>> +-sharedlib: override LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
>> +-staticlib sharedlib: CXXINCS += -I/usr/X11R6/include
>> ++sharedlib: override LDFLAGS += -lGL -lXxf86vm
> And here you drop entirely the -L argument ?
Due to the fact that it points to the host system libraries. This -L 
argument is set correctly within package makefile.
>
> Or is it two consecutive patches that have been merged upstream ?
No, they have not.
>
>> +# set correct path for libraries linking
>> +IRRLICHT_CONF_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib"
> This should not be necessary, STAGING_DIR/usr/lib is already the
> default search path for libraries in the Buildroot cross-compiler.
> Could you test without this ?
It seems to work quite well without this line.
>
>>   # Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
>>   # While linking an application with libIrrlicht.so, we get an undefined reference to
>>   # png_init_filter_functions_neon.
>>   # Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c,
>>   # so disable NEON support completely.
>> -IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0"
>> +IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0 -I$(STAGING_DIR)/usr/include/X11"
> It is a bit weird to have this below the NEON related comment.
>
> Can we change that to:
>
> IRRLICHT_CPPFLAGS = $(TARGET_CPPFLAGS)
>
> # blabla about NEON
> IRRLICHT_CPPFLAGS += -DPNG_ARM_NEON_OPT=0
>
> # blabla about X11 includes
> IRRLICHT_CPPFLAGS += -I$(STAGING_DIR)/usr/include
>
> IRRLICHT_CONF_OPTS += CPPFLAGS="$(IRRLICHT_CPPFLAGS)"
Good hint, I was thinking about a bit different approach but it wasn't 
working as I expected therefore I did it as it's above.
> It is a bit sad that they don't use pkg-config, but oh well, we can 
> live with this explicit -I flag. Thanks! Thomas 
Best
Bartek
