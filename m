From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 Jul 2016 15:57:18 -0500
Subject: [Buildroot] [PATCH] support/download: support git older then 1.8.x
Message-ID: <1469653038-64643-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A recent commit[1] in the git downloader uses the "--no-patch" option,
which appeared on git 1.8.4. Systems with older git versions show an
error and fall back to the wget downloader, which isn't suitable for
all the cases.

This commit uses a "git log" variant and works on older systems.

[1]
https://github.com/buildroot/buildroot/commit/3abd5ba4243489b821d44e407528020cd8a138f8#diff-75410bcfefacf16bcd60a2a6ac77c433R73

Signed-off-by: Enrique Ocana Gonzalez <eocanha@igalia.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
1.9.1
