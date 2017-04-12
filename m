From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 12 Apr 2017 08:42:49 -0300
Subject: [Buildroot] [PATCH v7 2/2] systemd: select fsck wrapper from
	util-linux
In-Reply-To: <1491997369-21394-1-git-send-email-casantos@datacom.ind.br>
References: <1491997369-21394-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1491997369-21394-3-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the fsck required by systemd provided by util-linux. This
prevents ending up with fsck from busybox, which is incompatible
with systemd.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
[there were no v1, v2]
Changes v3
  - Select e2fsprogs + e2fsck
Changes v3->v4
  - Remove selection of e2fsprogs + e2fsck
  - Clean-up commit message
Changes v4->v5
  - Screwed-up everything, reverting the chances made in v4
Changes v5->v6
  - Restored changes made in v4.
  - Restore the patch changelog.
Changes v6->v7
  - Removed spurious Change-Id from commit message.
---
 package/systemd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0f54686..478cc10 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,6 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
+	select BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
@@ -61,6 +62,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  - libgcrypt package will add support for journal sealing and
 	    DNSSEC verification in resolved.
 
+	  Notice that systemd selects the fsck wrapper from util-linux
+	  but no particular fsck.<fstype> is selected. You must choose
+	  the apropriate ones (e.g. e2fsck, from the e2fsprogs package)
+	  according to the system configuration.
+
 	  http://freedesktop.org/wiki/Software/systemd
 
 if BR2_PACKAGE_SYSTEMD
-- 
2.7.4
