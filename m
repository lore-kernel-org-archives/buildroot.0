From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 23:35:04 +0200
Subject: [Buildroot] [PATCH] support/downlaod: fix the Hg backend for tags
Message-ID: <1439933704-7451-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 support/download/hg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
