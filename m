From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 18 Apr 2015 18:54:25 +0200
Subject: [Buildroot] [PATCH 1/3] support/download/cvs: add support to use a
	date instead of a tag
In-Reply-To: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1429376067-9228-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful when a tag is not avaiable.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 support/download/cvs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/download/cvs b/support/download/cvs
index 2c3a666..6491cc8 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -26,7 +26,15 @@ rev="${3}"
 rawname="${4}"
 basename="${5}"
 
+if [[ ${rev} =~ ^[0-9] ]]; then
+    # Date, because a tag cannot begin with a number
+    select="-D ${rev}"
+else
+    # Tag
+    select=-"r :${rev}"
+fi
+
 ${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
+       co -d "${basename}" ${select} -P "${rawname}"
 
 tar czf "${output}" "${basename}"
-- 
2.3.5
