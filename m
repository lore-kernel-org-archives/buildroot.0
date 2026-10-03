Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE73CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B276A813CE;
	Sat,  3 Oct 2026 13:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvXZjqwS0KTB; Sat,  3 Oct 2026 13:28:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1B3848133D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791034100;
	b=s68J18BakdZ+H3I+L6kLTVYAfLZ3lNVENLKoAvv5x3oyC0Rq0X/k/L4xIaGv/lYdCdRA
	 AXx3xw8uJnYG7Mx+XuE1TqUVCN5VqgEnKxr89OP0AwWFCIHFQzJOm0VS/lxcTn3xrcqBJ
	 YrGBHyQ/caFEwY+gjYeJxCfLPfGCLE6dyZK/ImIksbV+7FXhSeE7XHJToaSuJybPey4Kp
	 pRTf2uG6lFu2fqvBMQTSW8EU8+9S+hNqO8dzZau2y2wGrb8hD9rMBdh4uxYQVEvGQNGhZ
	 ySZji71Manvng4aidlfzmECraNGcpGA1wR4kiFsjlzH2OJ+wJnFLaWIa7xRPi/HjxeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791034100;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MfYwWvar+uyCCMvLveUBX17qTAPryRzPtK8LqgMluXo=;
	b=AxlOJ9q5NDx2ppNUWKmDwC0AqwVaipyePr61m6jCBI82gFYwmv+tnueewuiA7Oh3gxye
	 0R2rxFE38uQfv/degEhHrA970ol9JyIayBDjlZT/ZEMk70uLReTzO76wjPnscz52lwqOv
	 wFYGkzFAxCTLLk1h8cktuq8uBV3OO6w0Nry3DXGKDQN3N7yFCJmxVRWK7FqDLr57GrKoW
	 UqIKO2IsgLdPjMw1PyfmJMiMrVBz5/R6fc+fKrdCSg5poYj2ig6VA8i43ZecC23ckqSaM
	 QCddd2u0YxHyxSL5f4u7T5e5QpUtLLyG9oxF6v8LsYSXfgzfmWJfDsezPC+A11aepyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791034100;
	bh=MfYwWvar+uyCCMvLveUBX17qTAPryRzPtK8LqgMluXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sK/eQKaUf2XOZ/5B3dTxGWKg6S+UZZOMM3IN+9bzBrlFlNIBt7zdPDJkfMdJOoUO4
	 G2Lt+/As+AwnZfMzchiH5Bh3TKJOojQ6QMrg/MnzgnAEUdgW8pv1WPZ1rpHziHqLqY
	 lAja3fMAduooXCzWDEYKI6xGoc8LtIBNsHiu+gs+pVxbtan3ntcx7406DvvZxbiDe8
	 kahlSB0ANU/TyvO2jneBsP7ElTakkiONns24AQRqFHQWRWvV0yYlxqzEIPyXZ95x1E
	 lfwpkTWmtz7EeJyjgM4bJnKDCBK/K/2Cmxp+QAcKf6LLsph2Xm6wPbUrtfBxCRc/85
	 Q+TEo7IxkE7vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3848133D;
	Sat,  3 Oct 2026 13:28:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62331179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F9F48133D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTacSiIuYVH5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:28:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A5AAE81330
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791034097;
 b=cQcSI/4nISmb9eD2F9ZVQFhXU210xSJHq3B210I9fP6vlv01zgddfT/8nMKz4ryqPRz+
 RmgmQ2K68u4lP2hvaPD7DcnLlGsF1OvD+c5nUvZ5g6rSIVhVZL0PlofnxKTN7tDqZPosF
 5tZhMnwT2UCiYe5zAIP3/srYVrJ9o/FPL2OWV7UgM8utSsC77NBxoAWOgJ30NBBNa5K98
 /0hZ0RuX41Q+vBTe2gezdgJtBcP5Ch4UCvDqus90aypVJ4CzydYMw3Bylpeyys9HEcp7R
 DoqHs9Tvyf5vVjfR0EfN9cIbZgnEyBnqXQtspuY6ouDByzRO+lhTZR8468gSKCT18hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791034097;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZU2382QUwr8fgGAuUHesgusOxvwjVQzZgf0FdO5nfCw=;
 b=cNzW535F2c762ApegbCAGfxIDDYhbAEhS+O8DpFLqR5X42UINrdaht6JFtrczlhJLugX
 +x8TcUL7Guce6kQ4IPkSUFwtsq3a7dWvrOggExub6WsT66FKi8yzyRl/GX76UJL/bUdci
 Ks4zxi8FcWgrprSXVg9ddRwnN653zHz0QiXGFxlnuon/RYX+MlWZ0dQdFyLC4/i0W3OrA
 LDQUBSQ4HuJ+gYJWhud5OlXh18c5y1KGsNo623TybUxK6X05b7ByCCMgH/OQqqnJIoaYQ
 4qkn0wC/W5Gl4UkhbtG/XRn/pPY6+OF+LwKsvcgQPsAdVkF/U80f4HGj2vly3M8w9og==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5AAE81330
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5E7E8A309; Sat,  3 Oct 2026 13:27:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:19:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a01c8eba9935dfc8f487bed50b5b695aca6077f
X-Git-Newrev: 4a6801a365f947d3ff5c9da7c7a17926f9d0c761
X-Patchwork-Hint: ignore
Message-Id: <20261003132702.E5E7E8A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/resiprocate: security bump version
 to 1.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a6801a365f947d3ff5c9da7c7a17926f9d0c761
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/resiprocate/resiprocate/releases/tag/resiprocate-1.14.0

Fixes the following security problems:

Use CSPRNG for security-sensitive SIP/STUN/TURN tokens (CWE-338)
    Use crypto RNG when generating certificates and nonce
    Use crypto RNG to generate various IDs that are supposed to be unique
    Improve transaction ID uniqueness
Authenticate STUN Binding responses (CWE-345)
Add Digest Authentication Support for SHA256 and SHA512/256 algorithms
Add new DigestStream class, capable of MD5, SHA1, SHA256, SHA512 and SHA512/256 hash algorithms
TLS handshake fixes
    Avoid using undefined client verification mode in TLS connection
    Disable TLS compression by default
    Correct TLS logging
Allow applications to get TLS connection/handshake errors
Propagate SSL Certificate Validation errors to ConnectionTerminated event/message
Cleanup SecurityAttributes
WinSecurity: expand constructors to allow setting of defaultPrivateKeyPassPhrase and DHParamsFilename
WinSecurity: perform normal preload process so that domain certificates can be loaded

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/resiprocate/resiprocate.hash | 2 +-
 package/resiprocate/resiprocate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 93a7131141..be09ac4624 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  f132e4d0fcae0c155f91e5dad608a9985e199e4e3c09b6029a70b1b3b6d0b156  resiprocate-1.14.0.tar.gz
 sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index ab8299302a..4af7bb7e76 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_VERSION = 1.14.0
 RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
