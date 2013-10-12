From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Oct 2013 12:15:08 +0200
Subject: [Buildroot] [PATCH] package: fix 'local' site method for host
	packages
Message-ID: <1381572908-22696-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the 'local' site method works just fine for target
packages. However, for host packages, when HOST_<pkg>_SITE is
automatically defined by the package infrastructure to be equal to
<pkg>_SITE, when defining the <pkg>_OVERRIDE_SRCDIR, the $($(2)_SITE)
is empty, due to a missing additional dollar sign.

This patch ensures that the <pkg>_OVERRIDE_SRCDIR gets the correct
value, regardless of whether the HOST_<pkg>_SITE variable has been
defined by the package itself, or inferred by the package
infrastructure using the <pkg>_SITE value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: http://stackoverflow.com/questions/19311747/buildroot-cant-use-local-site-method-for-custom-host-packages
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a46457c..4bba4b5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -281,7 +281,7 @@ endif
 
 ifeq ($$($(2)_SITE_METHOD),local)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
-$(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
+$(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
 endif
 endif
 
-- 
1.8.1.2
