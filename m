Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28946CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 07:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1B560A9D;
	Fri, 16 Oct 2026 07:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fg3Fl87wCDuz; Fri, 16 Oct 2026 07:07:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2DDE60AC0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792134421;
	b=ZPCXswSVeXxx48kJ9lHCMiHs3Va7HZ6l6AOt0TX7I+yTfuj+vLh6obwu+CYFPf+oEbe4
	 YFYJOl1dMqaNb0BisKiWPvRy3giXwvaVHZRKU6FC5ux4HarH9aOulWZBoLaeZNYV37iu+
	 EH645YRexh5XJvspCyb2rO8/qoZMV3g0ZjEryfMfHNOEdAM4FpfZdqw8orOBdFU8o7m46
	 KITyb7bk8oMhhSJUfbcSkJmxTy7HZw5IbCeNQ/Grrcdm4CrCamsDoPb5H/xiskffAGOVQ
	 kddqhbw9pCmhBdYZilJFeMxGp8XSSHIYuqsurEEEQvnUXbaVeyZ1Dhx/YyEfQ7cAOyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792134421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F22Q+rAOf62Cwx55xOTDbiukJmmcC8g63dpzXzoSEDQ=;
	b=acZvuLAsw66cHc6AMDfcuKfBZUn/C1xDyQLFd+quTPpaIWUGD4J9nhJLvFYdBHpSFnnP
	 V8mK+AGJ/myg25EHIlg86b9YUTjgZXLlINud98bLMO4SNs00ipw4usVO2vmCIQmMIh09Z
	 Xt6jSXHMS60eSPYQdZeIr/cb+FUcKERIKUlmaoeDoAnsLM7HvP9Z7H0C0cBW7lfLgWPIS
	 hQzLLSKcJ+cX37J3UswTLJGZOmFc1x9zoRXMJC48SMfPx1tBFyRCVJp87nn4mr4+5v2nF
	 E3pjxP8q4C/bQB/Q5RsreuRu9LHnASqteW+7mwfeK85FmIRbniZPrVFwHFULjKU0enQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792134420;
	bh=F22Q+rAOf62Cwx55xOTDbiukJmmcC8g63dpzXzoSEDQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1YzsLtS/j3K82JIPAtlCgCZtAmYkx4qMhbqnfqg9OO6sMGfZpok0hhbd5edfTufV
	 8kotH0tUJeTkr3MrPyfcaiD3NeVgmlwCLdO9Ah/fq3juCmsCuAYsteVnb95iGpuzzy
	 46dsKimHqW9BzyAHxkAp3BPARbW11qli0fAYwjUI5ktKuxuXyD73rAqa3ystBVURio
	 clzk9L1ZxDqnNkX522UQ3bKOMQi6leeZxukxdCDgV/hsEW85oPM9MbKUN/jsivzbty
	 Wv2mlpQmiF6dRzMRxB25h3k/yjm6D5dyrK1IznTQYDqb3shrii7gfOGw+Z7tzk5wTk
	 I3mCmNvLGu3Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2DDE60AC0;
	Fri, 16 Oct 2026 07:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 232DA79D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14F9A60ACF
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNgCsNjcSGOf for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 07:06:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 64DBA60A9D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792134418;
 b=FpAEq8KRtbms2dmrjeQxURfKMYXEwX6561YjWdkqYBj3iF+nujnhsSD7WGsJXTaEcQ+w
 L30ZEfceHt0/NXPUFO2kBnGDiTj1kfQD/68Tv2zDbI3K+7bY+eeZ1flcztmbo9NfZS/ML
 yu3pbE+ROZcXCCsqwrzE4gOlaOy+VtWe8uK9Yf3mLX6Yy354/jc+ebXaaAYqmNI5CInbQ
 SH4Io/kjeQds00qLIKTL6HZeM9vB/ClzZNdtmWiNvS4TOk1TmzdvBK4RXY/iFsys8getb
 hzfgsv8Pa2qnK8Hzu1hZ68w8bgms4f6rcDoVcpCSEcHXJQGEUUCCtXfNrm+EJuLLBlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792134418;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WPkMbqoeNXYRo21Ec4hEd57yOO3UJXrqVxpv/8ofLbM=;
 b=ZWpPSeIordgkgL6ZT/SyIiqX1yaSrexoPg5jAX/4EMxf0gjanggggjk5Q0JoAyklgGWD
 elUBGKBhrt9tPbnRC1a7oWi7qQsPg7DiwlfciwWoeHax+PuhFtM19NFiIC5r2tIm1+tha
 ElF8JrjWalDtxrQ3qb8wiHr/U7kqae81ENCfLahj5S8lkLFSY4/leT6PMpOynGhirO8v8
 1Y6KrygCeTZQ67+Io+UbqjyX+iJenV2PGacDAU06eqVtc7i+ZqPQNdZK56dYtpoBqiPcW
 Aeb/Lkhv8oJqioV8D/TxKS5cuHPK5W1rsOJBWqzpVIgIsbR6vhiY+wUhCLJI3MeWNLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64DBA60A9D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:06:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62DD9960BB; Fri, 16 Oct 2026 07:05:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 09:06:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbdf7d35cd0a504afa0b8e26353f64be7a5236c2
X-Git-Newrev: fc7f3bc1fd5d4c564539c4f7796eb60a8ffef8df
X-Patchwork-Hint: ignore
Message-Id: <20261016070537.62DD9960BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc7f3bc1fd5d4c564539c4f7796eb60a8ffef8df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

--with-... arguments need two dashes.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448 ("package/libtpms: add host package")
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtpms/libtpms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 7bc69a50d6..0ece84ae04 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
 # Required because a plain Git clone is used:
 HOST_LIBTPMS_AUTORECONF = YES
 HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
-HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
