From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 21 Feb 2019 14:52:27 -0600
Subject: [Buildroot] [PATCH v2] package/proftpd: prevent openssl pthread
 detection
Message-ID: <1550782347-31389-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openssl cmdline executable can be used as a config test which
results in either the host-openssl or host system's openssl
being used to detect the linking with -pthread. This is an
issue as a system maybe building with a toolchain without
thread support. (To review the detection logic, see proftpd
configure.in and search for pr_use_pthread_for_openssl)

Fixes
http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
To recreate the failure, with a clean build.
  make host-openssl proftpd

Changes
v1 -> v2
[Arnout
 - Noted the inhert dependency that was going on and suggested the
   configure step fix to prevent the openssl flag detection leading
   to the -pthread being added the the linker flags.
---
 package/proftpd/proftpd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 592c069..67d8eb8 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -22,7 +22,8 @@ PROFTPD_CONF_OPTS = \
 	--disable-dso \
 	--enable-sendfile \
 	--enable-shadow \
-	--with-gnu-ld
+	--with-gnu-ld \
+	--without-openssl-cmdline
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_MODULES += mod_rewrite
-- 
1.9.1
