From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Sep 2012 22:54:20 +0200
Subject: [Buildroot] [git commit] pkg-infra: warn about use of deprecated
	GENTARGETS
Message-ID: <20120905215420.EDD0B97020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e0d702b7cfa09c9b4b4b0047b10be9f8bbf95a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the replacement of GENTARGETS by package-generic, there is a risk
that local packages don't work anymore without any indication of what
is wrong.  Therefore, generate an error message if the GENTARGETS,
AUTOTARGETS or CMAKETARGETS macro is still used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 340e387..64508b2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -300,6 +300,12 @@ else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
+# Warn if a package uses the deprecated GENTARGETS macros.  This can be
+# removed again for BR-2012.11.
+GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval $$$$(host-generic-package)))
+AUTOTARGETS = $$(error The AUTOTARGETS macro no longer exists; use $$$$(eval $$$$(autotools-package)) or $$$$(eval $$$$(host-autotools-package)))
+CMAKETARGETS = $$(error The CMAKETARGETS macro no longer exists; use $$$$(eval $$$$(cmake-package)) or $$$$(eval $$$$(host-cmake-package)))
+
 include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
