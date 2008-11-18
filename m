From: Weber, Bernd <BWEBE@dolby.com>
Date: Mon, 17 Nov 2008 19:26:22 -0800
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <COL102-DS89F706C15CE7C86CDE04BDC130@phx.gbl>
References: <20081111183231.E74AC3C989@busybox.net>	<BD79186B4FD85F4B8E60E381CAEE1909CEAAE5@mi8nycmail19.Mi8.com>	<20081112085548.105af9b2@surf>	<1363312C-9914-45B9-9A58-86C6CB8AD38B@valka.is><e4c675870811142206p1100c2a6ha571f1fbe5a5ba1e@mail.gmail.com>
	<COL102-DS89F706C15CE7C86CDE04BDC130@phx.gbl>
Message-ID: <05BB196AB3DA6C4BBE11AB6C957581FE123071BB@sfo-exch-01.dolby.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm running into problems here since this last patch.
The situation:
I had a buildroot from 10-14-2008 which worked fine on my Fedora 9 box here. However once my colleague tried to build the same tree on his Ubuntu 7.x and 8.x machines he reported the issues some of you are seeing with the wrong linker paths. So he could not build the tree.
After applying your patch, however, it doesn't build on either machine anymore. I get the reported issues with warnings ("linker input file unused because linking not done") and eventually it breaks the build during gdb-6.8.
I attached the error message bellow.
I got both to work by doing the following:
- I removed the rpath statements from the non-external-toolchain part in package/Makefile.in. The rest of the change I left intact.

After doing that additional things came up:
- The fontconfig Makefile(fontconfig.mk) has to be changed since the CFLAGS are overridden with target specifics and since it compiles (partly) on the host machine it breaks the build. So the CFLAGS have to be HOSTCFLAGS when configuring.
- DirectFB has problems with the CFLAGS as well. The configured CFLAGS are overwritten when building with TARGET_CONFIGURE_OPTS. So remove that.

I attached the patches to this email. I hope this helps!

-Bernd


/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc -Os  -I/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/include -I/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/include -Wl,--rpath-link -Wl,/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/lib -Wl,--rpath-link -Wl,/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/lib -mtune=mips32r2 -mabi=32 -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -DHAVE_CONFIG_H -Os  -I/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/include -I/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/include -Wl,--rpath-link -Wl,/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/lib -Wl,--rpath-link -Wl,/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/lib -mtune=mips32r2 -mabi=32 -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/lib -L/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/lib -Wno-error -I. -I/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/../include  -W -Wall -Wwrite-strings -Wstrict-prototypes -pedantic  /workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c -o fibheap.o
mipsel-linux-uclibc-gcc: --rpath-link: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: /workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/lib: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: --rpath-link: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: /workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/lib: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: --rpath-link: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: /workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/lib: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: --rpath-link: linker input file unused because linking not done
mipsel-linux-uclibc-gcc: /workspace/ubuntu/trunk/tools/buildroot/build_mipsel/staging_dir/usr/lib: linker input file unused because linking not done
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c: In function 'fibheap_union':
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c:151: warning: implicit declaration of function 'free'
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c: In function 'fibheap_delete_node':
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c:258: error: 'LONG_MIN' undeclared (first use in this function)
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c:258: error: (Each undeclared identifier is reported only once
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c:258: error: for each function it appears in.)
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c: In function 'fibheap_consolidate':
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c:360: warning: implicit declaration of function 'memset'
/workspace/ubuntu/trunk/tools/buildroot/toolchain_build_mipsel/gdb-6.8/libiberty/fibheap.c:360: warning: incompatible implicit declaration of built-in function 'memset'
make[3]: *** [fibheap.o] Error 1
make[3]: Leaving directory `/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/gdb-6.8-target/libiberty'
make[2]: *** [all-libiberty] Error 2
make[2]: Leaving directory `/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/gdb-6.8-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/gdb-6.8-target'
make: *** [/workspace/ubuntu/trunk/tools/buildroot/build_mipsel/gdb-6.8-target/gdb/gdb] Error 2



