From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 21 May 2018 18:17:18 -0300
Subject: [Buildroot] [PATCH v2] modem-manager: remove -Werror from CFLAGS
In-Reply-To: <CAGm1_kuEqW+Mito5P8rMxdM+zrCFAxpu2TzsZa=mvDAK8d1e1w@mail.gmail.com>
References: <CAGm1_kuEqW+Mito5P8rMxdM+zrCFAxpu2TzsZa=mvDAK8d1e1w@mail.gmail.com>
Message-ID: <20180521211718.5465-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are aproaching the 2018.05 release and modem-manager is still broken
due to warnings like this:

  mm-base-manager.c: In function 'handle_set_logging':
  mm-base-manager.c:680:15: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
       ctx->self = g_object_ref (manager);
                 ^

There is a macro defined in build/libglib2-2.56.1/gobject/gobject.h
which leads to the assignment errors:

  511 /* Make reference APIs type safe with macros */
  512 #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))

The problem can be easily reproduced with this sample code:

  $ cat test.c
  extern void *g_object_ref(void *);
  #define g_object_ref(Obj) ((__typeof__(Obj)) (g_object_ref) (Obj))
  extern double *new_double(int *);
  double *new_double(int *ip) {
    double *dp;
    dp = g_object_ref(ip);
    return dp;
  }

  $ gcc -Wall -Werror -c /tmp/test.c -o /tmp/test.o
  /tmp/test.c: In function ?new_context?:
  /tmp/test.c:19:13: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     ctx->self = g_object_ref(om);
               ^
  cc1: all warnings being treated as errors

Fixing the code would require either changing the 120 ofending calls to
g_object_ref or a refactoring to make all types assignment compatible.
Let's take a simpler approach, disabling extra warnings, and wait for
the next release of ModemManager.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 100c4a2941..fe4a7a95da 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -11,6 +11,7 @@ MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
+MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
-- 
2.17.0
