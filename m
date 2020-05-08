From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 09:58:28 +0200
Subject: [Buildroot] [git commit] package/apparmor: fix compatibility with
 busybox grep
Message-ID: <20200508075218.D1CDF90F1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=515751036c15048c1f3af81e98c189ac3f3bd1d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following regex string in rc.apparmor.functions
"^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is broken due to
the unescaped { at the end of the regex pattern.
GNU grep ignors the error. However, the Busybox grep does not and throws the
error "unescaped character {"

Escape the "{" character to fix this issue.

Note: Upstream has rewritten large sections of the rc.apparmor.functions file
and the function this patch fixes will no longer be necessary after the next
version is released. However, it is not possible to easily backport the
upstream patches as the rewrite comes with new features that would not be
possible with a simple patch such as this one.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...n-rc.apparmor.functions-to-work-with-busy.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
new file mode 100644
index 0000000000..c372a86998
--- /dev/null
+++ b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
@@ -0,0 +1,37 @@
+From 12764faa0a01bcc4e0ffc92ce308985dbad0d954 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Thu, 7 May 2020 18:25:29 -0700
+Subject: [PATCH] fix regex in rc.apparmor.functions to work with busybox
+
+The following regex string in rc.apparmor.functions
+"^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is broken due to
+the unescaped {. GNU grep ignores the error. However, the Busybox grep does
+not and throws the error "unescaped character {"
+
+Escape the "{" character to fix this issue.
+
+Note: Upstream has rewritten large sections of the rc.apparmor.functions file
+and the function this patch fixes will no longer be necessary after the next
+version is released.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ parser/rc.apparmor.functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
+index f3108f8..db0697c 100644
+--- a/parser/rc.apparmor.functions
++++ b/parser/rc.apparmor.functions
+@@ -140,7 +140,7 @@ force_complain() {
+ 	local profile=$1
+ 
+ 	# if profile not in complain mode
+-	if ! egrep -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" $profile ; then
++	if ! grep -E -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+\{" $profile ; then
+ 		local link="${PROFILE_DIR}/force-complain/`basename ${profile}`"
+ 		if [ -e "$link" ] ; then
+ 			aa_log_warning_msg "found $link, forcing complain mode"
+-- 
+2.26.2
+
