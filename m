Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ABBC7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B9AC40AED;
	Mon, 23 Jun 2025 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4byRfwtaGFop; Mon, 23 Jun 2025 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB4740B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB4740B6D;
	Mon, 23 Jun 2025 20:36:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8EB3154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9DF440AED
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1cDB6YDCecV for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 20:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 192A840A2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 192A840A2B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 192A840A2B
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:36:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3F88278035E;
 Mon, 23 Jun 2025 22:36:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Jun 2025 22:36:24 +0200
MIME-Version: 1.0
Date: Mon, 23 Jun 2025 22:36:24 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
References: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3701e4a818ca7c4a0909134f7e894d08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750710985;
 bh=V2Kq9m7uDGMiQcyXpDLS3HEwHHCUAicY8ruEQDtg/MY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IuALJ2xQkXw/1IVtQ1EtVtgW7xLaXAUFIzV5EnxL76x8758sJZdW6Q6SXvaod2K7r
 CArSH4g5qWdRLeDTCF6kQyvtR3Ea/Wxo3VwJ9Yw4dn2JcMQVCgNkPqGD/yj47GFr3Z
 UqNBFNJjENLHzimpukWR5feRF1SIjLLckCwGyo+dEK8c3YQUHkmQIeGAcaTf01d5mh
 MguJ8jgKbBtQiH7cf7BspZ6/HiL76hsxSaz+rF/iLXnjK/4NxAQdinKisDj4WnnZK2
 FQ84c5IAzgkLbxzlrXZBG3AktvO6gAWVFoFBh9v5+g2HnIkATKYLpLqO0zgyUtYtAG
 4lJjnW5Qxu1WQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IuALJ2xQ
Subject: Re: [Buildroot] [PATCH] package/cifs-utils: bump to version 7.4
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

On 23/06/2025 21:12, Thomas Petazzoni via buildroot wrote:
> According to
> https://lists.samba.org/archive/samba-technical/2025-June/139484.html:
> 
> A new update, version 7.4, of cifs-utils has been released today.
> Users of cifs-utils version 7.3 on older kernels are encouraged to
> update to 7.4 since it includes a fix for a mount problem with version
> 7.3 of cifs-utils on older kernels when using namespaces.
> 
> [...]
> 
> Detailed list of changes since version 7.3 was released
> ----------------------------------------------------------------
> Enzo Matsumiya (1):
>       mount.cifs: retry mount on -EINPROGRESS
> 
> Henrique Carvalho (1):
>       cifs.upcall: correctly treat UPTARGET_UNSPECIFIED as UPTARGET_APP
> 
> Paulo Alcantara (1):
>       cifs.upcall: fix memory leaks in check_service_ticket_exits()
> 
> Pavel Shilovsky (1):
>       cifs-utils: bump version to 7.4
> 
> Z. Liu (2):
>       getcifsacl, setcifsacl: use <libgen.h> for basename
>       cifscreds: use <libgen.h> for basename
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
