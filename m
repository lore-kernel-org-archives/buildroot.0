From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:39:34 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/bind: security
 bump to version 9.11.10
Message-ID: <20190926094238.A6E848F839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c5d229deed80b3d974e952fdbf13231ee75e221
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Remove all patches except first one (already in version)
- Update first patch
- Fix CVE-2019-6471: A race condition when discarding malformed packets
  can cause BIND to exit with an assertion failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 395ad387e0361714c3a6d080ee6a40b9ca6576d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/0001-cross.patch                      |  13 +-
 ...mic-operations-in-bin-named-client.c-with.patch | 133 ---------------------
 package/bind/bind.hash                             |   4 +-
 package/bind/bind.mk                               |   2 +-
 4 files changed, 12 insertions(+), 140 deletions(-)

diff --git a/package/bind/0001-cross.patch b/package/bind/0001-cross.patch
index 5b4b1cd836..d3e7cc68a6 100644
--- a/package/bind/0001-cross.patch
+++ b/package/bind/0001-cross.patch
@@ -1,18 +1,23 @@
 Use host compiler to build 'gen' since it's run when building.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Fabrice: updated for 9.11.10]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -Nura bind-9.5.1-P1/lib/dns/Makefile.in bind-9.5.1-P1.gencross/lib/dns/Makefile.in
 --- bind-9.5.1-P1/lib/dns/Makefile.in	2007-09-11 22:09:08.000000000 -0300
 +++ bind-9.5.1-P1.gencross/lib/dns/Makefile.in	2009-03-04 16:35:23.000000000 -0200
-@@ -160,8 +160,8 @@
- 	./gen -s ${srcdir} > code.h
+@@ -160,10 +160,8 @@
+ 	./gen -s ${srcdir} > code.h || { rm -f $@ ; exit 1; }
 
  gen: gen.c
 -	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
--	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c ${BUILD_LIBS}
+-	${LFS_CFLAGS} ${LFS_LDFLAGS} \
+-	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
+-	${BUILD_LIBS} ${LFS_LIBS}
 +	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
 +	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
 
- rbtdb64. at O@: rbtdb.c
+ timestamp: include libdns. at A@
+ 	touch timestamp
 
