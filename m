Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903E7CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 557BF6120D;
	Fri, 16 Oct 2026 13:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id hVcTAO7u5IFg; Fri, 16 Oct 2026 13:12:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A5706124C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156351;
	b=MGFXypwGxcF/eEI+V2ZuyDn2gPJvd9ZTvluP15OFIi2BOX4LB34loafi5KxZab2w6JvA
	 zhSLaUkhIuVhbSt7rqoUbQYhhEiGO+lCJ5CfVA5N7nOZKy9JZT+4IBzfzQ1/Aa1MZfTwO
	 sqUhnI2O7dQmhPHJXSkDJ94xWBDw/IHg6aImUtLUOw/yCBgYfcO0rCYTVi+23vgpoPlKQ
	 D7JSdUxtPWWSOmQgOvsAKlIhMmGTy8dhO2uXMyRghSO9SsLUoBDIVg7ks3Huxp2a3r9tp
	 gElSXBYPpIO5tCoDrg/FqI9VyTmTsR5pYstzlgE5LFs9bKhAesqa82ozxjQrp2uypLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156351;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jVL2wNqEkOVvUmy9HwCGP0/d8VJ1TahnCQaxh94Al/4=;
	b=TXZRAeZp6q0CRYpw+i3iSJhdj9r1zd/ISPHdPxRd0pwJdTDjITCWaOJ3WZjMpOUGIzsp
	 dCpKR7WIJ2Kkl4i/D86qCIwa8BzNbNVWGA38K3RxaZfYDfl/6vBZC+7cDp4o8+paGRrmQ
	 9tB7LtVqgOXeMu1z8rjrzkj26i2nMr21EGHaZW1olPYHw+Gnn2VD9mMGV7pBbmRY2lHQi
	 2k4X+xC0d+vUVUAK/fMKilHXgKiMHIz7RjMKNF8C+jjQhXAxs+Mbj2tr+yQ5h0f+dqR0/
	 xcrrs2O7hYpQj7GnH6wdYBeWux103a0bkdDUUd80Wf/Oy502IAIILCi50/5n6Sa5g8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156351;
	bh=jVL2wNqEkOVvUmy9HwCGP0/d8VJ1TahnCQaxh94Al/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FPLxdpzEWfAvKwNRhsdX67XuvsmkDpIBolfbH6kFoYU0OFGIgeRcY8N73/8vaJC41
	 d7VuCeXCx4xmJKwp2X60QwT5GHBfU3QRZPGii1XD2ETiRLC9dUhwGhU0hPv3zy6Uc8
	 dQzswqmzAfCB7Bl6ZffGpcUQ7/ucaEl9ZxA+WvhsCkHgk4VArC8jjvm3gp2HN8f6kv
	 KgfDQ5zbWeNK1s+B3v1JlKGDEp/ByzzO/Hn5OVynxrFABYtOst9i1BSdnavZtA+/28
	 +ocCVLyAQYtjE8LUY8QhNW+IkcCUEgRwsp81abEY88pgxW3+Qp8c0LdlO/RS+o1P0J
	 SOEwJ7DB1ratw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5706124C;
	Fri, 16 Oct 2026 13:12:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 811F8920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7258460B36
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RN170evAyH2K for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9880260F24
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=c8QvSPuvUTt0ynUWnNH4/L0lY+OmMc68qQS+5mezwCam4o95eQDxLQqUKmvK0TamVzWw
 RBF1hUeKgcCBmRmOxw8RrhHkuIPtk4MFP2vujvvryoZzBkXr7Ix+mrHvNmTq2Kd3b9Gs7
 5e3UrvOdfRiExf9gHZFOSxx8Izsbn3lTQM6zDkbUtrhQi9qechUs0znkuT5u5Q0p8MX8X
 LOGpgJupZkdx2jDaUdGDxghtjaRt/uW214qd2qXzvFnsa/mKgoBdBdAhYezVUL18r0Xj8
 XxuDcgTYnATYxZGeKfGIxie2QKK5ZfL1u7lAgL7l+9FRctWGJJI3284Kawv1EktNcJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Df5+V8UJjmfSiybzp12TM/sD0kIq4rceVHCwbOPxwwo=;
 b=YGPw/9egHLjW2PGn+4pC04gw31f2dNoWC5FRrbSeH/1IhGxx04eIxyDRyzhiPaPE1XXS
 ThUGq6aLiP9HuM0C+VrrEgzYA5BIUaVLCyh6Dx6ycwiSYh2X4w4o+TOUTG3fQz/xUC/Eu
 pm0UlGckwdSWeFrINPIylCJTCeTVTDjlzgI+HEFYlUWzgbDzOqbakcDQ1SL36bnAIpr1n
 9028nCbg5BjdgOYizavZcwQLOUYrKR7TL8ENwcKX+1wr8FQIYNWGB82zoazZyyadMvfC4
 Axk+xJE/lwk/mp+Y5Jso2v/9XPBtcb5oIS+yZbY4Nta3H4x9F6Rc7dd2PQBfJWcntPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9880260F24
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88F00960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:16 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: eca7314d342e0636504e807abb9d489872e35f8f
X-Git-Newrev: 33ea536021e6b8a57569af46e46eeed838f66572
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.88F00960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/snort3: fix build
 error with numa support
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8991688925996522328=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8991688925996522328==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33ea536021e6b8a57569af46e46eeed838f66572
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 4fab16d9c25ed5869073e17051f1c1ef8cb028e4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============8991688925996522328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8991688925996522328==--
