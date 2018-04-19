From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:10:24 +0200
Subject: [Buildroot] [git commit] download/git: be sure we do fetch something
Message-ID: <20180419211049.195AC88830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2b71e852dc4200ce48715a9e9b5ed44379bfec8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The different versions of git will behave in different ways when
fetching remote references, as summarised by the table below:

              |     ancient git         | new git
--------------------------------------------------------------------
git fetch     | fetch all refs but tags | fetches all refs but tags
git fetch -t  | fetches only tags       | fetch all refs and tags

(git-fetch may still fetch tags, but only if reachable from a branch)

So, to cover all the bases, we do a simple fetch, to be sure we have
branches, followed by the existing fetch -t, to get extra tags.

Fixes:
    http://autobuild.buildroot.net/results/0a2/0a238a7f55ea56c33b639ad03ed5796143426889/build-end.log

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/download/git b/support/download/git
index 1172310186..c48ad36b1a 100755
--- a/support/download/git
+++ b/support/download/git
@@ -81,6 +81,7 @@ if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Fetching all references\n"
+    _git fetch origin
     _git fetch origin -t
 fi
 
