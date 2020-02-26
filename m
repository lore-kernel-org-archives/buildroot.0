From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:35:43 +0100
Subject: [Buildroot] [git commit] package/fail2ban: The (host-python3) 2to3
 utility needs to be present
Message-ID: <20200226152402.6035A8E9CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc9364ffae64623158830698a4f84fb2a179910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During _POST_PATCH_HOOKS _DEPENDANCIES aren't guaranteed to be built,
however during _PRE_CONFIGURE_HOOKS they should be built.

Should fix:
http://autobuild.buildroot.net/results/dd8e225e2a49cfa6735bed11459007003a37c137/
http://autobuild.buildroot.net/results/e688c3652bd474ac682984e2e5947701942f0f57/

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/fail2ban.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 6f023b48a1..a0a2dc704b 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -15,7 +15,9 @@ define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
 endef
 FAIL2BAN_DEPENDENCIES += host-python3
-FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_PYTHON_2TO3
+# We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
+# to build and install before _POST_PATCH_HOOKS run.
+FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3
 endif
 
 define FAIL2BAN_FIX_DEFAULT_CONFIG
