From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jun 2016 15:05:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/libmdnsresponder: new package
Message-ID: <1466946336-6741-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for mdnsembedded in Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |   1 +
 .../libmdnsresponder/0001-android-embedded.patch   | 413 +++++++++++++++++++++
 package/libmdnsresponder/0002-makefile.patch       |  93 +++++
 package/libmdnsresponder/Config.in                 |  11 +
 package/libmdnsresponder/libmdnsresponder.hash     |   2 +
 package/libmdnsresponder/libmdnsresponder.mk       |  31 ++
 6 files changed, 551 insertions(+)
 create mode 100644 package/libmdnsresponder/0001-android-embedded.patch
 create mode 100644 package/libmdnsresponder/0002-makefile.patch
 create mode 100644 package/libmdnsresponder/Config.in
 create mode 100644 package/libmdnsresponder/libmdnsresponder.hash
 create mode 100644 package/libmdnsresponder/libmdnsresponder.mk

diff --git a/package/Config.in b/package/Config.in
index a2a02a8..16d40e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1155,6 +1155,7 @@ menu "Networking"
 	source "package/libiscsi/Config.in"
 	source "package/libldns/Config.in"
 	source "package/libmbus/Config.in"
+	source "package/libmdnsresponder/Config.in"
 	source "package/libmemcached/Config.in"
 	source "package/libmicrohttpd/Config.in"
 	source "package/libmnl/Config.in"
