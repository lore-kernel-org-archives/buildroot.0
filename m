Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC0AC88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 03:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694B780798;
	Wed, 16 Sep 2026 03:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lj9c-vVZ-Y8F; Wed, 16 Sep 2026 03:23:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 53BD580843
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789529028;
	b=AljwjNjJj9vp1AgoWgB3a7xVGAcfSk448n+VpZJynSSVtxpBEiiOEN7kyjyighTILX/Y
	 fzwH3hCewA2FD3LQDi4AeRjG+JuSbORTLFKZY678PSb0nZFqjPaZCnc0/RsMuGMqHczGW
	 V6j1yMHQaOpOFHVQapAvScg1ys9/0NssQwO8/B3LKTEtmFFVxbgguB+Jkho3QUUJdk9f7
	 D50WNC0fcoyrQNfbIjOHAzbIemeQ6uGpSUVaWmzmFCoOwoGGCdYUZCPeTvEDTEy6/KdUS
	 swGwjjvttGDY2qFWveGPwuBwFOW9tCTPWFUNAwP6FrDFEXJ1HGVBRvQ+pgLjNRVXGnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789529028;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+DnnI05jkO/qo5XJw+HOSRbh9cMDXC3EtK9x8ujG5Do=;
	b=dunrL84ELPQIWq6RKs39hr746rD3uIf9rqRuqrcD83CglISiSCv0nYSmMUZ7fRuANOnq
	 UMG1b/dGwaSvkMtDoBtokzdqqouYEyRs7qIKYZDsI5W9ch83Fuxwe8PnWD54J1xi6M4mK
	 MEX4dor/WGVr9srTSe9RBCgsCHAolqvhG5AERjW2kwYBYkOHAzp4QJBLJ1nYO8f6nDDR5
	 xLlkwDvPCtMbgbFuQoN3QTDFbbqmwNqsW9IUd3VSaHj4oqyzmb7UQLjTc0Agn+QduSB3y
	 vqSAZ2ra7wMSelu8BnJL4BdCxHBY0oFsix8j+qzMqejhyUcbnyPdXd4M6axEqigMcrg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+Ao2lPp;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789529028;
	bh=+DnnI05jkO/qo5XJw+HOSRbh9cMDXC3EtK9x8ujG5Do=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b61kznfLT2j6MYCQ87jhGJZAfrNCMXlpjgE/raIS9iqN2RD/6Gp0UL2zrTTI5YyHq
	 TeFtxMAhCPDKUDAR0Us3fki3VShyeojphP1yCHq4EHGxKa49YRhMnkH+Cfpry7dNHB
	 ugS8953o9E16KmLUNJnPahYqnEZU/Jw9cL19oUcgY8xRAgRO7ffMFZxcL+U8SJFZAY
	 T6RwdbFlxbnlAr3Wpl1VY1xVUdkERb2reXONPtjBLtcUTsQvTG9oKcXoUzfr+McE4Z
	 xgFsGN+wQNdFIe1+fsQB4ll9h6LWD2yGU4Evhn1TVlo962/Ko1dWAduvstyrPSKwxs
	 o+JEs/UtQrAwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BD580843;
	Wed, 16 Sep 2026 03:23:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD6E3AF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 03:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D285180843
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 03:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQyaaEE5Bc9X for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 03:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B15E80798
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789529026;
 b=pMzU8nI0UrLxHz+5cBvPpc4T0ZCnrxwhciR68OJMKAxlgsnzGTT4xEIx4oMgYW84XSJL
 MparpIVG1h9pf1OkP55O5k4tGzsu3sq3OjX99hZDNHFi7hm/okTUP94IWO6BNHJB8j28y
 38E4K8ZA0l6Chf7FJtL8TpwuGVpxIN5pk/EHLp4BDEsYUMpIhZtDNvJYsfyyrLnQqBwnT
 asjOnp8BWFp3kO6T7k3EbNbqOa0Wsgmm5DyncLc7rvFjq18HYRIX0+5nNrwLRDw6+Mqm2
 pqQVqo2vF18jsRNxuojrRt0X0U5wQYGN+E0vmQLogrkMuvOTke4deZ7zjlCkOKuzVpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789529026;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=UHEcDkQWVGdsJDgm4VmWun6GEdbqvVznhPB7Z7Cf2M0=;
 b=qNkYBnGI8f8GJ3dsJf1Q4RuvgZhOQw4dCiTyEGV7jM2kwAra4R+J4IFBv7NW7WzaQclA
 fukAZ0CA4YPGhe0TLs9FFclitjVHzO85nUzjRNdk8k6WRXhlTbbGBUItKQ+mAVtllp91E
 jiq55rVZ5JFIt7xXGXOk8S1YIsx2tCXaOaULm8A7Fu9CE3Vf1H3iXFXEUEpUkmoOKdiOJ
 HyMXGp/lHhkSImL6Vi2SKwtkfYPyXODTarnlxeSmNSAabjo8T5mmJQEOQvOIyugseX/da
 L00AKK9Cjj/OVVkj6BgT7WMmDoK5G6bbbeB+5KctBELtSD2MzKjjnr7wuQw2Nzpv84g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=P+Ao2lPp; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=P+Ao2lPp
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B15E80798
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 03:23:44 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso5176765e9.2
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 20:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789529022; x=1790133822; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UHEcDkQWVGdsJDgm4VmWun6GEdbqvVznhPB7Z7Cf2M0=;
 b=P+Ao2lPpsZ5h1BHAGWdTf3XiDzqUJtjXh6OkMeCHb4+9zBgXNs8mztKjBCr2G7KKLq
 hnGnOet9e6IHog6PdBCl9BjdoYbiz38gnbgLM9voKxDe+Z3/R2HBN5CW+tOSacfqMKdD
 3zOBktpa21rcI77g1+4FKR4L9KUM9MLQVV3RxwylA8yXEFH6TofgG0SXF66Ycd0TRyiv
 nybUdx0o9Dohca9+LRuv0C7bYMhQutwGu0HbdX2Cl2z3mNTOI74nDU87Pqu7zEjeuQKx
 kxaU3bMS6NaxmzvMLdftCJBdTBqnLoPkYarT5aZZjt9XAuuhkghFs40qE1/SO+L89w1j
 0wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789529022; x=1790133822;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UHEcDkQWVGdsJDgm4VmWun6GEdbqvVznhPB7Z7Cf2M0=;
 b=oN3J6D++aTw/I8X22s6QT209date8KUPoMscS06kd9p0iBkA/lE6oC/sB6fRTuSCKa
 SvVy3yB7YqmV+E3I2iZafW3Ocijic/Nz3CUPPEONy82oJUhXCepJN9HJFWa1LTGZiTsO
 ofT2mDOE5yYI5gbpxn5b5G8kOgPOdbpU4p40FNKEJExYDE+XesKCfntwQ1pSPPqOkN/u
 wPLUxv9be3kzWMb1oV/cNUaYHTb/vh+cRUpdHrWR3AEGXY7UqYMTj6AoUGcvwXCTijsC
 vVwVjhvbyLybtjBkqmHn5GORuR9nojpElDSvoI7D73V0czvXK01V6jxcCoGEEbcuCyFk
 iT6Q==
