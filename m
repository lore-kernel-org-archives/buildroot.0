From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 15 Jan 2013 17:47:10 +0100
Subject: [Buildroot] [PATCH 3/3] Add parsing of Config.in in ipk-post.sh.
In-Reply-To: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
References: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
Message-ID: <1358268430-2431-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Built packages now contains description from Buildroot.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/scripts/ipk-post.sh |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/support/scripts/ipk-post.sh b/support/scripts/ipk-post.sh
index a5beacb..2bfd736 100755
--- a/support/scripts/ipk-post.sh
+++ b/support/scripts/ipk-post.sh
@@ -38,6 +38,23 @@ for P in $PKG $PKG-i18n $PKG-doc $PKG-dbg $PKG-dev; do
 	[ $P == $PKG-dbg  ] && echo "Depends: $PKG"
 	[ $P == $PKG-doc  ] && echo "Recommends: $PKG"
 	echo "Description: $PKG"
+	STATE=EMPTY
+	while IFS= read LINE; do
+		if [[ $STATE == GETINDENT ]]; then
+		INDENT="$(echo "$LINE" | grep -o '^[ 	]*')" 
+		STATE=GETHELP
+		fi
+		if [[ $STATE == GETHELP ]]; then
+		if [[ "$LINE" =~ ^"$INDENT" ]]; then
+			echo "	${LINE#$INDENT}"
+		elif [[ "$LINE" == "" ]]; then 
+			echo "	." 
+		else 
+			break
+		fi
+		fi
+		[[ "$LINE" =~ ^.*-*help-*$ ]] && STATE=GETINDENT
+	done < $PKG_DIR/Config.in
 	[ $P == $PKG-i18n ] &&  echo -e "	.\n	This package contains locales files"
 	[ $P == $PKG-dev  ] &&  echo -e "	.\n	This package contains developement files"
 	[ $P == $PKG-dbg  ] &&  echo -e "	.\n	This package contains debug symbols"
-- 
1.7.9.5
