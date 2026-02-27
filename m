Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F9CFEFB6A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF8760A63;
	Fri, 27 Feb 2026 16:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q15LqSNLm60d; Fri, 27 Feb 2026 16:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 046D460ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772210319;
	bh=MoeRK5RNr3YguA1wurs9g3CrBTOH2VBtMPEFKUKySM0=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VyF0CMa84LPXywpguGbihEpkMV4ClwNUWD7IZJKdycjYa/8tyngnbk7xzm7y71oWp
	 SJc71Vkz94Msp0Wi2TF5ij4nvNg69u4WTTecMv89EiDiunYgwnx7JoQY9SZQkOXxCN
	 /Muk3nXSLJP8eQ5Hf7MnDKfmXmP4L2CgWEY2Jn9W37J9P86IhQvPemKDhIQ5hQ/Z7n
	 HWmbCAo+t2gF2g8p8rk+kDEDsmlt1A6GsXfw3b03AQR821D/SB7HsRUtThs9g77o7J
	 JZM84PDGEPLgDWcbYGTMtNvt3kWgg6iEUs5jdoWy3ZwQCzAHpayFq7152lKygOkukX
	 EcYZclcb7gy8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046D460ABE;
	Fri, 27 Feb 2026 16:38:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F10F51F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6BCB60ABE
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zs7dcXRm9T9F for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 16:38:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57E5860A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E5860A63
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57E5860A63
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:38:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1457396550; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Feb 2026 16:38:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vw0rH-000000086gF-05Lo;
 Fri, 27 Feb 2026 17:38:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260226070623.3826260-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 26 Feb 2026 07:06:23 +0000")
References: <20260226070623.3826260-1-neal.frager@amd.com>
Date: Fri, 27 Feb 2026 17:38:30 +0100
Message-ID: <871pi6qgzd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=sJEOgx5uJQw2xiJb3P/Y9XAmNBewK63sGBvisXJrboDF2LMb69BsurOU/4/9NGfPAJCL325KBqbxX6ZCGaEytpZ8p2IGBoA1YPcUoq79aOfVCZSOrqPVAO2Ray28AILVdw9DiuLM9SvhgZyW2m+OXTQ4k85M7Urs8NT6VzL9VDHDzhgjFAFyxrScHdMy5BjlxPftAFBuGG0sKXfvjbQ4nuCiC/+fRdi3zG4dkGhLsqhuIoo71pwtT88ddmu3uY17wzZ/KHymB7WtNAWeaFWTxtkfnNCc4572IktGvlF9Icn2t+Tjw9VbyWKNxg0UJuVd0Jwh3zS+yrW+O4rC/PK8nA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=cYGyL4RcOUuURJJivbpIauLM+mTDtQ00vGZqy2PcpMQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=sJEOgx5u
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vpk120_defconfig: new
 defconfig
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, akbar.anthony.rezvanpour@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Add versal_vpk120_defconfig for vpk120 evaluation board.  This board has a
 > Versal Premium VP1202 soc, and this defconfig further extends the portfolio
 > of example defconfigs for Xilinx Versal SoC products.

 > More details about the evaluation board can be found here:
 > https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk120.html

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
