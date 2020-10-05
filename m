From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2020 08:09:43 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 support/scripts/setlocalversion: fix/improve Mercurial output
Message-ID: <20201005060154.44F8F8EB9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f15df857d06d55ba9d5e58d0b21dbe9a42dbf39c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Commit 9e4ffdc8cfdf4c73f4fa8c66259a5aadaee4ae88 modified the output of
'setlocalversion' so that the Buildroot version tag is included in the
output, the version part was added in Makefile.

Due to differences in behavior of the used git and Mercurial commands, this
caused different output for the Mercurial case, in BR2_VERSION_FULL and thus
/etc/os-release and 'make print-version'. Assuming the official Buildroot
releases are tagged and no project-specific tags are present, the output
after commit 9e4ffdc8cfdf4c73f4fa8c66259a5aadaee4ae88 is:
    -hg<commit>
whereas it is expected to be something like:
    2020.02.6-hg<commit>

Change the Mercurial case in setlocalversion to behave similar to git,
looking up the latest tag if the current revision is not itself tagged.

The number of commits after the latest tag is not added, unlike in git, as
this value is not commonly present in Mercurial output, and its added value
can be disputed in this context. Even one commit could bring a huge change
to the sources, so in order to interpret the number one has to look at the
repository anyhow, in which case the commit ID can just be used.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 32eb5a1d16559d147e610e5158154ed9518f63e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/setlocalversion | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
index e04c955d9e..d492f2db2f 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -48,14 +48,28 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 fi
 
 # Check for mercurial and a mercurial repo.
+# In the git case, 'git describe' will show the latest tag, and unless we are
+# exactly on that tag, the number of commits since then, and last commit id.
+# Mimic something similar in the Mercurial case.
 if hgid=`HGRCPATH= hg id --id --tags 2>/dev/null`; then
 	tag=`printf '%s' "$hgid" | cut -d' ' -f2 --only-delimited`
 
 	# Do we have an untagged version?
 	if [ -z "$tag" -o "$tag" = tip ]; then
+		# current revision is not tagged, determine latest tag
+		latesttag=`HGRCPATH= hg log -r. -T '{latesttag}' 2>/dev/null`
+		# In case there is more than one tag on the latest tagged commit,
+		# 'latesttag' will separate them by colon (:). We'll retain this.
+		# In case there is no tag at all, 'null' will be returned.
+		if [ "$latesttag" = "null" ]; then
+			latesttag=''
+		fi
+
+		# add the commit id
 		id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
-		printf '%s%s' -hg "$id"
+		printf '%s%s%s' "${latesttag}" -hg "$id"
 	else
+		# current revision is tagged, just print the tag
 		printf ${tag}
 	fi
 
