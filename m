From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:09:03 +0100
Subject: [Buildroot] [git commit] package/asterisk: fix parallel install
Message-ID: <20171201210148.679F682582@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42dfbdfe51a62d6c2c007c3c47ec64647179f306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/7c92fb71d0aee211c8e0ef9d646da477fd97fb4c/
    http://autobuild.buildroot.org/results/2b8c810bd8775413fd4567b2f8495be70b7bb808/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0006-install-samples-need-the-data-files.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/asterisk/0006-install-samples-need-the-data-files.patch b/package/asterisk/0006-install-samples-need-the-data-files.patch
new file mode 100644
index 0000000..a9560e8
--- /dev/null
+++ b/package/asterisk/0006-install-samples-need-the-data-files.patch
@@ -0,0 +1,35 @@
+From 05680ea9899c2246c23d11860c2c8e10aa8f80c7 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 1 Dec 2017 11:08:16 +0100
+Subject: [PATCH] install: samples need the data files
+
+When installing samples, "sample voicemail" is generated from the
+already-installed sound files.
+
+However, when doing the install and the samples at the same time in a
+parallel install, it is possible that the sound files are not already
+installed at the time we try to generate the voicemail data.
+
+Ensure the needed dependency.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f29c07f680..b58f707b61 100644
+--- a/Makefile
++++ b/Makefile
+@@ -779,7 +779,7 @@ adsi:
+ 		$(INSTALL) -m 644 "$$x" "$(DESTDIR)$(ASTETCDIR)/`$(BASENAME) $$x`" ; \
+ 	done
+ 
+-samples: adsi
++samples: adsi datafiles
+ 	@echo Installing other config files...
+ 	$(call INSTALL_CONFIGS,samples,.sample)
+ 	$(INSTALL) -d "$(DESTDIR)$(ASTSPOOLDIR)/voicemail/default/1234/INBOX"
+-- 
+2.11.0
+
