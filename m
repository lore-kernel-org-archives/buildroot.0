Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE468E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBC640945;
	Sat, 20 Dec 2025 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfwtSblURBvD; Sat, 20 Dec 2025 18:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCCE4092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766257075;
	bh=viW4VUXWsZPeAhoLWG+lL6Px5PVyz/Sdr1Sa2g+etDs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rAUzQraFQ3cVuroPXXUJLU8/I2R22XIsYDUhmkBhvTCNSA6emO/AErP4JiLkZwLSw
	 JGLpCFQEeQAOlf95GRsRkjK8pVny/DRpr+zWqDKo3H2IPQNbMVwsJug+wpyufpzjMg
	 YLov2SQThlw+ue0IORi9voqMecz20M1EFbo6tmMBcQrMS1HGtNbsxuA6g9OiwDRhI5
	 BgnhR+aCmXh3QIFzYdiEjazRYS50AxzxV+zkGtbngjdBzFsxg8Mw6eugRR4WwgnbD1
	 pPNS3LpWRFvVWeRwF2SChmIgThky/D5xBspTaNKocIBnQ9meeB/+v4/c5Y9O0ZZnDI
	 INlpiUsXywSnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FCCE4092B;
	Sat, 20 Dec 2025 18:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE83119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0D3F4092B
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moNUHs_UCUeA for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 18:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F84940908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F84940908
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F84940908
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:57:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B8BE1780333;
 Sat, 20 Dec 2025 19:57:48 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 19:57:48 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 19:57:48 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>, Biagio Montaruli
 <biagio.hkr@gmail.com>
In-Reply-To: <c46ebb5e-ee04-4e67-8883-db808aa2161a@grenoble.cnrs.fr>
References: <c46ebb5e-ee04-4e67-8883-db808aa2161a@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <80ebc46138b82ad9c9fc1d69d7eb3436@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766257070;
 bh=u5pavG52IXkjxXkCPWxOoSB/ZqPePwIAyYxJmMj+BaQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CM0x6LPl6Sl2TGlZsMB18/97G7/I7I+MgwsLy+4EshUYXhD663ejaV1S9pKiUNaIi
 xiT10qBse/Sv8Y5IX6v7sUM+BUmGjbZ8qK61SKMEfdPNuC8cY55x1X0gd2fGOGX1FI
 9/VOfJyg+L9pgvdIwr+j+6aViMHbiJLXe/hRghwpUTCL3dX44R9Vw3KF4yfGAEWi0y
 q4/aIsVSCnufdJ5nsR9aZJiUYOc8GaF6xorVTJhUUL01UH+VFLPoSTn1u7OjisdoSv
 B8B0QnlMpceurwr4fFUXJUy5EogzeTG9dy3V7cJBydjK9lHDn/xuacXXvRVEhAnYQz
 l/G1zQ2Uv4qSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CM0x6LPl
Subject: Re: [Buildroot] [PATCH 1/2] configs/acmesystems_acqua_a5_*: switch
 to Bootlin glibc stable toolchain
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

On 16/12/2025 10:12, Edgar Bonet via buildroot wrote:
> Update the Acmesystem's Acqua defconfigs to the Bootlin glibc stable
> external toolchain, as per[1].
> 
> [1]: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
