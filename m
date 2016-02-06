From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 21:27:24 +0100
Subject: [Buildroot] [git commit] aespipe: add host variant
Message-ID: <20160206202737.448E47F9ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df3c3bcf598908ad542043a1fc40f9af9c7cbdb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having the host version may allow post-image scripts to encrypt the
resulting image with aespipe (and decrypt it in the update tool on the
target).

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
[Thomas: rewrap Config.in help text, tweak commit title.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host         |  1 +
 package/aespipe/Config.in.host | 10 ++++++++++
 package/aespipe/aespipe.mk     |  1 +
 3 files changed, 12 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 8e6b870..1c691a3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/aespipe/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/aespipe/Config.in.host b/package/aespipe/Config.in.host
new file mode 100644
index 0000000..b64868c
--- /dev/null
+++ b/package/aespipe/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_AESPIPE
+	bool "host aespipe"
+	help
+	  aespipe program is AES encrypting or decrypting pipe. It
+	  reads from standard input and writes to standard output. It
+	  can be used to create and restore encrypted tar or cpio
+	  archives. It can be used to encrypt and decrypt loop-AES
+	  compatible encrypted disk images.
+
+	  http://koti.tnnet.fi/jari.ruusu/linux/
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index a220688..c567092 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -10,3 +10,4 @@ AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
