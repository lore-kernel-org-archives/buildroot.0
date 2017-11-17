From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Fri, 17 Nov 2017 12:50:34 -0600
Subject: [Buildroot] [PATCH 1/1] support/download: svn non-interactive in
 BR2_SVN
Message-ID: <1510944634-3374-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of overriding the _svn command and injecting --non-interactive,
change the default value of BR2_SVN to include this flag so the end user
can choose not to use the flag.

This change helps users behind corporate system rules which may not
allow them to locally cache credentials and require interactive mode.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

[Originally implemented by]
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in            | 2 +-
 support/download/svn | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 90f793a..d192995 100644
--- a/Config.in
+++ b/Config.in
@@ -106,7 +106,7 @@ config BR2_WGET
 
 config BR2_SVN
 	string "Subversion (svn) command"
-	default "svn"
+	default "svn --non-interactive"
 
 config BR2_BZR
 	string "Bazaar (bzr) command"
diff --git a/support/download/svn b/support/download/svn
index ee799f4..ad84a39 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -33,7 +33,7 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
+_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
 
 # If this is a HEAD revision, export the exact version
 # that was checked out.
-- 
1.9.1
