From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 23:10:58 +0200
Subject: [Buildroot] [PATCH 5/5] utils/genrandconfig: add a 30-minute timeout
In-Reply-To: <cover.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <17a71c0c569e1b66a46ef40f14f07db8adf847b9.1534972250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some autobuilders seem to have difficulties downloading big git trees.
Sicne those are autobuilders, they only test known git sha1s or tags, so
they eventually get cached in our primary mirror, and thus we can expect
that slow autobuilders can eventually fetch them from there.

Add a relatively high timeout, so that those autobuilders are not stuck
forever in downloads.

Should fix autobuild issues like:
    http://autobuild.buildroot.org/results/ddb/ddbc96b24017f2a2b06c6091dea3e19520bf2dd1/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hollis Blanchard <hollis_blanchard@mentor.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 27f84ea555..2dbdc2ccf6 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -353,6 +353,9 @@ def gen_config(args):
     # Allow hosts with old certificates to download over https
     configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"")
 
+    # Don't be stuck forever downloading big git trees, timeout after 30 min
+    configlines.append("BR2_DL_TIMEOUT=\"30m\"")
+
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
-- 
2.14.1
