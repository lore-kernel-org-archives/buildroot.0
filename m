From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Jun 2012 01:16:51 +0200
Subject: [Buildroot] [PATCH v2] Update gdisk (gptfdisk) to version 0.8.5.
In-Reply-To: <1339626043-11946-1-git-send-email-jmaggard10@gmail.com>
References: <1339626043-11946-1-git-send-email-jmaggard10@gmail.com>
Message-ID: <4FD91F63.5030806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/14/12 00:20, Justin Maggard wrote:
> Update GPT fdisk utility to upstream version 0.8.5.

  This part of the commit message is redundant, it's already in the subject line.

> Signed-off-by: Justin Maggard<jmaggard10@gmail.com>
[snip]
> --- /dev/null
> +++ b/package/gdisk/gdisk-0.8.5-no-utf16.patch

  The policy nowadays is not to include version numbers in patch names.  So
just gdisk-no-utf16.patch is fine.

> @@ -0,0 +1,43 @@
> +[PATCH] Disable UTF16 support

  It would be better if UTF16 support was included if BR2_PACKAGE_ICU is
selected.  Maybe a bit difficult to implement, so take this is optional,
but I'll give some hints below.

> +
> +libicu is quite large, and unicode partition names are uncommon.
> +
> +Signed-off-by: Justin Maggard<jmaggard10@gmail.com>
> +---
> +diff -ur gdisk-0.8.5/Makefile gptfdisk-0.8.5/Makefile
> +--- gdisk-0.8.5/Makefile	2012-05-30 08:38:43.000000000 -0700
> ++++ gptfdisk-0.8.5/Makefile	2012-06-05 11:38:23.710597974 -0700
> +@@ -1,8 +1,8 @@
> + CC=gcc
> + CXX=g++
> + CFLAGS+=-D_FILE_OFFSET_BITS=64
> +-CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
> +-#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
> ++#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
> ++CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64

  You can actually override the CFLAGS and CXXFLAGS on the command line, so
this part of the patch is unneeded.  Just change the build commands into

$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(GDISK_TARGETS_y)

> + LDFLAGS+=
> + LIB_NAMES=crc32 support guid gptpart mbrpart basicmbr mbr gpt bsd parttypes attributes diskio diskio-unix
> + MBR_LIBS=support diskio diskio-unix basicmbr mbrpart
> +@@ -14,16 +14,16 @@
> + all:	cgdisk gdisk sgdisk fixparts
> +
> + gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
> +-#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
> +-	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
> ++	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
> ++#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk

  You could make this configurable with

$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) $(if $(USE_UTF16),-licuio -licuuc) -luuid -o gdisk

  This only works with GNU make, but buildroot anyway only works with GNU make.

  You can define USE_UTF16 by adding the following to the make flags in the BUILD_CMDS:

USE_UTF16=$(BR2_PACKAGE_ICU)

  and of course add the conditional dependency:

GDISK_DEPENDENCIES += $(if $(BR2_PACKAGE_ICU),icu)


> +
> + cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
> +-#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
> +-	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
> ++	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
> ++#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
> +
> + sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
> +-#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
> +-	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
> ++	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
> ++#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
> +
> + fixparts: $(MBR_LIB_OBJS) fixparts.o
> + 	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
> diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
> index a53ee83..619a32d 100644
> --- a/package/gdisk/gdisk.mk
> +++ b/package/gdisk/gdisk.mk
> @@ -4,9 +4,9 @@
>   #
>   #############################################################
>
> -GDISK_VERSION = 0.6.14
> +GDISK_VERSION = 0.8.5
>   GDISK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
> -GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz
> +GDISK_SOURCE = gptfdisk-$(GDISK_VERSION).tar.gz
>
>   GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
>   GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk

  Since the upstream name has changed, I would change the buildroot package name
as well.  Again, it's a bit more work though.  Also it would make existing config
files that select gdisk invalid - I'm not sure if Peter allows that.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
