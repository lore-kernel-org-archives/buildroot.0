Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AEDCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C2460658;
	Sat, 10 Oct 2026 07:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Cm47AdCF77K; Sat, 10 Oct 2026 07:34:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C546A6064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617685;
	b=YbtOH9nRPj6LEe5jbL/crlU7ABk06zP9S3MWhH+DLaFDraZMbnWROtGBI8+9pD7PtnqP
	 Sv+e5clt/aZWxnswSsf9/8tztzEyOQj37cpM3qIFvPmtFPRz9KoCnDyC+rxRoipOrliA5
	 w6bHf8WoyEz0cPG3Ae5q8vgPDbv1vf8yncW6JxU0Z1iWuHyJTtS3gUQKGFBYIEYtLTlIL
	 o5lQ9F7VWWGyK/M45ZSrj0P8mlFACjAGwKtyWJgrMpX9gh9ZRVclhQI0F6gQBEbFUH2Wy
	 5MR7MXxneUvndCWQb0xYmHBLQh5v9tzPcGUHivF4NzlD9Px71ip0pWknjH808TJbjeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6mQQ3mczu1gpUranPCjK3F3+8PaRGnhQ4ubGMvZuIRs=;
	b=r0v1fuKAEB8LfOufZSmsfsPkwvObbHVDKqyDruD1V5z1JYjz7Ub1V5mvptYAuQxJFt0P
	 pa4eb5E4xwV2+F6PosYzMti5zZ/m2ElLQfdENaXf01NefKOsiyzCGLrkUZEpV8pGECWeL
	 Jpfix4vla6aEnw77mu4+p9s9tWVtBCI/XrwE8FzkVClJhLccb1xjpBepWVvFedvTHv7Kp
	 hK7kbjHnvqxWaRxdJI3Aj3PAB2fuAikMWwfSu9+QzkUk+yemh6dtJfEMVAx4Y9flJRQMF
	 kDUZ55MVrWCccSesbcLfu349igwd9Ze5FlVmNah8F8XtkvTELgy+HsxwmWTL84CH14g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617685;
	bh=6mQQ3mczu1gpUranPCjK3F3+8PaRGnhQ4ubGMvZuIRs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M7DX4B9BQNKKOVmBX74Vez5EsbPOl43rjzMWrhcxSCuge0jaUaT5nNVTUn3ngH6nX
	 HUMgr0+vK8L+S8XeocHjG1bU3smZ0t0FdIDqXNDt/GGRYb+NsZcR9QZVMu+eT9e/y+
	 J1OvrVmj3oWyFukxfYS1Y9UIJ9nTMfB8rfOroPKS9mdQlEBKwd5j3mG7JD+HjSfAkr
	 2L/D+bTAime9oavQWkwSmwNX4AhrTYwUbtBV2ML59zLu8UC1g5ixY5O6SUx4nibzgk
	 kAuy/DUlkb2Dhrg6Q4bflg4RnwNjpi4A3QXvU1wWCHQ3JLp0z6LlkLYqqxMwHsiqSe
	 wTl8XRJFtXWAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C546A6064C;
	Sat, 10 Oct 2026 07:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABD89D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C3476061F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyHOy5CHhoLf for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CCFFF6064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617680;
 b=apX8PanY7g1p9edCbOZM2b/z//AeeoPJv4DzKt5mLzULvnd4llIyAnLV9bgypnyLjGaZ
 KZrHnLJ2CKg3PaDBWTZPXl1Q8gdkNwWM2k0zA/KkzGZWyOAeQHBFOwRtqjxNsqduRG7tD
 sOJuvUNdfUHZlOKFYe++n11g7WI3khH3wbDINVWbfAfbB42craRahwGqyvga94/YLbU5K
 kflcPcRKlTT38LSfrG2uKhGlPh7cZBKJLWmjs8GZ/HjIzlNDeoDLA/jFkMSALizyQQNvP
 eSZ5vRgD5iircdCyAqPn4AmXyZaGgw8zHHWOcHxMFCh+FzvUklr6dxg6bKWG5lp4PAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617680;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JDLKJ7vBGmE8ThMotIFVEo/2uTi5iH+AHCSzW4iN01s=;
 b=XPnC2mwDZHEHcjjb5HS4vqjfLvChXXc5qmFE/mEs9o/SS0smp5GEePZf6K4l3nAlN6uN
 JUWy+XRAWNDfVotqr15F6P48+9/fBNF2xCclS0xrxfHxVEQnReZyyQBgos313KwWF80MW
 F2jIL9jH0NbnTOTpXHbBVbEmU7AbsFEl16UT+ClqN1ku6R4IYKXQxmMMVEeVJE+DNxl5P
 47OrqNjjROx3FrdYFjH26pGacVtDmdbLRb8Qib8uhycsVkBFdQTPCqi4ZtP0MhCWq/RJB
 wZ2AnbE/AbO44pcCqZ0hPHC+ZbdNnUZ29P3EV6XWMe05IdZnl4gGAA69u+YUrqSJ0NQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCFFF6064C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37418E8EC; Sat, 10 Oct 2026 07:33:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:33:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8194b1f22d79731d12dc3fa2b969cf61f5223d9
