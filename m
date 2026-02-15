Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F708E63F09
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 17:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FEE8402F8;
	Sun, 15 Feb 2026 17:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFEDwt8X1x8C; Sun, 15 Feb 2026 17:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE6F40317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771177874;
	bh=YZaUVeH41NEbGg4ziEFS2eoxe5O0zrO4AAfd7vPvMzk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h/x/ztUlHVtcbtkgNR/Ah8V5cTbC0zj657IiyygvNmalbJMLsASb10mPneLguaFFD
	 xisvIY7IAOEGR9OYeGxsdee66aAdbWFum/74mvC0kznRg2lpgEGXQr9GfMCnBcinO7
	 1cgx2S1I0fo3kU6Gm2Dhe4VqH0Yy+MjBlMJuSNuQZqu69PbT3abC7xnscm4ewtEPMD
	 EQzxa6NzeyVpfA6VXrNCWiLJfWnv8o50CoRPjyb/WXuWEZwDCXgc99xE/q0F1J2cC+
	 pjZsLWQuB8r1GICCJd2zi71NlYuMzbxpjbkzJPQICgLaKxCAWEvXknM/ulhnthYZN/
	 Ik2y+w2vaO3Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE6F40317;
	Sun, 15 Feb 2026 17:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FD9B270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B0A824DD
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC8EHAaaa5-t for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 17:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9908480FAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9908480FAD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9908480FAD
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:51:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A5B1D6013A;
 Sun, 15 Feb 2026 18:51:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Feb 2026 18:51:08 +0100
MIME-Version: 1.0
Date: Sun, 15 Feb 2026 18:51:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215160425.1421192-1-bernd@kuhls.net>
References: <20260215160425.1421192-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <756327be5aab19a6ef26bdf70678c2f0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771177869;
 bh=eZQg2ZiMY+zNXzZo+16KuR+NU7IiZ21hCfJqL+NpKgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MWZA8b23Y+Z4J3sIDg31Ho3Kxd96oAXFNGT337O350gvOMZK8/1lGYXJ6h4GPM5B4
 JZJZYQT5vjlwRJV3Mzq9ut4GdIMEw2YSkOn7JmVaPwriE5d4H6TsttCxXIzKJe7DmR
 kJ3tE71GWos/Qg+TdFhrRgzL5wtGGSw8q6bNz4VNGf9CnRsKAin75vq5ivRKOZbhVV
 bjdTb/beFnv7CpH+anXZBoIAkXMKZZPNLeO57jk3qPTqtW6X9hwtglnPn6S1I2KNWC
 s6ZKFVPCj1/j6w4WcxxNPTCbvT2vWd8dbzXpEdtyMTYioT/gjC8TnGTw3Fy1efg02q
 7bBXH6ioqGFEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MWZA8b23
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.10
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

On 15/02/2026 17:04, Bernd Kuhls wrote:
> Upstream does not provide hashes in sha1/sha256 format anymore.
> 
> https://lists.gnu.org/archive/html/coreutils-announce/2025-11/msg00000.html
> 
> https://lists.gnu.org/archive/html/coreutils-announce/2026-02/msg00000.html
> "'kill' and 'uptime' are no longer built by default.  These programs
>  can be built with the --enable-install-program=kill,uptime configure
>  option."
> 
> Adjust coreutils.mk to install 'kill' and 'uptime'.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
