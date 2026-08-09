Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C825C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8B160677;
	Sun,  9 Aug 2026 15:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddgf0HY1aUjW; Sun,  9 Aug 2026 15:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6552460603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786288984;
	bh=GftytHs9c4Ysew+JSE1S2/lu73He1rhaRZscpmTOlS8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nMqiFQE/pUJZtiPd4gyTpEHTKEWFC2lBaD06S37vyh0Mk5h/jvESfpNWikQKb2WqB
	 OxNd3BEC68UFOZTrQjpYm64sTFn+xlZvqD7UNhkztGl9MpSSKmOfA3H+jLd426tQ9Y
	 2DqtBjuJ0Cmq6AtDBDMG1BfI6/Ir6SDaRz9lfPHwdCM1Q9NRQ8NML02HQTMvJByzmd
	 HQLq82WOSDb5u+EzVHo/npJldh5HxqCMfYW0VgP9RhPpwhoYSgV2CEtONDc86N4hK9
	 8E13L+H+QL32jyiMTwm3NWwEeVmJPUR0qaDUsmdkfO3KNRbvpie8SY5obxqpbvcizy
	 6G3BmU7LLPqKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6552460603;
	Sun,  9 Aug 2026 15:23:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0762D198
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF9D80CE8
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uitR6kqQI2P2 for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E51A380CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E51A380CEC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E51A380CEC
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:23:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D00E113F86E;
 Sun,  9 Aug 2026 17:22:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 17:22:58 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 17:22:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20260809103605.907605-1-bernd@kuhls.net>
References: <20260809103605.907605-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <5625fee46b1010a817ad79e7f8634aae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786288981;
 bh=QLURxWY8m3KNHyrNlvKbZ621KEl+bEB1ycFnYKgXPkY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GhbS8ijkmK6RG0AF7idC2hI/7ARNXXUHNK4UurOiI49fL0FgRP1y79DOmlzkjOOlm
 JPtO/V4xA4x6RPGmJF3kb2Vb0D2P7fXnbXr8l461w9Urk3Uc621KrUBg12CcmKrItJ
 dW1SMvywyCpSVlydyVodQV3yFgZdVgOZf/Wy8VGNcQDU2gomjNFdiZBCuhkR6+SBH2
 Ha6SNNAElyGahR+MgQnRJiOPFhmFM94vqHeEUiY8WLPeVS9LBDJVN9F0J9t/kg3mFT
 ickPcQ8M6m4453zhk2KRdjRgTDjJ058xIzM7l9ncIDPa8/LGajkDhpd9WB604kaiDO
 jiuZxo2tsTa8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GhbS8ijk
Subject: Re: [Buildroot] [PATCH 1/2] package/syslog-ng: needs libopenssl,
 not libressl
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

On 09/08/2026 12:36, Bernd Kuhls wrote:
> Buildroot commit 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d bumped the
> package from version 4.8.3 to 4.11.0. Upstream commit
> https://github.com/syslog-ng/syslog-ng/commit/dbe9fb306929168172062a6bc985eb7e38201dab
> added the usage of OpenSSL BIO_ functions in version 4.9.0 causing
> build errors with LibreSSL:
> 
> lib/transport/transport-tls.c: In function 'BIO_s_transport':
> lib/transport/transport-tls.c:125:3: error: implicit declaration of
>  function 'BIO_meth_set_write_ex'; did you mean 'BIO_meth_set_write'?
>  [-Wimplicit-function-declaration]
>   125 |   BIO_meth_set_write_ex(meth, _BIO_transport_write);
> 
> lib/transport/transport-tls.c:126:3: error: implicit declaration of
>  function 'BIO_meth_set_read_ex'; did you mean 'BIO_meth_set_read'?
>  [-Wimplicit-function-declaration]
>   126 |   BIO_meth_set_read_ex(meth, _BIO_transport_read);
> 
> because LibreSSL does not provide these functions.
> 
> Fixes:
> https://autobuild.buildroot.net/results/117/117b3b38098df075d96167863d9f6b933a97eb64/
> https://autobuild.buildroot.net/results/a39/a39ecc88a9342005b75660ee0ac60a1025fa6fc2/
> https://autobuild.buildroot.net/results/6b3/6b3eb910ccdb67827f0c12cea0e3a63c5e6b68af/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
