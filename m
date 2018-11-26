From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:14:17 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] core: ensure we use the
 realpath(3) of DL_DIR
Message-ID: <20181126161114.DCBBE886D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4bb2ef5ea3dfcfc70b9786e6d2c7bae68fa2fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

When $(TOPDIR)/dl is a symlink, checking out git submodules can fail,
as reported by Michael in #11086.

To reproduce a similarly-related mis-behaviour:

    $ mkdir -p foo/bar foo/buz
    $ cd foo/bar
    $ ln -s ../buz meh
    $ cd meh
    $ cd ../../foo

The last command should not succeed, because, relative to meh, there is
no ../../foo directory; we would expect it to be ../../../foo, instead.
But since meh is a symlink to a directory, then a relative path from that
symlink is interpreted as relative to the derefrenced directory, i.e.
from buz in this case.

But where this gets even weirder, is that, if the last command is
replaced by:

    $ cd ../../../foo

then it still works, too.

And that is the root of Michael's issue: the dl directory in Buildroot's
TOPDIR is a symlink to a similarly-named directory one directory higher,
which then confuses relative paths, which gets especially and noticeably
bad for git submodules.

Avoid this strangeness, and just use so-called "physical" path, i.e. a
path where all symlinks to directories have been dereferenced.

Fixes: #11086

Reported-by: Michael Nosthoff <posted@heine.so>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <posted@heine.so>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 632e164a19fc3d1ce419c60eb85214d42a673b28)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bf93b9a08e..6a50c920d8 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -32,8 +32,8 @@ else
 BR2_DL_DIR = $(DL_DIR)
 endif
 
-# ensure it exists and a absolute path
-DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
+# ensure it exists and a absolute path, derefrecing symlinks
+DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd -P)
 
 #
 # URI scheme helper functions
