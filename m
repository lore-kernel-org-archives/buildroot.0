From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Wed, 4 Mar 2020 13:41:24 +0000
Subject: [Buildroot] [PATCH] Makefile: work around a bug in newly
 released make 4.3
In-Reply-To: <20200304125330.8948-1-yann.morin.1998@free.fr>
References: <20200304125330.8948-1-yann.morin.1998@free.fr>
Message-ID: <VI1PR02MB3920623E71FF15DDA53631DDDCE50@VI1PR02MB3920.eurprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I've tested the patch against master and using a br2-external tree and 
it works.
I've also tested it against buildroot-2019.02.9, but there it needs 
to be adjusted: `$(BASE_DIR)/.br-external.mk:;`

Mircea

________________________________________
From: buildroot <buildroot-bounces@busybox.net> on behalf of Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Wednesday, March 4, 2020 14:53
To: buildroot at buildroot.org
Cc: Yann E. MORIN
Subject: [Buildroot] [PATCH] Makefile: work around a bug in newly released make 4.3

Several users of rolling-release distributions have been reporting on
IRC that Buildroot is broken now that they have switched to the newly
released make 4.3.

It turns out that the constructs we use to generated and ionclude the
internal br2-external related fragments is no longer working with
make-4.3.

Indeed, an upstream bug report [0] seems to imply that it so far was
working by chance. There has been no further feedback, whether this is
really considered a fix or a regression...

In the meantime, we add a workaround that fixes the issue, and should
not break on older make versions either (verified on all relevant
versions: 3.81, 3.82, 4.0, 4.1, and 4.2).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Mircea Gliga <mgliga@bitdefender.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 31624f77a2..c22c1d8980 100644
--- a/Makefile
+++ b/Makefile
@@ -188,6 +188,9 @@ ifneq ($(BR2_EXTERNAL_ERROR),)
 $(error $(BR2_EXTERNAL_ERROR))
 endif

+# Workaround bug #57676 in make-4.3
+$(BASE_DIR)/.br2-external.mk:;
+
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
--
2.20.1

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

________________________
This email was scanned by Bitdefender
