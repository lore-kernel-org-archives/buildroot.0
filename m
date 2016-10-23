From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 14:51:16 +0200
Subject: [Buildroot] [git commit] pkg-download: fix fetching URLs with ?
	from PRIMARY/BACKUP
Message-ID: <20161023125350.C8D61819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8740f321fcd2b245e3585b319e2a87aa361656cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages download files (especially patches) with a ? in the
URL. The ? marks the query part of the URL. However, the downloaded
file still contains the ? but from then on it doesn't designate a
query part anymore. Therefore, when fetching from PRIMARY or
BACKUP site over http, the server will report a 404 Not Found.

To fix, we need to replace the ? with %3F. Obviously, this should
be done only when fetching from PRIMARY or BACKUP. For fetching
from the real upstream, the ? really does designate the query part.

Fixes #9371.

Reported-by: Johan Derycke <johanderycke@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: replace 'SECONDARY' by 'BACKUP'.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0f542e6..cfc550e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -210,6 +210,10 @@ endef
 #
 # E.G. use like this:
 # $(call DOWNLOAD,$(FOO_SITE))
+#
+# For PRIMARY and BACKUP site, any ? in the URL is replaced by %3F. A ? in
+# the URL is used to separate query arguments, but the PRIMARY and BACKUP
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
