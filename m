From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 15:59:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: disable audit for host
 package
In-Reply-To: <20200829135941.1862456-1-fontaine.fabrice@gmail.com>
References: <20200829135941.1862456-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829135941.1862456-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable audit for host package to avoid getting the following error if
it is found on host:

[84/662] Generating audit_type-list.txt with a meson_exe.py custom command
In file included from <command-line>:32:
./../src/basic/missing_audit.h:7:10: fatal error: libaudit.h: No such file or directory
    7 | #include <libaudit.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/67782c225c08387c1bbcbea9eee3ca12bc6577cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 115ccbda06..81fa2bd0f0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -700,7 +700,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
 	-Dsystemd-analyze=false \
-	-Dlibcryptsetup=false
+	-Dlibcryptsetup=false \
+	-Daudit=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
-- 
2.28.0
