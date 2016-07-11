From: Romain Perier <romain.perier@free-electrons.com>
Date: Mon, 11 Jul 2016 10:48:40 +0200
Subject: [Buildroot] [PATCH 1/6] support/download: Add support for the
	referer option to wget
In-Reply-To: <1468226925-21264-1-git-send-email-romain.perier@free-electrons.com>
References: <1468226925-21264-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1468226925-21264-2-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow user to specify a referer url as optional 3rd argument. Useful for
retrieving documents with server-side processing that assume they are
always being retrieved by interactive web browsers.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
---
 support/download/wget | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/download/wget b/support/download/wget
index 0fc7ffa..68b000c 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -6,7 +6,7 @@ set -e
 # Download helper for wget, to be called from the download wrapper script
 #
 # Call it as:
-#   .../wget [-q] OUT_FILE URL
+#   .../wget [-q] OUT_FILE URL [REFERER_URL]
 #
 # Environment:
 #   WGET     : the wget command to call
@@ -22,6 +22,7 @@ shift $((OPTIND-1))
 
 output="${1}"
 url="${2}"
+referer="${3}"
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -29,4 +30,9 @@ _wget() {
     eval ${WGET} "${@}"
 }
 
-_wget ${verbose} -O "'${output}'" "'${url}'"
+if [[ "$referer" != '' ]]
+then
+	referer_opt="--referer='${referer}'"
+fi
+
+_wget ${verbose} "${referer_opt}" -O "'${output}'" "'${url}'"
-- 
2.8.1
