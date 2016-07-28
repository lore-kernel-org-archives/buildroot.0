From: =?UTF-8?q?Enrique=20Oca=C3=B1a=20Gonz=C3=A1lez?= <eocanha@igalia.com>
Date: Thu, 28 Jul 2016 10:40:22 +0200
Subject: [Buildroot] [PATCH 1/1] Fix backward incompatibility on git
	downloader for git older than 1.8.4
Message-ID: <1469695222-1749-1-git-send-email-eocanha@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "--no-patch" option used by the git downloader appeared on git
1.8.4. Systems with older git versions show an error and fall back to
the wget downloader, which isn't suitable for all the cases.

Signed-off-by: Enrique Oca?a Gonz?lez <eocanha@igalia.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 663006b..416cd1b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -76,7 +76,7 @@ _git checkout -q "'${cset}'"
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
-date="$( _git show --no-patch --pretty=format:%cD )"
+date="$( _git log -1 --pretty=format:%cD )"
 
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
-- 
1.8.3.2
