From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue,  9 Jul 2019 09:45:49 +0200
Subject: [Buildroot] [PATCH 1/3] package/pkg-generic: allow to use
 <pkg>_DL_VERSION in packages .mk files
In-Reply-To: <20190709074551.22747-1-victor.huesca@bootlin.com>
References: <20190709074551.22747-1-victor.huesca@bootlin.com>
Message-ID: <20190709074551.22747-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch continue the work done here http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-4-Sanetize-packages-version-tp225554.html
By making this DL_VERSION public we should be able to handle the missing corner-cases
with package version sanitizeing.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9620dec524..c48f54a2b7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -447,7 +447,9 @@ $(2)_PKGDIR			=  $(pkgdir)
 # version control system branch or tag, for example remotes/origin/1_10_stable.
 # Similar for spaces and colons (:) that may appear in date-based revisions for
 # CVS.
-ifndef $(2)_VERSION
+ifdef $(2)_DL_VERSION
+ $(2)_DL_VERSION := $$(strip $$($(2)_DL_VERSION))
+else ifndef $(2)_VERSION
  ifdef $(3)_DL_VERSION
   $(2)_DL_VERSION := $$($(3)_DL_VERSION)
  else ifdef $(3)_VERSION
-- 
2.21.0
