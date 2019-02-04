From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:25:33 +0100
Subject: [Buildroot] [git commit] support/scripts/setlocalversion: fix
 detection of hg revision when _not_ on branch 'default'
Message-ID: <20190204202416.58D678376B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57e6dcf5fbdbdd2079d92c8f6029ec7385e96e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Buildroot is stored in a Mercurial repository on a branch other than
'default' ('master' in git terms), setlocalversion (used to populate
/etc/os-release) will incorrectly think that this is a tagged version and
will NOT print out the revision hash.

This is due to the fact that the output of 'hg id' is assumed to be
    "<revision> <tags-if-any>"
but when on a branch it actually is:
    "<revision> (<branch>) <tags-if-any>"

To let setlocalversion receive the output it expects, explicitly ask 'hg id'
to retrieve only the revision hash and any tags, ommitting any branch
information.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
index 33cd605bf3..45f4283bb1 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -53,7 +53,7 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 fi
 
 # Check for mercurial and a mercurial repo.
-if hgid=`hg id 2>/dev/null`; then
+if hgid=`hg id --id --tags 2>/dev/null`; then
 	tag=`printf '%s' "$hgid" | cut -d' ' -f2 --only-delimited`
 
 	# Do we have an untagged version?