X-Git-Newrev: 4fab16d9c25ed5869073e17051f1c1ef8cb028e4
X-Patchwork-Hint: ignore
Message-Id: <20261010073322.B37418E8EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: fix build error with numa
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4fab16d9c25ed5869073e17051f1c1ef8cb028e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
package from 3.1.40.0 to 3.11.1.0. Upstream commit
https://github.com/snort3/snort3/commit/83e9a2dda250a0ced9a105454a5a4fe59c304601
added numa support, first included in release 3.1.65.0.

This causes a build error due to the numactl package being pulled-in as
optional dependency by hwloc, the latter being a hard dependency of
snort3.

Fixes:
https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Rename-numa.h-to-numa_snort.h.patch       | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
new file mode 100644
index 0000000000..ca8f7774f1
--- /dev/null
+++ b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
@@ -0,0 +1,79 @@
+From 3bb2a8fc1244fcbdf24235e541fa2a06a655dcea Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 21:20:04 +0200
+Subject: [PATCH] Rename numa.h to numa_snort.h
+
+Fixes https://github.com/snort3/snort3/issues/368
+
+and a build error seen with gcc 15.1.0 by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/build-end.log
+
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
+ In member function 'virtual int NumaWrapper::available()':
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:50:16:
+ error: 'numa_available' was not declared in this scope; did you mean 'available'?
+   50 |         return numa_available();
+
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
+ In member function 'virtual int NumaWrapper::max_node()':
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:54:16:
+ error: 'numa_max_node' was not declared in this scope; did you mean 'max_node'?
+   54 |         return numa_max_node();
+
+Upstream: https://github.com/snort3/snort3/pull/479
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/CMakeLists.txt           | 2 +-
+ src/main/numa.cc                  | 2 +-
+ src/main/{numa.h => numa_snort.h} | 0
+ src/main/thread_config.h          | 2 +-
+ 4 files changed, 3 insertions(+), 3 deletions(-)
+ rename src/main/{numa.h => numa_snort.h} (100%)
+
+diff --git a/src/main/CMakeLists.txt b/src/main/CMakeLists.txt
+index 117612b94..e4e816d15 100644
+--- a/src/main/CMakeLists.txt
++++ b/src/main/CMakeLists.txt
+@@ -23,7 +23,7 @@ endif ( ENABLE_SHELL )
+ add_subdirectory(test)
+ 
+ if ( HAVE_NUMA )
+-    set ( NUMA_SOURCES numa.h numa.cc)
++    set ( NUMA_SOURCES numa_snort.h numa.cc)
+ endif( HAVE_NUMA )
+ 
+ add_library (main OBJECT
+diff --git a/src/main/numa.cc b/src/main/numa.cc
+index 259f776b7..5cb23e26b 100644
+--- a/src/main/numa.cc
++++ b/src/main/numa.cc
+@@ -17,7 +17,7 @@
+ //--------------------------------------------------------------------------
+ // numa.cc author Denys Zikratyi <dzikraty@cisco.com>
+ 
+-#include "numa.h"
++#include "numa_snort.h"
+ 
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
+diff --git a/src/main/numa.h b/src/main/numa_snort.h
+similarity index 100%
+rename from src/main/numa.h
+rename to src/main/numa_snort.h
+diff --git a/src/main/thread_config.h b/src/main/thread_config.h
+index 93bfe63d2..8134da8bf 100644
+--- a/src/main/thread_config.h
++++ b/src/main/thread_config.h
+@@ -26,7 +26,7 @@
+ #include "main/thread.h"
+ 
+ #ifdef HAVE_NUMA
+-#include "numa.h"
++#include "numa_snort.h"
+ #endif
+ 
+ struct CpuSet;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
