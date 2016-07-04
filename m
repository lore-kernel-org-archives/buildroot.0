From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 10:04:22 +0200
Subject: [Buildroot] [git commit] support/download: don't over-remove files
	from git archives
Message-ID: <20160704083224.01FF17FF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1830ca8777b899c3f66be059fcedccdf9fd3295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we now manually create git archives, we removed all .git-related
files. However, we also exclude empty directories.

This means that a directory which only had a .gitignore file is excluded
from the archive.

Fixes:
    http://autobuild.buildroot.org/results/2aa/2aa8954311f009988880d27b6e48af91bc74c346/
    http://autobuild.buildroot.org/results/b45/b45cceea99b9860ccf1c925eeda498a823b30903/
    http://autobuild.buildroot.org/results/5ae/5ae336052fd32057d9631649279e142a81f5651f/
    http://autobuild.buildroot.org/results/5fc/5fc3abf4a1aea677f576e16c49253d00720a8bef/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 45802d3..663006b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -83,9 +83,9 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# We do not need the .git dir and other gitfiles to generate the tarball
-find . \( -name .git -o -name .gitmodules -o -name .gitignore \) \
-       -exec rm -rf {} +
+# We do not need the .git dir; we keep other .git files, in case they
+# are the only files in their directory.
+rm -rf .git
 
 popd >/dev/null
 
