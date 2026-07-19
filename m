Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EBAC44512
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA8E60693;
	Sun, 19 Jul 2026 19:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xt1X0etaCa8U; Sun, 19 Jul 2026 19:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03DC56062C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489377;
	bh=x48DEUmMmnm9NjzEOjL8ul8lxbixLHiRuwRrainDVbY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hsjJpQHH+otvv/0AEuPlbLGaBZicZu1To0/W1mTKXX1PZvryIWeC9XRfAxF2Cc+3w
	 ng+ZEd5k967hf5lQ6mMifaladJhMy1NJ8VMDPbH/mUUf8FlM5BL9i4Tds7jLfRBRgD
	 JoTw4IonI4UVORMkgtNNoQ1rhFaj05xwpJ3X3hzbHWTKdS/7sm48tVmOMPV+PrEn3E
	 RkmNxfxK7Npt9oMegJx7zOg/zdPBvrf0fD2aEmqFI1vPj4oj6h7q51F0VOSC+SYDpp
	 mKm2qJT2mUolaQ+ztcZA3I/FfHtmEsYRBdAPK99sxU9oNILE2BH1azubLRXoc1/TR6
	 Xq88goYu5e3Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03DC56062C;
	Sun, 19 Jul 2026 19:29:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA899282
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC57A605F8
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9RCKhYGxnFP for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A648F6062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A648F6062C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A648F6062C
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:29:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7583519F57B;
 Sun, 19 Jul 2026 21:29:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jul 2026 21:29:28 +0200
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 21:29:28 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <660856a0a6c56c964ce496b54ef818b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784489371;
 bh=x+5+WNkDkTqHR3uMMEcRq6fks6O2IGs8uCSh/pN9YjE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DZWEhiA3hTU+aKT2D3mZIgh9WMk9SrG8s/sxs7M517lNevPPulzwQcruj5j5oKn8v
 c/Oi0/uhVxFXkNn2zIT3Bu+9z9b6TWzjNJP3l0k5ReKoHVuyT7PeMQnEp/VKVgHke7
 Uz92v+tvnlBKhZg+3XxW2lQVYpSFbkkS3/9oaxHY4FnZg0gkCKpbM8WGNcWU6MsrOL
 fNFtBbpmUHcenTHM6SD1ze0aglGfnwia0cIrH56C/PbeGPxphMncGdElySQGQ6Rjs0
 sOg/xrpxFmZtOc2iSiGRjFdpeQlHUix0wC5u0OX8Nff6rRVGOJWJvfrlQfbW6dmOfk
 GETEpcvnHD5cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DZWEhiA3
Subject: Re: [Buildroot] [PATCH 1/9] package/fmlib: bump version to
 lf-6.18.20-2.0.0
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

Hi Akhilesh,

On 07/07/2026 06:05, Akhilesh Nema wrote:
> No change.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Series applied to master, thanks.

For info, I fixed the hash for qoriq-ddr-phy-binary.

Could you consider, in followup patches, updating those defconfigs
to switch to external Bootlin stable toolchain, please?

See for example commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/18b85442351e80099fd97d20cd4774b17fc9f2c4

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
