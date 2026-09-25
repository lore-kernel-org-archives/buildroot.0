Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3109CC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F3860D7A;
	Fri, 25 Sep 2026 14:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqgGTK5np3V5; Fri, 25 Sep 2026 14:43:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1160060D84
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347432;
	b=nMaP6LinCk7lM9Q7I2Cqbo6OhecX4ilLH/y1WdwX3HlofyQAy4vX6BfxliW/+/F1Znxp
	 OptkqJrjuI2G4pOG5+NzGQsnbrzKCdMrmq1CLvPkCTo3TWupTD8MjeXi582NWG4Nvgame
	 ZqOPt6JU5w4cINIzZzYmwLEQSdAK4QqJo6DrDzabuKDNZ5HbSPMQOH7N5SYghg0iWowbh
	 qKwAk55ZhtQQ8RXahvCwe5IPhzm8OJ/kQSUr8UB45ntXGZJjLFz006ZGy9nhVUcb8pU1e
	 Ittz2dNzProkK+nwuK2rD1tY1U5aCsuP5RMioD1RpULPEEYl6VSWRynYwpnJNGhcc4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Td9Id+2rqDBo6SKu0n0hi4I1US/U1/DhxyIUPlbH3X0=;
	b=OVWKBTsixwX/zzEElPG4Kua/d3KgSySt3XUB2PsrZPngzrKX2TVpDNQzEnzMIyzBA3wQ
	 TO0BtUTmp3cI0jxuUrYOeed9toAVSmRgyVT9u7UyK2b4EWxfO1T80i7zMe4Db1pxMr8L3
	 Bc1MnFGKqZTlf0iQnssjxQXrtR9TN+XcLFsPnNHGpAcePp+fXwYkd3Yfp3TPYx6nBCoxO
	 iht3LM3OmctaGmoUvlc+KPx+s+pow2KPF2RR4AW/u1KzkPvdXaDTIU8xN8kV7oV7qGjic
	 nCWf6q81KAVxfyo4uG2aDm2faY3cLrruccv6ZUj0Cinl1rb4VNKWh82BPFP9DKqoiXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347432;
	bh=Td9Id+2rqDBo6SKu0n0hi4I1US/U1/DhxyIUPlbH3X0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GTfFUfgJHfQxiBtZ5xGsbpcoJUQe9qYYhuG8BzeoSCwTTE5PzHirWPS/hjOi2ytij
	 3K7eG76BngnKiot+AZbCkpq6E2H9PgMPj3BfaazdkZTQhpEibAysN2KVAwgx/Tcjeu
	 rAZgWF2NKgYX2eq4puXaBK8im20753MZfdo4RgOD4rydbYK00/499ORVOZSIJtyDEq
	 eiy6Nu+5Yux+wCvBMvBMWIRXZPY/4lUZiDkvgbJxfmyqXKQ6ZVs5zOxFeFyOzR1LZm
	 ZN81D+9Elxz3McjMMJthDtllpguUejlkiSOPr9cMlpqP1sNxt7lY1WUJ289CWqkMMC
	 aRNlYJvnlk0Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1160060D84;
	Fri, 25 Sep 2026 14:43:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44A8B334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36474407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB6_johgCcjQ for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BCDD40790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347429;
 b=jEGHZCuNSZTQoeQG8cmAX1TpinF64ysCAuxVlx3W7EHXh9KbMx26kXp43hOWtzRaDez9
 6wHGrr9C65qjm6IhqC/x8VQZS//hRkyw8KOYedJjy+YU8Rhis2muzGKLiCatG4SziikQ+
 fXFwQIE4biNgbf38/BNB0Ftx2seXKf/KxypRv45a1rzVVDS3TIKwWBTg7/YI0YEBiCy7I
 uTI4E55OI0P2Ns8aJvZcle2IIVRaGlfLJ05DUQ1UbLrUlVRqHd7qO6zm9VazeweQiqr1L
 3WJ/j101O9vhkgXypw6BmtyvR43sB5uz+Orkz2hI9rApwEM+RwownoHigrZ8+BaMXvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347429;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=18/SzCsyRsXk363R6Or5F7wxzflI5g6DGaEi4GI3L+8=;
 b=SSEjla4HEvbSCjekEAOOoFD25yD2o8m22iAEhQ7Yx/2nHgrtbnmTLMtmuJYFkgqrMg0s
 L98IyBcmHOfiMur48xpuaaWMp4vqyYdcbvDA8vIWS8u/oPhaQICVndl8UKEuUrUDD4xte
 uDck2UO2QgleWt87o+lQpeJCSvPN3DBxL+EEl/tunvd7ClptZn22mTLrLDRsnGoKaXASW
 UPBiSfp2dRWimSDABDlka0gMJBv3GikvqzWizHz9bC0geAIDeWtBSrh407WnGDold7nA/
 Ime2Ry/k3VRfZFkeZG5m9fk4VFKfu7GiFQQY8T/gv3chk4Xm0M0mvbmp732/yQM96Ag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Y9FL/In6"; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BCDD40790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:48 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48882c1f261so169723f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347427; x=1790952227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=18/SzCsyRsXk363R6Or5F7wxzflI5g6DGaEi4GI3L+8=;
 b=UFP7c9j5uKzWt9KHXP23w/w9gUL+qrIGlCnnmZGWMm6ST7GmIgQl0ATIEMZdbXOpUc
 1dlm9WcMQtk5ZLlm68qSP36pvowLmrxwaQ/Ix9LmGLWte4kO1GGCdRPxqhfyL7gksFfc
 VVFIv8WZgwd2dfDMKopZKbzX3yQrWFX4YJR/rtUe69cDkI8Fst3e1YumpTOUxssARqQc
 fiVdsX/xLX6DUVCQL8gV0QOdX4dTI9fwnq45UsLg/TTLNvfkTms8SnBGmDHbCRcmXfl5
 VThFbaZ68PL2yAByVWACGgiNzoBxh4KYqIvMVjJzeBcOZLmCdLqK29g/Pf+3Ofzfyb8T
 hF5w==
