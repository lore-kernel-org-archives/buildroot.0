From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:34:46 +0200
Subject: [Buildroot] [git commit] package/domoticz: fix build with boost
 1.70.0
Message-ID: <20190420143017.342FA8EE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=280b4fde0f7e7ad3aa66f0d079e4969180ca4b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - No autobuilders failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...03-Fix-for-boot-1-70-get_io_service.patch.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch b/package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch
new file mode 100644
index 0000000000..28807fc0b0
--- /dev/null
+++ b/package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch
@@ -0,0 +1,74 @@
+From 9d226dab339f5767ec01ea1bcc9043ceee185cca Mon Sep 17 00:00:00 2001
+From: Rob Peters <info@domoticz.com>
+Date: Mon, 25 Mar 2019 08:50:23 +0100
+Subject: [PATCH] Fix for boot 1.70 get_io_service, fixed #3117
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/9d226dab339f5767ec01ea1bcc9043ceee185cca]
+---
+ hardware/Pinger.cpp                   | 10 ++++++++--
+ hardware/TCPProxy/tcpproxy_server.cpp |  8 +++++++-
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/hardware/Pinger.cpp b/hardware/Pinger.cpp
+index 01a955ba4..184378738 100644
+--- a/hardware/Pinger.cpp
++++ b/hardware/Pinger.cpp
+@@ -18,6 +18,12 @@
+ 
+ #include <iostream>
+ 
++#if BOOST_VERSION >= 107000
++#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
++#else
++#define GET_IO_SERVICE(s) ((s).get_io_service())
++#endif
++
+ class pinger
+ 	: private domoticz::noncopyable
+ {
+@@ -76,7 +82,7 @@ class pinger
+ 				num_tries_++;
+ 				if (num_tries_ > 4)
+ 				{
+-					resolver_.get_io_service().stop();
++					GET_IO_SERVICE(resolver_).stop();
+ 				}
+ 				else
+ 				{
+@@ -118,7 +124,7 @@ class pinger
+ 			if (num_replies_++ == 0)
+ 				timer_.cancel();
+ 			m_PingState = true;
+-			resolver_.get_io_service().stop();
++			GET_IO_SERVICE(resolver_).stop();
+ 		}
+ 		else
+ 		{
+diff --git a/hardware/TCPProxy/tcpproxy_server.cpp b/hardware/TCPProxy/tcpproxy_server.cpp
+index fddac08de..60445d9c2 100644
+--- a/hardware/TCPProxy/tcpproxy_server.cpp
++++ b/hardware/TCPProxy/tcpproxy_server.cpp
+@@ -15,6 +15,12 @@
+ #include "stdafx.h"
+ #include "tcpproxy_server.h"
+ 
++#if BOOST_VERSION >= 107000
++#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
++#else
++#define GET_IO_SERVICE(s) ((s).get_io_service())
++#endif
++
+ namespace tcp_proxy
+ {
+ 	bridge::bridge(boost::asio::io_service& ios)
+@@ -38,7 +44,7 @@ namespace tcp_proxy
+ 		boost::asio::ip::tcp::endpoint end;
+ 
+ 
+-		boost::asio::io_service &ios=downstream_socket_.get_io_service();
++		boost::asio::io_service &ios= GET_IO_SERVICE(downstream_socket_);
+ 		boost::asio::ip::tcp::resolver resolver(ios);
+ 		boost::asio::ip::tcp::resolver::query query(upstream_host, upstream_port, boost::asio::ip::resolver_query_base::numeric_service);
+ 		boost::asio::ip::tcp::resolver::iterator i = resolver.resolve(query);
