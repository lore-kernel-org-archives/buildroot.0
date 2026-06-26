Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EE0C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B0E81A27;
	Fri, 26 Jun 2026 14:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPgQEdmsrA_A; Fri, 26 Jun 2026 14:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60C678215C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485804;
	bh=4keNuyH6JRSroUVPoUIzVpjUh9/eHg7sWDXoeCkZym4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lvt+yyRRvLYYprKQsAvV4ZYZdmEQjjLQUzIppH3iyfYZGbPCV6Ex9fwwQ0RfQCE1s
	 rKTTMAOoRySbE/Al6VPtjn2XIEgb6J7WLL2L+EJeu9dV8G5pbtsMwIY4nDO7W/f+Ef
	 TlbnVrEI+CLLtJASILEpU+Kk5fI9/lHRRSCZmhouIDTne144qkkUfRxjN87WdRJV3p
	 yOWRvGyK5i1ogwtJsaA1fuJ+oiuSqzBn5k+eG7uLMChuOdbn4YQl7N4QgxJPudaz6f
	 egvCaLoj+S/HagXT6U2G3T3QT4ua2MqWySjOh8YOFQOCWDZh8UFiaXorrBUovzFY9G
	 LJi/HE0ho4mVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C678215C;
	Fri, 26 Jun 2026 14:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5A5231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD098610AA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1l52N_-gSFa for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9627261106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9627261106
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9627261106
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490c0c92cffso8416745e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485784; x=1783090584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HQS1uVOBRTvYeA6GRIjUnV05gD0c9tzwm9byzuQsXPM=;
 b=GlsrlM/Q0cjZrLe0Uc9pOtzt5k14a4UHWto21C4GHPJMMkuwpWI353e/BfIkylt8Cy
 QCY+NsyVD/vWttIsFJfcLZJmmODKNZjmlHoaiTDMS9tYTUQGYCzYzkvPCNbcgdV/KiYk
 nGZo7AgQ4muW0rLh+fRxZTBM3r7fn9v1ER1wevUf5gyeApD2CHmJ6H17TMZ0TDrTFdPb
 Su544JYJlrJACKRKHVIg1nxdGV8b9IgvQmSVsKzPjTBfVzI6hjLVjZl6fX8QlwJCigsY
 WuNG6IlU0+JmiUwOWtnFF/NGGYSPKxWOhWkqiBJz2JdPVirLhp6hUE2KhTaecxjtz4w3
 5R6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9lMvWS1tj5mUduQ7uhFJ+aXCzptiOzR6lbSjara8PDu67Stn9sESSKs+FXayaCLjj5qAVwcl0mlfw=@buildroot.org
X-Gm-Message-State: AOJu0YxWZIuFhb0fASEbefe9A+sbmtnsT6qTtnwR1swPQhT36uTUMOjx
 pSvU0KK8FKW08JAZG7S1XUpYDaXwpHfsWSnB2D/k58k1gJl3WBcVgfXqpbeYzoH7XiB3ZEpuy2g
 YxRVu
X-Gm-Gg: AfdE7ckv8nByWtnbubQOYdPJLUD9QlHDmlpHWZWORI3FUntuQwQBgBlplMpfYqzFpya
 Ic2VuYwgUc2JQ1ujSxyIQ05YchzO1EH+r5MCM9Huqd8oIUH285jvRJdSWjVGSILbldmC1w97CrG
 4RaD3da40xqe6J1lV/TWYGydUjLHHry6k15ojMxQ1me0z02pEokzebrojUWAvTbJTXiks3mWxyR
 45W68r2iyFEnEAwTbwtP+wHGpOWXYmgXvYKjzedjkxubZLc+mFFiE8fFTx3WAXf+/JaBZuLZikO
 +GX+ldf9m/ar5nuEDzAIwZ8AxYHSGBHphjk8cxBwXhXeqhuHJRgcojYdiZic4O7AvyXDiOYF//1
 NoaXp72njprojS4+9vs7htI3GMXJlGN2Oh4GoYulTkgazNDp4putUvTVdauwKJqIALBMFVW3NST
 OAto5Y
X-Received: by 2002:a05:600c:3492:b0:490:be9e:fd03 with SMTP id
 5b1f17b1804b1-49266838803mr102251365e9.7.1782485784461; 
 Fri, 26 Jun 2026 07:56:24 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926c285fc1sm40056825e9.1.2026.06.26.07.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:24 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:23 +0200
Message-ID: <20260626145623.345004-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-2-peter@korsgaard.com>
References: <20260618124835.2935850-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485784; x=1783090584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQS1uVOBRTvYeA6GRIjUnV05gD0c9tzwm9byzuQsXPM=;
 b=UpMqW/YMG9CO7TUNW7BmXPDxGUjgrR7KPjor129F2VT3EEktXHGW863AIYmuZHWmgb
 SNFhI/G+F/V7vZlIHJx89IEHxOobg3xKS98nZVxMihw725en6kkplYMVFwJe9oU4cJDe
 OJ+uflQ1lrOG2LTYSOKjD2A1uudLDC3/NmNpCZ6wdsvgk341LW/yw5cy9jbU0V91mMF4
 gT1EapYhfokVqP9M6dm1nWwNJacpwdkByXzwg3a5xnPfbauDbhsX3UUnCBcbeRZVwVgl
 y0F56WVdW2MXefeFRlYsk/levBl38gDdW7/jEPZg3kfz4Zko33su6gGmXY62wQunqWfM
 ZTTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UpMqW/YM
Subject: Re: [Buildroot] [PATCH 02/29] support/testing: test_systemd.py: use
 assertRun{, Not}Ok()
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
> Use the helpers to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/init/test_systemd.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> index 472a65db57..60b9c3d032 100644
> --- a/support/testing/tests/init/test_systemd.py
> +++ b/support/testing/tests/init/test_systemd.py
> @@ -340,19 +340,16 @@ class InitSystemSystemdBaseOverlayfs():
>  
>          # /var/foo/bar is from the pre-populated /var, so it should
>          # not be present in the upper of the overlay
> -        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("test -e /run/buildroot/mounts/var/upper/foo/bar")
>  
>          # We can write in /var/foo/bar
> -        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
> -        self.assertEqual(exit_code, 0)
> +        self.assertRunOk("echo barfoo >/var/foo/bar")
>          # ... and it contains the new content
>          out, exit_code = self.emulator.run("cat /var/foo/bar")
>          self.assertEqual(exit_code, 0)
>          self.assertEqual(out[0], "barfoo")
>          # ... and it to appears in the upper
> -        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
> -        self.assertEqual(exit_code, 0)
> +        self.assertRunOk("test -e /run/buildroot/mounts/var/upper/foo/bar")
>          # ... with the new content
>          out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/upper/foo/bar")
>          self.assertEqual(exit_code, 0)
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
