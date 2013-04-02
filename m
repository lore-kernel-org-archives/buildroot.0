From: Patrick Boettcher <pboettcher@kernellabs.com>
Date: Tue,  2 Apr 2013 21:40:09 +0200
Subject: [Buildroot] [PATCH] pkg-download: take some more care of
	<PKG_>VERSION when METHOD is git
In-Reply-To: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
References: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
Message-ID: <1364931609-2459-2-git-send-email-Patrick.Boettcher@parrot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a package's SITE_METHOD is set to git, but the VERSION is not set
it fails to create a tar-ball, this patch is fixes this by always using
HEAD as git-archive reference.

HEAD will work in both cases:
1) if VERSION is set the clone's HEAD is VERSION,
2) if VERSION is not set the clone's HEAD is the default branch.

Signed-off-by: Patrick Boettcher <Patrick.Boettcher@parrot.com>
---
 package/pkg-download.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1705fcd..610ceb3 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -77,6 +77,10 @@ domainseparator=$(if $(1),$(1),/)
 # branch). Before trying to do a shallow clone we check if $($(PKG)_DL_VERSION)
 # is in the list provided by git ls-remote. If not we fall back on a full clone.
 #
+# In any case we archive HEAD (and not $($(PKG)_DL_VERSION)): if VERSION is not
+# set the default branch is checked out and git-archive will fail if no refspec
+# is given. HEAD will continue to work if VERSION is set.
+#
 # Messages for the type of clone used are provided to ease debugging in case of
 # problems
 define DOWNLOAD_GIT
@@ -88,7 +92,7 @@ define DOWNLOAD_GIT
 	  (echo "Doing full clone" && \
 	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
-	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
+	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ HEAD | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
 	popd > /dev/null && \
 	rm -rf $($(PKG)_DL_DIR) && \
-- 
1.7.10.4
