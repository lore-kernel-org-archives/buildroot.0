From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 30 Jun 2012 22:29:22 +0200
Subject: [Buildroot] [PATCH resend] Globally disable PKG_CONFIG_PATH
Message-ID: <1341088162-16689-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If PKG_CONFIG_PATH is set in the environment, it allows pkg-config to
look for libraries outside of the buildroot tree.  This is a problem
both for host and target builds.  To avoid it, globally set an empty
PKG_CONFIG_PATH in the environment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 Makefile |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 7a66897..bcbe9fc 100644
--- a/Makefile
+++ b/Makefile
@@ -165,6 +165,9 @@ HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
+# Make sure pkg-config doesn't look outside the buildroot tree
+unexport PKG_CONFIG_PATH
+
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
 # line doesn't affect the environment of $(shell ..) calls, so
-- 
tg: (dc1d20a..) t/pkg-config-path (depends on: master)
