Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE727C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 21:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91E2F844C3;
	Thu, 30 Jan 2025 21:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48kxyI-43NqO; Thu, 30 Jan 2025 21:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D7AD846C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D7AD846C1;
	Thu, 30 Jan 2025 21:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E30212C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4408F4247F
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fS_vj7JDtpa for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 21:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAA4042482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA4042482
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAA4042482
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:02:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1B4185FFC0;
 Thu, 30 Jan 2025 22:01:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57396])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 30 Jan 2025 22:01:58 +0100
MIME-Version: 1.0
Date: Thu, 30 Jan 2025 22:01:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z5uCdWxT1daQ80gR@waldemar-brodkorb.de>
References: <Z5uCdWxT1daQ80gR@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <18f9bca3b6a9ce5d624aa90dcf3203e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738270920;
 bh=Y+kh7BuiSGrtBMOJ2fDm+3Eh0+LPteVfhf4ACEHSIlc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F8Q99aNlqnJjcU/MFxoAX8L1nxdTy5dSGLQNLRaKn7kSZ6e+BmqQqLoQjpJHP6nwM
 18TxfHbiJGLlbSpXV6jfZEHqZhupsHHKMtxeZJL972qvMd6zRUTSBH5sDtexxgTwSI
 rggF6xrCAHo/mH3qgI4TVbLWbaEmm/tyGEU8bUZD/RrhFbP4JvHoL+5L/THAGjvqst
 kRgBY0xmyu3onXcUImtdSAOwQ90GQO3E0fuB3BLurozArpLucDbxjJ2rx3sM+c2fyA
 9FnEFbIg0oe2UBypUgBuBpX4Cy0KwvBg5opEcR2xl+zaWawUqH/W2q9MkN6e62mb5x
 uX+CEkN6zClaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F8Q99aNl
Subject: Re: [Buildroot] [PATCH] package/bind: security update to 9.18.33
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/01/2025 14:45, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