diff --git a/package/bind/0002-Replace-atomic-operations-in-bin-named-client.c-with.patch b/package/bind/0002-Replace-atomic-operations-in-bin-named-client.c-with.patch
deleted file mode 100644
index 2701de766a..0000000000
--- a/package/bind/0002-Replace-atomic-operations-in-bin-named-client.c-with.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From ef49780d30d3ddc5735cfc32561b678a634fa72f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
-Date: Wed, 17 Apr 2019 15:22:27 +0200
-Subject: [PATCH] Replace atomic operations in bin/named/client.c with
- isc_refcount reference counting
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bin/named/client.c                     | 18 +++++++-----------
- bin/named/include/named/interfacemgr.h |  5 +++--
- bin/named/interfacemgr.c               |  7 +++++--
- 3 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/bin/named/client.c b/bin/named/client.c
-index 845326abc0..29fecadca8 100644
---- a/bin/named/client.c
-+++ b/bin/named/client.c
-@@ -402,12 +402,10 @@ tcpconn_detach(ns_client_t *client) {
- static void
- mark_tcp_active(ns_client_t *client, bool active) {
- 	if (active && !client->tcpactive) {
--		isc_atomic_xadd(&client->interface->ntcpactive, 1);
-+		isc_refcount_increment0(&client->interface->ntcpactive, NULL);
- 		client->tcpactive = active;
- 	} else if (!active && client->tcpactive) {
--		uint32_t old =
--			isc_atomic_xadd(&client->interface->ntcpactive, -1);
--		INSIST(old > 0);
-+		isc_refcount_decrement(&client->interface->ntcpactive, NULL);
- 		client->tcpactive = active;
- 	}
- }
-@@ -554,7 +552,7 @@ exit_check(ns_client_t *client) {
- 		if (client->mortal && TCP_CLIENT(client) &&
- 		    client->newstate != NS_CLIENTSTATE_FREED &&
- 		    !ns_g_clienttest &&
--		    isc_atomic_xadd(&client->interface->ntcpaccepting, 0) == 0)
-+		    isc_refcount_current(&client->interface->ntcpaccepting) == 0)
- 		{
- 			/* Nobody else is accepting */
- 			client->mortal = false;
-@@ -3328,7 +3326,6 @@ client_newconn(isc_task_t *task, isc_event_t *event) {
- 	isc_result_t result;
- 	ns_client_t *client = event->ev_arg;
- 	isc_socket_newconnev_t *nevent = (isc_socket_newconnev_t *)event;
--	uint32_t old;
- 
- 	REQUIRE(event->ev_type == ISC_SOCKEVENT_NEWCONN);
- 	REQUIRE(NS_CLIENT_VALID(client));
-@@ -3348,8 +3345,7 @@ client_newconn(isc_task_t *task, isc_event_t *event) {
- 	INSIST(client->naccepts == 1);
- 	client->naccepts--;
- 
--	old = isc_atomic_xadd(&client->interface->ntcpaccepting, -1);
--	INSIST(old > 0);
-+	isc_refcount_decrement(&client->interface->ntcpaccepting, NULL);
- 
- 	/*
- 	 * We must take ownership of the new socket before the exit
-@@ -3480,8 +3476,8 @@ client_accept(ns_client_t *client) {
- 		 * quota is tcp-clients plus the number of listening
- 		 * interfaces plus 1.)
- 		 */
--		exit = (isc_atomic_xadd(&client->interface->ntcpactive, 0) >
--			(client->tcpactive ? 1 : 0));
-+		exit = (isc_refcount_current(&client->interface->ntcpactive) >
-+			(client->tcpactive ? 1U : 0U));
- 		if (exit) {
- 			client->newstate = NS_CLIENTSTATE_INACTIVE;
- 			(void)exit_check(client);
-@@ -3539,7 +3535,7 @@ client_accept(ns_client_t *client) {
- 	 * listening for connections itself to prevent the interface
- 	 * going dead.
- 	 */
--	isc_atomic_xadd(&client->interface->ntcpaccepting, 1);
-+	isc_refcount_increment0(&client->interface->ntcpaccepting, NULL);
- }
- 
- static void
-diff --git a/bin/named/include/named/interfacemgr.h b/bin/named/include/named/interfacemgr.h
-index 3535ef22a8..6e10f210fd 100644
---- a/bin/named/include/named/interfacemgr.h
-+++ b/bin/named/include/named/interfacemgr.h
-@@ -45,6 +45,7 @@
- #include <isc/magic.h>
- #include <isc/mem.h>
- #include <isc/socket.h>
-+#include <isc/refcount.h>
- 
- #include <dns/result.h>
- 
-@@ -75,11 +76,11 @@ struct ns_interface {
- 						/*%< UDP dispatchers. */
- 	isc_socket_t *		tcpsocket;	/*%< TCP socket. */
- 	isc_dscp_t		dscp;		/*%< "listen-on" DSCP value */
--	int32_t			ntcpaccepting;	/*%< Number of clients
-+	isc_refcount_t		ntcpaccepting;	/*%< Number of clients
- 						     ready to accept new
- 						     TCP connections on this
- 						     interface */
--	int32_t			ntcpactive;	/*%< Number of clients
-+	isc_refcount_t		ntcpactive;	/*%< Number of clients
- 						     servicing TCP queries
- 						     (whether accepting or
- 						     connected) */
-diff --git a/bin/named/interfacemgr.c b/bin/named/interfacemgr.c
-index d9f6df5802..135533be6b 100644
---- a/bin/named/interfacemgr.c
-+++ b/bin/named/interfacemgr.c
-@@ -386,8 +386,8 @@ ns_interface_create(ns_interfacemgr_t *mgr, isc_sockaddr_t *addr,
- 	 * connections will be handled in parallel even though there is
- 	 * only one client initially.
- 	 */
--	ifp->ntcpaccepting = 0;
--	ifp->ntcpactive = 0;
-+	isc_refcount_init(&ifp->ntcpaccepting, 0);
-+	isc_refcount_init(&ifp->ntcpactive, 0);
- 
- 	ifp->nudpdispatch = 0;
- 
-@@ -618,6 +618,9 @@ ns_interface_destroy(ns_interface_t *ifp) {
- 
- 	ns_interfacemgr_detach(&ifp->mgr);
- 
-+	isc_refcount_destroy(&ifp->ntcpactive);
-+	isc_refcount_destroy(&ifp->ntcpaccepting);
-+
- 	ifp->magic = 0;
- 	isc_mem_put(mctx, ifp, sizeof(*ifp));
- }
--- 
-2.11.0
-
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index cdd4bdd312..999c6602a8 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.6-P1/bind-9.11.6-P1.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.10/bind-9.11.10.tar.gz.asc
 # with key 156890685EA0DF6A1371EF2017CC5DB1F0088407
-sha256 58ace2abb4d048b67abcdef0649ecd6cbd3b0652734a41a1d34f942d5500f8ef bind-9.11.6-P1.tar.gz
+sha256 b2bb840cda20e6771ae8c054007b4ec12e1bb6aa6bfe79102890eb94956a70c3 bind-9.11.10.tar.gz
 sha256 cd02c93b8dcda794f55dfd1231828d69633072a98eee4874f9cf732d22d9dcde COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 42c240a747..4ac81f1d24 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.6-P1
+BIND_VERSION = 9.11.10
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
