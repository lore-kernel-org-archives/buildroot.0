From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:24:26 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/openvmtools: udev
 rules files should not be executable
Message-ID: <20191205213908.377D481024@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6e06a51efee0020ef0b5412ef6b9de927ee96ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

/usr/lib/udev/rules.d/99-vmware-scsi-udev.rules is marked executable,
causing systemd to complain.

Source: https://github.com/vmware/open-vm-tools/pull/376

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ad22f41b57fb244f2f396533d549f7d9eaa5a06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0009-Set-permissions-on-rules-file.patch       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/openvmtools/0009-Set-permissions-on-rules-file.patch b/package/openvmtools/0009-Set-permissions-on-rules-file.patch
new file mode 100644
index 0000000000..6a37c1690d
--- /dev/null
+++ b/package/openvmtools/0009-Set-permissions-on-rules-file.patch
@@ -0,0 +1,23 @@
+From c3ef6a8285132871ad10f9300d8afff55d8d6de2 Mon Sep 17 00:00:00 2001
+From: puneetse <22071208+puneetse@users.noreply.github.com>
+Date: Wed, 16 Oct 2019 10:09:38 -0700
+Subject: [PATCH] Set permissions on rules file
+
+udevs rules should not be executable otherwise udev will log a warning in the journal
+
+Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
+---
+ udev/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/udev/Makefile.am b/udev/Makefile.am
+index 68fbc3e27..8b9a4d716 100644
+--- a/udev/Makefile.am
++++ b/udev/Makefile.am
+@@ -17,5 +17,5 @@
+ 
+ install-data-local:
+ 	$(INSTALL) -d $(DESTDIR)$(UDEVRULESDIR)
+-	$(INSTALL) $(srcdir)/99-vmware-scsi-udev.rules $(DESTDIR)$(UDEVRULESDIR)
++	$(INSTALL) -m 0644 $(srcdir)/99-vmware-scsi-udev.rules $(DESTDIR)$(UDEVRULESDIR)
+ 
