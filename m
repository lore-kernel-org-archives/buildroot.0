Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A483ECCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AF5061097;
	Fri, 16 Oct 2026 13:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUTAcTNSBpPS; Fri, 16 Oct 2026 13:11:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C0D6610B7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156282;
	b=FiqANPjuU+l5J38fCuN3PkymsP5O4vTcJV/yP36bX0YZmj5nVwO/4BVM211hUY6YGKRD
	 5nrAYp9iKW6TKGQb5BYENv9mCWwJrZ4i11bDc3b7FEWXd7aPbh6kwFLlfsKG1cx9dB+RH
	 8JeVsNp39vvbDIA/t/JCxTT+H0/9vbSbXQooE3+LoVmpZCnUE+vFsrniv+/xsaTo+W51j
	 3nzcj81f2wMoW7V4RSfU9jDsW6ChlZLcoiZpvdMGDlvswd8xqV5HqpmagCYVvH76XFLak
	 OfXUpDO8KjOXunTC1lQr6SDho8KglN+mXy/pa5TKeVzmkPPWAtnzUUFI/r2+9Yz6toA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RDFMYFHbqyFhk5Db3hz25R69TQ2BVaO8GT+ZEHNpeso=;
	b=d6z4tQMfMIvhAUv9V8LOcn+XvYz25+x1n8O5ki3oIhFceqVnY0HYJGe/H8EJYFmiULHs
	 OM4ufU/Ec35MgXHQCQuXn+3glS7tJwG9ZN8rZJ0DiY8q1WiSKvCshqBD+p2Dqr3vKvnYg
	 lBXd9nXLdGK6NFloZ2TR5WS7HVAccvMM2nC1KpQGyR9KuG3RdyHVuY1BA36u7Wj25rLqV
	 TlvaojeaH0i3Ne5ABeKG/07o7zDQJMt06fVPDs/SRo7XFjxNbLGuoVlefrNXPkjzJVQ/T
	 6g2D0SGBogO8r5zsc8KDEU9koyZIhEY44JCHFjwzr+SzKeRVbFKfXvJPVaD77aehZHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156282;
	bh=RDFMYFHbqyFhk5Db3hz25R69TQ2BVaO8GT+ZEHNpeso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z1/+T0DciKq0NllK0X8svkMaw2EbAJ9Qh8OVpSR2Cnk732cz10HpTWvZHpvshDpEW
	 T/CLDy8+cL+y/3vI+cjmlkvoa6Z2UVjuANxeOoeoehKwC4M7lpwF0uAEwsIs6AR0aJ
	 uATNqWqFyKuBaXAg1vZmOx+EycsRsZL0WIg6xp6Rj9rnG+TCB+aWOh0at2FRHWF/Cp
	 lnNYXBqLoKg/iRn15WNmZ78zXQ1xMLmcyoFitL2aKskAt2uItSKqFU8LA05//DfEHa
	 VX+Gxm6wpzYK9cyz5ar6mOqgOqiKgL/X1IfAEbEYex1H3OOvb8vNmt1xs/GvoW7QoD
	 iGfpTL+SHgQeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0D6610B7;
	Fri, 16 Oct 2026 13:11:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE0D1C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39EC240474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w71mvELf7rmG for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E23F40494
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=VC9dVpFIFqlo3dzegJkrSe+g/AMysx0R8lvHEWNVxs08pxEheZAQn1CX0G/kOzWKa1Bz
 PzORqnzTF8Qy+7CTvtNCh2Wx6YwQg0nzkBRxHMOcCZSbltPDBR/uBPjpT0z4FdagYHzkU
 cLy9dwXOxEpObPg+yrkwlpjoccFfC1F0qtui/IDTU7eMiWx4VP/z4ARgtkPLNrpllFFUV
 VdzaXDUo9gS2unVeVLGDeAijqtDX7HnEBGGXVeRhwCfI8Wocd7ZHq+hBwsefUTdLqQdu1
 G6eWw1MeDFnRbj96FXhZNYwrBI3HkPhoDmLq22WvmNgJxgDq+BRHlwOhY2gqd2+YBLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6+qElJ1oDCXKBM6pNoQ8CMpTKbOWMNaMKmS1DPTyzOE=;
 b=dznGbH6H43kyb4slVb/uFK/xNGsbGqwPWO8FJgYr4XzR3EBKS1giSYsitZZFuO2+FZGM
 c7GaoRvmxJLuy/aW5nE821vjkcR74zJ0csxfk0ZZ43ypPpt6bO9v5x+s+UNMcDXE8W/b2
 8b+H2cU0xopvo0fcwSH9tdGe06aR2wiRoFAgySn3gGGepbNCvjFLmIVMtyS5Hkhtfr81Q
 OvBqVJmqJkea/JMpUDoXJ/hQ/kmxswPvBgyHNEwVBDwmGxWCX5TlIi/hSudhltRIGD7q2
 MQhNcjQanJpsDgB68+7CnByAJIAE+BMcBgW7pSImOvOG7WTr5lPIZ80SBTambaEv/0A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E23F40494
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EC38960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:20:56 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 737f6f0222f8b8920dd51b5d2719373bc360ae58
X-Git-Newrev: 6d90c8f535cfa383a9f1cd1354f5d89d564be18b
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.0EC38960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/inadyn: fix
 mbedtls support
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
Content-Type: multipart/mixed; boundary="===============1105980134446733109=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1105980134446733109==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d90c8f535cfa383a9f1cd1354f5d89d564be18b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since commit 6bab22ca41 ("package/inadyn: bump to v2.10.0"), the
mbedtls condition is written as "$BR2_PACKAGE_MBEDTLS", which make
expands as the variable $B followed by "R2_PACKAGE_MBEDTLS", so the
condition is never true. Without OpenSSL and GnuTLS, inadyn was built
with --disable-ssl even when mbedtls was enabled.

In addition, inadyn uses GnuTLS by default and needs --enable-mbedtls
to use mbedtls, which was never passed.

Fix the condition and pass --enable-mbedtls.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 23d71bfd96a32a7a1282ca474861d5e5d86a8d41)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/inadyn/inadyn.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index a8891debb3..68a28eabfa 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -15,7 +15,8 @@ INADYN_CONF_OPTS += --enable-openssl
 INADYN_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 INADYN_DEPENDENCIES += gnutls
-else ifeq ($BR2_PACKAGE_MBEDTLS, y)
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+INADYN_CONF_OPTS += --enable-mbedtls
 INADYN_DEPENDENCIES += mbedtls
 else
 INADYN_CONF_OPTS += --disable-ssl

--===============1105980134446733109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1105980134446733109==--
