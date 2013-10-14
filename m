From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 21:58:03 +0200
Subject: [Buildroot] [git commit] package: fix 'local' site method for host
	packages
Message-ID: <20131014203036.7EB839B9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86e61d20504db0881c495da07a25552d8783bd71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
