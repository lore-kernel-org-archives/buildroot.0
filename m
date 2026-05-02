Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8D5CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867CE83CF2;
	Sat,  2 May 2026 11:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjI-jNtZNcLk; Sat,  2 May 2026 11:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EDC83CE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777720284;
	bh=c+WZa/3dLt0e0pSvgFF9tq4Ta40nHIE/xXCUiwazcnE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=epRDVMzkmz6ZzwHs862Oh8DSt0s+V099t+v8PB4mYP5wlVbZw66cP7M0uRqOLv8Xm
	 1ZzkbthyW0bQKrG2i4vYJAmBzFRoUPMAEOinnRGZP+DDTVWY51mSh2+XN0MG9wuMfz
	 KT3ZIuSVT8EFyxnLLbVieswpJy7NCC05Polfo0xK+f5q0K84WC2Ew3jideA3GN6IaY
	 sF+Gmsgp732leXo0otQldQTxVh6CeUUPRLeq5ThxYb5lx1stsS2N2/UABI6SsBv5Vf
	 OKEeCIuC+T8iXZQYEMdicwWSIgOeZSOdisndoo1Eo5uADDXB/XY9xIePNs6nz2NsdH
	 DHbv2g48i+tnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28EDC83CE9;
	Sat,  2 May 2026 11:11:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08484127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE5034122D
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMoTBldepgKf for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9FE6411C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9FE6411C1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9FE6411C1
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:11:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id ECB5D60128;
 Sat,  2 May 2026 13:11:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 13:11:16 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 13:11:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430181751.2088520-1-bernd@kuhls.net>
References: <20260430181751.2088520-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <19b5ad8f55e653cfad5465fe6714f0f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777720278;
 bh=hYc2/gNmCpUaPgV4uvjoE3ase0ms11s+7agCaavUyaA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MJTs7Grfpd4l+ngaIgo9YkFf9ty1VmoWegl26Yhf9S52w/va1xRVkaI6e/M++vtp6
 SSKehixSAZbnSHMd8HLgKa+2ltxs9Xs39Kb0wDAn9qj8kXHUwVULf4gJCe+cZFMLB6
 X8xCiTsR3sjSZJUfyQQYVTXToJE6BzOvgrOjoVeN6WaHdmshFSb5/L0TNcuBhy784g
 8DRt9790m4Wb8wUxFsW2zRN+fXR9MnTYud81McSaed2UQNB2KWNbYGqdBr8ucY42eD
 8DbNuQn7msBMCbhU7+e5mIrv7a5nN5NoytAu5/Tk1/7cVXDMqtH1IXRdDhxzeWDVFy
 JNhQPGtomihrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MJTs7Grf
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: security bump version
 to 1.3.9a
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

On 30/04/2026 20:17, Bernd Kuhls wrote:
> https://github.com/proftpd/proftpd/blob/1.3.9/NEWS
> 
> Fixes CVE-2026-42167.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
