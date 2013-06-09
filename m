From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 21:03:24 +0200
Subject: [Buildroot] [git commit] libglib2: update no IPv6 patch to libglib2
	2.36
Message-ID: <20130609190601.062789AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99328951a3d624938562c64d58b8d130b7b05fbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   http://autobuild.buildroot.net/results/dec/dece077c2cc831332badefb46c386a762ffcad55/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2-0001-optional-ipv6.patch |  154 +++++++++++++++++++-
 1 files changed, 148 insertions(+), 6 deletions(-)

diff --git a/package/libglib2/libglib2-0001-optional-ipv6.patch b/package/libglib2/libglib2-0001-optional-ipv6.patch
index 8e7b418..cbab1f1 100644
--- a/package/libglib2/libglib2-0001-optional-ipv6.patch
+++ b/package/libglib2/libglib2-0001-optional-ipv6.patch
@@ -1,14 +1,17 @@
 [PATCH]: fix build on uClibc without IPv6 support
 
+Updated to glib 2.36 by Thomas Petazzoni.
+
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  gio/ginetaddress.c |    9 +++++++++
  1 file changed, 9 insertions(+)
 
-Index: glib-2.26.0/gio/ginetaddress.c
+Index: b/gio/ginetaddress.c
 ===================================================================
---- glib-2.26.0.orig/gio/ginetaddress.c
-+++ glib-2.26.0/gio/ginetaddress.c
+--- a/gio/ginetaddress.c
++++ b/gio/ginetaddress.c
 @@ -21,6 +21,7 @@
   *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
   */
@@ -17,7 +20,7 @@ Index: glib-2.26.0/gio/ginetaddress.c
  #include <config.h>
  
  #include <string.h>
-@@ -434,7 +435,11 @@
+@@ -423,7 +424,11 @@
    return NULL;
  }
  
@@ -29,7 +32,7 @@ Index: glib-2.26.0/gio/ginetaddress.c
  
  /**
   * g_inet_address_new_from_bytes:
-@@ -483,8 +488,10 @@
+@@ -472,8 +477,10 @@
  
        return g_inet_address_new_from_bytes (addr, family);
      }
@@ -40,7 +43,7 @@ Index: glib-2.26.0/gio/ginetaddress.c
  }
  
  /**
-@@ -510,8 +517,10 @@
+@@ -499,8 +506,10 @@
  
        return g_inet_address_new_from_bytes (addr, family);
      }
@@ -51,3 +54,142 @@ Index: glib-2.26.0/gio/ginetaddress.c
  }
  
  
+Index: b/gio/gsocket.c
+===================================================================
+--- a/gio/gsocket.c
++++ b/gio/gsocket.c
+@@ -425,7 +425,9 @@
+   switch (family)
+     {
+      case G_SOCKET_FAMILY_IPV4:
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+      case G_SOCKET_FAMILY_IPV6:
++#endif
+        socket->priv->family = address.ss_family;
+        switch (socket->priv->type)
+ 	 {
+@@ -1321,11 +1323,13 @@
+       g_socket_get_option (socket, IPPROTO_IP, IP_TTL,
+ 			   &value, &error);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (socket->priv->family == G_SOCKET_FAMILY_IPV6)
+     {
+       g_socket_get_option (socket, IPPROTO_IPV6, IPV6_UNICAST_HOPS,
+ 			   &value, &error);
+     }
++#endif
+   else
+     g_return_val_if_reached (0);
+ 
+@@ -1362,6 +1366,7 @@
+       g_socket_set_option (socket, IPPROTO_IP, IP_TTL,
+ 			   ttl, &error);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (socket->priv->family == G_SOCKET_FAMILY_IPV6)
+     {
+       g_socket_set_option (socket, IPPROTO_IP, IP_TTL,
+@@ -1369,6 +1374,7 @@
+       g_socket_set_option (socket, IPPROTO_IPV6, IPV6_UNICAST_HOPS,
+ 			   ttl, &error);
+     }
++#endif
+   else
+     g_return_if_reached ();
+ 
+@@ -1470,11 +1476,13 @@
+       g_socket_get_option (socket, IPPROTO_IP, IP_MULTICAST_LOOP,
+ 			   &value, &error);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (socket->priv->family == G_SOCKET_FAMILY_IPV6)
+     {
+       g_socket_get_option (socket, IPPROTO_IPV6, IPV6_MULTICAST_LOOP,
+ 			   &value, &error);
+     }
++#endif
+   else
+     g_return_val_if_reached (FALSE);
+ 
+@@ -1515,6 +1523,7 @@
+       g_socket_set_option (socket, IPPROTO_IP, IP_MULTICAST_LOOP,
+ 			   loopback, &error);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (socket->priv->family == G_SOCKET_FAMILY_IPV6)
+     {
+       g_socket_set_option (socket, IPPROTO_IP, IP_MULTICAST_LOOP,
+@@ -1522,6 +1531,7 @@
+       g_socket_set_option (socket, IPPROTO_IPV6, IPV6_MULTICAST_LOOP,
+ 			   loopback, &error);
+     }
++#endif
+   else
+     g_return_if_reached ();
+ 
+@@ -1559,11 +1569,13 @@
+       g_socket_get_option (socket, IPPROTO_IP, IP_MULTICAST_TTL,
+ 			   &value, &error);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (socket->priv->family == G_SOCKET_FAMILY_IPV6)
+     {
+       g_socket_get_option (socket, IPPROTO_IPV6, IPV6_MULTICAST_HOPS,
+ 			   &value, &error);
+     }
++#endif
+   else
+     g_return_val_if_reached (FALSE);
+ 
+@@ -1601,6 +1613,7 @@
+       g_socket_set_option (socket, IPPROTO_IP, IP_MULTICAST_TTL,
+ 			   ttl, &error);
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (socket->priv->family == G_SOCKET_FAMILY_IPV6)
+     {
+       g_socket_set_option (socket, IPPROTO_IP, IP_MULTICAST_TTL,
+@@ -1608,6 +1621,7 @@
+       g_socket_set_option (socket, IPPROTO_IPV6, IPV6_MULTICAST_HOPS,
+ 			   ttl, &error);
+     }
++#endif
+   else
+     g_return_if_reached ();
+ 
+@@ -1965,6 +1979,7 @@
+       result = setsockopt (socket->priv->fd, IPPROTO_IP, optname,
+ 			   &mc_req, sizeof (mc_req));
+     }
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_IPV6__))
+   else if (g_inet_address_get_family (group) == G_SOCKET_FAMILY_IPV6)
+     {
+       struct ipv6_mreq mc_req_ipv6;
+@@ -1982,6 +1997,7 @@
+       result = setsockopt (socket->priv->fd, IPPROTO_IPV6, optname,
+ 			   &mc_req_ipv6, sizeof (mc_req_ipv6));
+     }
++#endif
+   else
+     g_return_val_if_reached (FALSE);
+ 
+@@ -2089,8 +2105,8 @@
+     case G_SOCKET_FAMILY_IPV4:
+       return TRUE;
+ 
+-    case G_SOCKET_FAMILY_IPV6:
+ #if defined (IPPROTO_IPV6) && defined (IPV6_V6ONLY)
++    case G_SOCKET_FAMILY_IPV6:
+       {
+         gint v6_only;
+ 
+@@ -2101,8 +2117,6 @@
+ 
+         return !v6_only;
+       }
+-#else
+-      return FALSE;
+ #endif
+ 
+     default:
