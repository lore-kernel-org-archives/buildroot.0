From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:13:55 +0100
Subject: [Buildroot] [git commit] support/download: really,
	really make git archives reproducible
Message-ID: <20160227222849.B8D83800D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87731820926cd6f51879d7b89687bfec2e615b3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The way we use it, gzip will store the current time in the header, which
leads to unreproducible archives.

Fix that by telling gzip to not store the name and date of the file it
compresses, with the -n option. Since it compresses its stdin, there was
already no filename stored; now there's even no date stored.

Note: gzip has had -n since at least 1.2.4, released in 1993, so
virtually every gzip out there nowadays has it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index e342ed3..314b388 100755
--- a/support/download/git
+++ b/support/download/git
@@ -55,4 +55,4 @@ fi
 GIT_DIR="${basename}" \
 _git archive --prefix="'${basename}/'" -o "'${output}.tmp'" --format=tar "'${cset}'"
 
-gzip <"${output}.tmp" >"${output}"
+gzip -n <"${output}.tmp" >"${output}"
