From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Feb 2020 15:30:01 +0200
Subject: [Buildroot] [PATCH] docs/manual: clarify hooks and dependencies
 build order
Message-ID: <f60d91e668f9c6cedccc0a9afbf84e020e8e40e0.1582810201.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As explained in commit bdc9364ffae ("package/fail2ban: The
(host-python3) 2to3 utility needs to be present"), hooks before
_PRE_CONFIGURE_HOOKS can't rely on package dependencies build artefacts.
Mention this point in hooks documentation.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/adding-packages-hooks.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 0ce79f8907f8..c80f5cb52d32 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -59,6 +59,14 @@ endef
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 ----------------------
 
+[[hooks-order]]
+==== Hooks run order
+Hooks up to, and including, +LIBFOO_POST_PATCH_HOOKS+ might run before
++LIBFOO_DEPENDENCIES+ finish building. You can not rely on build artefacts of
+dependency packages in these early hooks. +LIBFOO_PRE_CONFIGURE_HOOKS+ and
+later hooks will run only when +LIBFOO_DEPENDENCIES+ have been built. As a
+result, you can use dependencies build artefacts in these later hooks.
+
 [[hooks-rsync]]
 ==== Using the +POST_RSYNC+ hook
 The +POST_RSYNC+ hook is run only for packages that use a local source,
-- 
2.25.0
