From: Chien-Yu Chen <torus0@gmail.com>
Date: Mon, 30 Jun 2008 14:48:31 -0500
Subject: [Buildroot] building ffmpeg
Message-ID: <dbc6d8cc0806301248x46fb2090rbb4c4b3c2aa7fbc4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
  I was trying to build ffmpeg with the current snap shot of the buildroot
package, and am having some problem..

1. grub-0.97-35.diff (something like this) is not found any more. so I
download 0.97-40, and remove one of the patch, and grub was able to
compile...

the real question is the following, here is the ffmpeg rule I wrote,

----------------------------------------------------------

FFMPEG_VERSION:=export-2008-06-30
FFMPEG_SOURCE:=ffmpeg-export-snapshot.tar.bz2
FFMPEG_SITE:=http://ffmpeg.mplayerhq.hu
FFMPEG_DIR:=$(BUILD_DIR)/ffmpeg-$(FFMPEG_VERSION)
FFMPEG_CAT:=$(BZCAT)
FFMPEG_BINARY:=ffmpeg
FFMPEG_TARGET_BINARY:=usr/bin/$(FFMPEG_BINARY)
FFMPEG_LIB:=usr/lib/libavcodec.so
FFMPEG_LIB+=usr/lib/libavformat.so
FFMPEG_LIB+=usr/lib/libavdevice.so
FFMPEG_LIB+=usr/lib/libavutil.so

$(DL_DIR)/$(FFMPEG_SOURCE):
        $(WGET) -P $(DL_DIR) $(FFMPEG_SITE)/$(FFMPEG_SOURCE)

$(FFMPEG_DIR)/.unpacked: $(DL_DIR)/$(FFMPEG_SOURCE)
        $(FFMPEG_CAT) $(DL_DIR)/$(FFMPEG_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
        toolchain/patch-kernel.sh $(FFMPEG_DIR) package/ffmpeg/
ffmpeg-$(FFMPEG_VERSION)\*.patch\*
        $(CONFIG_UPDATE) $(FFMPEG_DIR)
        touch $@

$(FFMPEG_DIR)/.configured: $(FFMPEG_DIR)/.unpacked
        (cd $(FFMPEG_DIR); rm -rf config.cache; \
                $(TARGET_CONFIGURE_OPTS) \
                $(TARGET_CONFIGURE_ARGS) \
                CFLAGS="$(TARGET_CFLAGS)" \
                LDFLAGS="$(TARGET_LDFLAGS)" \
                ./configure \
                --prefix=/usr \
                --enable-cross-compile \
                --target-os=$(GNU_TARGET_NAME) \
                --cc=$(TARGET_CC) \
                --disable-static \
                --enable-shared \
                --disable-ffplay \
        )
        touch $@

$(FFMPEG_DIR)/$(FFMPEG_BINARY): $(FFMPEG_DIR)/.configured
        $(MAKE) -C $(FFMPEG_DIR)
        touch -c $@
$(TARGET_DIR)/$(FFMPEG_TARGET_BINARY): $(FFMPEG_DIR)/$(FFMPEG_BINARY)
        $(MAKE) DESTDIR=$(TARGET_DIR) -C $(FFMPEG_DIR) install
        $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
$(TARGET_DIR)/$(FFMPEG_TARGET_BINARY)
        touch -c $@

ffmpeg: uclibc  $(TARGET_DIR)/$(FFMPEG_TARGET_BINARY)

ffmpeg-source: $(DL_DIR)/$(FFMPEG_SOURCE)

ffmpeg-unpacked: $(FFMPEG_DIR)/.unpacked

ffmpeg-clean:
        rm -f $(TARGET_DIR)/$(FFMPEG_TARGET_BINARY)
        -$(MAKE) -C $(FFMPEG_DIR) clean

ffmpeg-dirclean:
        rm -rf $(FFMPEG_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_FFMPEG)),y)
TARGETS+=ffmpeg
endif

---------------------------------------------------------

I must have totally mess up the make file, as the system I created is as big
as 70M, while I have nothing included, only the kernel and busybox..
and even more weird is that if I remove the .iso after a run, and re-run
make, the iso image grows...
so I am guess some rule I wrote, I forgot to touch some file, and some
process got performed many times.  please advise if you see any obvious
mistake. thanks

chen


-- 
Any MicroSoft extension file will directly go to trash without any warning
and regret.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080630/1631c2fb/attachment.htm 
