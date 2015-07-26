From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:06:55 +0200
Subject: [Buildroot] [git commit branch/next] Makefile: unexport O
Message-ID: <20150808105641.2AE8B80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e32330c4a49f2422e88689b653f9d5ffb94077e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

After bee5745ccc2 ("Makefile: don't depend on the umask"), any use
of "make O=<dir>" would leak $O into the enviroment for submakes,
and it's inherited by package makefiles. Some package makefiles have
protections to make sure they don't use the value of $O if it comes from
the enviroment (Linux), but some don't (uClibc).

This caused build failures when using a different output dir.

Fix this by unconditionally unexporting the O variable, since we never
need to have it set in the environment for packages, it should be only
internally used by BR.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 8b9c5d9..9059884 100644
--- a/Makefile
+++ b/Makefile
@@ -329,6 +329,7 @@ unexport CONFIG_SITE
 unexport QMAKESPEC
 unexport TERMINFO
 unexport MACHINE
+unexport O
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
