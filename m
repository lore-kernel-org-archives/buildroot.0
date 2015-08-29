From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:38:00 +0200
Subject: [Buildroot] [git commit branch/next] support/download: fix the Hg
	backend for tags
Message-ID: <20150829094111.3F66F81D8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=697e2b7d948a8a12fd4c08e0beeb9264774ea5fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When the version of a package is a Mercurial tag, the download fails,
with:
    abort: unknown revision 'X.Y.Z'!

This is because, in Mercurial, tags are commits like the others, and
when we clone, we actively request a tag. But then, the server
"dereferences" that tag and sends us the revision pointed to by that
tag. Of course, since the tag is a commit after the revision we got,
we do not have the revision adding the tag.

So, we just have to download the full repository to be sure we have
the tags in our local clone.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/hg |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/download/hg b/support/download/hg
index d6654a1..ac1e9b9 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -25,7 +25,7 @@ repo="${2}"
 cset="${3}"
 basename="${4}"
 
-${HG} clone ${verbose} --noupdate --rev "${cset}" "${repo}" "${basename}"
+${HG} clone ${verbose} --noupdate "${repo}" "${basename}"
 
 ${HG} archive ${verbose} --repository "${basename}" --type tgz \
               --prefix "${basename}" --rev "${cset}" \
