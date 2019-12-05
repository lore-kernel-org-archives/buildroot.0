From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 19:37:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/pkg-generic.mk:
 make HOST_<pkg>_DL_OPTS inherit from <pkg>_DL_OPTS
Message-ID: <20191205185702.C23B986998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2522619ef9f2dde0a351d2420e9e2db52816a09f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Just like _SITE, _SOURCE, _SITE_METHOD, it is very likely that if
<pkg>_DL_OPTS is defined, the same value should be used for
HOST_<pkg>_DL_OPTS, so let's have the same inheritance logic than the
one we have for other variables.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12321

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 085f32c17b408fbac68d92232b42d49e883e1f69)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3cb13176ed..cd8434e94d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -538,6 +538,12 @@ ifndef $(2)_SITE_METHOD
  endif
 endif
 
+ifndef $(2)_DL_OPTS
+ ifdef $(3)_DL_OPTS
+  $(2)_DL_OPTS = $$($(3)_DL_OPTS)
+ endif
+endif
+
 ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
