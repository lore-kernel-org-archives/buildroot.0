Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B06EC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E81605E5;
	Wed, 16 Sep 2026 19:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Vi-JUl9sTvx; Wed, 16 Sep 2026 19:10:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 41BB560619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585813;
	b=ZwJQx/XQLd6uJZYi2Yfew54p9zSMTBGF4qW1DqZiDPVjk3jc+7DHK3pk97aTswh5qvnm
	 Fo/LIgjQE6M0mPQmIfbG2iOLfTJP4r+68rwaFs1D2BZaVd8v24FGoQuBAD5yYU5DjnqxL
	 GYlTQDNS27TiREPasOvXd3/AXH3eLn2/a2LihFKl+niEJ9uWyYIsxWrJg+qn1RgoaddCx
	 6sCzlxjBD1NIRPSzobSSjPKA1vv9jIkop2RT8RFGY3D7ah3LVc04rVEox3FDAAtjoFvTe
	 ai9w83AMKJkPo8Wu2SUOR4pRlflezXLITW0Ss7PjlqobP5ArG9KDj4JDNmtuf1yxBhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PqYRkMKtaPnyu4M16IFzYYFeQvjZa+41e5LiUoKweeU=;
	b=cSu1XFeJAKoiL6FQ//yLvGSdVCh6JWasFBz2UVIhyxNplUr6Mo2mVEAxYpCw8XjlkuCM
	 VLVOFxdEb7uvWVCRIqfn7dF+k5qnDj53ciYumcq/mXTQRETT4loOySD1z7uTabs8snQ2P
	 yAcr5CgObUQuxw5zzPYVfzPh7QkIqYW3WNdxD23cJ3DMqjqfqgzmPVWdFHbQPZ+7BqY/C
	 bJrvTJF3XV3z1nEz+0b5QRuL0KQgE62ma8vZ1t/B2sfQl70RUyr4CB1P46ntH9T7uaOte
	 c6WzdLRC036cFXoX243iecWp3LI0P52YA8f4s6O81H7DTF8HYzsdGr+LRUkrtliuQVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585813;
	bh=PqYRkMKtaPnyu4M16IFzYYFeQvjZa+41e5LiUoKweeU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rlE85R5jXtnagNmoiBisltFPCBZJMca5t8szuMMkS9I6UyVCIQBYsDIugK95lYydD
	 li85TkQTW6cKByEw8KQ3W9bZdY+zf1xrhHNvVA943k7WhoMRiDceOtW3GZ41gIiHTU
	 0EMTgy6YCd2tmHsVrM6wjMnaYti6AsRCJTlwgTgMe8fhcCS87T+VlLSNuV9JfJZm6t
	 O0B0o4kqan8ql75Ez0gFDqGdg4D+aJjoTdu/X25kzfcPP8G8n4AeiGUI5u6ysgSG7J
	 5u/5pRK0MhUfZRPJM7AEG4srHOCJQ+GERA8/cC5xGJ7c8gWPEkUMGJio2DMldxfMRb
	 eVao8LF4E6kkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41BB560619;
	Wed, 16 Sep 2026 19:10:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55EBF977
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C58F8085C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzDNpgdxJmKe for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81C7C808AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585809;
 b=n3jwThiUmAICfT7TuaNMl9HIys17rGBz9n6OfBAiJNoq9UmdR0U1W4kjHs/cgmmYFOEB
 7ZexB2Ul/9CfwznYb9IJjAQwjfLN+xZNTqEZbcgBcIqMzMfkTm62X2quSC5dK5rm20t38
 w8h5+mPiDgi4LlkqZQG3jY7i+FmLyRTUsCm/mxGV3dlo3quIGteGmQncYCYultunvJeoW
 7QkZHjeFc1n5qrAlEZ/B6LrmUXLZzRLKFTaakRHcjOp57lXvTLnpQUaEK2YuA8YT723C0
 El3lcD16K81Bvh5Gq5+0tnUQwMQNRGUd/Bf4BZvZtZUE2ipZ2sRwRwpS/seAaytjeGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585809;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ltW3Mq3UhY2BkwvDpuGf20DYlcEF+AxGhAbz/KwHH5c=;
 b=QUTq5W3pv4oEDER9JsZuLBBy+TWVaLAf669Y6UFBwY034P8lYYqwAxspAUcD9SrZ94x7
 v0/QUZdxcN4l6ENUqS8ao0j1T/3Bps9SBrofLsSoukiWZiHu6mxB3vt31gPUUMPzPheHS
 /rSFL8BOv3aXrWN6rbYcKXl5wfvoRtHRNqGE5asVAFzclfQUIAnc+HIzRqYoyOrIwlsOj
 JLM7Kd5lrp5B3Pyw5zvpTAk4DrA6YvlDjFynkt03BZxqSCVh/tHykh765bNr2QNuQmz48
 2EkfjO8O7kQ+MqtkdvqXQYz6fUseVfw7iFUcSqPqR8vBq3HQPldN4SqUjcKQ0aCf5Lg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81C7C808AF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 093FF9685C; Wed, 16 Sep 2026 19:09:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:05:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2bd6148c62dbc4068ea5d53c6e95ffdf6352f0c
X-Git-Newrev: 69863b92c9cedbf7a8aa490ccb0596d3dce1bd53
X-Patchwork-Hint: ignore
Message-Id: <20260916190903.093FF9685C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: bump version to
 2.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69863b92c9cedbf7a8aa490ccb0596d3dce1bd53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.lttng.org/?p=lttng-modules.git;a=blob_plain;f=ChangeLog;hb=53eb8c30aa8a8afaf7bc46a9959a94bd0508d18e

Fixes build errors with newer kernels.

Please note that the previous 2.14 branch does not support kernel
versions >= 7.2:
https://git.lttng.org/?p=lttng-modules.git;a=commitdiff;h=7db42e0238d347eff969c1b1cf66fb5320da1bab

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 3cf11dae32..3c12217d50 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.14.3.tar.bz2.sha256
-sha256  35a1875ad96e8b4b6aa8729f59af350bfc788ba65c6856deaa84d33acc0f28c2  lttng-modules-2.14.3.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.16.0.tar.bz2.sha256
+sha256  854600604cdaaa66fc1711e564aff37d8dbba9bd1d3aaa94f12a561da845deb9  lttng-modules-2.16.0.tar.bz2
 
 # Hash for license files
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index b51fb5dd96..d4cdafe568 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.14.3
+LTTNG_MODULES_VERSION = 2.16.0
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
