From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Nov 2017 14:18:57 +0100
Subject: [Buildroot] [git commit] support/download: svn non-interactive in
 BR2_SVN
Message-ID: <20171126132609.ADA3E81493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad477b08593bbffee7d9d8a64a18f98105735a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of overriding the _svn command and injecting --non-interactive,
change the default value of BR2_SVN to include this flag so the end user
can choose not to use the flag.

This change helps users behind corporate system rules which may not
allow them to locally cache credentials and require interactive mode.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

[Originally implemented by]
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in            | 2 +-
 support/download/svn | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 8920b72..75e5604 100644
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
index 9f27d71..77abf3d 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -33,6 +33,6 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
+_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
