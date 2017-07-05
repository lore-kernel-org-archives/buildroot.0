From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:43 +0200
Subject: [Buildroot] [git commit] raspberrypi-usbboot: remove /usr from
	DESTDIR-based install commands
Message-ID: <20170705141337.26C857FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=223eae404bf1acbb601a8e1a54fc77e4f8a1ce0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have a patch that adds $(DESTDIR) to the install commands of
raspberrypi-usbboot, but it would still be installed in $(DESTDIR)/usr.
We don't want that, so remove the /usr part in the installation
commands.

Note that upstream has removed the 'install' target entirely, so
there's no point trying to keep the patch in upstreamable shape (i.e.
defaulting DESTDIR to /usr).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Makefile-add-DESTDIR-support.patch        | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch b/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch
index c37d5a1..a757cb0 100644
--- a/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch
+++ b/package/raspberrypi-usbboot/0002-Makefile-add-DESTDIR-support.patch
@@ -7,6 +7,8 @@ This allows installing rpiboot outside of /usr if needed.
 
 Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Arnout: remove /usr]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  Makefile | 20 ++++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)
@@ -24,11 +26,11 @@ index d9a7220..7835b7f 100755
 -	cp usbbootcode.bin /usr/share/rpiboot
 -	cp msd.elf /usr/share/rpiboot
 -	cp buildroot.elf /usr/share/rpiboot
-+	cp rpiboot $(DESTDIR)/usr/bin
-+	mkdir -p $(DESTDIR)//usr/share/rpiboot
-+	cp usbbootcode.bin $(DESTDIR)/usr/share/rpiboot
-+	cp msd.elf $(DESTDIR)/usr/share/rpiboot
-+	cp buildroot.elf $(DESTDIR)/usr/share/rpiboot
++	cp rpiboot $(DESTDIR)bin
++	mkdir -p $(DESTDIR)/share/rpiboot
++	cp usbbootcode.bin $(DESTDIR)/share/rpiboot
++	cp msd.elf $(DESTDIR)/share/rpiboot
++	cp buildroot.elf $(DESTDIR)/share/rpiboot
  
  uninstall:
 -	rm -f /usr/bin/rpiboot
@@ -36,11 +38,11 @@ index d9a7220..7835b7f 100755
 -	rm -f /usr/share/rpiboot/msd.elf
 -	rm -f /usr/share/rpiboot/buildroot.elf
 -	rmdir --ignore-fail-on-non-empty /usr/share/rpiboot/
-+	rm -f $(DESTDIR)/usr/bin/rpiboot
-+	rm -f $(DESTDIR)/usr/share/rpiboot/usbbootcode.bin
-+	rm -f $(DESTDIR)/usr/share/rpiboot/msd.elf
-+	rm -f $(DESTDIR)/usr/share/rpiboot/buildroot.elf
-+	rmdir --ignore-fail-on-non-empty $(DESTDIR)/usr/share/rpiboot/
++	rm -f $(DESTDIR)/bin/rpiboot
++	rm -f $(DESTDIR)/share/rpiboot/usbbootcode.bin
++	rm -f $(DESTDIR)/share/rpiboot/msd.elf
++	rm -f $(DESTDIR)/share/rpiboot/buildroot.elf
++	rmdir --ignore-fail-on-non-empty $(DESTDIR)/share/rpiboot/
  
  clean: 
  	rm rpiboot