X-Gm-Message-State: AFuF++kihR6UwjRLquMpsiwlam4AlKE3vezvU6SR0wGvg7M8Az4UE6X/
 EWSy6M8Z6BYSy/VXnUhmSMMjrc9u0kFkMxf8Ma+pPT8W0Nu5qggklRZ5U1EeKZpe
X-Gm-Gg: AYBFou1A3R/w6DSjpYvzN1/Sdhh9HwrgZhjHsNDtDQ8q1pfg7NDEVbFXCyio8KkAp88
 Z5wwwVTh8OZW0mQgo+hBT3GNyzTL+V63lnABH7G48yWKeY5JtaS5cyvXGzKVTbR9EXSEwQhCbHj
 FIzMf6pDp75wUcACEblEm9BcSKgjlsROXvWofpUGhlwHRglshKd7NwJ3JhoEPAK2jpXGrEUYZ3d
 KuORsW0wmxfOGB3sQJsLQzumTab3bLzgrqYcyjGT9HsahmhL1GrmFIuu6uMw1g3DtDucJqJpqmY
 oBy+zBBU/QOPqoNb3APr21cxSWrwTu+dlSqLOOKHN+Mq591/zyhDlwbVgHfCArYZ1Ona0uhL4a0
 dA6n4QZrevyvlgaOI5MVOgBzx38/Dsq1Gdn11BVPIze/q7zrg2YgW/129YDq68rOsiYu5Dsngtb
 CJk1WEBNW6xWGeLBm+Y4VeY/OJgvcOASEs36uXB+qufM4S9nbIFL/PCz4B8yCO63q03j+mtfOAm
 Fs=
X-Received: by 2002:a05:600c:3487:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-49eb7326671mr17940775e9.10.1789529021760; 
 Tue, 15 Sep 2026 20:23:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83d906d8sm49360695e9.5.2026.09.15.20.23.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 20:23:41 -0700 (PDT)
Message-ID: <6aaa0bbd.90c7066a.851af.47cf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 16 Sep 2026 03:23:41 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-15
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

Hello,

Autobuild statistics for 2026-09-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  8  |  0  | 10  |
  2026.08.x  |  0  |  1  |  0  |  1  |
    master   | 24  | 35  |  0  | 59  |

Classification of failures by reason for master
-----------------------------------------------

               linux-pam-1.7.2 | 3 
libesmtp-v1.1.0-14-g335ee8d... | 2 
                   linux-tools | 2 
                    szip-2.1.1 | 2 
                       unknown | 2 
                   atop-2.13.0 | 1 
          cloudflared-2026.6.1 | 1 
             dahdi-linux-3.3.0 | 1 
                     fd-10.3.0 | 1 
                  ffmpeg-6.1.5 | 1 
