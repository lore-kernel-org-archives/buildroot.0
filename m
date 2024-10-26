Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18CD10BE3
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3124E40800;
	Sat, 26 Oct 2024 05:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcqWt2Eoe0TO; Sat, 26 Oct 2024 05:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054B04083F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 054B04083F;
	Sat, 26 Oct 2024 05:43:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37B485C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 241CF4083F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a76TpGGa1JPY for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 142E840800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142E840800
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 142E840800
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:43:07 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5ebc0992560so1741264eaf.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729921387; x=1730526187;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pjYTSkCPzVp76q1Wi5INft3PxQ2nYbdfxG1yk1PJYhE=;
 b=cB5HwO+GsXoDf8ItbE8fUSQipVXsc2cm9fBgh169nVt1rpQV/ZiB5Z+huo7rU9GWtZ
 hRQJP8NSuvjB2OqSNndmakdQKeLFLfXTA2SJP9+FgbyUfgQeXhWwfN8Nchkj/5eULXbV
 aeAmi3ezOTSNNznHLgb54B2AXtdI7D1CiqWlQSJ52aTGphXUu6pgxPmLwRIlmC0jCDW8
 VfVlGIx6EdbPA3K5IiBtPtexx6nEUVUY4VXIXEPSawiu/c85NaKW9a9oJZ/ckpi6cpLQ
 cxRlH02H9kWaVU9wvAu4xVtlLbiSYy+5WlJTzcV4LAyWixt73lVNOH8+GbqOqt7rjl8a
 ItgA==
X-Gm-Message-State: AOJu0YzOmvtFhYBtkDKCZzqEt3h8b3ghBoKLddZDMKwuBj+BiadRXStA
 jrxMkjRtzRw2OADFIcnoc8Bc2NVhDWNohI9uYI+5e6Cgo1S5v1DRCblCan4gm9JjEwdByJE7rcU
 6
X-Google-Smtp-Source: AGHT+IGZhMIAG3mLem7oYz1PCD886qDu7kKBrw8ebMWKgMgzHbcmOZ8v+OALedxoJqfn4bhT/PDGIw==
X-Received: by 2002:a05:6871:687:b0:270:46be:9534 with SMTP id
 586e51a60fabf-29051c2f83fmr1486220fac.24.1729921386699; 
 Fri, 25 Oct 2024 22:43:06 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-290383511edsm705952fac.56.2024.10.25.22.43.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 22:43:06 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7181caa08a3so1578475a34.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:43:06 -0700 (PDT)
X-Received: by 2002:a05:6871:687:b0:270:46be:9534 with SMTP id
 586e51a60fabf-29051c2f83fmr1486210fac.24.1729921385808; Fri, 25 Oct 2024
 22:43:05 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 22:42:55 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pDpNLjCiJMuc+d7ioFDrOGiTu3YpQBRmrt7acGbeeQaw@mail.gmail.com>
Message-ID: <CA+h8R2pDpNLjCiJMuc+d7ioFDrOGiTu3YpQBRmrt7acGbeeQaw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729921387; x=1730526187; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pjYTSkCPzVp76q1Wi5INft3PxQ2nYbdfxG1yk1PJYhE=;
 b=gfYNBeFOdxLHGCHaIrw908PsMoLd6F+Fi8kAo3LG9QKP3iwcUcBuUvCEXNWYKYAkPK
 zKoQ29bltf9Eh/zkjz3VtLqqsVaDX/bGz9wQc8YS9Mk4Lr9ob7c4GG6gKKhirrGbPZjX
 IYPPIU7/kKlK/Dae66vuZk6LY7M7L1LK7jv4iustReGOWNCue6f1RNujHa8Y5uQxkYS+
 BrqDPCwCGErWmBiUXcSp4m3NJ6QwgSRjNneMzOF4VIhioWEe4nULCt903ftqhBd/Syja
 ur0swIT9YbUu9nI6+4UmYF591ZHUXstoDW0Xibd1gGM778jMFjeTB92qJPAz8EZcqcqe
 4ryg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=gfYNBeFO
Subject: [Buildroot] package/linux-firmware: build failure
 rtl8723bs_config-OBDA8723.bin
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

It seems like the latest linux-firmware dropped some files:

rtl_bt/rtl8723bs_config-OBDA8723.bin
rtl_bt/rtl8723d_config.bin


This causes a build failure if these files are enabled in package/linux-firmware

Probably related:
https://lore.kernel.org/all/20241024200129.874978353A@busybox.osuosl.org/T/

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