--- ../temp/buildroot/package/Makefile.in	2008-11-17 11:04:59.538371000 -0800
+++ package/Makefile.in	2008-11-17 16:02:07.495849000 -0800
@@ -38,8 +38,7 @@
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
-	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include \
-	-Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib
+	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include 
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)



--- ../temp/buildroot/package/directfb/directfb.mk	2008-11-17 14:11:28.856319000 -0800
+++ package/directfb/directfb.mk	2008-11-17 17:50:23.454473000 -0800
@@ -147,7 +151,6 @@
 
 $(DIRECTFB_DIR)/.compiled: $(DIRECTFB_DIR)/.configured
 	$(MAKE) PATH=$(STAGING_DIR)/usr/lib:$(PATH) \
-		$(TARGET_CONFIGURE_OPTS) \
 		-C $(DIRECTFB_DIR)
 	touch $(DIRECTFB_DIR)/.compiled



--- ../temp/buildroot/package/fontconfig/fontconfig.mk	2008-11-17 11:04:56.513571000 -0800
+++ package/fontconfig/fontconfig.mk	2008-11-17 16:47:11.922219000 -0800
@@ -10,7 +10,7 @@
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
 
-FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
+FONTCONFIG_CONF_OPT = CFLAGS=$(HOSTCFLAGS) --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
 		--with-expat="$(STAGING_DIR)/usr/lib" \
 		--with-expat-lib=$(STAGING_DIR)/usr/lib \





-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Daniel Laird
Sent: Monday, November 17, 2008 3:54 AM
To: 'Roberto A. Foglietta'; 'Arnar Mar Sig'; 'Thomas Petazzoni'
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package

All,

I have been looking a bit more into the issues around the --rpath-link
options. 
1. It seems that we should only do this for people using external toolchains
as currently it appears buildroot built toolchains are ok.
2. I think that we could use --sysroot cflags.
   This is only supported in GCC 4.2 and later so this would need to be
checked.
   We would then need to copy all compiler includes into
$STAGING_DIR/usr/include
   Then I believe we could pass --sysroot=$STAGING_DIR as a cflag and this
should then pick up all headers and libraries.

Does anyone have any thoughts on this.   I have not tried it yet but perhaps
you have?

Hope you can help
Daniel Laird

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Roberto A. Foglietta
Sent: 2008 Nov 15 06:07
To: Arnar Mar Sig
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package

2008/11/12 Arnar Mar Sig <antab@valka.is>:
>
> On Nov 12, 2008, at 8:55 AM, Thomas Petazzoni wrote:
>
>> Le Tue, 11 Nov 2008 20:09:06 -0500,
>> "hartleys" <hartleys@visionengravers.com> a ?crit :
>>
>>> Each source file hit with CC produces a warning message. Everything
>>> hit with LD is fine. Here's a snip of the output:
>>>
>>> ...
>>> LD      lib/zlib_inflate/zlib_inflate.o
>>> LD      lib/zlib_inflate/built-in.o
>>> CC      lib/audit.o
>>> arm-linux-gcc: --rpath-link: linker input file unused because linking
>>> not done
>>> arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/lib:
>>> linker input file unused because linking not done
>>> arm-linux-gcc: --rpath-link: linker input file unused because linking
>>> not done
>>> arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/usr/
>>> lib:
>>> linker input file unused because linking not done
>>
>> Odd. I did try to build the kernel and didn't see this messages. I
>> will
>> try something else.
>>
>> Sincerly,
>>
>> Thomas
>
>
> This also happen when building for AVR32.

It happens in i586 too, please take a look to this report

http://busybox.net/bugs/view.php?id=6324

may be it is related with your changes.

 Ciao,
-- 
/roberto
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

-----------------------------------------
This message (including any attachments) may contain confidential
information intended for a specific individual and purpose.  If you
are not the intended recipient, delete this message.  If you are
not the intended recipient, disclosing, copying, distributing, or
taking any action based on this message is strictly prohibited.
