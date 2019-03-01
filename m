From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Mar 2019 11:12:38 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: speed up
 RECURSIVE_FINAL_DEPENDENCIES
Message-ID: <20190301101250.495BF8D700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a21212fb7cf4868b2f00d1aa22861f6103fab979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Evaluating all the <PKG>_RECURSIVE_FINAL_DEPENDENCIES variables
(abbreviated RFD hereafter) ends up being quite slow.  Enough, on a
reasonable modern workstation, to increase the time it takes to run
"make printvars" from 13 seconds in 2018.02 to 371 seconds in 2019.02.

This patch improves this by using dynamic programming to speed the
evaluation of RFD, reducing the before mentioned printvars time to about
14.6 seconds.

The evaluation of PKG1_RFD requires recursively evaluating each of
PKG1's dependencies' RFDs, then their dependencies' RFDs, and so on.
The same is done for PKG2_RFD.  But it's likely that many of the
dependencies of PKG2 are the same as PKG1.  And when we consider all
packages, the dependencies are re-computed many thousands of times.

To avoid this re-computation we memoize, or save, the computed value of
each RFD variable when it found the first time.  Subsequent evaluations
re-use the memoized value.

Surprisingly, this ends up being not all the hard to implement in make.
The basic construct is this:

VAR = $(if !defined(VAR__X),$(eval VAR__X := value))$(VAR__X)

The first time VAR is evaluated VAR__X will not be defined, and code to
set VAR__X to the computed value is eval'd.  Then the now defined value
of VAR__X is returned.  Subsequent evaluations can just return VAR__X.

It is important to note that VAR is defined with '=', as not enough
information (namely, all packages' dependencies) is know when it is
parsed to find the correct value.  VAR will be evaluated each time it is
used.  But VAR__X is defined with ":=", so that it is evaluated once
when defined, and not each time it is used.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6168b40e89..4353bd3868 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -637,14 +637,17 @@ $(2)_FINAL_ALL_DEPENDENCIES = \
 		$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES) \
 		$$($(2)_FINAL_EXTRACT_DEPENDENCIES) \
 		$$($(2)_FINAL_PATCH_DEPENDENCIES))
-$(2)_FINAL_RECURSIVE_DEPENDENCIES = \
-	$$(sort \
-		$$(foreach p,\
-			$$($(2)_FINAL_ALL_DEPENDENCIES),\
-			$$(p)\
-			$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES)\
-		)\
-	)
+$(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
+	$$(if $$(filter undefined,$$(origin $(2)_FINAL_RECURSIVE_DEPENDENCIES__X)), \
+		$$(eval $(2)_FINAL_RECURSIVE_DEPENDENCIES__X := \
+			$$(foreach p, \
+				$$($(2)_FINAL_ALL_DEPENDENCIES), \
+				$$(p) \
+				$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES) \
+			) \
+		) \
+	) \
+	$$($(2)_FINAL_RECURSIVE_DEPENDENCIES__X))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