diff --git a/package/libmdnsresponder/0001-android-embedded.patch b/package/libmdnsresponder/0001-android-embedded.patch
new file mode 100644
index 0000000..e82c352
--- /dev/null
+++ b/package/libmdnsresponder/0001-android-embedded.patch
@@ -0,0 +1,413 @@
+Add wrapper for mDNSEmbeddedAPI with Bonjour.
+
+Downloaded from Kodi:
+https://github.com/xbmc/xbmc/blob/master/tools/depends/target/mdnsresponder/01-android-embedded.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uPr ./mDNSCore/mDNSEmbeddedAPI.h ./mDNSCore/mDNSEmbeddedAPI.h
+--- ./mDNSCore/mDNSEmbeddedAPI.h	2012-10-24 01:18:23.000000000 +0200
++++ ./mDNSCore/mDNSEmbeddedAPI.h	2013-06-10 18:45:59.000000000 +0200
+@@ -1144,6 +1144,10 @@
+     McastResolver_FlagNew    = 2
+ };
+ 
++// everyone loves proprietary language extensions in the global namespace
++#ifdef _MSC_VER
++#undef interface
++#endif
+ typedef struct McastResolver
+ {
+     struct McastResolver *next;
+diff -uPr ./mDNSCore/mDnsEmbedded.c ./mDNSCore/mDnsEmbedded.c
+--- ./mDNSCore/mDnsEmbedded.c	1970-01-01 01:00:00.000000000 +0100
++++ ./mDNSCore/mDnsEmbedded.c	2013-06-10 18:45:59.000000000 +0200
+@@ -0,0 +1,145 @@
++/**
++ *  @file
++ *  @brief      Wrapper for mDNSEmbeddedAPI with Bonjour.
++ *  @author     2012 Stefan Radomski (stefan.radomski at cs.tu-darmstadt.de)
++ *  @copyright  Simplified BSD
++ *
++ *  @cond
++ *  This program is free software: you can redistribute it and/or modify
++ *  it under the terms of the FreeBSD license as published by the FreeBSD
++ *  project.
++ *
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ *  You should have received a copy of the FreeBSD license along with this
++ *  program. If not, see <http://www.opensource.org/licenses/bsd-license>.
++ *  @endcond
++ */
++
++#include <stdlib.h>
++#include <assert.h>
++#include <sys/select.h>
++// include order matters
++#include "mDNSEmbeddedAPI.h"
++#ifdef WIN32
++#include "../mDNSWindows/mDNSWin32.h"    // Defines the specific types needed to run mDNS on windows platforms
++#else
++#include <sys/time.h>
++#include "../mDNSPosix/mDNSPosix.h"    // Defines the specific types needed to run mDNS on posix platforms
++#endif
++
++#define RR_CACHE_SIZE 500
++static CacheEntity rrcachestorage[RR_CACHE_SIZE];
++mDNS mDNSStorage;
++//struct mDNS_PlatformSupport_struct {};
++static int mDNSIsInitialized = 0;
++static mDNS_PlatformSupport platformSupport;
++
++const char ProgramName[] = "umundo";
++extern mDNSexport void mDNSPosixGetFDSet(mDNS *m, int *nfds, fd_set *readfds, struct timeval *timeout);
++extern mDNSexport void mDNSPosixProcessFDSet(mDNS *const m, fd_set *readfds);
++
++// promise compiler that these will be there
++mDNSexport int embedded_mDNSmainLoop(struct timeval timeout);
++
++#if WIN32
++mStatus mDNSPoll(DWORD msec);
++static void	embedded_mDNSInit_ReportStatus( int inType, const char *inFormat, ... ) {
++}
++#endif
++
++mDNSexport int embedded_mDNSInit() {
++	mStatus err;
++	if (mDNSIsInitialized != 0) {
++		return 0;
++	}
++
++	mDNSPlatformMemZero( &mDNSStorage, sizeof(mDNSStorage));
++	mDNSPlatformMemZero( &platformSupport, sizeof(platformSupport));
++
++	err = mDNS_Init(
++		&mDNSStorage,
++		&platformSupport,
++		rrcachestorage,
++		RR_CACHE_SIZE,
++		mDNS_Init_AdvertiseLocalAddresses,
++		mDNS_Init_NoInitCallback,
++		mDNS_Init_NoInitCallbackContext
++	);
++	if (err)
++		return err;
++
++#ifdef WIN32
++	platformSupport.reportStatusFunc = embedded_mDNSInit_ReportStatus;
++	err = SetupInterfaceList( &mDNSStorage );
++	if (err)
++		return err;
++	err = uDNS_SetupDNSConfig( &mDNSStorage );
++#endif
++
++	if (err == 0) {
++		mDNSIsInitialized = 1;
++	}
++	return err;
++}
++
++mDNSexport void embedded_mDNSExit() {
++#ifdef WIN32
++	struct timeval tv;
++	tv.tv_sec  = 0;
++	tv.tv_usec = 0;
++//	mDNS_StartExit(&mDNSStorage);
++//	embedded_mDNSmainLoop(tv);
++//	mDNS_FinalExit(&mDNSStorage);
++#else
++	mDNS_Close(&mDNSStorage);
++#endif
++}
++
++#ifdef WIN32
++mDNSexport int embedded_mDNSmainLoop(struct timeval timeout) {
++	mDNS_Execute(&mDNSStorage);
++	mDNSPoll(100);
++//	Sleep(100);
++	return 0;
++}
++
++#else
++
++// From <mDNSDir>/ExampleClientApp.c
++mDNSexport int embedded_mDNSmainLoop(struct timeval timeout) {
++	int nfds = 0;
++	fd_set readfds;
++	int result;
++
++	// 1. Set up the fd_set as usual here.
++	// This example client has no file descriptors of its own,
++	// but a real application would call FD_SET to add them to the set here
++	FD_ZERO(&readfds);
++
++	// 2. Set up the timeout.
++	// This example client has no other work it needs to be doing,
++	// so we set an effectively infinite timeout
++//	timeout.tv_sec = 0x3FFFFFFF;
++//	timeout.tv_usec = 0;
++
++	assert(timeout.tv_sec < 10);
++	// 3. Give the mDNSPosix layer a chance to add its information to the fd_set and timeout
++	mDNSPosixGetFDSet(&mDNSStorage, &nfds, &readfds, &timeout);
++
++	// 4. Call select as normal
++	result = select(nfds, &readfds, NULL, NULL, &timeout);
++
++	if (result > 0) {
++		// 5. Call mDNSPosixProcessFDSet to let the mDNSPosix layer do its work
++		mDNSPosixProcessFDSet(&mDNSStorage, &readfds);
++
++		// 6. This example client has no other work it needs to be doing,
++		// but a real client would do its work here
++		// ... (do work) ...
++	}
++	return result;
++}
++#endif
+diff -uPr ./mDNSCore/mDnsEmbedded.h ./mDNSCore/mDnsEmbedded.h
+--- ./mDNSCore/mDnsEmbedded.h	1970-01-01 01:00:00.000000000 +0100
++++ ./mDNSCore/mDnsEmbedded.h	2013-06-10 18:45:59.000000000 +0200
+@@ -0,0 +1,32 @@
++/*                                                                                                                                                                                        
++ *      Copyright (C) 2005-2013 Team XBMC                                                                                                                                                 
++ *      http://xbmc.org                                                                                                                                                               
++ *                                                                                                                                                                                        
++ *  This Program is free software; you can redistribute it and/or modify                                                                                                                  
++ *  it under the terms of the GNU General Public License as published by                                                                                                                  
++ *  the Free Software Foundation; either version 2, or (at your option)                                                                                                                   
++ *  any later version.                                                                                                                                                                    
++ *                                                                                                                                                                                        
++ *  This Program is distributed in the hope that it will be useful,                                                                                                                       
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of                                                                                                                        
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the                                                                                                                          
++ *  GNU General Public License for more details.                                                                                                                                          
++ *                                                                                                                                                                                        
++ *  You should have received a copy of the GNU General Public License                                                                                                                     
++ *  along with XBMC; see the file COPYING.  If not, see                                                                                                                                   
++ *  <http://www.gnu.org/licenses/>.                                                                                                                                                       
++ *                                                                                                                                                                                        
++ */
++
++#ifndef _MDNSEMBEDDED_H_
++#define _MDNSEMBEDDED_H_
++#ifdef __cplusplus
++extern "C" {
++#endif
++int embedded_mDNSInit();
++void embedded_mDNSExit();
++int embedded_mDNSmainLoop(struct timeval timeout);
++#ifdef __cplusplus
++}
++#endif
++#endif //_MDNSEMBEDDED_H_
+diff -uPr ./mDNSPosix/mDNSPosix.h ./mDNSPosix/mDNSPosix.h
+--- ./mDNSPosix/mDNSPosix.h	2011-12-02 01:39:45.000000000 +0100
++++ ./mDNSPosix/mDNSPosix.h	2013-06-10 18:45:59.000000000 +0200
+@@ -25,6 +25,10 @@
+ extern "C" {
+ #endif
+ 
++#ifdef ANDROID
++#include <fcntl.h>
++#endif
++
+ // PosixNetworkInterface is a record extension of the core NetworkInterfaceInfo
+ // type that supports extra fields needed by the Posix platform.
+ //
+diff -uPr ./mDNSShared/dnssd_clientshim.c ./mDNSShared/dnssd_clientshim.c
+--- ./mDNSShared/dnssd_clientshim.c	2013-04-10 01:09:07.000000000 +0200
++++ ./mDNSShared/dnssd_clientshim.c	2013-06-10 18:53:18.000000000 +0200
+@@ -25,6 +25,13 @@
+ 
+ #include "dns_sd.h"             // Defines the interface to the client layer above
+ #include "mDNSEmbeddedAPI.h"        // The interface we're building on top of
++#ifndef _MSC_VER
++#include <sys/socket.h>
++#include <netinet/in.h>
++#else
++#include <winsock2.h>
++#endif
++
+ extern mDNS mDNSStorage;        // We need to pass the address of this storage to the lower-layer functions
+ 
+ #if MDNS_BUILDINGSHAREDLIBRARY || MDNS_BUILDINGSTUBLIBRARY
+@@ -71,6 +78,14 @@
+ typedef struct
+ {
+     mDNS_DirectOP_Dispose  *disposefn;
++    DNSServiceRef                aQuery;
++    DNSServiceGetAddrInfoReply   callback;
++    void                         *context;
++} mDNS_DirectOP_GetAddrInfo;
++
++typedef struct
++{
++    mDNS_DirectOP_Dispose  *disposefn;
+     DNSServiceResolveReply callback;
+     void                   *context;
+     const ResourceRecord   *SRV;
+@@ -399,7 +414,7 @@
+ 
+     // Check parameters
+     if (!regtype[0] || !MakeDomainNameFromDNSNameString(&t, regtype))      { errormsg = "Illegal regtype"; goto badparam; }
+-    if (!MakeDomainNameFromDNSNameString(&d, *domain ? domain : "local.")) { errormsg = "Illegal domain";  goto badparam; }
++    if (!MakeDomainNameFromDNSNameString(&d, (domain && *domain) ? domain : "local.")) { errormsg = "Illegal domain";  goto badparam; }
+ 
+     // Allocate memory, and handle failure
+     x = (mDNS_DirectOP_Browse *)mDNSPlatformMemAllocate(sizeof(*x));
+@@ -668,7 +683,7 @@
+     x->q.ExpectUnique        = mDNSfalse;
+     x->q.ForceMCast          = (flags & kDNSServiceFlagsForceMulticast) != 0;
+     x->q.ReturnIntermed      = (flags & kDNSServiceFlagsReturnIntermediates) != 0;
+-    x->q.SuppressUnsable     = (flags & kDNSServiceFlagsSuppressUnusable) != 0;
++    x->q.SuppressUnusable    = (flags & kDNSServiceFlagsSuppressUnusable) != 0;
+     x->q.SearchListIndex     = 0;
+     x->q.AppendSearchDomains = 0;
+     x->q.RetryWithSearchDomains = mDNSfalse;
+diff -uPr ./mDNSShared/dns_sd.h ./mDNSShared/dns_sd.h
+--- ./mDNSShared/dns_sd.h	2013-04-10 01:08:48.000000000 +0200
++++ ./mDNSShared/dns_sd.h	2013-06-10 18:45:59.000000000 +0200
+@@ -93,7 +93,7 @@
+ /* standard calling convention under Win32 is __stdcall */
+ /* Note: When compiling Intel EFI (Extensible Firmware Interface) under MS Visual Studio, the */
+ /* _WIN32 symbol is defined by the compiler even though it's NOT compiling code for Windows32 */
+-#if defined(_WIN32) && !defined(EFI32) && !defined(EFI64)
++#if defined(_WIN32) && !defined(EFI32) && !defined(EFI64) && !defined(DISC_BONJOUR_EMBED)
+ #define DNSSD_API __stdcall
+ #else
+ #define DNSSD_API
+diff -uPr ./mDNSShared/dnssd_ipc.h ./mDNSShared/dnssd_ipc.h
+--- ./mDNSShared/dnssd_ipc.h	2012-07-12 23:57:14.000000000 +0200
++++ ./mDNSShared/dnssd_ipc.h	2013-06-10 18:45:59.000000000 +0200
+@@ -29,6 +29,11 @@
+ #ifndef DNSSD_IPC_H
+ #define DNSSD_IPC_H
+ 
++#ifdef ANDROID
++#include <sys/socket.h>
++#include <sys/un.h>
++#endif
++
+ #include "dns_sd.h"
+ 
+ //
+diff -uPr ./mDNSShared/PlatformCommon.c ./mDNSShared/PlatformCommon.c
+--- ./mDNSShared/PlatformCommon.c	2012-01-18 03:45:05.000000000 +0100
++++ ./mDNSShared/PlatformCommon.c	2013-06-10 19:24:58.064683350 +0200
+@@ -15,6 +15,8 @@
+  * limitations under the License.
+  */
+ 
++#include "DNSCommon.h"
++
+ #include <stdio.h>              // Needed for fopen() etc.
+ #include <unistd.h>             // Needed for close()
+ #include <string.h>             // Needed for strlen() etc.
+@@ -24,9 +26,12 @@
+ #include <syslog.h>
+ 
+ #include "mDNSEmbeddedAPI.h"    // Defines the interface provided to the client layer above
+-#include "DNSCommon.h"
+ #include "PlatformCommon.h"
+ 
++#ifdef ANDROID
++#include <android/log.h>
++#endif
++
+ #ifdef NOT_HAVE_SOCKLEN_T
+ typedef unsigned int socklen_t;
+ #endif
+@@ -143,13 +148,20 @@
+ #if MDNS_DEBUGMSGS
+ mDNSexport void mDNSPlatformWriteDebugMsg(const char *msg)
+ {
++#ifdef ANDROID
++       __android_log_print(ANDROID_LOG_DEBUG, "bonjour", "%s", msg);
++#else
+     fprintf(stderr,"%s\n", msg);
+     fflush(stderr);
++#endif
+ }
+ #endif
+ 
+ mDNSexport void mDNSPlatformWriteLogMsg(const char *ident, const char *buffer, mDNSLogLevel_t loglevel)
+ {
++#ifdef ANDROID
++       __android_log_print(ANDROID_LOG_DEBUG, "bonjour", "%s", buffer);
++#else
+ #if APPLE_OSX_mDNSResponder && LogTimeStamps
+     extern mDNS mDNSStorage;
+     extern mDNSu32 mDNSPlatformClockDivisor;
+@@ -193,4 +205,5 @@
+ #endif
+         syslog(syslog_level, "%s", buffer);
+     }
++#endif
+ }
+diff -uPr ./mDNSShared/uds_daemon.h ./mDNSShared/uds_daemon.h
+--- ./mDNSShared/uds_daemon.h	2012-07-12 23:57:14.000000000 +0200
++++ ./mDNSShared/uds_daemon.h	2013-06-10 18:45:59.000000000 +0200
+@@ -22,6 +22,11 @@
+ 
+  */
+ 
++#ifdef ANDROID
++#include <sys/socket.h>
++#include <sys/un.h>
++#endif
++
+ #include "mDNSEmbeddedAPI.h"
+ #include "dnssd_ipc.h"
+ 
+diff -uPr ./mDNSWindows/mDNSWin32.c ./mDNSWindows/mDNSWin32.c
+--- ./mDNSWindows/mDNSWin32.c	2012-10-31 00:24:17.000000000 +0100
++++ ./mDNSWindows/mDNSWin32.c	2013-06-10 18:45:59.000000000 +0200
+@@ -2920,10 +2920,7 @@
+ 		sa4.sin_family 		= AF_INET;
+ 		sa4.sin_port 		= port.NotAnInteger;
+ 		sa4.sin_addr.s_addr	= ipv4.NotAnInteger;
+-		
+-		err = bind( sock, (struct sockaddr *) &sa4, sizeof( sa4 ) );
+-		check_translated_errno( err == 0, errno_compat(), kUnknownErr );
+-		
++				
+ 		// Turn on option to receive destination addresses and receiving interface.
+ 		
+ 		option = 1;
+@@ -2964,6 +2961,9 @@
+ 		err = setsockopt( sock, IPPROTO_IP, IP_MULTICAST_TTL, (char *) &option, sizeof( option ) );
+ 		check_translated_errno( err == 0, errno_compat(), kOptionErr );
+ 
++		err = bind( sock, (struct sockaddr *) &sa4, sizeof( sa4 ) );
++		check_translated_errno( err == 0, errno_compat(), kUnknownErr );
++
+ 	}
+ 	else if( inAddr->sa_family == AF_INET6 )
+ 	{
+@@ -2981,10 +2981,7 @@
+ 		sa6.sin6_flowinfo	= 0;
+ 		sa6.sin6_addr		= sa6p->sin6_addr;
+ 		sa6.sin6_scope_id	= sa6p->sin6_scope_id;
+-		
+-		err = bind( sock, (struct sockaddr *) &sa6, sizeof( sa6 ) );
+-		check_translated_errno( err == 0, errno_compat(), kUnknownErr );
+-		
++				
+ 		// Turn on option to receive destination addresses and receiving interface.
+ 		
+ 		option = 1;
+@@ -3034,6 +3031,10 @@
+ 		option = 255;
+ 		err = setsockopt( sock, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, (char *) &option, sizeof( option ) );
+ 		check_translated_errno( err == 0, errno_compat(), kOptionErr );
++		
++		err = bind( sock, (struct sockaddr *) &sa6, sizeof( sa6 ) );
++		check_translated_errno( err == 0, errno_compat(), kUnknownErr );
++
+ 	}
+ 	else
+ 	{
diff --git a/package/libmdnsresponder/0002-makefile.patch b/package/libmdnsresponder/0002-makefile.patch
new file mode 100644
index 0000000..367364e
--- /dev/null
+++ b/package/libmdnsresponder/0002-makefile.patch
@@ -0,0 +1,93 @@
+Update Makefile to work with Linux toolchains
+
+Downloaded from
+https://github.com/xbmc/xbmc/blob/master/tools/depends/target/mdnsresponder/makefile.internal
+
+and added support to create libmDNSEmbedded.so instead of libmDNSEmbedded.a
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr mDNSResponder-625.41.2.org/Makefile mDNSResponder-625.41.2/Makefile
+--- mDNSResponder-625.41.2.org/Makefile	2016-03-11 10:47:07.000000000 +0100
++++ mDNSResponder-625.41.2/Makefile	2016-06-26 13:00:48.000000000 +0200
+@@ -1,49 +1,34 @@
+-#
+-# Top level makefile for Build & Integration.
+-# 
+-# This file is used to facilitate checking the mDNSResponder project
+-# directly out of CVS and submitting to B&I at Apple.
+-#
+-# The various platform directories contain makefiles or projects
+-# specific to that platform.
+-#
+-#    B&I builds must respect the following target:
+-#         install:
+-#         installsrc:
+-#         installhdrs:
+-#         clean:
+-#
+-
+-include $(MAKEFILEPATH)/pb_makefiles/platform.make
+-
+-MVERS = "mDNSResponder-625.41.2"
+-
+-DDNSWRITECONFIG = "$(DSTROOT)/Library/Application Support/Bonjour/ddnswriteconfig"
+-VER = 
+-ifneq ($(strip $(GCC_VERSION)),)
+-	VER = -- GCC_VERSION=$(GCC_VERSION)
+-endif
+-echo "VER = $(VER)"
+-
+-installSome:
+-	cd "$(SRCROOT)/mDNSMacOSX"; xcodebuild install     OBJROOT=$(OBJROOT) SYMROOT=$(SYMROOT) DSTROOT=$(DSTROOT) MVERS=$(MVERS) SDKROOT=$(SDKROOT) -target Build\ Some $(VER) 
+-
+-SystemLibraries:
+-	cd "$(SRCROOT)/mDNSMacOSX"; xcodebuild install     OBJROOT=$(OBJROOT) SYMROOT=$(SYMROOT) DSTROOT=$(DSTROOT) MVERS=$(MVERS) SDKROOT=$(SDKROOT) -target SystemLibraries $(VER) 
+-
+-install:
+-	cd "$(SRCROOT)/mDNSMacOSX"; xcodebuild install     OBJROOT=$(OBJROOT) SYMROOT=$(SYMROOT) DSTROOT=$(DSTROOT) MVERS=$(MVERS) SDKROOT=$(SDKROOT) $(VER) 
+-	# Make sure ddnswriteconfig is owned by root:wheel, then make it setuid root executable
+-	if test -e $(DDNSWRITECONFIG) ; then chown 0:80 $(DDNSWRITECONFIG) ; chmod 4555 $(DDNSWRITECONFIG) ; fi
+-
+-installsrc:
+-	ditto . "$(SRCROOT)"
++DEFINES  ?= -DNOT_HAVE_SA_LEN -DUSES_NETLINK -fPIC
++INCLUDES ?= -I./mDNSShared -I./mDNSCore
++PREFIX   ?= /usr/local
++LIBDIR   ?= $(PREFIX)/lib
++INCDIR   ?= $(PREFIX)/include
++LIB =    libmDNSEmbedded.so
++
++HEADERS = mDNSShared/dns_sd.h mDNSCore/mDnsEmbedded.h
++
++OBJECTS =  mDNSShared/dnssd_clientshim.o mDNSPosix/mDNSPosix.o mDNSCore/mDNS.o
++OBJECTS += mDNSCore/DNSCommon.o mDNSShared/mDNSDebug.o mDNSShared/GenLinkedList.o
++OBJECTS += mDNSCore/uDNS.o mDNSShared/PlatformCommon.o mDNSPosix/mDNSUNP.o
++OBJECTS += mDNSCore/DNSDigest.o mDNSCore/mDnsEmbedded.o mDNSShared/dnssd_clientlib.o
++OBJECTS += mDNSCore/CryptoAlg.o mDNSCore/anonymous.o
++
++all: $(LIB)
++install: $(LIBDIR)/$(LIB) $(addprefix $(INCDIR)/,$(HEADERS))
++
++$(INCDIR)/%.h: %.h
++	mkdir -p $(INCDIR)
++	install -m 644 $< $(INCDIR)
++
++$(LIBDIR)/$(LIB): $(LIB)
++	mkdir -p $(LIBDIR)
++	install -m 644 $< $@
+ 
+-installhdrs::
+-	cd "$(SRCROOT)/mDNSMacOSX"; xcodebuild installhdrs OBJROOT=$(OBJROOT) SYMROOT=$(SYMROOT) DSTROOT=$(DSTROOT) MVERS=$(MVERS) SDKROOT=$(SDKROOT)  -target SystemLibraries $(VER)
++$(LIB): $(OBJECTS)
++	$(CC) -shared -o $@ $^
+ 
+-java:
+-	cd "$(SRCROOT)/mDNSMacOSX"; xcodebuild install  OBJROOT=$(OBJROOT) SYMROOT=$(SYMROOT) DSTROOT=$(DSTROOT) MVERS=$(MVERS) SDKROOT=$(SDKROOT) -target libjdns_sd.jnilib $(VER)
++%.o: %.c
++	$(CC) $(INCLUDES) $(DEFINES) $(CFLAGS) -c $< -o $@
+ 
+-clean::
+-	echo clean
++clean:
++	-rm $(OBJECTS) $(LIB)
diff --git a/package/libmdnsresponder/Config.in b/package/libmdnsresponder/Config.in
new file mode 100644
index 0000000..afce52a
--- /dev/null
+++ b/package/libmdnsresponder/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBMDNSRESPONDER
+	bool "libmdnsresponder"
+	depends on !BR2_STATIC_LIBS
+	help
+	  The mDNSResponder project is a component of Bonjour,
+	  Apple's ease-of-use IP networking initiative:
+
+	  http://developer.apple.com/bonjour
+
+comment "libmdnsresponder needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libmdnsresponder/libmdnsresponder.hash b/package/libmdnsresponder/libmdnsresponder.hash
new file mode 100644
index 0000000..3a4fe26
--- /dev/null
+++ b/package/libmdnsresponder/libmdnsresponder.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	8efdd7d57445f4defdb450217c31afc5c5d258822764bb02f4e8282430b33119	mDNSResponder-625.41.2.tar.gz
diff --git a/package/libmdnsresponder/libmdnsresponder.mk b/package/libmdnsresponder/libmdnsresponder.mk
new file mode 100644
index 0000000..05c54ff
--- /dev/null
+++ b/package/libmdnsresponder/libmdnsresponder.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libmdnsresponder
+#
+################################################################################
+
+LIBMDNSRESPONDER_VERSION = 625.41.2
+LIBMDNSRESPONDER_SITE = https://opensource.apple.com/tarballs/mDNSResponder
+LIBMDNSRESPONDER_SOURCE = mDNSResponder-$(LIBMDNSRESPONDER_VERSION).tar.gz
+LIBMDNSRESPONDER_LICENSE = \
+	Apache-2.0, BSD-3c (shared library), GPLv2 (mDnsEmbedded.h), \
+	NICTA Public Software Licence
+LIBMDNSRESPONDER_LICENSE_FILES = LICENSE
+LIBMDNSRESPONDER_INSTALL_STAGING = YES
+
+define LIBMDNSRESPONDER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define LIBMDNSRESPONDER_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX=$(STAGING_DIR)/usr install -C $(@D)
+endef
+
+define LIBLIBMDNSRESPONDER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX=$(TARGET_DIR)/usr install -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
