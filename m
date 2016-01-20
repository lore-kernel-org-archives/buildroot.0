From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 20 Jan 2016 22:53:19 +0100
Subject: [Buildroot] [PATCH] core: override the user's locale while setting
	HOSTARCH
Message-ID: <1453326799-14060-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least with French user's locale HOSTARCH is empty since
'Target' is not present in gcc output.

gcc -v 2>&1
Utilisation des specs internes.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/5.3.1/lto-wrapper
Cible : x86_64-redhat-linux

Override the user's local with LC_ALL=C.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2e09611..17c181b 100644
--- a/Makefile
+++ b/Makefile
@@ -297,7 +297,7 @@ export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 # So, we extract the first part of the tuple the host gcc was
 # configured to generate code for; we assume this is our userland.
 #
-export HOSTARCH := $(shell $(HOSTCC_NOCCACHE) -v 2>&1 | \
+export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 	sed -e '/^Target: \([^-]*\).*/!d' \
 	    -e 's//\1/' \
 	    -e 's/i.86/x86/' \
-- 
2.4.3
