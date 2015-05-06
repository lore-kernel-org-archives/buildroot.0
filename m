From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  6 May 2015 14:17:48 +0200
Subject: [Buildroot] [PATCH v3 1/3] support/download/cvs: add support to use
	a date instead of a tag
In-Reply-To: <1430914670-14882-1-git-send-email-fabio.porcedda@gmail.com>
References: <1430914670-14882-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1430914670-14882-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful when a tag is not avaiable.

Also fix support for Fedora where the command "cvs -r :<version>" doesn't work.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/cvs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/download/cvs b/support/download/cvs
index 2c3a666..bfac73b 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -26,7 +26,16 @@ rev="${3}"
 rawname="${4}"
 basename="${5}"
 
+if [[ ${rev} =~ ^[0-9] ]]; then
+    # Date, because a tag or a branch cannot begin with a number
+    select="-D"
+else
+    # Tag or branch
+    select="-r"
+fi
+
+export TZ=UTC
 ${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
+       co -d "${basename}" ${select} "${rev}" -P "${rawname}"
 
 tar czf "${output}" "${basename}"
-- 
2.3.5
