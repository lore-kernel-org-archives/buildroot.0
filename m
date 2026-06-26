Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C3FC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 007D6610DF;
	Fri, 26 Jun 2026 14:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0oZWoScy1xe; Fri, 26 Jun 2026 14:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FAC61112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485793;
	bh=Cqh2ZhZ956GhWqChQqvaOQO+JWcbTbDh28RpyvBjwoY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bkars8mqek8siYUMQcKNVP2bzKc5h4LPHHXcVGCGRm39wOZw3ati5FzgHX+b1ziqy
	 UnVuEMT+W+OzXlGNhP7XeKNVRs3RY40cmwcujTpbOrlf0vsQUEy/xCmK2TJzBNnpVb
	 hrynfuiHSeav8AstsGgv5ob5ivBg+NTKisfKfNrSRSbNljoZf83TVQEhF2rEQcdDuE
	 4b/Okcnj9HQwsOXA95yYZ2TKWXVxEjtjg+WAGjcGQ5cFhVrS8hd8o6ITbf7nF3WWxR
	 quDZvgAVsgDmck0mKTsLFkk0Ej9ynRqIQQn2CYBGrZ/ya8kmhSit5dsjQXYcrr/24L
	 SLfn2qfd4S4Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10FAC61112;
	Fri, 26 Jun 2026 14:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2DD8231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C833B411E7
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOy3d_sRksWO for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A08BB411DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08BB411DD
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A08BB411DD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4633193af19so644029f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485776; x=1783090576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5FCXBMKciI+PNRfO6cpGW+IDcCm/7NoPLPPj0AkBcnk=;
 b=oBni1KhL+PYDug9mowPnae9oTXataO0BLdE+XxFzzIgVGEazPzSSeqP3+HEhCXZhqf
 /lPGNHGF8v+8q7KNv508tZnUa69cxM43315J6Uflrp9JRnnrAXHFpKRR1eniT2V+C7lG
 y/PLT7LkO2rOdQ12sRe9F1ukuRNH2XeWw7onFqjdE0aUb7qnkx2oduiMCvO75XoYpVMk
 G5O2uUe9g2XuBBwRx1L7gQJOeAOch+hFh52RZPMXR7jLJd1KLvOXlNCQPQvlBIS4hXjJ
 trMTMqjijZ2nbB7onpSh8RqMg+Mm5BVlBMJu8tGsZVWE3g4h6JvmKX6WLOwKH8kfDJ7y
 11PQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrgD33l8HLYaSE280SohuIbk2se5tdiX8Xzmc6F6FSqxl6GlLAjdK0OiOnIQdIVFhhfEHi2HBVfcs0=@buildroot.org
X-Gm-Message-State: AOJu0YzrKAz+rjw/ROFJtKUyi8A+K46zgeYlvZw+xvBrXwijsfeNhbpE
 jIf8qvCGTBhtTf1/rOv3FPOn/MbjtbMa5X3nwVu9hoQC1mkeVQ7Xb4Hu5YI8MQkGA+E=
X-Gm-Gg: AfdE7cm8mG7oY9WAm3Z6O3hBDmMDd6YkB72shrAh1OnxgaFZnZoqCYXgqWIx1zfexCN
 +1X5kc00hfNOGXKaUftCAKbYcDz9N6UuUrfIcMOf735m9V1ZebuOOwoGutlYGDro4sL0goA8XN5
 b3vzMF5aScQps/CqJV2vW+cdp3Eta0QhX8zaSQEhFlEAUKt9kaTRJuATem8gImA1BxQLWr99hA7
 UlZdl//ps0JSs5sgZcHjEVGsd1DswCKp3F3i63HdM0Bdt1YcibHxwj78f2eKHHaa0mXaUMPEwJh
 D74gOVC/dPNDEPr2AM7XtfCCqJe/stnm5MRfXtB+s2K00rWyWeN/9ro7CbHwMkaG7/GOpGvCq/K
 EbfxkSKOo4WXRr9TI+CL3k9oxCf1EjcDkGDmxlSPtzdjcjouyd2Wy8SPxz6OAd1NyJLu7dlgAPa
 ghbdto5wLbDWArxak=
X-Received: by 2002:a5d:570a:0:b0:460:71e6:e3b with SMTP id
 ffacd0b85a97d-46fb88c891emr1608803f8f.27.1782485775581; 
 Fri, 26 Jun 2026 07:56:15 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d3ba68d8dsm19530880f8f.27.2026.06.26.07.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:15 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:14 +0200
Message-ID: <20260626145614.344422-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-14-peter@korsgaard.com>
References: <20260618124835.2935850-14-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485776; x=1783090576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FCXBMKciI+PNRfO6cpGW+IDcCm/7NoPLPPj0AkBcnk=;
 b=M0kUMG7anb7Fua1/NDCc4mArbzOjKhdQTtOoaKIlClmahrp5j34ij7Xn7ghRuUifN5
 fLjpicJRHADIASMfcDeMzOIAueXc84Lzi+j1KpH0o3yQ7X1isELOflCvgn2EIf+WGwEp
 sHToJo6BhIDtuESS7k0vr9uxMPoYS2eSEAvLXiuk47xXM/Bw4J7tGA7+fmHQuUuAIdEx
 OhB0/2cZlH6DEk2KBDY2V5YCtGCXWK07lGPOw64Tcto30XU6g34TvgYi5YkGvy+cBaT2
 m+EbCyMu0AC2Jv0vW5YyOkY1qYjMvYwPFfsLbjyf79OBShneCviRbloP4+PGx+RfZ9Qz
 +CSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M0kUMG7a
Subject: Re: [Buildroot] [PATCH 14/29] support/testing: test_jq.py: use
 assertRunNotOk()
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_jq.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_jq.py b/support/testing/tests/package/test_jq.py
> index 67420abb6b..ffa284ce31 100644
> --- a/support/testing/tests/package/test_jq.py
> +++ b/support/testing/tests/package/test_jq.py
> @@ -34,8 +34,7 @@ class TestJq(infra.basetest.BRTest):
>  
>          # Check the execution fails on a non JSON file.
>          cmd = "jq -M '.' broken.json"
> -        _, ret = self.emulator.run(cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Check an execution of a simple query. Note that output is a
>          # JSON (quoted) string.
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
