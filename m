From: bbj17 at gmx.de <bbj17@gmx.de>
Date: Wed, 30 Mar 2011 17:52:37 +0200
Subject: [Buildroot] fix for package/config/util.c
Message-ID: <20110330155237.111340@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found a bug in package/config/util.c (package/config/patches/08-make-write-deps.patch).

Symbols not starting with BR2_ / PACKAGE_ / TARGET_ will result in memory corruption.

--- package/config/util.c       2011-03-30 17:42:26.911184273 +0200
+++ package/config/util.c.old   2011-03-30 17:37:08.016057639 +0200
@@ -35,12 +35,12 @@
        char *ret;
        if (len < 1)
                return NULL;
-       ret = malloc(len+1);
+       ret = malloc(len);
        if (!ret) {
                printf("Out of memory!");
                exit(1);
        }
-       memset(ret, 0, len+1);
+       memset(ret, 0, len);
        i = j = 0;
        if (strncmp("BR2_", in, 4) == 0)
                i += 4;

Ben
-- 
GMX DSL Doppel-Flat ab 19,99 Euro/mtl.! Jetzt mit 
gratis Handy-Flat! http://portal.gmx.net/de/go/dsl
