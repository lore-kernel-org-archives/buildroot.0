Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC36E73144
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C49F3607BA;
	Mon,  2 Feb 2026 08:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYYTTqHO8-2J; Mon,  2 Feb 2026 08:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14C996076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770020591;
	bh=BtqPrBJJ2OhvyDcUEe5/aHoDRbkp8OKQNxa/iTZhJkg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stox2pEWHTH8ydAwn+/8Gj4kTxzFWhVnUHHYiENEKAF2RgrjJJHwbwwbfZ/OtRPuN
	 E2GFLxuYYBlFIHbIcvx1MUwsgjV4qfUhxrs7BCGhkHWddqzoO/DWIT1Dl57BVCY1nC
	 mxkGf5mUHjFEZArf0DoDg7x2v9S9VnC7ttpAHgW+zc0YlLjpauOf/Q7HDh61zXv5eq
	 rhAfjq1Pjlvh67B93nd9sHgUf4PXXrUrZR+Tf4qU0EVDejoe6fNwH6qeBjHUVDLqD0
	 2Xif1/Q51Bi+TeX+RwS3wISbhhJrfI4Oqypi5Q6zp91BanB6YdTlf13CwkU7LEf+kz
	 Bd0/Gy3wiEPiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C996076B;
	Mon,  2 Feb 2026 08:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE600149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C340960648
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX-Nchdqkv3w for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8AE46076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8AE46076B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8AE46076B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:23:08 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -113011797; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:23:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpD6-00000005oER-0XIB;
 Mon, 02 Feb 2026 09:23:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Spenser Gilliland <spenser@gillilanding.com>
In-Reply-To: <20260201184137.3595514-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:41:37 +0100")
References: <20260201184137.3595514-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 09:23:04 +0100
Message-ID: <87tsvz7dw7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AaKwkin2RudZsR1j3ZNyREv2RaL1Wf9q1s11iUlXw3ntcr94x1XCP/g2lDmqGTgg2mKzvIRZABn4cL21F3F3o0G22Tt3tYIFguC65pCQdokfP2y5yjiRBGN6vZNrVHjfxfvHSJ8a03kYLWpyea2U5BHX7CtBIXMvAAnlxR6ndq4PVhs/30woK3djSBFlDKiwT2ME8kcCXzAnB4w4MlzGL6GAwdO4KVuNpIKoLpBECn3nkgHSv/4XdtApfbZl2/X94L7HIrEgY7+Gkvo+Uk9VzkDLtteiOTpa6V+PlwCM2M6i19lqwa/fYHjnZ9yVFDZN4EFxMe9f9Yg6m7UAqxab8Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=EAtbgtjwaxfLWpZyf5iwd9jGHbF2EATwbTVCm9CPkwE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=AaKwkin2
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.16.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.16.0

I see the release notes mentions several security-related bugfixes, so
maybe this should be marked as a security bump?

 - Bug fixes:
    Fix to heap buffer overflow in vp9_deblock, vp9_post_proc_frame, and
    vp9_pack_bitstream.

    Fix to integer overflow in vp9_highbd_post_proc, vp9_rc_regulate_q,
    tiny_ssim, and vp9_calc_pframe_target_size_one_pass_cbr.

    Fix to use-of-uninitialized-value in vp9_highbd_post_proc, mfqe, and
    vp8_datarate_test.

    Fix to out-of-bounds in log_tile_cols_from_picsize_level.
    Fix to double free on initialization failure in vpx_codec_enc_init_multi.
    Fix to division-by-zero crash in vpxenc with 0 FPS numerator input.
    Fix to various build failures for Arm/SVE2, macOS cross-compilation, and
    Xcode 16.

So I added that and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