X-Gm-Message-State: AFuF++mKrTUPzOcSiwAhVt2Xv4VJTzkD8GPkcgaQu4/R1HcukgR78Qhy
 sZdqv01VyJ8AdgW9wgwnYKQtlwwKiQ0x0IE7ZO4p9diL8uHLr5hFB7XFe6KjyxHlK8qpLVpJ+W+
 4ndRSeljLww==
X-Gm-Gg: AYBFou1KH+PnwAWkUBEdjLjlRYUvPmWp6F2lOYQTJmzK9VfXYzTtSmLnv5pCvKoOA2t
 J4RKzq5/Xm1ZzVFFuL/DaLtxcnMvEPmnMvzM82pMLggognK76h2KeE1l7cUcmWXonJ6MHV5EXCb
 HG3HnWgUvds2FpcFIn7VJZU/GCsxSOkXJADvTttqI6AFyFudcxiCoLo2DWnnHTerszxNvkFUte6
 dADFGREDfrDcX0/5bC3Rl19ONVwz//YIshfUUj7UkAtuct1fBnjR9gDVMAYxHiF3JrwRMDdgfov
 wb1wOs8NCL70Y64xQzqg5Qpy+avjg37e0E2tm2Q6jnBaS0JWa46pw+/1RtWdDi17VHXu9fGVbtG
 30RlnNx8EGPr4O6dS7Dx4eBGgxGTXyogIJ3WmZq7dS6Z8Bdo6wIQZreh01ScNsbkCBM0m1ZbZOg
 9BUI8s3kbVABaZvru5/4Xo066Ww3xLzPH6HQCo1wa4WgRq+t5m1qHMeuj3XNQHX2DUT8CWNBJpv
 4HQObBJDWxM/M3GEv6AWQ3dicUNza+INBtZ9gQldA==
X-Received: by 2002:a05:6000:2383:b0:488:81d4:8bfc with SMTP id
 ffacd0b85a97d-48881d48c0bmr3008332f8f.11.1790347426747; 
 Fri, 25 Sep 2026 07:43:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a35fb05sm8492685f8f.20.2026.09.25.07.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:46 -0700 (PDT)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:44 +0200
Message-ID: <20260925144345.4095137-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260905144548.61238-1-ju.o@free.fr>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_erlang: new
 runtime test
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/16325100707
> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_erlang.py | 48 ++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 support/testing/tests/package/test_erlang.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1fd93b1de5..4b8d8155b8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1903,6 +1903,7 @@ F:	support/testing/tests/package/test_dosfstools.py
>  F:	support/testing/tests/package/test_dosfstools/
>  F:	support/testing/tests/package/test_dpdk.py
>  F:	support/testing/tests/package/test_ed.py
> +F:	support/testing/tests/package/test_erlang.py
>  F:	support/testing/tests/package/test_ethtool.py
>  F:	support/testing/tests/package/test_ethtool/
>  F:	support/testing/tests/package/test_exfatprogs.py
> diff --git a/support/testing/tests/package/test_erlang.py b/support/testing/tests/package/test_erlang.py
> new file mode 100644
> index 0000000000..a765cec843
> --- /dev/null
> +++ b/support/testing/tests/package/test_erlang.py
> @@ -0,0 +1,48 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestErlang(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_ERLANG=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can execute.
> +        self.assertRunOk("erl -version")
> +
> +        # We check can print a message from the command line.
> +        msg = "Hello Buildroot!"
> +        erl_expr = f"io:format(\"{msg}~n\"), halt()."
> +        cmd = f"erl -noshell -eval '{erl_expr}'"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], msg)
> +
> +        # We check we can exit with a specific code.
> +        exit_code = 123
> +        erl_expr = f"halt({exit_code})."
> +        cmd = f"erl -noshell -eval '{erl_expr}'"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, exit_code)
> +        self.assertEqual(len(out), 0)
> +
> +        # We check we can do basic arithmetic.
> +        val1 = 1234
> +        val2 = 5678
> +        erl_expr = f"X = {val1} * {val2}, io:format(\"~p~n\", [X]), halt()."
> +        cmd = f"erl -noshell -eval '{erl_expr}'"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        expected_result = val1 * val2
> +        self.assertEqual(int(out[0]), expected_result)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
