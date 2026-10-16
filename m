Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188E3CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB5D160B1F;
	Fri, 16 Oct 2026 13:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9p0q8KuRMLVG; Fri, 16 Oct 2026 13:08:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 082CE60AD7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156116;
	b=EcfRRrs87VEuur/VQ3FjCDAn5H9VYLvEoj2dEcb02/XPfl3205fe7ZBCohAsVYig/vj9
	 1X70x9EG/YaaUQTy5Jai5clRiimfhsOuQTTpz2MAgg3f2j2RooTfQo6+PHccFAlS0hUXo
	 8ijTzfINVwQKmrY8eAdy+P4ixTu63qbWdUDNjLbCGvzmxmzfiCntJC1Vo95ekgUb82aGP
	 yo5977+fcV/RQNTQMIHNa17YqhXys4tizGlTntal+MO2MtU22yttaDtn5cEge6Zm5LqJa
	 fBdCGd/ZYgPdZAZ3+A0EcG6mKElRra/kdHlFeUdALqBjW35KwyuZYr3jztAtD50fXng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+UpwvxLrsju0CetKHeJFR9E1lZbrXSczbEU84i009FM=;
	b=cOgfRAYV3eyUmbtSNT7dHZ5ESdHkao6WMo8C89GfprBirnav48tZcWgng5O0faQmYS3c
	 gaZMya4G2rDDjAsu/CN0QJCeUMLRM9ooaoVtx3zaE4dugsc7UpmLWQAbqUkVN+3TST0BO
	 9HWdZa+Sg2F45cKl6DCFiT9LRfWhHcKRUTXe3FA625HzwdWhszJThfv2xe0Ho1MnWl3L+
	 NXkqSaxD8dPWIavpJOyEUyjE7mo9y7qi768Xacb3pFWW4WZ6rLB0uqoAnHeyHJ670o8kY
	 Oqp7FJIKdGg4uWWxxI9C5Chch9ZV3hy9jjD/V+Z2dawvF10y1ZYLLYbgrHrFRMIGulw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156116;
	bh=+UpwvxLrsju0CetKHeJFR9E1lZbrXSczbEU84i009FM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hJOPgQb/iRZYmR8FEoyijErlVtmLMULsftacEeT1rzOS2ffqcXXlAPnPGqiO/S8Ft
	 chzgOWxlIE7N/0FeYxatoLghBtcpBdooVs+DU8jtw43nOFa0U8D2h1VMn5+jclO6Fw
	 0tAq3F6dIYoMJC2aybRAOS2CBmyUlcgV49/B+RYwhmbKdBae40kgMm1LqgAb+9s5Iq
	 3PBBCvHxVy3VzL5DmnEfPN1GGhvZGErlumgs4Q8hYPBsz0tuwrVF4HWVCKAXoHAmE6
	 1+w1DWiMuuovDcjZwZQ76/bfEJK+qlr2tp0gQ5fmCGn9MnG+DPih0ttWGlT+X1trPH
	 61yoYuoeWpv/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082CE60AD7;
	Fri, 16 Oct 2026 13:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFAC5255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1DBF40A0B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzUNaDRvMKh8 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA408409F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=mSYYBEMeuIBzZhAcoEqPq4CDZT10SoZ3WLcS6narfueyqh5cxTaETmuizo7GZVDE6Drk
 BxzzsqC7J356s4I47iKtaxlp1cYiRd8zENOqa73+ic4jen9i5lVUP7NvoR0FA3XdZ8r5H
 8V/73ENg5yOiM9FbsM2MdtwRy6QUFHsx4GwfVvToUai9rNisP/Rs/TB84m7LTF6rjnsxU
 C65Kq/HxksQyFhL7+0mhbS+GOKA75hbqwfnKO6gQsOWe8kq2S4DGjOp3XgdUNTyyLjoba
 VfMnRXrw6+kN4JYwUO5fMzcAwGYnSj3a7+1KvYvESwGxamLdvPU0o/o1rd70YAprE4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rnrdk0RJ7hSVgcFnhyb8wNlvVBrnkx1FGolYRjEXn5A=;
 b=S1JOnAzlFT+I0i1uqgdswIkpAKfnwrIlulfMxI7YarZ/SpyZBV82N9FhAeIs+ck4rD44
 MWzsh2vytRPkGj/DI2rbCeUKRPqQcNkbwOh9egORKUn5+ez/JlqiM58aUe61JxCK/PtmM
 pYSZK1ppyok64jsjPxoVACKFsuZP+Vf8Ecwgq1OnAwj9UOtfTcjSHUsHctrm/LzlYmcPC
 ERFSJSwZ1AYJM7ibrVfrmv81ZiXT4O9OEU99SzEIj+vzhhyqUYvp8Zy+ZxHK/Wddoci3O
 BXB43TbvHEyNnu4D5SVLOxt1tBi/DZA1CLybNLBugzeKx6QcS4FDcWVqOjTJ2pN9O2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA408409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA8CE960D9; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5f3438b20e6fd369781beccb78e4346890ae2503
X-Git-Newrev: 21a76ca9fca296e9ec712b24ded4fbd30dbb1b74
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.DA8CE960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/inadyn: fix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1281017466160391270=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1281017466160391270==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21a76ca9fca296e9ec712b24ded4fbd30dbb1b74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index fa2eedc1f3..e02bc00c8c 100644
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

--===============1281017466160391270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1281017466160391270==--
