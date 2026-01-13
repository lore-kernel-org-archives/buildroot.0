Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3849D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8927C841E8;
	Tue, 13 Jan 2026 19:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ql-e_Nn-wvdZ; Tue, 13 Jan 2026 19:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD539841E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333582;
	bh=9bMo/9D9hhib9mSOsbpzdlWHYW8vEnnLkp1bhj/Wl4M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GmAMcEB+y7+wNBXEsjxFuDCtPSFm7Xu8sY2h7Bti0ctCr+Is1njZFel8ln+XnNfM1
	 wyaVWQ0pwDrFD4WBkZef6RcLre7n+rlcwBR0OokyRH824mcYnMNIXakZSHcU92lfW9
	 y9loCWz47RAU+YfMc18LxJjGW2ID4nr6hQHLggjWUUpafFOd7ibQB5bjsIBDpsWpzn
	 p02iAs5FznLp+tsurFTZ/QFHYj/+NNdCZfBidvTKrCgG9nPTpROEEHa0s1lqnjOEoS
	 dzxTgave4A/VLlaEwrBJQ/rGb0PEjRvKJlyewAtuZrafdU7aN91VXplcUbOTSl8mbW
	 aarbdpn1kfzFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD539841E9;
	Tue, 13 Jan 2026 19:46:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 978491C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91C1440373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORBAR2JGOxZ9 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72DD740376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72DD740376
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72DD740376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83F7DB97A863; Tue, 13 Jan 2026 20:46:16 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:14 +0100
Message-ID: <20260113194614.98410-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218214636.736781-1-ju.o@free.fr>
References: <20251218214636.736781-1-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333576; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Vg2rCvzCypFLaAcot7nJ1k31a+XgPnQhCcj7KlS8yZU=;
 b=nlaNpPlSw2H3l8FbLaUDnUvxhxbm4bavos45cj5Pr815i5mqIYG+Ts5XCrFqHUj4VlLrhF
 1b9mp5YgRBewlEE1kZkSCdB9Ux+GD36QdXRCYSco+XamwqBmbq9SrzLY9wGMcSBH0JlB4z
 bHdHvNBqucvX7PLAEPI0LF0hyAHaW94HzjUM3TP+xZRDcKvWOtIUwcqkbJel15J6f84mRB
 ijog28Wlh3/PmOhO7Y1KZHStc5Rwg7IwobgK2EgR/krY9Z2mpkqhxO+HCUjP6p14UozyDb
 T1oYB0mVrJzK8ft0P25WWVg722bxB8GQp3lfc6fCPHtDnQOtwXOF3Gagkl/8VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nlaNpPlS
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add opus-tools runtime
 test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS                                     |  1 +
>  .../testing/tests/package/test_opus_tools.py   | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 support/testing/tests/package/test_opus_tools.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1b27df9beb..3ea5f84b30 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1973,6 +1973,7 @@ F:	support/testing/tests/package/test_oath_toolkit.py
>  F:	support/testing/tests/package/test_octave.py
>  F:	support/testing/tests/package/test_openblas.py
>  F:	support/testing/tests/package/test_openocd.py
> +F:	support/testing/tests/package/test_opus_tools.py
>  F:	support/testing/tests/package/test_parted.py
>  F:	support/testing/tests/package/test_patch.py
>  F:	support/testing/tests/package/test_patch/
> diff --git a/support/testing/tests/package/test_opus_tools.py b/support/testing/tests/package/test_opus_tools.py
> new file mode 100644
> index 0000000000..89b76fb954
> --- /dev/null
> +++ b/support/testing/tests/package/test_opus_tools.py
> @@ -0,0 +1,18 @@
> +from tests.package.test_audio_codec_base import TestAudioCodecBase
> +
> +
> +class TestOpusTools(TestAudioCodecBase):
> +    __test__ = True
> +    config = TestAudioCodecBase.config + \
> +        """
> +        BR2_PACKAGE_OPUS_TOOLS=y
> +        """
> +    encoded_file = "encoded.opus"
> +
> +    def encode_test(self, input_filename):
> +        cmd = f"opusenc {input_filename} {self.encoded_file}"
> +        self.assertRunOk(cmd)
> +
> +    def decode_test(self, output_filename):
> +        cmd = f"opusdec {self.encoded_file} {output_filename}"
> +        self.assertRunOk(cmd)
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
