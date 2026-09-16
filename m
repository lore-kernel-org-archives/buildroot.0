Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DA2C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F362960E31;
	Fri, 18 Sep 2026 13:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIg5iruIbq1O; Fri, 18 Sep 2026 13:07:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7062660E24
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736820;
	b=iY1lij2UDYqfP8Ey6+befeXMPWBHpLQC2ivEPozP0GUHBMRMwYzKHMsZm+IACtB/iE55
	 SQolYsOJMJCzOisvSARHmVEYM1hXXqOBr2dWo9LCz8WPev5oH+im7/rZHD3c2R8jl8b34
	 B7l6OJ+VgpHwVRgNmZzFj7nrBzOutF/6ZKw+wo5CFe0flJZMJKgNwGUFv0ykHNZZqapdt
	 uxOEiyTQdw6xS6OpTzV2y3dYMFLqyNefMY+v6C3aMjlfcbfsdFQ/PRnWfMOkwCq6DOfcj
	 VfIRTKPPi01N8xTIfj+RDd3puYhsq280/RRX3tBTChT98nczuqvEMqSWnwD+YEw9J9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tf95JT3g5C1dwAyEA3EmIQbl8Npr6UMXGzklwYGhpdk=;
	b=FmW41jfvoOF7qLeMpCNas3qdwS/EM6Z63oKF1LDIkokYbw9j6eMZ3cHB1ae6FMAtN9vg
	 NRbMOoq7nDSI3/mKiyrP7Nmy9GeQCUiEPJ74ePczb7C8YaczQf8fkO5Q0CwT1ci71nd+K
	 3nn1uYBUPH0LPlZzqVL6dg8v8xkQE6YEQTsD0UATqUdsa4Lx5qjMCwzxr9zkZTnaOw2YE
	 nY9Fflj+dy/4KIswo0AvujeEAv9J3F83h3508z3hxJOa/vSHodRRTGRunms5bafF5Wu/1
	 oBkXp76HUrbKFCpOa5X0OngVMXhcXP5QvJoh/qGAQl6+SlkviFFoG0z13zol2tvnRhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736820;
	bh=Tf95JT3g5C1dwAyEA3EmIQbl8Npr6UMXGzklwYGhpdk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=frp2LhPqLFq3SHcngQU8cjCGTQ/cwtV7cTWF+T+uPifScNjs5P4MykQELcO0LDEtB
	 gW9HMtfb6Dq9lsTzryBtEuhTUhgwEBsm10cIFJUziK1cPC8obw9Vkt1IMgorbWDaxj
	 bKsvSADzXYkqsjt0WsIsOucdWUTjyBaMwy9pS16JbUCcHGO6z5c/rJQF6EN2PyZ8+f
	 1wDsvgD8eDwv9mD59AaUnv1Uo4Un2+iqQ5ML9eCvBFww1Q5/zWaJbgjgS/XaadzdfO
	 AHrxYSwqQBMqyWYUAajk87bNvCrWanwskkEwv2GSfgxrcLSxV9nM240QW7JlAhsJ9Q
	 PRRy4XNT/Ncxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7062660E24;
	Fri, 18 Sep 2026 13:07:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86F33224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D1C040BFC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFdxPcDu1UrQ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9F3D640B9E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736811;
 b=b7VgLxk6jHdW6wV8ciiffXeoN4oId0TMPT1jM2gO03rmlZl77Zc9JegNHlgX/32CPLFS
 WZUi+AsYD3wuXkt7ji74SU43Eh4gRIJt/JptezAxGX5MhI46J0FmFN2wn1KA1R4j3z2b+
 hV3qaUv2+aDo+Gfy2S5vszG3kD80y8Vkfxn2bk58MLqOcpcflhu9jTIA+DKRvxU9FM5O/
 xU4WKacIg1OEcLYo/goLEmdqVETKuf6gVGBXCS4+oXObsN+tXRdYZVQs+SaaEFehOaXsh
 r3/L9y1fQBN34dFQKbBTMz1XqMa0/DoFlcG/WiTaalxeE1Y/LlWhLPxBuebcSqI4P0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736811;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=stEUEKmF8sFPEdtNBrvNwsbDV8SI2mNobeRIBEzrwSI=;
 b=UsqaaqKt5bcoXrAhLaFYPu0K1rKAzqmxFGq91XsjJtWKLCekGvZEBZE8JD8nPkAXTk7o
 o/Uv/n2ilC5lWxMiH4H1p8r0RU1zK507cPPXZXdSlaYo0PlPrrcTZ2AgsEkicFM+ExfQB
 fugVxVhsBs0j9V/rCysxsaVundeL3SPu+ldFuOsUi7oP8lSYKjE6nWXo42XH+p+lXTN6K
 ChqYaxEkst+BVhagErVpa6T8nLpWcUTTwi2PvT2Zt4lWldclW1a3mhCParLIndo0/a4WK
 tWnXwssUIhE+rWhGbK8EQdEmxd2dnxrFVFXF9W8Ir+awtaEnaa0j0uk0Y4H2Jd1ercQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F3D640B9E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B72297698; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:22:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 70d29d2b0b2118a515b54c4a6b1d5f83cec80412
X-Git-Newrev: 151555d771b9ecebee9570daf81639b80162fb7e
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.4B72297698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pcre2: security
 bump to version 10.48
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/151555d771b9ecebee9570daf81639b80162fb7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.48

Fixes the following security issues:

(Security fix for specific API usage, GHSA-2p8c-ff85-vh9x)
 If pcre2_jit_compile() is called with options for some match modes, and
 then pcre2_match() is used to perform a match for a different match
 mode, an out-of-bounds read can occur if the match is attempted against
 invalid UTF input.

(Security fix for pattern conversion, GHSA-q8g2-wprr-34m9)
 If pcre2_convert() is called on untrusted input on platforms with
 32-bit size_t, an out-of-bounds heap write can occur.

(Security fix, GHSA-3r4p-g7gg-ppmf) Fixed an out-of-bounds write in DFA
 matching when using a heap limit; also fixed possible integer overflows
 which could cause under-allocation of the workspace.

(Security fix, GHSA-fmgr-6ggq-9859) Added bounds checks for several
 integer overflows while compiling patterns on 32-bit CPUs, which could
 cause under-allocation followed by out-of-bounds writes.

(Security fix, GHSA-9qww-pwc4-77qq) Applied lower buffer bound to
 prevent two out-of-bounds reads while scanning backwards through
 invalid UTF data with PCRE2_MATCH_INVALID_UTF.

(Security fix for specific API usage, #937) Fixed a leak and later
 invalid free when calling the fast-path pcre2_jit_match() function with
 a match data object previously used with pcre2_match() and
 PCRE2_COPY_MATCHED_SUBJECT.

(Low-severity security fix, GHSA-q7rw-r7qq-2hx6) Fixed exposure of two
 uninitialised bytes from malloc() via pcre2_serialize_encode().

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 664db5d62c952f69f5cefe91a88ba9f107cd0b5b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 17f15c0fdc..90991322a2 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
-sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
+# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
+sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index f2b5608150..ea841f482e 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.47
+PCRE2_VERSION = 10.48
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
