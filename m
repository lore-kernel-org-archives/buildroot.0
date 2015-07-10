From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 11:09:20 +0200
Subject: [Buildroot] [git commit] support/download/cvs: add support to use a
	date instead of a tag
Message-ID: <20150710091809.3FEA181991@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c0d6592f400a48150d7d4e068d110ca2ed903c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful when a tag is not avaiable.

Also fix support for Fedora where the command "cvs -r :<version>" doesn't work.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/cvs |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

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
