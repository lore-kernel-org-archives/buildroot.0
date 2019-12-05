From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:25:52 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/openvmtools: fix
 build on musl
Message-ID: <20191205213858.9E50B80080@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebcc3d3cc6085dc62f46b3a9604dafedd5ab9584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/9c67acf77fdcebab1e50d6c1b42475efcedec82d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b27040cdd141ad9257de3ce5105b1e90cd6e8203)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...to-vm_poll-h-to-fix-build-failure-on-musl.patch | 798 +++++++++++++++++++++
 ...mptions-about-glibc-being-only-libc-imple.patch |  27 +
 ...05-Use-configure-test-for-struct-timespec.patch |  48 ++
 ...ix-definition-of-ALLPERMS-and-ACCESSPERMS.patch |  61 ++
 ...re-to-test-for-feature-instead-of-platfor.patch | 150 ++++
 ...Use-configure-test-for-sys-stat.h-include.patch |  28 +
 6 files changed, 1112 insertions(+)

diff --git a/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch b/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
new file mode 100644
index 0000000000..e9495ce43f
--- /dev/null
+++ b/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
@@ -0,0 +1,798 @@
+From 9d13e32e362ad3ce5169f49b7f0fe1d9380e558c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 30 Sep 2019 13:32:35 +0200
+Subject: [PATCH] Rename poll.h into vm_poll.h to fix build failure on musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl libc redirects include of sys/poll.h to poll.h. But since poll.h is
+also a local header file, the musl libc header is never included. This
+leads to the following build failure:
+
+In file included from asyncsocket.c:73:0:
+.../host/i586-buildroot-linux-musl/sysroot/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+ #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+asyncsocket.c: In function ???AsyncTCPSocketPollWork???:
+asyncsocket.c:2537:13: error: invalid use of undefined type ???struct pollfd???
+          pfd[i].fd = asock[i]->fd;
+             ^
+asyncsocket.c:2537:13: error: dereferencing pointer to incomplete type ???struct pollfd???
+asyncsocket.c:2538:13: error: invalid use of undefined type ???struct pollfd???
+          pfd[i].events = read ? POLLIN : POLLOUT;
+             ^
+asyncsocket.c:2538:33: error: ???POLLIN??? undeclared (first use in this function); did you mean ???POLL_IN????
+          pfd[i].events = read ? POLLIN : POLLOUT;
+
+So rename poll.h into vm_poll.h as suggested by srowe in
+https://github.com/vmware/open-vm-tools/issues/359#issuecomment-533529956
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4f575ef42bbc4387a07e396205052b2da081c64d
+
+Fix #359
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/vmware/open-vm-tools/pull/383]
+---
+ lib/asyncsocket/asyncsocket.c |   4 +-
+ lib/hgfsServer/hgfsServer.c   |   2 +-
+ lib/include/asyncsocket.h     |   2 +-
+ lib/include/poll.h            | 330 --------------------
+ lib/include/pollImpl.h        |   2 +-
+ lib/include/vm_poll.h         | 330 ++++++++++++++++++++
+ lib/rpcIn/rpcin.c             |   2 +-
+ 7 files changed, 336 insertions(+), 336 deletions(-)
+ delete mode 100644 open-vm-tools/lib/include/poll.h
+ create mode 100644 open-vm-tools/lib/include/vm_poll.h
+
+diff --git a/lib/asyncsocket/asyncsocket.c b/lib/asyncsocket/asyncsocket.c
+index 102638cc..01181a95 100644
+--- a/lib/asyncsocket/asyncsocket.c
++++ b/lib/asyncsocket/asyncsocket.c
+@@ -69,8 +69,8 @@
+ #else
+ #include <stddef.h>
+ #include <ctype.h>
++#include <poll.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <netdb.h>
+@@ -86,7 +86,7 @@
+ #include "random.h"
+ #include "asyncsocket.h"
+ #include "asyncSocketBase.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "log.h"
+ #include "err.h"
+ #include "hostinfo.h"
+diff --git a/lib/hgfsServer/hgfsServer.c b/lib/hgfsServer/hgfsServer.c
+index 46224551..fc691286 100644
+--- a/lib/hgfsServer/hgfsServer.c
++++ b/lib/hgfsServer/hgfsServer.c
+@@ -48,7 +48,7 @@
+ #include "hgfsServerOplock.h"
+ #include "hgfsDirNotify.h"
+ #include "userlock.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "mutexRankLib.h"
+ #include "vm_basic_asm.h"
+ #include "unicodeOperations.h"
+diff --git a/lib/include/asyncsocket.h b/lib/include/asyncsocket.h
+index 95a5e464..a4b4e5aa 100644
+--- a/lib/include/asyncsocket.h
++++ b/lib/include/asyncsocket.h
+@@ -164,7 +164,7 @@ typedef struct AsyncSocket AsyncSocket;
+  * Or the client can specify its favorite poll class and locking behavior.
+  * Use of IVmdbPoll is only supported for regular sockets and for Attach.
+  */
+-#include "poll.h"
++#include "vm_poll.h"
+ struct IVmdbPoll;
+ typedef struct AsyncSocketPollParams {
+    int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
+diff --git a/lib/include/poll.h b/lib/include/poll.h
+deleted file mode 100644
+index 6acd4f35..00000000
+--- a/lib/include/poll.h
++++ /dev/null
+@@ -1,330 +0,0 @@
+-/*********************************************************
+- * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
+- *
+- * This program is free software; you can redistribute it and/or modify it
+- * under the terms of the GNU Lesser General Public License as published
+- * by the Free Software Foundation version 2.1 and no later version.
+- *
+- * This program is distributed in the hope that it will be useful, but
+- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+- * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
+- * License for more details.
+- *
+- * You should have received a copy of the GNU Lesser General Public License
+- * along with this program; if not, write to the Free Software Foundation, Inc.,
+- * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
+- *
+- *********************************************************/
+-
+-/*********************************************************
+- * The contents of this file are subject to the terms of the Common
+- * Development and Distribution License (the "License") version 1.0
+- * and no later version.  You may not use this file except in
+- * compliance with the License.
+- *
+- * You can obtain a copy of the License at
+- *         http://www.opensource.org/licenses/cddl1.php
+- *
+- * See the License for the specific language governing permissions
+- * and limitations under the License.
+- *
+- *********************************************************/
+-
+-
+-#ifndef _POLL_H_
+-#define _POLL_H_
+-
+-#define INCLUDE_ALLOW_USERLEVEL
+-#define INCLUDE_ALLOW_VMCORE
+-#include "includeCheck.h"
+-
+-#include "vm_basic_types.h"
+-#include "vm_basic_defs.h"
+-#include "vmware.h"
+-#include "userlock.h"
+-
+-#if defined(__cplusplus)
+-extern "C" {
+-#endif
+-
+-#ifdef _WIN32
+-#define HZ 100
+-#elif defined linux
+-#include <asm/param.h>
+-#elif __APPLE__
+-#include <TargetConditionals.h>
+-/*
+- * Old SDKs don't define TARGET_OS_IPHONE at all.
+- * New ones define it to 0 on Mac OS X, 1 on iOS.
+- */
+-#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
+-#include <sys/kernel.h>
+-#endif
+-#include <sys/poll.h>
+-#define HZ 100
+-#endif
+-#ifdef __ANDROID__
+-/*
+- * <poll.h> of android should be included, but its name is same
+- * with this file. So its content is put here to avoid conflict.
+- */
+-#include <asm/poll.h>
+-#define HZ 100
+-typedef unsigned int  nfds_t;
+-int poll(struct pollfd *, nfds_t, long);
+-#endif
+-
+-
+-/*
+- * Poll event types: each type has a different reason for firing,
+- * or condition that must be met before firing.
+- */
+-
+-typedef enum {
+-   /*
+-    * Actual Poll queue types against which you can register callbacks.
+-    */
+-   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
+-   POLL_VTIME = 0,
+-   POLL_REALTIME,
+-   POLL_DEVICE,
+-   POLL_MAIN_LOOP,
+-   POLL_NUM_QUEUES
+-} PollEventType;
+-
+-
+-/*
+- * Classes of events
+- *
+- * These are the predefined classes.  More can be declared
+- * with Poll_AllocClass().
+- */
+-
+-typedef enum PollClass {
+-   POLL_CLASS_MAIN,
+-   POLL_CLASS_PAUSE,
+-   POLL_CLASS_IPC,
+-   POLL_CLASS_CPT,
+-   POLL_CLASS_MKS,
+-   POLL_FIXED_CLASSES,
+-   POLL_DEFAULT_FIXED_CLASSES,
+-   /* Size enum to maximum */
+-   POLL_MAX_CLASSES = 31,
+-} PollClass;
+-
+-/*
+- * Do not use; Special pseudo private poll class supported by
+- * PollDefault only
+- */
+-#define POLL_DEFAULT_CLASS_NET POLL_FIXED_CLASSES
+-#define POLL_DEFAULT_CS_NET    PollClassSet_Singleton(POLL_DEFAULT_CLASS_NET)
+-
+-/*
+- * Each callback is registered in a set of classes
+- */
+-
+-typedef struct PollClassSet {
+-   uintptr_t bits;
+-} PollClassSet;
+-
+-/* An empty PollClassSet. */
+-static INLINE PollClassSet
+-PollClassSet_Empty(void)
+-{
+-   PollClassSet set = { 0 };
+-   return set;
+-}
+-
+-/* A PollClassSet with the single member. */
+-static INLINE PollClassSet
+-PollClassSet_Singleton(PollClass c)
+-{
+-   PollClassSet s = PollClassSet_Empty();
+-
+-   ASSERT_ON_COMPILE(POLL_MAX_CLASSES < sizeof s.bits * 8);
+-   ASSERT(c < POLL_MAX_CLASSES);
+-
+-   s.bits = CONST3264U(1) << c;
+-   return s;
+-}
+-
+-/* Combine two PollClassSets. */
+-static INLINE PollClassSet
+-PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
+-{
+-   PollClassSet set;
+-   set.bits = lhs.bits | rhs.bits;
+-   return set;
+-}
+-
+-/* Add single class to PollClassSet. */
+-static INLINE PollClassSet
+-PollClassSet_Include(PollClassSet set, PollClass c)
+-{
+-   return PollClassSet_Union(set, PollClassSet_Singleton(c));
+-}
+-
+-
+-#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
+-#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
+-                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
+-#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
+-                           PollClassSet_Singleton(POLL_CLASS_CPT))
+-#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
+-                           PollClassSet_Singleton(POLL_CLASS_IPC))
+-#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
+-#define POLL_CS_MKS	PollClassSet_Singleton(POLL_CLASS_MKS)
+-/* 
+- * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
+- */
+-#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
+-
+-/*
+- * Poll class-set taxonomy:
+- * POLL_CS_MAIN
+- *    - Unless you NEED another class, use POLL_CS_MAIN.
+- * POLL_CS_PAUSE
+- *    - For callbacks that must occur even if the guest is paused.
+- *      Most VMDB or Foundry commands are in this category.
+- * POLL_CS_CPT
+- *    - Only for callbacks which can trigger intermediate Checkpoint 
+- *      transitions.
+- *      The ONLY such callback is Migrate.
+- * POLL_CS_IPC
+- *    - Only for callbacks which can contain Msg_(Post|Hint|Question) 
+- *      responses, and for signal handlers (why)?
+- *      Vigor, VMDB, and Foundry can contain Msg_* responses.
+- * POLL_CS_MKS
+- *    - Callback runs in MKS thread.
+- * POLL_CS_ALWAYS
+- *    - Only for events that must be processed immediately.
+- *      The ONLY such callback is OvhdMemVmxSizeCheck.
+- */
+-
+-
+-/*
+- * Poll_Callback flags
+- */
+-
+-#define POLL_FLAG_PERIODIC		0x01    // keep after firing
+-#define POLL_FLAG_REMOVE_AT_POWEROFF	0x02  	// self-explanatory
+-#define POLL_FLAG_READ			0x04	// device is ready for reading
+-#define POLL_FLAG_WRITE			0x08	// device is ready for writing
+-#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
+-#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
+-#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
+-#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
+-#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
+-#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
+-
+-
+-typedef void (*PollerFunction)(void *clientData);
+-typedef void (*PollerFireWrapper)(PollerFunction func,
+-                                  void *funcData,
+-                                  void *wrapperData);
+-typedef Bool (*PollerErrorFn)(const char *errorStr);
+-
+-/*
+- * Initialisers:
+- *
+- *      For the sake of convenience, we declare the initialisers
+- *      for custom implmentations here, even though the actual
+- *      implementations are distinct from the core poll code.
+- */
+-
+-typedef struct PollOptions {
+-   Bool locked;           // Use internal MXUser for locking
+-   Bool allowFullQueue;   // Don't assert when device event queue is full.
+-   VThreadID windowsMsgThread;       // thread that processes Windows messages
+-   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
+-   void *fireWrapperData; // optional
+-   PollerErrorFn errorFn; // optional; called upon unrecoverable error
+-} PollOptions;
+-
+-
+-void Poll_InitDefault(void);
+-void Poll_InitDefaultEx(const PollOptions *opts);
+-void Poll_InitGtk(void); // On top of glib for Linux
+-void Poll_InitCF(void);  // On top of CoreFoundation for OSX
+-
+-
+-/*
+- * Functions
+- */
+-int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
+-void Poll_Loop(Bool loop, Bool *exit, PollClass c);
+-void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
+-Bool Poll_LockingEnabled(void);
+-void Poll_Exit(void);
+-
+-
+-/*
+- * Poll_Callback adds a callback regardless of whether an identical one exists.
+- * The exception to this rule is POLL_DEVICE callbacks: there is a maximum of
+- * one read and one write callback per fd.
+- *
+- * Poll_CallbackRemove removes one callback. If there are multiple identical
+- * callbacks, which one is removed is an implementation detail. Note that in
+- * the case of POLL_DEVICE and POLL_REALTIME callbacks, the fd/delay used to
+- * create the callback is not specified when removing, so all callbacks
+- * of those types with the same flags, function, and clientData are considered
+- * "identical" even if their fd/delay differed.
+- */
+-
+-VMwareStatus Poll_Callback(PollClassSet classSet,
+-                           int flags,
+-                           PollerFunction f,
+-                           void *clientData,
+-                           PollEventType type,
+-                           PollDevHandle info, // fd/microsec delay
+-                           MXUserRecLock *lck);
+-Bool Poll_CallbackRemove(PollClassSet classSet,
+-                         int flags,
+-                         PollerFunction f,
+-                         void *clientData,
+-                         PollEventType type);
+-Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
+-                                int flags,
+-                                PollerFunction f,
+-                                PollEventType type,
+-                                void **clientData);
+-
+-void Poll_NotifyChange(PollClassSet classSet);
+-
+-/*
+- * Wrappers for Poll_Callback and Poll_CallbackRemove that present
+- * simpler subsets of those interfaces.
+- */
+-
+-VMwareStatus Poll_CB_Device(PollerFunction f,
+-                            void *clientData,
+-                            PollDevHandle device,
+-                            Bool periodic);
+-
+-Bool Poll_CB_DeviceRemove(PollerFunction f,
+-                          void *clientData,
+-                          Bool periodic);
+-
+-
+-VMwareStatus Poll_CB_RTime(PollerFunction f,
+-                           void *clientData,
+-                           int64 delay,   // microseconds
+-                           Bool periodic,
+-                           MXUserRecLock *lock);
+-
+-Bool Poll_CB_RTimeRemove(PollerFunction f,
+-                         void *clientData,
+-                         Bool periodic);
+-
+-
+-#ifdef _WIN32
+-void Poll_SetPumpsWindowsMessages(Bool pumps);
+-void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
+-Bool Poll_FireWndCallback(void *lparam);
+-#endif
+-
+-#if defined(__cplusplus)
+-}  // extern "C"
+-#endif
+-
+-#endif // _POLL_H_
+diff --git a/lib/include/pollImpl.h b/lib/include/pollImpl.h
+index 46442e55..8bc66997 100644
+--- a/lib/include/pollImpl.h
++++ b/lib/include/pollImpl.h
+@@ -44,7 +44,7 @@
+ #define INCLUDE_ALLOW_USERLEVEL
+ #include "includeCheck.h"
+ 
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "vm_basic_asm.h"
+ 
+ #if defined(__cplusplus)
+diff --git a/lib/include/vm_poll.h b/lib/include/vm_poll.h
+new file mode 100644
+index 00000000..6acd4f35
+--- /dev/null
++++ b/lib/include/vm_poll.h
+@@ -0,0 +1,330 @@
++/*********************************************************
++ * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU Lesser General Public License as published
++ * by the Free Software Foundation version 2.1 and no later version.
++ *
++ * This program is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++ * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
++ * License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program; if not, write to the Free Software Foundation, Inc.,
++ * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
++ *
++ *********************************************************/
++
++/*********************************************************
++ * The contents of this file are subject to the terms of the Common
++ * Development and Distribution License (the "License") version 1.0
++ * and no later version.  You may not use this file except in
++ * compliance with the License.
++ *
++ * You can obtain a copy of the License at
++ *         http://www.opensource.org/licenses/cddl1.php
++ *
++ * See the License for the specific language governing permissions
++ * and limitations under the License.
++ *
++ *********************************************************/
++
++
++#ifndef _POLL_H_
++#define _POLL_H_
++
++#define INCLUDE_ALLOW_USERLEVEL
++#define INCLUDE_ALLOW_VMCORE
++#include "includeCheck.h"
++
++#include "vm_basic_types.h"
++#include "vm_basic_defs.h"
++#include "vmware.h"
++#include "userlock.h"
++
++#if defined(__cplusplus)
++extern "C" {
++#endif
++
++#ifdef _WIN32
++#define HZ 100
++#elif defined linux
++#include <asm/param.h>
++#elif __APPLE__
++#include <TargetConditionals.h>
++/*
++ * Old SDKs don't define TARGET_OS_IPHONE at all.
++ * New ones define it to 0 on Mac OS X, 1 on iOS.
++ */
++#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
++#include <sys/kernel.h>
++#endif
++#include <sys/poll.h>
++#define HZ 100
++#endif
++#ifdef __ANDROID__
++/*
++ * <poll.h> of android should be included, but its name is same
++ * with this file. So its content is put here to avoid conflict.
++ */
++#include <asm/poll.h>
++#define HZ 100
++typedef unsigned int  nfds_t;
++int poll(struct pollfd *, nfds_t, long);
++#endif
++
++
++/*
++ * Poll event types: each type has a different reason for firing,
++ * or condition that must be met before firing.
++ */
++
++typedef enum {
++   /*
++    * Actual Poll queue types against which you can register callbacks.
++    */
++   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
++   POLL_VTIME = 0,
++   POLL_REALTIME,
++   POLL_DEVICE,
++   POLL_MAIN_LOOP,
++   POLL_NUM_QUEUES
++} PollEventType;
++
++
++/*
++ * Classes of events
++ *
++ * These are the predefined classes.  More can be declared
++ * with Poll_AllocClass().
++ */
++
++typedef enum PollClass {
++   POLL_CLASS_MAIN,
++   POLL_CLASS_PAUSE,
++   POLL_CLASS_IPC,
++   POLL_CLASS_CPT,
++   POLL_CLASS_MKS,
++   POLL_FIXED_CLASSES,
++   POLL_DEFAULT_FIXED_CLASSES,
++   /* Size enum to maximum */
++   POLL_MAX_CLASSES = 31,
++} PollClass;
++
++/*
++ * Do not use; Special pseudo private poll class supported by
++ * PollDefault only
++ */
++#define POLL_DEFAULT_CLASS_NET POLL_FIXED_CLASSES
++#define POLL_DEFAULT_CS_NET    PollClassSet_Singleton(POLL_DEFAULT_CLASS_NET)
++
++/*
++ * Each callback is registered in a set of classes
++ */
++
++typedef struct PollClassSet {
++   uintptr_t bits;
++} PollClassSet;
++
++/* An empty PollClassSet. */
++static INLINE PollClassSet
++PollClassSet_Empty(void)
++{
++   PollClassSet set = { 0 };
++   return set;
++}
++
++/* A PollClassSet with the single member. */
++static INLINE PollClassSet
++PollClassSet_Singleton(PollClass c)
++{
++   PollClassSet s = PollClassSet_Empty();
++
++   ASSERT_ON_COMPILE(POLL_MAX_CLASSES < sizeof s.bits * 8);
++   ASSERT(c < POLL_MAX_CLASSES);
++
++   s.bits = CONST3264U(1) << c;
++   return s;
++}
++
++/* Combine two PollClassSets. */
++static INLINE PollClassSet
++PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
++{
++   PollClassSet set;
++   set.bits = lhs.bits | rhs.bits;
++   return set;
++}
++
++/* Add single class to PollClassSet. */
++static INLINE PollClassSet
++PollClassSet_Include(PollClassSet set, PollClass c)
++{
++   return PollClassSet_Union(set, PollClassSet_Singleton(c));
++}
++
++
++#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
++#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
++                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
++#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
++                           PollClassSet_Singleton(POLL_CLASS_CPT))
++#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
++                           PollClassSet_Singleton(POLL_CLASS_IPC))
++#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
++#define POLL_CS_MKS	PollClassSet_Singleton(POLL_CLASS_MKS)
++/* 
++ * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
++ */
++#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
++
++/*
++ * Poll class-set taxonomy:
++ * POLL_CS_MAIN
++ *    - Unless you NEED another class, use POLL_CS_MAIN.
++ * POLL_CS_PAUSE
++ *    - For callbacks that must occur even if the guest is paused.
++ *      Most VMDB or Foundry commands are in this category.
++ * POLL_CS_CPT
++ *    - Only for callbacks which can trigger intermediate Checkpoint 
++ *      transitions.
++ *      The ONLY such callback is Migrate.
++ * POLL_CS_IPC
++ *    - Only for callbacks which can contain Msg_(Post|Hint|Question) 
++ *      responses, and for signal handlers (why)?
++ *      Vigor, VMDB, and Foundry can contain Msg_* responses.
++ * POLL_CS_MKS
++ *    - Callback runs in MKS thread.
++ * POLL_CS_ALWAYS
++ *    - Only for events that must be processed immediately.
++ *      The ONLY such callback is OvhdMemVmxSizeCheck.
++ */
++
++
++/*
++ * Poll_Callback flags
++ */
++
++#define POLL_FLAG_PERIODIC		0x01    // keep after firing
++#define POLL_FLAG_REMOVE_AT_POWEROFF	0x02  	// self-explanatory
++#define POLL_FLAG_READ			0x04	// device is ready for reading
++#define POLL_FLAG_WRITE			0x08	// device is ready for writing
++#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
++#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
++#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
++#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
++#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
++#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
++
++
++typedef void (*PollerFunction)(void *clientData);
++typedef void (*PollerFireWrapper)(PollerFunction func,
++                                  void *funcData,
++                                  void *wrapperData);
++typedef Bool (*PollerErrorFn)(const char *errorStr);
++
++/*
++ * Initialisers:
++ *
++ *      For the sake of convenience, we declare the initialisers
++ *      for custom implmentations here, even though the actual
++ *      implementations are distinct from the core poll code.
++ */
++
++typedef struct PollOptions {
++   Bool locked;           // Use internal MXUser for locking
++   Bool allowFullQueue;   // Don't assert when device event queue is full.
++   VThreadID windowsMsgThread;       // thread that processes Windows messages
++   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
++   void *fireWrapperData; // optional
++   PollerErrorFn errorFn; // optional; called upon unrecoverable error
++} PollOptions;
++
++
++void Poll_InitDefault(void);
++void Poll_InitDefaultEx(const PollOptions *opts);
++void Poll_InitGtk(void); // On top of glib for Linux
++void Poll_InitCF(void);  // On top of CoreFoundation for OSX
++
++
++/*
++ * Functions
++ */
++int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
++void Poll_Loop(Bool loop, Bool *exit, PollClass c);
++void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
++Bool Poll_LockingEnabled(void);
++void Poll_Exit(void);
++
++
++/*
++ * Poll_Callback adds a callback regardless of whether an identical one exists.
++ * The exception to this rule is POLL_DEVICE callbacks: there is a maximum of
++ * one read and one write callback per fd.
++ *
++ * Poll_CallbackRemove removes one callback. If there are multiple identical
++ * callbacks, which one is removed is an implementation detail. Note that in
++ * the case of POLL_DEVICE and POLL_REALTIME callbacks, the fd/delay used to
++ * create the callback is not specified when removing, so all callbacks
++ * of those types with the same flags, function, and clientData are considered
++ * "identical" even if their fd/delay differed.
++ */
++
++VMwareStatus Poll_Callback(PollClassSet classSet,
++                           int flags,
++                           PollerFunction f,
++                           void *clientData,
++                           PollEventType type,
++                           PollDevHandle info, // fd/microsec delay
++                           MXUserRecLock *lck);
++Bool Poll_CallbackRemove(PollClassSet classSet,
++                         int flags,
++                         PollerFunction f,
++                         void *clientData,
++                         PollEventType type);
++Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
++                                int flags,
++                                PollerFunction f,
++                                PollEventType type,
++                                void **clientData);
++
++void Poll_NotifyChange(PollClassSet classSet);
++
++/*
++ * Wrappers for Poll_Callback and Poll_CallbackRemove that present
++ * simpler subsets of those interfaces.
++ */
++
++VMwareStatus Poll_CB_Device(PollerFunction f,
++                            void *clientData,
++                            PollDevHandle device,
++                            Bool periodic);
++
++Bool Poll_CB_DeviceRemove(PollerFunction f,
++                          void *clientData,
++                          Bool periodic);
++
++
++VMwareStatus Poll_CB_RTime(PollerFunction f,
++                           void *clientData,
++                           int64 delay,   // microseconds
++                           Bool periodic,
++                           MXUserRecLock *lock);
++
++Bool Poll_CB_RTimeRemove(PollerFunction f,
++                         void *clientData,
++                         Bool periodic);
++
++
++#ifdef _WIN32
++void Poll_SetPumpsWindowsMessages(Bool pumps);
++void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
++Bool Poll_FireWndCallback(void *lparam);
++#endif
++
++#if defined(__cplusplus)
++}  // extern "C"
++#endif
++
++#endif // _POLL_H_
+diff --git a/lib/rpcIn/rpcin.c b/lib/rpcIn/rpcin.c
+index 47a3380e..660382c6 100644
+--- a/lib/rpcIn/rpcin.c
++++ b/lib/rpcIn/rpcin.c
+@@ -57,7 +57,7 @@
+ 
+ #if defined(VMTOOLS_USE_VSOCKET)
+ #  include <glib.h>
+-#  include "poll.h"
++#  include "vm_poll.h"
+ #  include "asyncsocket.h"
+ #  include "vmci_defs.h"
+ #include "dataMap.h"
+-- 
+2.23.0
+
diff --git a/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch b/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch
new file mode 100644
index 0000000000..5960006f2f
--- /dev/null
+++ b/package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch
@@ -0,0 +1,27 @@
+From a0983d84185f04c4e40778fe951fde4439894882 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 07:37:03 -0700
+Subject: [PATCH] Remove assumptions about glibc being only libc
+ implementation on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Retrieved (and updated to work on current version) from:
+http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch?h=sumo]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ open-vm-tools/lib/file/fileIOPosix.c      | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+Index: open-vm-tools/lib/file/fileIOPosix.c
+===================================================================
+--- open-vm-tools.orig/lib/file/fileIOPosix.c
++++ open-vm-tools/lib/file/fileIOPosix.c
+@@ -205,7 +205,7 @@ static AlignedPool alignedPool;
+  * are not available in any header file.
+  */
+ 
+-#if defined(__linux__) && !defined(__ANDROID__)
++#if defined(__linux__) && defined(__GLIBC__)
+    #if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS == 64)
+       /*
+        * We want preadv/pwritev. But due to FOB=64, the symbols are -64.
diff --git a/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch b/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch
new file mode 100644
index 0000000000..3386faec15
--- /dev/null
+++ b/package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch
@@ -0,0 +1,48 @@
+From bf1eafb07297711baf9320b1edcca8a3376f117d Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 09:03:00 +0000
+Subject: [PATCH] Use configure test for struct timespec
+
+Use the configure script to test for struct time spec instead of trying
+to keep track of what platforms has it.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+[Retrieved from:
+http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch?h=sumo]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ open-vm-tools/configure.ac           | 1 +
+ open-vm-tools/lib/include/hgfsUtil.h | 8 +-------
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -1127,6 +1127,7 @@ AC_TYPE_OFF_T
+ AC_TYPE_PID_T
+ AC_TYPE_SIZE_T
+ AC_CHECK_MEMBERS([struct stat.st_rdev])
++AC_CHECK_MEMBERS([struct timespec.tv_sec],[],[],[[#include <time.h>]])
+ AC_HEADER_TIME
+ AC_STRUCT_TM
+ AC_C_VOLATILE
+Index: open-vm-tools/lib/include/hgfsUtil.h
+===================================================================
+--- open-vm-tools.orig/lib/include/hgfsUtil.h
++++ open-vm-tools/lib/include/hgfsUtil.h
+@@ -53,13 +53,7 @@
+ #      include <time.h>
+ #   endif
+ #   include "vm_basic_types.h"
+-#   if !defined _STRUCT_TIMESPEC &&   \
+-       !defined _TIMESPEC_DECLARED && \
+-       !defined __timespec_defined && \
+-       !defined sun && \
+-       !defined __FreeBSD__ && \
+-       !__APPLE__ && \
+-       !defined _WIN32
++#   if !defined HAVE_STRUCT_TIMESPEC_TV_SEC
+ struct timespec {
+    time_t tv_sec;
+    long   tv_nsec;
diff --git a/package/openvmtools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/package/openvmtools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
new file mode 100644
index 0000000000..371004c90f
--- /dev/null
+++ b/package/openvmtools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
@@ -0,0 +1,61 @@
+From 31ae6f42458f90d4994a4ad8e2b7673691612c36 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 09:10:14 +0000
+Subject: [PATCH] Fix definition of ALLPERMS and ACCESSPERMS
+
+The ALLPERMS and ACCESSPERMS defines are not specified in POSIX so
+assume it is not there instead of testing for specific implementations.
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+[Retrieved from:
+http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch?h=sumo]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c      | 8 +++++---
+ open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c | 3 +--
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+Index: open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+===================================================================
+--- open-vm-tools.orig/lib/hgfsServer/hgfsServerLinux.c
++++ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+@@ -107,11 +107,13 @@ typedef struct DirectoryEntry {
+ #endif
+ 
+ /*
+- * ALLPERMS (mode 07777) and ACCESSPERMS (mode 0777) are not defined in the
+- * Solaris version of <sys/stat.h>.
++ * ALLPERMS (mode 07777) and ACCESSPERMS (mode 0777) are not specified in
++ * POSIX.
+  */
+-#ifdef sun
++#ifndef ACCESSPERMS
+ #   define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)
++#endif
++#ifndef ALLPERMS
+ #   define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
+ #endif
+ 
+Index: open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/dndcp/dnd/dndLinux.c
++++ open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
+@@ -51,7 +51,7 @@
+ 
+ #define DND_ROOTDIR_PERMS     (S_IRWXU | S_IRWXG | S_IRWXO)
+ #define DND_STAGINGDIR_PERMS  (S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH)
+-#ifdef sun
++#ifndef ACCESSPERMS
+ #define ACCESSPERMS           (S_IRWXU | S_IRWXG | S_IRWXO)
+ #endif
+ #ifdef __ANDROID__
+@@ -60,7 +60,6 @@
+  */
+ #define NO_SETMNTENT
+ #define NO_ENDMNTENT
+-#define ACCESSPERMS           (S_IRWXU | S_IRWXG | S_IRWXO)
+ #endif
+ 
+ 
diff --git a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
new file mode 100644
index 0000000000..0d3948aa10
--- /dev/null
+++ b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -0,0 +1,150 @@
+From 6cc1c22cc30320f56da552a76bd956db8f255b6a Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 10:05:07 +0000
+Subject: [PATCH] Use configure to test for feature instead of platform
+
+Test for various functions instead of trying to keep track of what
+platform and what version of the given platform has support for what.
+
+This should make it easier to port to currently unknown platforms and
+will solve the issue if a platform add support for a missing feature in
+the future.
+
+The features we test for are:
+- getifaddrs
+- getauxval
+- issetugid
+- __secure_getenv
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+[Retrieved (and slightly updated) from:
+http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch?h=sumo]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ open-vm-tools/configure.ac               |  4 ++++
+ open-vm-tools/lib/misc/idLinux.c         | 30 ++++++++++++++----------------
+ open-vm-tools/lib/nicInfo/nicInfoPosix.c |  8 ++++++--
+ 3 files changed, 24 insertions(+), 18 deletions(-)
+
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -798,6 +798,7 @@ AC_CHECK_FUNCS(
+ 
+ AC_CHECK_FUNCS([ecvt])
+ AC_CHECK_FUNCS([fcvt])
++AC_CHECK_FUNCS([getifaddrs getauxval issetugid __secure_getenv])
+ 
+ AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
+ 
+@@ -1063,10 +1064,13 @@ AC_PATH_PROG(
+ ###
+ 
+ AC_CHECK_HEADERS([crypt.h])
++AC_CHECK_HEADERS([ifaddrs.h])
+ AC_CHECK_HEADERS([inttypes.h])
+ AC_CHECK_HEADERS([stdint.h])
+ AC_CHECK_HEADERS([stdlib.h])
+ AC_CHECK_HEADERS([wchar.h])
++AC_CHECK_HEADERS([net/if.h])
++AC_CHECK_HEADERS([sys/auxv.h])
+ AC_CHECK_HEADERS([sys/inttypes.h])
+ AC_CHECK_HEADERS([sys/io.h])
+ AC_CHECK_HEADERS([sys/param.h]) # Required to make the sys/user.h check work correctly on FreeBSD
+Index: open-vm-tools/lib/misc/idLinux.c
+===================================================================
+--- open-vm-tools.orig/lib/misc/idLinux.c
++++ open-vm-tools/lib/misc/idLinux.c
+@@ -27,12 +27,9 @@
+ #include <sys/syscall.h>
+ #include <string.h>
+ #include <unistd.h>
+-#ifdef __linux__
+-#if defined(__GLIBC__) && \
+-           (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
++#ifdef HAVE_SYS_AUXV_H
+ #include <sys/auxv.h>
+ #endif
+-#endif
+ #ifdef __APPLE__
+ #include <sys/socket.h>
+ #include <TargetConditionals.h>
+@@ -997,31 +994,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
+ static Bool
+ IdIsSetUGid(void)
+ {
+-#if defined(__ANDROID__)
+-   /* Android does not have a secure_getenv, so be conservative. */
+-   return TRUE;
+-#else
+    /*
+     * We use __secure_getenv, which returns NULL if the binary is
+-    * setuid or setgid. Alternatives include,
++    * setuid or setgid, when issetugid or getauxval(AT_SECURE) is not
++    * available. Alternatives include,
+     *
+-    *   a) getauxval(AT_SECURE); not available until glibc 2.16.
+-    *   b) __libc_enable_secure; may not be exported.
++    *   a) issetugid(); not (yet?) available in glibc.
++    *   b) getauxval(AT_SECURE); not available until glibc 2.16.
++    *   c) __libc_enable_secure; may not be exported.
+     *
+-    * Use (a) when we are based on glibc 2.16, or newer.
++    * Use (b) when we are based on glibc 2.16, or newer.
+     */
+ 
+-#if defined(__GLIBC__) && \
+-           (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
++#if HAVE_ISSETUGID
++   return issetugid();
++#elif HAVE_GETAUXVAL
+    return getauxval(AT_SECURE) != 0;
+-#else
++#elif HAVE___SECURE_GETENV
+    static const char envName[] = "VMW_SETUGID_TEST";
+ 
+    if (setenv(envName, "1", TRUE) == -1) {
+       return TRUE; /* Conservative */
+    }
+    return __secure_getenv(envName) == NULL;
+-#endif
++#else
++   /* Android does not have a secure_getenv, so be conservative. */
++   return TRUE;
+ #endif
+ }
+ #endif
+Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
+===================================================================
+--- open-vm-tools.orig/lib/nicInfo/nicInfoPosix.c
++++ open-vm-tools/lib/nicInfo/nicInfoPosix.c
+@@ -34,9 +34,13 @@
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <errno.h>
+-#if defined(__FreeBSD__) || defined(__APPLE__)
++#if HAVE_SYS_SYSCTL_H
+ # include <sys/sysctl.h>
++#endif
++#if HAVE_IFADDRS_H
+ # include <ifaddrs.h>
++#endif
++#if HAVE_NET_IF_H
+ # include <net/if.h>
+ #endif
+ #ifndef NO_DNET
+@@ -348,10 +352,7 @@ GuestInfoGetNicInfo(NicInfoV3 *nicInfo)
+  *
+  ******************************************************************************
+  */
+-#if defined(__FreeBSD__) || \
+-    defined(__APPLE__) || \
+-    defined(USERWORLD) || \
+-    (defined(__linux__) && defined(NO_DNET))
++#if defined(NO_DNET) && defined(HAVE_GETIFADDRS)
+ 
+ char *
+ GuestInfoGetPrimaryIP(void)
diff --git a/package/openvmtools/0008-Use-configure-test-for-sys-stat.h-include.patch b/package/openvmtools/0008-Use-configure-test-for-sys-stat.h-include.patch
new file mode 100644
index 0000000000..c058dfe6c3
--- /dev/null
+++ b/package/openvmtools/0008-Use-configure-test-for-sys-stat.h-include.patch
@@ -0,0 +1,28 @@
+From 95c6184d9ff70a47c41768850923a96de9e544aa Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 10:41:01 +0000
+Subject: [PATCH] Use configure test for sys/stat.h include
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+[Retrieved from:
+http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch?h=sumo]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ open-vm-tools/services/plugins/vix/vixTools.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: open-vm-tools/services/plugins/vix/vixTools.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/vix/vixTools.c
++++ open-vm-tools/services/plugins/vix/vixTools.c
+@@ -66,7 +66,7 @@
+ #include <unistd.h>
+ #endif
+ 
+-#if defined(sun) || defined(__FreeBSD__) || defined(__APPLE__)
++#ifdef HAVE_SYS_STAT_H
+ #include <sys/stat.h>
+ #endif
+ 
