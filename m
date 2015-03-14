From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 13:28:00 +0100
Subject: [Buildroot] [git commit] libpcap: update libnl fix patch
Message-ID: <20150314122812.1EBAD807A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=272bb6b27c42afb84a27129f190a3939a337489e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We also need to nuke bad LIBS assumptions, fixes:
http://autobuild.buildroot.net/results/bbd/bbde2b62d4b677e71a62b25fb9ccb4ac4764a4aa/
http://autobuild.buildroot.net/results/5de/5dedfb19df476a633e4449d44e7ba2778bf5b737/
...and lots more of those kind.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libpcap/0001-remove-libnl-include-path.patch   |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libpcap/0001-remove-libnl-include-path.patch b/package/libpcap/0001-remove-libnl-include-path.patch
index a4039ef..d0760d4 100644
--- a/package/libpcap/0001-remove-libnl-include-path.patch
+++ b/package/libpcap/0001-remove-libnl-include-path.patch
@@ -4,16 +4,22 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for 1.7.2]
 
 diff -Nura libpcap-1.7.2.orig/configure.in libpcap-1.7.2/configure.in
---- libpcap-1.7.2.orig/configure.in	2015-03-11 10:02:44.416189921 -0300
-+++ libpcap-1.7.2/configure.in	2015-03-11 10:03:03.967633673 -0300
-@@ -466,9 +466,8 @@
+--- libpcap-1.7.2.orig/configure.in	2015-03-14 08:02:05.538706347 -0300
++++ libpcap-1.7.2/configure.in	2015-03-14 08:17:22.637519050 -0300
+@@ -461,14 +461,13 @@
+ 			#
+ 			# Yes, we have libnl 3.x.
+ 			#
+-			LIBS="${libnldir} -lnl-genl-3 -lnl-3 $LIBS"
++			LIBS="-lnl-genl-3 -lnl-3 $LIBS"
+ 			AC_DEFINE(HAVE_LIBNL,1,[if libnl exists])
  			AC_DEFINE(HAVE_LIBNL_3_x,1,[if libnl exists and is version 3.x])
  			AC_DEFINE(HAVE_LIBNL_NLE,1,[libnl has NLE_FAILURE])
  			AC_DEFINE(HAVE_LIBNL_SOCKETS,1,[libnl has new-style socket api])
 -			V_INCLS="$V_INCLS ${incdir}"
  			have_any_nl="yes"
 -		],[], ${incdir} ${libnldir} -lnl-genl-3 -lnl-3 )
-+		],[], ${libnldir} -lnl-genl-3 -lnl-3 )
++		],[], -lnl-genl-3 -lnl-3 )
  
  		if test x$have_any_nl = xno ; then
  			#
