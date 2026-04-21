Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2EBF94CA9
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D764213A;
	Tue, 21 Apr 2026 19:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xF0IgMM_xS76; Tue, 21 Apr 2026 19:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B90C42133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776800360;
	bh=29bkuzwu1SD5XlyoyF1hcPqtY+rlUTBrw69kI2haxPg=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XZN7xKi5j+qT2C8MY6OWZWhE7D9cnu4ROOz5K+MNp52KNgoKhQmVhszcQaa3UN8Ur
	 oY8wog64hbf2TxwT2hQFwLBDte/uN59NuK26AOgf1Ds7k1cOxEvmCPaI04xWng3sOw
	 s6yubZ9W/R/VWhGH2jeb2O1aRnD4XkzX6Iaz2GBG2JlKoIy//u6qtsJwt6TbRWbvev
	 NCm9KKnKeIoJyMX3u9ymWpZBGSs9ZoFqLs5/BtjgQkBNnjMmK+8UhIHqo3/IwxQYXY
	 0bQQD2uSx+ZK+dxlKu1z7cdqRM6FOS4RAZZ51+FR6EpUkEJFDkyF9lWXJBN/UrDBlF
	 XZrsWdxdb1iMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B90C42133;
	Tue, 21 Apr 2026 19:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA53624D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBF80840B5
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDIsCO6gvVWl for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D689840AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D689840AE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D689840AE
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:39:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 129371190; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 21 Apr 2026 19:39:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wFGw3-0000000BoUc-1vYD;
 Tue, 21 Apr 2026 21:39:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 20 Apr 2026 18:38:53 +0100")
References: <20260420173858.1655069-1-neal.frager@amd.com>
Date: Tue, 21 Apr 2026 21:39:03 +0200
Message-ID: <877bq0hzmw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=f5KAqnXCNl1oLmd2oHsQw4NNdg7AUDIw8MU42+k6rz7KRrhzrp58q2Eena1QA+HbJrrHp/IaTZuGgXKMiBEi45wss78YtizFIXpy7lpPsLNGGhEFPPl2Xc4U7D771yAo2E5k1z1KujyVLevkNd/7U97TfCgb4wql0u+96HTmU5ZfdQvJH59QUASwkUOfFr0z4E1eDjqDP1D7iBrlo5QcLvMnFVg7cYeSOAsKGdOpOyqtAn6v7/bsDDg33sxE4cZNQj9U1H6bF7bOCgddW7q8ai7YUb7MCqZ1SKES4LRRW6e27OLR65xMIR/iov2BUuwTAD43TdQVuJB96ZNdIXCqog==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Zg0v38gDzDRREVpxrXO5aUrm8WMecGMsmJPpAbCqhkE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=f5KAqnXC
Subject: Re: [Buildroot] [PATCH v1 1/6] board/xilinx: add Linux 6.12.70 hash
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
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

Hi Neal,

 > Add the hash for the Xilinx Linux 6.12.70 release tag.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  board/xilinx/patches/linux/linux.hash | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
 > index d843dafb20..87db73fc78 100644
 > --- a/board/xilinx/patches/linux/linux.hash
 > +++ b/board/xilinx/patches/linux/linux.hash
 > @@ -1,5 +1,6 @@
 >  # Locally calculated
 >  sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
 > +sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz

Somewhat related: Is there any specific reason why an un-annotated tag
was used this time? Earlier the tags were always annotated and signed
(git tag -u), E.G.:

tag xlnx_rebase_v6.12_LTS_2025.1_update_merge_6.12.60
Tagger: Manikanta Sreeram <manikanta.sreeram@amd.com>
Date:   Mon Jan 5 07:25:30 2026 -0700

tag for 6.12.60 upstream merge
-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE2KNj9EeOMtlQShBLMVLSoYhJhtIFAmlbyf0ACgkQMVLSoYhJ
htIA8wf/fUDy8nFHuE6EMTcKdncFeVSnenWYq+xHoTdBTS95NJQMrpEkQrfifkEZ
ueCnIAt2SZDNY1MpvWsnk+7bErXF4czCWBhgPpwA2MfeU2mlE15qsmMnqmfdBrkn
rvne09cQui2wzC1LJXNtDYc6c770iivQCzddLcld119mOjtQYx3zAmb0/qlEYHhX
5rpeFSi8d1jnmM0QVDhxvpdC1vkNdhOcHXo7Xv3pERN9waVygThcs1/Xk6XgAQkP
e56141hpN7c9OW5tIQNcZr4ZhBWYHTAexTkSR8DDPIzyj4750Kd1yRKV8v5cSpNf
yeZMUSTS5PtgMwirZFy5PGX5PGlDEw==
=fsAs
-----END PGP SIGNATURE-----

Un-annotated tags are E.G. not picked up by git describe by default.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
