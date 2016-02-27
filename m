From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Feb 2016 23:03:15 +0100
Subject: [Buildroot] [PATCH] support/download: really,
	really make git archives reproducible
Message-ID: <1456610595-8715-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The way we use it, gzip will store the current time in the header, which
leads to unreproducible archives.

Fiss that by telling gzip to not store the name and date of the file it
compresses, with the -n option. Since it compresses its stdin, there was
already no filename stored; now there's even no date stored.

Note: gzip has had -n since at least 1.2.4, released in 1993, so
virtually every gzip out there nowadays has it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
1.9.1
