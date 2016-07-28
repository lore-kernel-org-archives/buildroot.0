From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:02:13 +0200
Subject: [Buildroot] [git commit] support/download/git: Fix compatibility
	issue with git older than 1.8.4
Message-ID: <20160728201546.9FC817FDA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e39f0873393189278d92ac3589a329f42c8311c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "--no-patch" option used by the git downloader appeared on git
1.8.4. Systems with older git versions show an error and fall back to
the wget downloader, which isn't suitable for all the cases.

Signed-off-by: Enrique Oca??a Gonz??lez <eocanha@igalia.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
