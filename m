From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Oct 2016 22:27:15 +0200
Subject: [Buildroot] [PATCH] pkg-download: fix fetching URLs with ? from
	PRIMARY/SECONDARY
Message-ID: <20161021202715.16528-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages download files (especially patches) with a ? in the
URL. The ? marks the query part of the URL. However, the downloaded
file still contains the ? but from then on it doesn't designate a
query part anymore. Therefore, when fetching from PRIMARY or
SECONDARY site over http, the server will report a 404 Not Found.

To fix, we need to replace the ? with %3F. Obviously, this should
be done only when fetching from PRIMARY or SECONDARY. For fetching
from the real upstream, the ? really does designate the query part.

Fixes #9371.

Reported-by: Johan Derycke <johanderycke@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I tested with
make BR2_PRIMARY_SITE=http://localhost/dl BR2_PRIMARY_SITE_ONLY=y BR2_DL_DIR=/tmp/dl openssl
and also checked with a file:// primary site, with secondary site, and
openssl-source-check
---
 package/pkg-download.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0f542e6..65e753c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -210,6 +210,10 @@ endef
 #
 # E.G. use like this:
 # $(call DOWNLOAD,$(FOO_SITE))
+#
+# For PRIMARY and SECONDARY site, any ? in the URL is replaced by %3F. A ? in
+# the URL is used to separate query arguments, but the PRIMARY and SECONDARY
+# sites serve just plain files.
 ################################################################################
 
 define DOWNLOAD
@@ -226,7 +230,7 @@ define DOWNLOAD_INNER
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
 			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
-			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
+			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
 	if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
@@ -245,7 +249,7 @@ define DOWNLOAD_INNER
 		esac ; \
 	fi ; \
 	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
+		$(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ; \
 	fi ; \
 	exit 1
 endef
-- 
2.9.3
