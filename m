Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07822FA3742
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 12:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF234406E3;
	Fri,  2 Jan 2026 12:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJkcicx7TsWX; Fri,  2 Jan 2026 12:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC450405DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767357549;
	bh=dK4HXCqlE6GR2OiH5hzQHHjcpbz5Bt7HczArCKU5V+M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oCTAfMPkCAWRzmHyr9vvcB0/Ir2mcg/3mAcFBoBG5lFtLNWJMNExt2QJCC4uoe80r
	 JSrhK21eUddkLvvPahpiah7fRVo0hSVIpMRaiKjiX4Uj9CLKoTKQxvtws9+jiqemaT
	 DuZGv1fb1aBOnhHIOYE4cm8A6fZmIUhbji1jYIFXQYE4drHSfqtanAOG65frng/hId
	 7TZGljtrk1mE/Y+lRbeKH2sGakZolehhypv5m/RlFqJkja+tNoDqZXSOM2Hnb/ErwY
	 +S9nGMO1pNCmJ8dYjD/uQnbxIVH5uQvRfcczU68Qv/hf1FVJ1zW8QEzwMadEqO/FWn
	 QJyj1Esb/6kpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC450405DE;
	Fri,  2 Jan 2026 12:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C471D19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0ED403D2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp3ritNw7M-j for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 12:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B188540087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B188540087
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B188540087
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:39:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C3B66B0053E;
 Fri,  2 Jan 2026 13:39:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 02 Jan 2026 13:39:02 +0100
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 13:39:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20260101192150.1714696-1-bernd@kuhls.net>
References: <20260101192150.1714696-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <00895b0916ef00066cf9b1e6df653590@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767357545;
 bh=jcj7feaX8otdkMLXkY4xFSXvAS8CPAqLTQo8zmkGS3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=owOO0pt8m3rhyui/jBxY/99I1b2DejXnHOupHtrxGr489Dt6N0EEEufh5C+37WfLa
 FhX/MOd8rMReRMfB2BsDI86ki/DqoKzqNJpI8K0s+kqt3iGCAw0Te9gciJG80Qdf2V
 jXOP7KsyMHlncTCknS+bl3Q19Lgit8x10m3N1CNjWNDnNPCmxyw+Ly4KQR4ZtJwBy8
 JiVcoG+P6lTlR1nNDGVQwgLetIZ9V3x7YDxAFNtp+Lpm9LRIVzBmvBEkUTSNnXotWR
 anuAKgSQR71tr1Yniu4+5X4Fx3+tlMQ7m0JIIvoQ1Gdj5qk7B7TJuYKJBKhobQzuGn
 opZYAMQHIzivg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=owOO0pt8
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 6.1.4
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

On 01/01/2026 20:21, Bernd Kuhls wrote:
> https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=0b3937cd1ab60b206a8bca8be5253b053e042161;hb=34277e12e80031c7f89494ba543684bc1dd0be8f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
