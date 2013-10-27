From: Karim Yaghmour <karim.yaghmour@opersys.com>
Date: Sun, 27 Oct 2013 13:50:42 -0400
Subject: [Buildroot] Android.mk file for integration into AOSP build
Message-ID: <526D5272.6010909@opersys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I've been meaning to post this for a while. With the help of Thomas and
Maxime from Free Electrons, I created an Android.mk to have the AOSP
merge Buildroot's output into the final Android images. The whole thing
took us like 10 minutes at the last ABS/ELC in SFO; 10 min *without*
Android's build time.

Here's how it works - instructions for 2.3.7 (see below for 4.x):

1- Setup:
- Create a "buildroot" directory at the top of the AOSP
- Untar a buildroot in there
- Configure and build buildroot
- Create a symlink to buidroot's output:
$ cd buildroot/
$ ln -s buildroot-2012.11.1/output/images/rootfs.tar .
- Put the attached Android.mk in [aosp]/buildroot/

2- Build AOSP

3- Profit

If all goes well, you'll have a /bin/ and /lib/ in the Android rootfs
that will contain all the Buildroot stuff. And it won't overlap with
Android since the latter uses /system/bin/ and /system/lib/.

Note: you need to use a separate toolchain to build Buildroot than the
one provided in the AOSP.

In 4.x, the "ALL_PREBUILT" in the Android.mk is no longer supported "out
of the box". So you need to "help" the AOSP a little. Edit the
build/core/legacy_prebuilts.mk and add "buildroot" to the list of
items in "GRANDFATHERED_ALL_PREBUILT":
GRANDFATHERED_ALL_PREBUILT := \
	akmd2 \
	am \
...
	zoneinfo.idx \
	zoneinfo.version \
	buildroot

Enjoy!

-- 
Karim Yaghmour
CEO - Opersys inc. / www.opersys.com
http://twitter.com/karimyaghmour
-------------- next part --------------
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# This part is a hack, we're doing "addprefix" because if we don't,
# this dependency will be stripped out by the build system
BUILDROOT_ROOTFS := $(addprefix $(TARGET_ROOT_OUT)/, buildroot)

$(BUILDROOT_ROOTFS):
	mkdir -p $(TARGET_ROOT_OUT)
	tar --exclude="dev" -xvf $(TOPDIR)buildroot/rootfs.tar -C $(TARGET_ROOT_OUT)

ALL_PREBUILT += $(BUILDROOT_ROOTFS)
