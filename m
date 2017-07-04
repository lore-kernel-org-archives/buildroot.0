From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 17:36:02 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] setlocalversion: fix
	detection of hg revision for untagged versions
Message-ID: <20170704154817.AC3B17FAFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a704805131024f4b0ad8da09a8e493d1cde05f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

By default, cut prints the entire line if the specified delimiter is not
present at all:

    $ printf "foo bar" | cut -d' ' -f2
    bar
    $ printf "foobar" | cut -d' ' -f2
    foobar

In setlocalversion, cut is presented with the output of 'hg id' which has
the format:

    "<revision> <tags-if-any>"

If the current revision is not tagged, the output of 'hg id' does not
contain the delimiter (space), cut prints the entire string, and
setlocalversion thinks the version is the tag.
As setlocalversion does not print anything for tagged versions, there is no
output overall, and no correct indication of the mercurial revision.

Fix by passing the extra cut option '--only-delimited', which suppresses
output if no delimiter is found.

This problem likely went unnoticed for so long, because the tag 'tip' (i.e.
most recent revision of the branch) is treated specially: in this case the
mercurial revision _is_ printed, i.e. the situation is treated as
'untagged'.
The problem is only seen when you are _not_ at the most recent revision in
your branch.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ec019bcf643de83d502f30d85d56dd4547b0c11b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
index adeeb78..33cd605 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -54,7 +54,7 @@ fi
 
 # Check for mercurial and a mercurial repo.
 if hgid=`hg id 2>/dev/null`; then
-	tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+	tag=`printf '%s' "$hgid" | cut -d' ' -f2 --only-delimited`
 
 	# Do we have an untagged version?
 	if [ -z "$tag" -o "$tag" = tip ]; then
