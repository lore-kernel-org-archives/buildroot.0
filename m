Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46CDCD4F21
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 15:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ECC685339;
	Sat, 16 May 2026 15:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yX-1Uovl2IlL; Sat, 16 May 2026 15:41:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CDB885342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778946071;
	bh=wB9UZhWwowHLRJOZe8N95L2v5fwwmS6envak985O+0U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MlEjaKgt82t6tV1TQnCjRjpeHv4AbwwGVIvSbvF4v4y+PtzkAyaPPoPDbHUngTr2b
	 XZDLmHtGFl+ggq53Sk2euK8wD8C/JnJYr++KMm117U8YkZ3WJkAqntgkEWM7spOWbU
	 ipIc7IfpRlS1urb+kuvwguy77oUVJObRCTLz3Ske+8IGcxcDqTTcD3inpPq4mRqT/P
	 Ln/ODmuFG7WPwSDgy5gntbeZxDlQdZ2kWJEhN25FyD+7eODL9A9q3LuHnDsN7oCweb
	 Ii3yzqTWSYm8IHg0BtQQc0J/FIPkivure4O1GRUsrWbd1sV+jqOnjBI/6eUP1qcI1q
	 db7/NfYoGb2ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CDB885342;
	Sat, 16 May 2026 15:41:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3F74282
 for <buildroot@buildroot.org>; Sat, 16 May 2026 15:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59F56F649
 for <buildroot@buildroot.org>; Sat, 16 May 2026 15:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw9bTq-wpF5i for <buildroot@buildroot.org>;
 Sat, 16 May 2026 15:41:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 500826F5DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 500826F5DE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 500826F5DE
 for <buildroot@buildroot.org>; Sat, 16 May 2026 15:41:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 00F3C780375;
 Sat, 16 May 2026 17:41:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 May 2026 17:41:03 +0200
MIME-Version: 1.0
Date: Sat, 16 May 2026 17:41:03 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260515162105.2267034-1-romain.naour@smile.fr>
References: <20260515162105.2267034-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <a2590e0cd06bcaed587c4bc5ded0690c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778946065;
 bh=vRY8F9xPA+fbJJB82V9ZvULawn5qb7jKRw8XyLbmaoE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4013jrYuS9vd1cHQYz/BBCHcT1rejQQ/CRboKtmMwDXWwOJ+ltt0u2DLrykLHx4Z
 7IyxyeVpRk6Mn3wYn4g8GXayozJzIYwIvDW25DjN3uOGmOjFgWeC3Hw3PLtPFsgzJA
 wdL0Hm1waGeIBSavVNAbr0DUQ+/NHsj4XDkCNRgtF7mbq1gygZqKsIUogTCu6Amf8k
 2ZPqW3+peXVXxoXKLSWuID0WRGtGRZPDBbYdXCJNVfW0kdyEUCmPflwsMmyKzDp8Wp
 Aue/GpA/Oagian6fN5UxnwVU+RLC9slF46lIpAQkMl9C3ni2/UQyQvNEAUHIYAw3Mw
 07MVbBzGX2EVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S4013jrY
Subject: Re: [Buildroot] [for-next] Config.in.legacy: fix release where
 BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL was removed
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/05/2026 18:21, Romain Naour via buildroot wrote:
> Commit 9a5369effd22011b52b82c91f702bacde690c41a which removed the
> BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL symbol but forgot to introduce the
> new "Legacy options removed in 2026.08" comment.
> 
> So the legacy symbol was incorrectly placed under
> "Legacy options removed in 2026.05" comment.
> 
> Fix that.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
