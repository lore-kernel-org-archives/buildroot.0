From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Jul 2021 22:33:28 +0200
Subject: [Buildroot] [git commit] Revert "package/pkg-python: invalidate
 precompiled _sysconfigdata*.pyc"
Message-ID: <20210708200918.1BC9595441@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b928074e2d83f5b873bf1ba381b212dfad9bf207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This causes build failure for the first host python package get built,
because the $(STAGING_DIR)/usr/lib/python* may not yet exist by tht
time, so find will whine and fail.

This was was alrady the case for the existing find call, a few lines
above, but that was ignored as find is a left-hand-side of a pipe, so
its return code was ignored.

Fixes:
    http://autobuild.buildroot.org/results/860a188bd270c59b1fee2f56f31e73689f0e4979/build-end.log

... where we can see the two find error messages, but only the second
one causes the breakage.

This reverts commit 836528f03eb89fdc64432f7a7470145ddf553b8c.

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-python.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 1e4fd5ba33..59a48e5a87 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -97,8 +97,6 @@ define PKG_PYTHON_FIXUP_SYSCONFIGDATA
 	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
 		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
 		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.pyc" -delete
 endef
 endif
 
