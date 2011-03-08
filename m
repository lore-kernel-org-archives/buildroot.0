From: Desroches, Ludovic <Ludovic.Desroches@atmel.com>
Date: Tue, 8 Mar 2011 10:23:47 +0100
Subject: [Buildroot] alsa-utils and nctp troubles with 2011.02
Message-ID: <F41B82AC38A41A41868925971DCBED9E06EEB9E9@rfomb01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have encountered some problems during my file system creation with buildroot 2011.02.

- the first one was about alsa-utils install part :

>>> alsa-utils 1.0.23 Installing to target
for i in usr/sbin/alsactl usr/bin/alsamixer usr/bin/amixer usr/bin/aplay usr/bin/speaker-test; do install -D -m 755 /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/$i /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/$i; done
if [ -x "/home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/bin/speaker-test" ]; then mkdir -p /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/speaker-test; mkdir -p /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/sounds/alsa; cp -rdpf /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/alsa/speaker-test/* /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/speaker-test/; cp -rdpf /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/sounds/alsa/* /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/sounds/alsa/; fi
if [ -x "/home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/sbin/alsactl" ]; then mkdir -p /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/; rm -rf /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/; cp -rdpf /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/alsa/ /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/; fi
cp: target `/home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/' is not a directory: No such file or directory
make: *** [/home/ldesroches/buildroot_old/buildroot-2011.02/output/build/alsa-utils-1.0.23/.stamp_target_installed] Error 1

I think it can be simply corrected with :

--- package/multimedia/alsa-utils/alsa-utils.mk.orig	2011-03-08 11:21:21.000000000 +0100
+++ package/multimedia/alsa-utils/alsa-utils.mk	2011-03-07 17:35:05.000000000 +0100
@@ -49,7 +49,8 @@
 	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/; \
 		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
-		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
+		mkdir -p $(TARGET_DIR)/usr/share/alsa; \
+		cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/; \
 	fi
 endef
 

- the second one is about ncftp extraction part :

>>> ncftp 3.2.4 Extracting
tar: win/bmed/bookmark.c: Cannot hard link to `ncftp-3.2.4/ncftp/bookmark.c': No such file or directory
tar: Error exit delayed from previous errors
make: *** [/home/ldesroches/buildroot_old/buildroot-2011.02/output/build/ncftp-3.2.4/.stamp_extracted] Error 2

Manually, I have no problem to extract this archive. The problem seems to be a path problem since I have ncftp-3.2.4/win/bmed/bookmark.c and ncftp-3.2.4/ncftp/bookmark.c. Do you know how I can correct this problem ?


Best Regards,
Ludovic Desroches
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/7f67f386/attachment.html>
