Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D4DD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E6781351;
	Tue, 13 Jan 2026 19:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sOtywrObacG; Tue, 13 Jan 2026 19:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D77B813A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333503;
	bh=X1Nge9v3f3Yz2hvvXUQTYoTD4URcuM/G1kNy9a27ALA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m7T1UCafIGNd7vS10W6VKvz6/BXE8DfLAB6ieYnqjYwM9gsypUDrkqosq6b+hc155
	 qlmKw9aYxWRZNK5ozqv23hhecQYGgZgl2BGoCvq1YVOo+tumzRjY1Jw3AF2IsDxOPA
	 j3nD3CpAYRxxTRF5t6a/FRaTh4FqV6NfYXv8jWZPntf97nvi4X42dXio2ilMERr3aO
	 J1TQJ37DA9+0umxa/3HDkJju5dCqXzEAiSJ42wnmZigqpL/bx40PL8Ro6Uy2kzVv4p
	 QSj18pLXCKCug+qNHWDIi22LRXNaXTUwfHBpHtojPgkuWKN9VuyS8jiOEhAfJSdScB
	 Yga3b4OkLI8Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D77B813A1;
	Tue, 13 Jan 2026 19:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97AE41C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D1F940674
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMUPHltS9LTl for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71FEC40597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FEC40597
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71FEC40597
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74189B97A863; Tue, 13 Jan 2026 20:44:58 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:44:55 +0100
Message-ID: <20260113194455.97321-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20240808210603.185284-1-ju.o@free.fr>
References: <20240808210603.185284-1-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333498; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2tLIoWNPfC68eCb6ucduevUL7EejFhwG4cKGFS6Sgqg=;
 b=e9S/++IDSYSzEHtTEwCVucgHfqg8We20/DCOwE+g2l+Zu1VKsWsFd9ulpip6R/wZYNZ4g4
 EMDTj83ib8zKq5HtTe2/YQtwi2oq5kqhqtRr7azGMCfZiV6kMOHvzO1M3g7hwbA6GqRC7W
 eMoC5zcM8NqG5qEnVd9NuQgF3bIkorxHHccS6NTGM1WvAPt9pyRf4pnafov5OxavN3gzoy
 pabWt1uiazK/u7VkEspf8qi+3VXbKlU7sEPfwFtLH6p4deTVf5uYIwViaeLP5+FonaaBvy
 DXgmEL1ysAjrlCnxXcw6IK0VtG2G4gp2KgQQoWNSKl3bvcyPb9dAN9RZlBtklw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=e9S/++ID
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add flac runtime test
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
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7540310064
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_flac.py | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 support/testing/tests/package/test_flac.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..1255993b39 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1857,6 +1857,7 @@ F:	support/testing/tests/package/test_ethtool.py
>  F:	support/testing/tests/package/test_ethtool/
>  F:	support/testing/tests/package/test_file.py
>  F:	support/testing/tests/package/test_file/
> +F:	support/testing/tests/package/test_flac.py
>  F:	support/testing/tests/package/test_fluidsynth.py
>  F:	support/testing/tests/package/test_fluidsynth/
>  F:	support/testing/tests/package/test_fping.py
> diff --git a/support/testing/tests/package/test_flac.py b/support/testing/tests/package/test_flac.py
> new file mode 100644
> index 0000000000..9ee7bc1c0d
> --- /dev/null
> +++ b/support/testing/tests/package/test_flac.py
> @@ -0,0 +1,20 @@
> +from tests.package.test_audio_codec_base import TestAudioCodecBase
> +
> +
> +class TestFlac(TestAudioCodecBase):
> +    __test__ = True
> +    config = TestAudioCodecBase.config + \
> +        """
> +        BR2_PACKAGE_FLAC=y
> +        """
> +    encoded_file = "encoded.flac"
> +
> +    def encode_test(self, input_filename):
> +        cmd = "flac"
> +        cmd += f" -o {self.encoded_file} {input_filename}"
> +        self.assertRunOk(cmd)
> +
> +    def decode_test(self, output_filename):
> +        cmd = "flac -d"
> +        cmd += f" -o {output_filename} {self.encoded_file}"
> +        self.assertRunOk(cmd)
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
