From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 May 2017 10:20:05 +0200
Subject: [Buildroot] [PATCH] support/dependencies: check PATH does not carry
	a \n
Message-ID: <20170520082005.11668-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... otherwise it fails spectacularly as soon as PATH is referenced in a
package rule (i.e. very soon, fortunately):

    >>> host-lzip 1.18 Downloading
    /bin/bash: -c: line 0: unexpected EOF while looking for matching `"'
    /bin/bash: -c: line 1: syntax error: unexpected end of file

Fixes # 9886.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ciro Santilli <ciro.santilli@gmail.com>
---
 support/dependencies/dependencies.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 168d1960a1..925414cf18 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -29,6 +29,18 @@ if test -n "$LD_LIBRARY_PATH" ; then
 	fi
 fi;
 
+# PATH should not contain a newline, otherwise it fails in spectacular ways
+# as soon as PATH is referenced in a package rule
+case "${PATH}" in
+(*"
+"*) printf "\n"
+    # Break the '\n' sequence, or a \n is printed (which is not what we want).
+    printf "Your PATH contains a newline (%sn) charater.\n" "\\"
+    printf "This doesn't work. Fix you PATH.\n"
+    exit 1
+    ;;
+esac
+
 # sanity check for CWD in PATH. Having the current working directory
 # in the PATH makes the toolchain build process break.
 # try not to rely on egrep..
-- 
2.11.0
