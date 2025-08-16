Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD06CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31806151F;
	Sat, 16 Aug 2025 20:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA3_pM3kOvwp; Sat, 16 Aug 2025 20:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BC06151B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BC06151B;
	Sat, 16 Aug 2025 20:21:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 487E4196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 368836151A
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7iOFVCNDkpD for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3914961517
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3914961517
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3914961517
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:21:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b9e4193083so2806209f8f.3
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755375715; x=1755980515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iu16vkWrQ760AhykCqYBcKYlGYvmIb0WFTVoKSxBf4s=;
 b=pRr15gzzjkFhR4AFYCwnlwX63B3hG+wxiwSBjldhGKrNXT/snf78xfDD5231XtDPts
 MbDD0tpngeznOTWO69zXCcCEoFT8HYl+tyHkC3iVHJUVewAy5ZUNOZ4mo1jm0Il92rsN
 Iczz2+tRZmyqvcTywajbkkC+ea5HhF9wDW+N1mLv93Wq8d107Y7yc2Q4dMPUfV8dFuPn
 aQejJen85Bu8a8wRusGU4EF4MS7VTlWP4FNPA3VXPWh4Tp/9lNqJ5mHVJ7glMGXxVsXc
 XdDfT0zUfV0c7kDSdeDayjDpjV8LRWVzr8PmtTs1oSicjCDs3MlN71dpXf4MIooy0bQ2
 8Z8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEa8cZ3UIhqHuj6RWB9y6pvNDC5WOA3nTxijkO0ymFUBMz39YkgLbslfYGSR+rg789cH8qFVcg7N4=@buildroot.org
X-Gm-Message-State: AOJu0YzTVNN0iDk/t4wcvp7dnagiONHhnSmhciIr74kmnmrUIoljyyEX
 mz4vEN+XOBtFlCTfGzV906kdIMFU4rRWUF11wr3LYIyQnCzawNbSJAogTZABDUdB9mg=
X-Gm-Gg: ASbGncv8YWMw1m2cz40PPAGlKTcvNKE5ZsY7vMtguGIwjY3zOvZBptgc2Tcukqy/Ku2
 0AIKtPNo3QvyMog8NAWepfgl8AIVvCU4QNfFZf8GBqF3hTXWU68Z0/6lyskMbBtttTc4eDFey5X
 +LK1jGs8dRRj97PcTXyZtJatay76ts2oeRmdXrFoM5OoxB/iw+lH3y+SoE/hxmTmKAoHMdKpV3r
 bE7cbTicp3kE+xuO0UJN3eDG+MKGYMCdCUm8Kbp94oMFik7JE/JFRx6q39/QHIh7gvjyrhoE0WG
 OkSbn9q+W99gUw2vFN9NDxJ6B3/go8Ec0rWMmCtqKyDPxZknWKdPx8Oi0sn+VdKR6gXezxnRxae
 jKpSPa34JMxm6Vw==
X-Google-Smtp-Source: AGHT+IFRwEbxoaUzz6H5RT3f4IA7wG8s09vK/BRPyXCbnXgLQT5zs7Sv1HDFDh2EtWXjhaTbbF1SkQ==
X-Received: by 2002:a05:6000:420b:b0:3b3:c4b1:a212 with SMTP id
 ffacd0b85a97d-3bb66564c83mr5096507f8f.7.1755375714660; 
 Sat, 16 Aug 2025 13:21:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb676c9426sm7282874f8f.33.2025.08.16.13.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 13:21:54 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 16 Aug 2025 22:21:53 +0200
Message-ID: <20250816202153.3376159-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816195207.5f8136a3@windsurf>
References: <20250816195207.5f8136a3@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755375715; x=1755980515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iu16vkWrQ760AhykCqYBcKYlGYvmIb0WFTVoKSxBf4s=;
 b=Qw9OV1x/mkz/0oPKBD+N5l+u0EqVbNBnzLFzr/8DsAYj6SQ4hwh3yszVXkYDgU7Mbl
 tS/mV6EyrxDt0cmKz8PW6iROhvRusabS1Pg5fVRikFIlIg0VqkPA2eFY8fGlmeeZFNxy
 oULASSJV9mBRCC5iciK5W0/O/odfgi/kV1kppZSlUv0eobzWs/ImDAP5E5m+Yvg2SC31
 JpUdICq/+Q/Q6v4x4QnS4YN7UbGZyBkQerpZ1Us1zCqnJGuf+i7O9tJaubBwcltY60LQ
 lrzg9EW47D0rpTIjOEjKhT4YyDSSHid1h1ttw8ht3NzTH1gZnqWszFcdShoPM975d3tF
 FMaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qw9OV1x/
Subject: Re: [Buildroot] [PATCH 1/2] package/python-yarl: add missing select
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

Good Evening,

In reply of:
> On Sat, 16 Aug 2025 15:01:04 +0200
> Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
> 
> > `python-yarl.mk` depends on the host-python-cython package. This patch
> > adds a `select BR2_PACKAGE_HOST_PYTHON_CYTHON` to correctly express this
> > dependency in KConfig.
> 
> This is not quite needed, nor required. We do not enforce adding select
> for host packages. When a package needs host-pkgconf, we do not select
> BR2_PACKAGE_HOST_PKGCONF for example. I'm sure you will find tons of
> other packages that have host-python-cython in their <pkg>_DEPENDENCIES
> but that don't select BR2_PACKAGE_HOST_PYTHON_CYTHON.

Good to know, my reasoning was that other package in that same case seemed to
select `BR2_PACKAGE_HOST_PYTHON_CYTHON`:

- python-kmod/Config.in
- python-dbus-fast/Config.in
- python-rgbmatrix/Config.in

So, if you prefer to not include the 'select' I will send a v2 and remove my
series that did the same for python-propcache
(https://lore.kernel.org/r/<20250813201639.2443921-1-thomas.perale@mind.be>).

Best regards.

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
