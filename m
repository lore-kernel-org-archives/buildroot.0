Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F3CC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02BA7610C1;
	Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzMuWQLi-tdr; Fri, 26 Jun 2026 14:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 036BD610D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485783;
	bh=YfAySDEKhso2UWNx9phmCUqJTMU7xOol7BgkC8gZ5fY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CGz27s12clQj5Om4Z8nxAhnCuHKRrwjv+mwqDPl1NYI5UPImAzbkZjucl+fFh9epC
	 hhFxsakJZCwxbjARmxFArCjeyBPaN/BXOypYmKy6pGq+n92wvQuJklp7lxSRDc0jaW
	 FEjcFqo4T3BicIEQ4tGnaoFtBIs0JH7xqBc1BqTDJgH1vlm6yreAJSSvv7WCYFhlsL
	 GazQ69mWX+5GBNm0UxY2T1wtsWraB38NWw80ZW7JVFC+a+TZE5XCgJOKXZNU3DvX0w
	 X1jWe96q75hpnoy3qDTQH823RxLNaYf7zBfFk+Sutjl5l4/3VDvs5Mk84spBsx9dX3
	 5ksjJf+y0KIcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036BD610D5;
	Fri, 26 Jun 2026 14:56:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E48ED3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA06F411DA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8e25YjXF5Hq for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72A57411CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A57411CE
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72A57411CE
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49249707788so8990885e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485770; x=1783090570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jr53YBeRE9Ff2Y7E3X8qruOu2GUutMiO0rSCCKrX4ik=;
 b=ZARzJbPHNPhzDSADvlNncExDGfU8Jr2UkwOM/c0896Jzts1Rv/jj6Q0ucIFRuy0Wo+
 sTzv2ebPYQH7Niv5+KleUw3lf7NvAhJypwkPSiNp80gZf4+QFdDsVFc8x2TkfR5vwxre
 nvFOrGa0rEqrYauuQgKXuYH3v+9siU3Kzt3PBuVWPo8l9DlerxjRNeze0BkaGP9OaNfi
 I/BlSG2q7XlDjQI9T2JcavtWh+q6XiAJp5NU1l3JkxUl/YHuM9t7hgONl3AY3FgqXa4a
 DmcCqyuHV8Lhz+luIlxfA4SXHN5zJDQW5vdWExG8fQbwpQt4+dV+XIzTjk9Wp232Rk0B
 kmEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LKQ0TK6znFJkc27B7vPx+UjzqPaqqMvStYZo+mHtpRgSIjZdvKo3ewzPE706cNBB5UtnvfEgeM8Q=@buildroot.org
X-Gm-Message-State: AOJu0YwQ5/UcNNE88t/IKIK24DI37FiA5g2L2VfeHIxZmH9opIctoWxP
 9Ikg0Skavb1KMTK6j9ZKqrWxSISniEGBstCLd3LQ062EsnGeMgNfclpYAiJVoDdOoJw=
X-Gm-Gg: AfdE7clzgwYndmVhQ0Y/UdIXqxoQYqg9MxSca5MUIF2tMB4DsgLwFA8JOT5jYhRgQFI
 jV2nYQeNOFk6WECIgwoJ/jHCzpnu9t3rGCqhcKUNALzSqbBAj9UHVzqTakCpy/boukFacp28Cc4
 zUWZKYH3yZACwVYgVgME6A2CLlt+6hl/St1nY2+PkV/rlRnEuJKe/EBYeAeAAnmqQIfVGhwV2mH
 0mhetypCveaiMmBSDoLYaSJjLfNZXXxNKHgImz1ah+gb+KPyjtwGg9kZTPsF+ZxYrmEt6wVRVji
 jhb0C1mgiZ/D+6JJdjz8O7iprKuc3l/OhPPqD2j8or9GVEPgiOF6F65Oo8HinN2fmGI247C0kaV
 +iLLPEPM0Eepysay+93Xe79KbwhwIHD2vgK1TWHot6iJRgbNA0whNf6sUnp1x+ia2RJKElPElMP
 T6oJWi
X-Received: by 2002:a05:600c:c047:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-4926fc95e86mr13639445e9.30.1782485770278; 
 Fri, 26 Jun 2026 07:56:10 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fe949csm98509695e9.5.2026.06.26.07.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:10 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:09 +0200
Message-ID: <20260626145609.344083-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-7-peter@korsgaard.com>
References: <20260618124835.2935850-7-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485770; x=1783090570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jr53YBeRE9Ff2Y7E3X8qruOu2GUutMiO0rSCCKrX4ik=;
 b=K/AeYVczplpErw5eymParKXBq6/E0ECjD2RlqvwtDQ4mTV39EIPJZPtWsBA7hoLgbx
 HUzzAxYoFRr/LkBw8l+FDMbRQTweAUlKq99CY0gFe6gm7xKC3Qg2IHMyV4DH+NkOP58O
 vt5E+L0T2r3mljoIYagU3+jlnzv6EGXDo2CAebY3+mfEUMHUauGEhPrZkbR4sLEwS+X8
 JeZsnDuLhHxZ5fl5L2ULxwKWWr9laURG4WCl/+T3i3//0i+g7IbTEW2HHW3us27jIZAn
 DUySQB4NmvaSY3ARTo0lNUxgCqygEJvRQbSFO+sA+sqgkS41lkwCpJ08SlbFDIrmC6DF
 5upw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K/AeYVcz
Subject: Re: [Buildroot] [PATCH 07/29] support/testing: test_cryptsetup.py:
 use assertRunNotOk()
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
>  support/testing/tests/package/test_cryptsetup.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_cryptsetup.py b/support/testing/tests/package/test_cryptsetup.py
> index e409ea93e6..32a65210b5 100644
> --- a/support/testing/tests/package/test_cryptsetup.py
> +++ b/support/testing/tests/package/test_cryptsetup.py
> @@ -65,8 +65,7 @@ class TestCryptSetup(infra.basetest.BRTest):
>          # Check the device is NOT detected as a LUKS volume, because
>          # it is not formatted yet.
>          is_luks_cmd = f"cryptsetup isLuks {dev}"
> -        _, ret = self.emulator.run(is_luks_cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(is_luks_cmd)
>  
>          # Format the LUKS volume.
>          cmd = f"echo {passkey} | cryptsetup luksFormat {dev}"
> @@ -110,15 +109,13 @@ class TestCryptSetup(infra.basetest.BRTest):
>  
>          # We are NOT supposed to find our plain text message on the
>          # encrypted storage device.
> -        _, ret = self.emulator.run(f"grep -Fq '{msg}' {dev}", timeout=10)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(f"grep -Fq '{msg}' {dev}", timeout=10)
>  
>          # Try to open LUKS volume with a wrong password. This is
>          # expected to fail.
>          cmd = f"echo 'Wrong{passkey}' | "
>          cmd += f"cryptsetup open --type luks {dev} {dm_name}"
> -        _, ret = self.emulator.run(cmd, timeout=10)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(cmd, timeout=10)
>  
>          # Check the device-mapper device was NOT created (since we
>          # tried to open it with a wrong password).
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
