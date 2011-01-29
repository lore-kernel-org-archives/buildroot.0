From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 29 Jan 2011 01:08:29 +0100
Subject: [Buildroot] PATCH [1/1] bump libupnp to recent version with IPv6
	support
Message-ID: <40629304B1EC4D6184F772CE74EB3CF9@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

Update the rather old version to a recent one , supporting IPv6

Stolen from
http://libupnp4.sourcearchive.com/documentation/1.8.0~svn20100507/
And made a patch to allow building on an IPv4 only environment.


 

diff -rupN
buildroot-2010.11/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
buildroot/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
--- buildroot-2010.11/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
2010-11-30 16:52:43.000000000 +0100
+++ buildroot/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
1970-01-01 01:00:00.000000000 +0100
@@ -1,11 +0,0 @@
-diff -urN libupnp-1.6.6-0rig/configure libupnp-1.6.6/configure
---- libupnp-1.6.6-0rig/configure	2008-04-25 13:47:24.000000000 +0200
-+++ libupnp-1.6.6/configure	2009-01-14 21:55:16.000000000 +0100
-@@ -21096,7 +21096,6 @@
- 	sys/ioctl.h \
- 	sys/socket.h \
- 	sys/time.h \
--	sys/timeb.h \
- 	syslog.h \
- 	unistd.h \
- 
diff -rupN
buildroot-2010.11/package/libupnp/libupnp-1.8.0~svn20100507.orig.patch
buildroot/package/libupnp/libupnp-1.8.0~svn20100507.orig.patch
--- buildroot-2010.11/package/libupnp/libupnp-1.8.0~svn20100507.orig.patch
1970-01-01 01:00:00.000000000 +0100
+++ buildroot/package/libupnp/libupnp-1.8.0~svn20100507.orig.patch
2011-01-29 23:29:17.000000000 +0100
@@ -0,0 +1,423 @@
+diff -rupN
libupnp-1.8.0~svn20100507.orig/upnp/src/genlib/miniserver/miniserver.c
libupnp-1.8.0~svn20100507.origjs/upnp/src/genlib/miniserver/miniserver.c
+--- libupnp-1.8.0~svn20100507.orig/upnp/src/genlib/miniserver/miniserver.c
2010-05-11 16:16:14.000000000 +0200
++++
libupnp-1.8.0~svn20100507.origjs/upnp/src/genlib/miniserver/miniserver.c
2011-01-28 23:16:25.000000000 +0100
+@@ -566,12 +566,17 @@ static int get_miniserver_sockets(
+ {
+ 	char errorBuffer[ERROR_BUFFER_LEN];
+ 	struct sockaddr_storage __ss_v4;
+-	struct sockaddr_storage __ss_v6;
+ 	struct sockaddr_in* serverAddr4 = (struct sockaddr_in*)&__ss_v4;
++#ifdef IPV6_ENABLED
++	struct sockaddr_storage __ss_v6;
++
+ 	struct sockaddr_in6* serverAddr6 = (struct sockaddr_in6*)&__ss_v6;
+-	SOCKET listenfd4, listenfd6;
++	unsigned short actual_port6;
++	SOCKET listenfd6;
++#endif
++	SOCKET listenfd4;
+ 	int ret_code;
+-	unsigned short actual_port4, actual_port6;
++	unsigned short actual_port4;
+ 	int reuseaddr_on = 0;
+ 	int sockError = UPNP_E_SUCCESS;
+ 	int errCode = 0;
+@@ -579,27 +584,36 @@ static int get_miniserver_sockets(
+ 	// Create listen socket for IPv4/IPv6. An error here may indicate
+ 	// that we don't have an IPv4/IPv6 stack.
+ 	listenfd4 = socket(AF_INET, SOCK_STREAM, 0);
++#ifdef IPV6_ENABLED
+ 	listenfd6 = socket(AF_INET6, SOCK_STREAM, 0);
+ 	if (listenfd4 == INVALID_SOCKET && listenfd6 == INVALID_SOCKET) {
+ 		return UPNP_E_OUTOF_SOCKET;
+ 	}
++#else
++	if (listenfd4 == INVALID_SOCKET) {
++			return UPNP_E_OUTOF_SOCKET;
++	}
++#endif
+ 
+ 	// As per the IANA specifications for the use of ports by
applications
+ 	// override the listen port passed in with the first available 
+ 	if (listen_port4 < APPLICATION_LISTENING_PORT) {
+ 		listen_port4 = APPLICATION_LISTENING_PORT;
+ 	}
++#ifdef IPV6_ENABLED
+ 	if (listen_port6 < APPLICATION_LISTENING_PORT) {
+ 		listen_port6 = APPLICATION_LISTENING_PORT;
+ 	}
++#endif
+ 
+ 	memset(&__ss_v4, 0, sizeof (__ss_v4));
+ 	serverAddr4->sin_family = AF_INET;
+ 	serverAddr4->sin_addr.s_addr = htonl(INADDR_ANY);
+-
++#ifdef IPV6_ENABLED
+ 	memset(&__ss_v6, 0, sizeof (__ss_v6));
+ 	serverAddr6->sin6_family = AF_INET6;
+ 	serverAddr6->sin6_addr = in6addr_any;
++#endif
+ 
+ 	// Getting away with implementation of re-using address:port and
instead 
+ 	// choosing to increment port numbers.
+@@ -620,8 +634,10 @@ static int get_miniserver_sockets(
+ 			if (sockError == -1) {
+ 				shutdown(listenfd4, SD_BOTH);
+ 				UpnpCloseSocket(listenfd4);
++#ifdef IPV6_ENABLED
+ 				shutdown(listenfd6, SD_BOTH);
+ 				UpnpCloseSocket(listenfd6);
++#endif
+ 				return UPNP_E_SOCKET_BIND;
+ 			}
+ 
+@@ -634,13 +650,16 @@ static int get_miniserver_sockets(
+ 					errorBuffer);
+ 				shutdown(listenfd4, SD_BOTH);
+ 				UpnpCloseSocket(listenfd4);
++#ifdef IPV6_ENABLED
+ 				shutdown(listenfd6, SD_BOTH);
+ 				UpnpCloseSocket(listenfd6);
++#endif
+ 				/* Bind failed */
+ 				return UPNP_E_SOCKET_BIND;
+ 			}
+ 		}
+ 
++#ifdef IPV6_ENABLED
+ 		if(listenfd6 != INVALID_SOCKET) {
+ 			sockError = setsockopt(listenfd6, SOL_SOCKET,
SO_REUSEADDR,
+ 			(const char *)&reuseaddr_on, sizeof (int));
+@@ -667,7 +686,10 @@ static int get_miniserver_sockets(
+ 				return UPNP_E_SOCKET_BIND;
+ 			}
+ 		}
+-	} else {
++	} else
++
++#endif
++{
+ 		if (listenfd4 != INVALID_SOCKET) {
+ 			unsigned short orig_listen_port4 = listen_port4;
+ 			do {
+@@ -694,12 +716,15 @@ static int get_miniserver_sockets(
+ 					errorBuffer);
+ 				shutdown(listenfd4, SD_BOTH);
+ 				UpnpCloseSocket(listenfd4);
++#ifdef IPV6_ENABLED
+ 				shutdown(listenfd6, SD_BOTH);
+ 				UpnpCloseSocket(listenfd6);
++#endif
+ 				return UPNP_E_SOCKET_BIND;  // bind failed
+ 			}
+ 		}
+ 
++#ifdef IPV6_ENABLED
+ 		if (listenfd6 != INVALID_SOCKET) {
+ 			unsigned short orig_listen_port6 = listen_port6;
+ 			do {
+@@ -718,7 +743,7 @@ static int get_miniserver_sockets(
+ 					errCode = 0;
+ 				}
+ 			} while (errCode != 0 && (listen_port6 >=
orig_listen_port6));
+-
++#endif
+ 			if (sockError == -1) {
+ 				strerror_r(errno, errorBuffer,
ERROR_BUFFER_LEN);
+ 				UpnpPrintf(UPNP_INFO, MSERV, __FILE__,
__LINE__,
+@@ -726,8 +751,10 @@ static int get_miniserver_sockets(
+ 					errorBuffer);
+ 				shutdown(listenfd4, SD_BOTH);
+ 				UpnpCloseSocket(listenfd4);
++#ifdef IPV6_ENABLED
+ 				shutdown(listenfd6, SD_BOTH);
+ 				UpnpCloseSocket(listenfd6);
++#endif
+ 				/* Bind failied */
+ 				return UPNP_E_SOCKET_BIND;
+ 			}
+@@ -746,8 +773,10 @@ static int get_miniserver_sockets(
+ 				errorBuffer);
+ 			shutdown(listenfd4, SD_BOTH);
+ 			UpnpCloseSocket(listenfd4);
++#ifdef IPV6_ENABLED
+ 			shutdown(listenfd6, SD_BOTH);
+ 			UpnpCloseSocket(listenfd6);
++#endif
+ 			return UPNP_E_LISTEN;
+ 		}
+ 
+@@ -755,14 +784,17 @@ static int get_miniserver_sockets(
+ 		if (actual_port4 <= 0) {
+ 			shutdown(listenfd4, SD_BOTH);
+ 			UpnpCloseSocket(listenfd4);
++#ifdef IPV6_ENABLED
+ 			shutdown(listenfd6, SD_BOTH);
+ 			UpnpCloseSocket(listenfd6);
++#endif
+ 			return UPNP_E_INTERNAL_ERROR;
+ 		}
+ 
+ 		out->miniServerPort4 = actual_port4;
+ 	}
+ 
++#ifdef IPV6_ENABLED
+ 	if (listenfd6 != INVALID_SOCKET) {
+ 		ret_code = listen(listenfd6, SOMAXCONN);
+ 		if (ret_code == -1) {
+@@ -788,9 +820,12 @@ static int get_miniserver_sockets(
+ 
+ 		out->miniServerPort6 = actual_port6;
+ 	}
++#endif
+ 
+ 	out->miniServerSock4 = listenfd4;
++#ifdef IPV6_ENABLED
+ 	out->miniServerSock6 = listenfd6;
++#endif
+ 
+ 	return UPNP_E_SUCCESS;
+ }
+diff -rupN libupnp-1.8.0~svn20100507.orig/upnp/src/ssdp/ssdp_ctrlpt.c
libupnp-1.8.0~svn20100507.origjs/upnp/src/ssdp/ssdp_ctrlpt.c
+--- libupnp-1.8.0~svn20100507.orig/upnp/src/ssdp/ssdp_ctrlpt.c	2008-07-24
08:02:57.000000000 +0200
++++ libupnp-1.8.0~svn20100507.origjs/upnp/src/ssdp/ssdp_ctrlpt.c
2011-01-28 22:57:54.000000000 +0100
+@@ -372,9 +372,12 @@ CreateClientRequestPacket( IN char *Rqst
+ 
+     if (AddressFamily == AF_INET) {
+         sprintf( TempBuf, "HOST: %s:%d\r\n", SSDP_IP, SSDP_PORT );
+-    } else if (AddressFamily == AF_INET6) {
++    } 
++#ifdef IPV6_ENABLED
++else if (AddressFamily == AF_INET6) {
+         sprintf( TempBuf, "HOST: [%s]:%d\r\n", SSDP_IPV6_LINKLOCAL,
SSDP_PORT );
+     }
++#endif
+     strcat( RqstBuf, TempBuf );
+     strcat( RqstBuf, "MAN: \"ssdp:discover\"\r\n" );
+ 
+@@ -488,11 +491,14 @@ SearchByTarget( IN int Mx,
+     int *id = NULL;
+     int ret = 0;
+     char ReqBufv4[BUFSIZE];
+-    char ReqBufv6[BUFSIZE];
+     struct sockaddr_storage __ss_v4;
++	struct sockaddr_in* destAddr4 = (struct sockaddr_in*)&__ss_v4;
++
++#ifdef IPV6_ENABLED
++    char ReqBufv6[BUFSIZE];
+     struct sockaddr_storage __ss_v6;
+-    struct sockaddr_in* destAddr4 = (struct sockaddr_in*)&__ss_v4;
+-    struct sockaddr_in6* destAddr6 = (struct sockaddr_in6*)&__ss_v6;
++	struct sockaddr_in6* destAddr6 = (struct sockaddr_in6*)&__ss_v6;
++#endif
+     fd_set wrSet;
+     SsdpSearchArg *newArg = NULL;
+     int timeTillRead = 0;
+@@ -521,18 +527,22 @@ SearchByTarget( IN int Mx,
+     }
+ 
+     CreateClientRequestPacket( ReqBufv4, timeTillRead, St, AF_INET );
++#ifdef IPV6_ENABLED
+     CreateClientRequestPacket( ReqBufv6, timeTillRead, St, AF_INET6 );
++#endif
+ 
+     memset( &__ss_v4, 0, sizeof( __ss_v4 ) );
+     destAddr4->sin_family = AF_INET;
+     inet_pton( AF_INET, SSDP_IP, &destAddr4->sin_addr );
+     destAddr4->sin_port = htons( SSDP_PORT );
+ 
++#ifdef IPV6_ENABLED
+     memset( &__ss_v6, 0, sizeof( __ss_v6 ) );
+     destAddr6->sin6_family = AF_INET6;
+     inet_pton( AF_INET6, SSDP_IPV6_LINKLOCAL, &destAddr6->sin6_addr );
+     destAddr6->sin6_port = htons( SSDP_PORT );
+     destAddr6->sin6_scope_id = gIF_INDEX;
++#endif
+ 
+     // add search criteria to list
+     HandleLock();
+@@ -566,12 +576,14 @@ SearchByTarget( IN int Mx,
+         FD_SET( gSsdpReqSocket4, &wrSet );
+         max_fd = max(max_fd, gSsdpReqSocket4);
+     }
++#ifdef IPV6_ENABLED
+     if( gSsdpReqSocket6 != INVALID_SOCKET ) {
+         setsockopt( gSsdpReqSocket6, IPPROTO_IPV6, IPV6_MULTICAST_IF,
+             (char *)&gIF_INDEX, sizeof(gIF_INDEX) );
+         FD_SET( gSsdpReqSocket6, &wrSet );
+         max_fd = max(max_fd, gSsdpReqSocket6);
+     }
++#endif
+ 
+     ret = select( max_fd + 1, NULL, &wrSet, NULL, NULL );
+     if( ret == -1 ) {
+@@ -581,11 +593,14 @@ SearchByTarget( IN int Mx,
+             errorBuffer );
+ 	    shutdown( gSsdpReqSocket4, SD_BOTH );
+         UpnpCloseSocket( gSsdpReqSocket4 );
++#ifdef IPV6_ENABLED
+ 	    shutdown( gSsdpReqSocket6, SD_BOTH );
+         UpnpCloseSocket( gSsdpReqSocket6 );
+-
++#endif
+         return UPNP_E_INTERNAL_ERROR;
+     } 
++
++#ifdef IPV6_ENABLED
+     if( gSsdpReqSocket6 != INVALID_SOCKET && 
+         FD_ISSET( gSsdpReqSocket6, &wrSet ) ) {
+         int NumCopy = 0;
+@@ -596,6 +611,7 @@ SearchByTarget( IN int Mx,
+             imillisleep( SSDP_PAUSE );
+         }
+     }
++#endif
+     if( gSsdpReqSocket4 != INVALID_SOCKET && 
+         FD_ISSET( gSsdpReqSocket4, &wrSet ) ) {
+         int NumCopy = 0;
+diff -rupN libupnp-1.8.0~svn20100507.orig/upnp/src/ssdp/ssdp_device.c
libupnp-1.8.0~svn20100507.origjs/upnp/src/ssdp/ssdp_device.c
+--- libupnp-1.8.0~svn20100507.orig/upnp/src/ssdp/ssdp_device.c	2008-07-24
08:02:57.000000000 +0200
++++ libupnp-1.8.0~svn20100507.origjs/upnp/src/ssdp/ssdp_device.c
2011-01-28 23:00:20.000000000 +0100
+@@ -227,7 +227,9 @@ NewRequestHandler( IN struct sockaddr *D
+     int Index;
+     unsigned long replyAddr = inet_addr( gIF_IPV4 );
+     int ttl = 4; // a/c to UPNP Spec
++#ifdef IPV6_ENABLED
+     int hops = 1;
++#endif
+     char buf_ntop[64];
+ 
+     ReplySock = socket( DestAddr->sa_family, SOCK_DGRAM, 0 );
+@@ -247,14 +249,18 @@ NewRequestHandler( IN struct sockaddr *D
+             (char *)&replyAddr, sizeof (replyAddr) );
+         setsockopt( ReplySock, IPPROTO_IP, IP_MULTICAST_TTL,
+             (char *)&ttl, sizeof (int) );
+-    } else if( DestAddr->sa_family == AF_INET6 ) {
++    }
++#ifdef IPV6_ENABLED
++ else if( DestAddr->sa_family == AF_INET6 ) {
+         inet_ntop(AF_INET6, &((struct sockaddr_in6*)DestAddr)->sin6_addr, 
+             buf_ntop, sizeof(buf_ntop));
+         setsockopt( ReplySock, IPPROTO_IPV6, IPV6_MULTICAST_IF,
+             (char *)&gIF_INDEX, sizeof(gIF_INDEX) );
+         setsockopt( ReplySock, IPPROTO_IPV6, IPV6_MULTICAST_HOPS,
+             (char *)&hops, sizeof(hops) );
+-    } else {
++    }
++#endif
++ 	else {
+         UpnpPrintf( UPNP_CRITICAL, SSDP, __FILE__, __LINE__,
+             "Invalid destination address specified." );
+     }
+diff -rupN libupnp-1.8.0~svn20100507.orig/upnp/src/ssdp/ssdp_server.c
libupnp-1.8.0~svn20100507.origjs/upnp/src/ssdp/ssdp_server.c
+--- libupnp-1.8.0~svn20100507.orig/upnp/src/ssdp/ssdp_server.c	2010-04-12
17:45:47.000000000 +0200
++++ libupnp-1.8.0~svn20100507.origjs/upnp/src/ssdp/ssdp_server.c
2011-01-28 23:06:01.000000000 +0100
+@@ -51,15 +51,21 @@
+ #define MAX_TIME_TOREAD  45
+ 
+ CLIENTONLY( SOCKET gSsdpReqSocket4 = INVALID_SOCKET; )
++#ifdef IPV6_ENABLED
+ CLIENTONLY( SOCKET gSsdpReqSocket6 = INVALID_SOCKET; )
++#endif
+ 
+ void RequestHandler();
+ int create_ssdp_sock_v4( SOCKET* ssdpSock );
++#ifdef IPV6_ENABLED
+ int create_ssdp_sock_v6( SOCKET* ssdpSock );
++#endif
+ #if INCLUDE_CLIENT_APIS
+ int create_ssdp_sock_reqv4( SOCKET* ssdpReqSock );
++#ifdef IPV6_ENABLED
+ int create_ssdp_sock_reqv6( SOCKET* ssdpReqSock );
+ #endif
++#endif
+ Event ErrotEvt;
+ 
+ enum Listener { Idle, Stopping, Running };
+@@ -754,7 +760,12 @@ readFromSSDPSocket( SOCKET socket )
+         //initialize parser
+ 
+ #ifdef INCLUDE_CLIENT_APIS
++  
++#ifdef IPV6_ENABLED
+         if( socket == gSsdpReqSocket4 || socket == gSsdpReqSocket6 ) {
++#else
++        if( socket == gSsdpReqSocket4 ) {
++#endif
+             parser_response_init( &data->parser, HTTPMETHOD_MSEARCH );
+         } else {
+             parser_request_init( &data->parser );
+@@ -852,6 +863,7 @@ int get_ssdp_sockets( MiniServerSockArra
+         out->ssdpReqSock4 = INVALID_SOCKET;
+     }
+ 
++#ifdef IPV6_ENABLED 
+     // Create the IPv6 socket for SSDP REQUESTS
+     if( strlen( gIF_IPV6 ) > 0 ) {
+         retVal = create_ssdp_sock_reqv6( &out->ssdpReqSock6 );
+@@ -865,6 +877,7 @@ int get_ssdp_sockets( MiniServerSockArra
+     } else {
+         out->ssdpReqSock6 = INVALID_SOCKET;
+     }
++#endif
+ #endif /* INCLUDE_CLIENT_APIS */
+ 
+     // Create the IPv4 socket for SSDP
+@@ -873,14 +886,17 @@ int get_ssdp_sockets( MiniServerSockArra
+         if( retVal != UPNP_E_SUCCESS ) {
+             CLIENTONLY( shutdown( out->ssdpReqSock4, SD_BOTH ); )
+             CLIENTONLY( UpnpCloseSocket( out->ssdpReqSock4 ); )
++#ifdef IPV6_ENABLED
+             CLIENTONLY( shutdown( out->ssdpReqSock6, SD_BOTH ); )
+             CLIENTONLY( UpnpCloseSocket( out->ssdpReqSock6 ); )
++#endif            
+             return retVal;
+         }
+     } else {
+         out->ssdpSock4 = INVALID_SOCKET;
+     }
+ 
++#ifdef IPV6_ENABLED
+     // Create the IPv6 socket for SSDP
+     if( strlen( gIF_IPV6 ) > 0 ) {
+         retVal = create_ssdp_sock_v6( &out->ssdpSock6 );
+@@ -896,6 +912,7 @@ int get_ssdp_sockets( MiniServerSockArra
+     } else {
+         out->ssdpSock6 = INVALID_SOCKET;
+     }
++#endif
+ 
+     return UPNP_E_SUCCESS;
+ }
+@@ -951,6 +968,7 @@ int create_ssdp_sock_reqv4( SOCKET* ssdp
+  * Returns: void
+  *
+
***************************************************************************/
++#ifdef IPV6_ENABLED
+ int create_ssdp_sock_reqv6( SOCKET* ssdpReqSock )
+ {
+     char errorBuffer[ERROR_BUFFER_LEN];
+@@ -975,6 +993,7 @@ int create_ssdp_sock_reqv6( SOCKET* ssdp
+ 
+     return UPNP_E_SUCCESS;
+ }
++#endif
+ #endif /* INCLUDE_CLIENT_APIS */
+ 
+ 
+@@ -1118,6 +1137,7 @@ int create_ssdp_sock_v4( SOCKET* ssdpSoc
+  * Returns: void
+  *
+
***************************************************************************/
++#ifdef IPV6_ENABLED
+ int create_ssdp_sock_v6( SOCKET* ssdpSock )
+ {
+     char errorBuffer[ERROR_BUFFER_LEN];
+@@ -1213,6 +1233,7 @@ int create_ssdp_sock_v6( SOCKET* ssdpSoc
+ 
+     return UPNP_E_SUCCESS;
+ }
++#endif
+ 
+ #endif /* EXCLUDE_SSDP */
+ 
diff -rupN buildroot-2010.11/package/libupnp/libupnp.mk
buildroot/package/libupnp/libupnp.mk
--- buildroot-2010.11/package/libupnp/libupnp.mk	2010-11-30
16:52:43.000000000 +0100
+++ buildroot/package/libupnp/libupnp.mk	2011-01-30
00:34:45.000000000 +0100
@@ -3,12 +3,15 @@
 # libupnp
 #
 #############################################################
-LIBUPNP_VERSION:=1.6.6
-LIBUPNP_SOURCE:=libupnp-$(LIBUPNP_VERSION).tar.bz2
-LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourcefor
ge/pupnp
-
+LIBUPNP_VERSION:=1.8.0~svn20100507.orig
+LIBUPNP_SOURCE:=libupnp4_$(LIBUPNP_VERSION).tar.gz
+LIBUPNP_SITE:=http://ftp.de.debian.org/debian/pool/main/libu/libupnp4
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-
 LIBUPNP_INSTALL_STAGING:=YES
+LIBUPNP_INSTALL_TARGET:=YES
+
+ifeq ($(BR2_INET_IPV6),y)
+	LIBUPNP_CONF_ENV+= CFLAGS="-DIPV6_ENABLED"
+endif
 
 $(eval $(call AUTOTARGETS,package,libupnp))