firmware-utils-c42a3bc53da8... | 1 
      freeradius-server-3.2.10 | 1 
                     gdbm-1.26 | 1 
  gobject-introspection-1.86.0 | 1 
           host-coreutils-9.10 | 1 
          libatomic_ops-7.10.0 | 1 
          libmicrohttpd-1.0.10 | 1 
               madplay-0.15.2b | 1 
                  mender-3.5.3 | 1 
                    ne10-1.2.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.14 | 1 
                openntpd-6.8p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.3 | 1 
                 pixman-0.46.4 | 1 
                 rtl_433-25.02 | 1 
             sofia-sip-1.13.18 | 1 
             util-linux-2.41.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/470666d416ec108f44667dbc217cb945c24fabf4 |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/f7847d9ca1682dbbf5e60cc954870ea9f7e9cddc |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/071928da145e380c1d8074565c39b77feb4bca81 | ORPH
  aarch64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/63222b4206df095c0203a99a98b136724d285c00 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a3d2705545a2e0a0efc61d607c64334ec0acc979 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b0aeb473c6c1bc77f7ad2fa0b5fbce0196047f6f |     
loongarch64  |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/63967e5dfa25a95479fc52fe2b3ab9f7729c3473 |     
  aarch64    |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/1a08a45b6cdaab79fb19e14c50554638d07446ef | ORPH
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/c30c6719a0350370ebe3cfe262123727f4057734 | ORPH
    sh4      |      host-coreutils-9.10       | NOK | https://autobuild.buildroot.org/results/0b8a47a175f3d43c9887b46f436d0b3aaf8480b3 | ORPH
powerpc64le  |      libatomic_ops-7.10.0      | NOK | https://autobuild.buildroot.org/results/1e8bb070e5d45f0d01b238eb1840aef830dfa7ed | ORPH
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/596080cd0e5d9a27e552d06faacfcc2095b97b9a | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b8deca84a31ae626e8dc8cff7276d809d3f5c649 | ORPH
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/fe6a9d45b7a0362861ca644823568a93cf55c9d0 |     
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f7ed6ee7ef229ce872fd145484ffefcf7cecfa40 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0effccb0fafac6331a0606323c9cb4f2788a115b | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0c06867521fa85585cc3ab2b12ce4009e8fb0917 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a8076f81afca0e61330d196fa5080827ec6696ba | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/493b694497a7cfeb67b709f3be8a09096d43313b | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/6ebec64d85375e45a0a7af60df187051a5a98883 | ORPH
    arm      |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/1549b792649fa45addb991b094a65358b0ebbdc5 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/c2ecd02275c358aae01560bbf9594e5f43a34597 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/cb2f41861ed1aa5f4750b73595fea207e3e5349c |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/0976eb55e82f9e26752e01215885afe32d555bf7 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/43d0d014f31ae1a6ef8c202d34261dfbaf762bdb | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ba7d6f480638be8ce4760842b453776c17107315 |     
   mipsel    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/13a06504655912ee66167cecbeb8a9e5dbb181d8 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/f4dc2f59ce2583dd00a2cd4c05838fec6d771b41 | ORPH
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/5e00b0f9013e7c80fc46e06d2169c3368c7182fb |     
    i686     |       sofia-sip-1.13.18        | NOK | https://autobuild.buildroot.org/results/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/a800e60a140ba44f991079bca37d89ac55b17b5b |     
   x86_64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/7fd0da36e5c561ac0895b35eebfd054778bf8a03 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fcded56034d1c12531120a5cd2e212d9e2ae39ac |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/48ac9acbe67b4cc8797553345098b2b0d4609952 |     
    arm      |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/f791bd4e21cc8397bbca36139a5ffc2ab2fe590c |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c8280e4b79bb5a374fe69a236180880c64187ccf | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                 libpng-1.6.58 | 2 
                freerdp-2.11.8 | 1 
                     gzip-1.13 | 1 
               libunwind-1.8.1 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/05b84518ce94184f31902e48c850557742ef9e7a | ORPH
    i686     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/29cdb03707dd290193aad45bcda0a37fdedaeeda | ORPH
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/fd46ed2a06f6d5ef73791a52e7b1e368375f0a68 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/11290ad468dd485feeb51504affebd6557b74495 |     
  riscv64    |         libpng-1.6.58          | NOK | https://autobuild.buildroot.org/results/fcc49d9b5dba4aea1deb8f0ece6bf535e94657ff |     
  riscv64    |         libpng-1.6.58          | NOK | https://autobuild.buildroot.org/results/a8c1ca782f5ab2fd39e91bc801ea62ba82292563 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a248001ef5a6e0d3e873c286110f0ebb39b29af9 | ORPH
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/38b616f2f9c4b4a729f05881c81eaac699da146f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
