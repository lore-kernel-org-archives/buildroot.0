From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 17 Apr 2018 04:12:46 -0300
Subject: [Buildroot] [PATCH v2] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
Message-ID: <20180417071246.12046-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current logic that removes 5 files at random to force the download
to be tested eventually ends up removing files from the git
repositories used as cache by the download infra.

When a file that was previously checked out in a git cache is removed,
the next 'git checkout' succeeds but does not checkout that file. The
repo remains with 'Changes not staged for commit', the tarball is
generated and the hash mismatches, causing a build failure.

Ensure only the tarballs are removed by excluding any file inside a git
repository from the list of potential files to remove.
The download infra for git method uses 'git fetch' when regenerating the
tarball, this command fails as expected if the upstream location
changed.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 -> v2: (after review by Thomas Petazzoni)
  - add comment to the code to clarify why we test for '.git' and not
    'git';
  - use the most correct syntax: del;

I tested this by first populating the instance-0/dl/ with 22GB of
tarballs + git cache that I have locally, then I added 'continue' in the
main loop of the script just after prepare_build() returned.
After the script removed all tarballs from instance-0/dl/, I manually
checked the tarball for git package was removed, there are git
repositories and they are sane (using git fsck) and have a clean
worktree (using git status).
Tested with Python 2.7.14
---
 scripts/autobuild-run | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 33d0ae9..5b3d1c5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -291,6 +291,13 @@ def prepare_build(**kwargs):
     # recursively find files under root
     def find_files(root):
         for r, d, f in os.walk(root):
+            # do not remove individual files from git caches. 'git' can
+            # be either dl/<package>/git or dl/git and we want to
+            # eventually remove tarballs for the git package, so check
+            # for '.git' instead to match only dl/<package>/git/.git .
+            if '.git' in d:
+                del d[:]
+                continue
             for i in f:
                 yield os.path.join(r, i)
 
-- 
2.14.1
