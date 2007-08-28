From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 27 Aug 2007 18:51:05 -0700 (PDT)
Subject: [Buildroot] Unable to Build mpg123 because of wrong patch file
Message-ID: <12360819.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

 I am trying to build mpg123 for arm arm926ejs toolchain. Today i tried
building mpg123 and failed because of wrong patch. Error message is attached
below. The Cause is that the Patch file tries to correct a non existent file
Makefile inside mpg123 folder just after uncompressing the mpg123 tar file.
It should patch the same after it has compiled. 


error message ---->
bzcat /home/guru/project/original/bldrt/buildroot/dl/mpg123-0.66.tar.bz2 |
tar -C /home/guru/project/original/bldrt/buildroot/build_arm   -xf -
toolchain/patch-kernel.sh
/home/guru/project/original/bldrt/buildroot/build_arm/mpg123-0.66
package/mpg123/ mpg123\*.patch

Applying mpg123-cross.patch using plaintext: 
can't find file to patch at input line 4
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -ruN mpg123-0.59r.orig/Makefile mpg123-0.59r/Makefile
|--- mpg123-0.59r.orig/Makefile 1999-06-15 22:39:06.000000000 +0200
|+++ mpg123-0.59r/Makefile      2006-12-14 15:52:44.000000000 +0100
--------------------------
File to patch: Makefile
Makefile: No such file or directory
Skip this patch? [y] y
Skipping patch.
2 out of 2 hunks ignored
Patch failed!  Please fix mpg123-cross.patch!
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/mpg123-0.66/.unpacked]
Error 1

mpg123 folder contents.

root at box124:~/project/original/bldrt/buildroot# ls -la
build_arm/mpg123-0.66/Make*
-rwxr-xr-- 1 500 users  1112 Jun  3 19:43
build_arm/mpg123-0.66/MakeLegacy.sh
-rw-r--r-- 1 500 users   524 Jun  3 19:43 build_arm/mpg123-0.66/Makefile.am
-rw-r--r-- 1 500 users 20890 Jun  3 19:43 build_arm/mpg123-0.66/Makefile.in

mpg123.mk file contents

$(MPG123_DIR)/.unpacked: $(DL_DIR)/$(MPG123_SOURCE)
	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123\*.patch
	$(CONFIG_UPDATE) $(MPG123_DIR)/build
	touch $@

$(MPG123_DIR)/.configured: $(MPG123_DIR)/.unpacked
	(cd $(MPG123_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_ARGS) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		./configure \
		--target=$(REAL_GNU_TARGET_NAME) \
		--host=$(REAL_GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--sysconfdir=/etc \
		--with-cpu=generic_nofpu \
		$(MPG123_USE_ALSA) \
		$(DISABLE_NLS) \
		$(DISABLE_LARGEFILE) \
	)
	touch $@


Any help is appreciated.

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/Unable-to-Build-mpg123-because-of-wrong-patch-file-tf4339318.html#a12360819
Sent from the BuildRoot mailing list archive at Nabble.com.
