From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 11:20:55 +0100
Subject: [Buildroot] [git commit] perl: fix on uClibc without IPv6 support
Message-ID: <20131027102254.B97D29BBED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a4a11a5d1388cf358df8191acea990718fc8704
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl-uClibc-IPv6.patch |   61 +++++++++++++++++++++++++++++++++++
 1 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl-uClibc-IPv6.patch b/package/perl/perl-uClibc-IPv6.patch
new file mode 100644
index 0000000..8ace75e
--- /dev/null
+++ b/package/perl/perl-uClibc-IPv6.patch
@@ -0,0 +1,61 @@
+fix on uClibc without IPv6 support
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/cpan/Socket/Socket.xs
+===================================================================
+--- a/cpan/Socket/Socket.xs
++++ b/cpan/Socket/Socket.xs
+@@ -896,7 +896,7 @@
+ 	CODE:
+ #ifdef HAS_INETNTOP
+ 	STRLEN addrlen;
+-#ifdef AF_INET6
++#if (defined(__UCLIBC__) && defined(__UCLIBC_HAS_IPV6__)) || (!defined(__UCLIBC__) && defined(AF_INET6))
+ 	struct in6_addr addr;
+ 	char str[INET6_ADDRSTRLEN];
+ #else
+@@ -916,7 +916,7 @@
+ 		croak("Bad address length for Socket::inet_ntop on AF_INET;"
+ 		      " got %"UVuf", should be 4", (UV)addrlen);
+ 	    break;
+-#ifdef AF_INET6
++#if (defined(__UCLIBC__) && defined(__UCLIBC_HAS_IPV6__)) || (!defined(__UCLIBC__) && defined(AF_INET6))
+ 	  case AF_INET6:
+ 	    if(addrlen != 16)
+ 		croak("Bad address length for Socket::inet_ntop on AF_INET6;"
+@@ -925,7 +925,7 @@
+ #endif
+ 	  default:
+ 		croak("Bad address family for %s, got %d, should be"
+-#ifdef AF_INET6
++#if (defined(__UCLIBC__) && defined(__UCLIBC_HAS_IPV6__)) || (!defined(__UCLIBC__) && defined(AF_INET6))
+ 		      " either AF_INET or AF_INET6",
+ #else
+ 		      " AF_INET",
+@@ -955,7 +955,7 @@
+ #ifdef HAS_INETPTON
+ 	int ok;
+ 	int addrlen = 0;
+-#ifdef AF_INET6
++#if (defined(__UCLIBC__) && defined(__UCLIBC_HAS_IPV6__)) || (!defined(__UCLIBC__) && defined(AF_INET6))
+ 	struct in6_addr ip_address;
+ #else
+ 	struct in_addr ip_address;
+@@ -965,14 +965,14 @@
+ 	  case AF_INET:
+ 	    addrlen = 4;
+ 	    break;
+-#ifdef AF_INET6
++#if (defined(__UCLIBC__) && defined(__UCLIBC_HAS_IPV6__)) || (!defined(__UCLIBC__) && defined(AF_INET6))
+ 	  case AF_INET6:
+ 	    addrlen = 16;
+ 	    break;
+ #endif
+ 	  default:
+ 		croak("Bad address family for %s, got %d, should be"
+-#ifdef AF_INET6
++#if (defined(__UCLIBC__) && defined(__UCLIBC_HAS_IPV6__)) || (!defined(__UCLIBC__) && defined(AF_INET6))
+ 		      " either AF_INET or AF_INET6",
+ #else
+ 		      " AF_INET",
