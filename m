From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 09:52:25 +0200
Subject: [Buildroot] [PATCH] support/download: don't be over-remove file
	from git archives
Message-ID: <1467618745-1231-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we now manually create git archives, we remove all .git-related
files. However, we also exclude empty directories.

This means that a directory which only had a .gitignore file is excluded
from the archive.

Fixes:
    http://autobuild.buildroot.org/results/2aa/2aa8954311f009988880d27b6e48af91bc74c346/
    http://autobuild.buildroot.org/results/b45/b45cceea99b9860ccf1c925eeda498a823b30903/
    http://autobuild.buildroot.org/results/5ae/5ae336052fd32057d9631649279e142a81f5651f/
    http://autobuild.buildroot.org/results/5fc/5fc3abf4a1aea677f576e16c49253d00720a8bef/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 
-- 
2.7.4
