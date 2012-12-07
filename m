From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  6 Dec 2012 21:37:07 -0500
Subject: [Buildroot] [PATCH] pkg-download.mk: fix multiple matches in
	shallow clone test
Message-ID: <1354847827-4902-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the git reference directly to git-ls-remote rather than
piping the output to grep, to help avoid reporting partial
matches rather than the actual requested reference.  Also,
add quotes to protest "test" from failing when multiple
strings are reported.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/pkg-download.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ea01b05..1705fcd 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -82,7 +82,7 @@ domainseparator=$(if $(1),$(1),/)
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	 ((test `git ls-remote  $($(PKG)_SITE) | cut -f 2- | grep $($(PKG)_DL_VERSION)` && \
+	 ((test "`git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION)`" && \
 	   echo "Doing shallow clone" && \
 	   $(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) || \
 	  (echo "Doing full clone" && \
-- 
1.7.9.5
