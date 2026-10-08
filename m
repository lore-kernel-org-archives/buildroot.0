Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF5ECA6007
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 03:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BCE81016;
	Thu,  8 Oct 2026 03:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdiKL3eqEHYn; Thu,  8 Oct 2026 03:23:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 39EDF8100C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791429789;
	b=JrB7w6uEO6ycIuDvnrM1Cs23G50S+oUScH55XdNYzIWdcuOHe6/ZeNEHYzn+Twe3NRoS
	 WM+dSeuGRh6TEneqBcNbuJaYQNt83vxUR4Jp7G0R3f1OG6o/NZslRG4HzLluP4MYcbKoC
	 /7k0xJuvGLt4yktYUfzIKrG/lobUC4Y480BcxA6reYVABNtwGCzxsWSNLTXfLc5RI8aJ2
	 ufvfVaMJObCa9CIEwp5cMxjjLaDNtjLyqJ96sOealNuPqi5VzgW6xzbZy+AdKhsXvaYz5
	 CFcpCro1BYSSUJKzizCrKa6PAKz/UBkJR9Uwk3uYhQecAnzFSgcQpyRBpU/LRPhILYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791429789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rRUWa47bdUJkou03HcszsbnXq+sR+A6uK6xYScPjaFc=;
	b=KCXRjH6RSFv7ZeciDr5kHZK4toPWCatgdzNy1f1aCswh22IOcz+gvUoanGf7yux7KK9K
	 NqQsJXkk3rI78q/Qd7stsXr4W4yA/ijizMNil87Nf6iZjgEG+I8aeVKJO4vaORLDVrEsZ
	 n0MC6XYiplxefVzaLG1CKZ1Sxt6XcpzyaTHIN0GsviuLMF2X4BcEzWmGWHJ5vABv29bKK
	 Q/vJrtr7OOtC/Da8PiESQW2fNc7vhY4Xk2OREjRTvd+AiJwLR2kpzRVvxIpkZocRIJTaI
	 hVADvEAGAJwqChbK/k+ovs7x+6mF4Gg/m90Aajv5A1WPq3HeI4zDMmObXLnkXwED12w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791429789;
	bh=rRUWa47bdUJkou03HcszsbnXq+sR+A6uK6xYScPjaFc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTo4KPfE/0SJUq3Y+Pd4o/Au5LCIcniXYFTgniBoDTO2kqi6eTJCZ9ixqstFoL0iB
	 hIoCO5S5BmqjGePGQE/DmjCPHRSY9/PocOEl8WSQUq89gGrNJ1pSBEem5vMQ1t4uvy
	 Qz0fG5NhsVw5HujmRBfG92NofL1A1kSfKsd5mWHWa6xQyQjD4GJMJ9faI3QTuachgk
	 +TxMDxUcwhf4g4Klo2zw0CjrA864cxcENCOzKWHVvP8JBWNtEAidqpTOwY/SRasfNe
	 cm2/j82OdDUmSdCar++KILz8+CvFiaQjfeUspHAUoftLUSI8cz1doTg/Wl+IdS4+LQ
	 coeUaBSH/BQ6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39EDF8100C;
	Thu,  8 Oct 2026 03:23:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C35317
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 03:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A754400C5
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 03:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdM3PFf88Pfz for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 03:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ADCBB400AA
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791429787;
 b=CLEdeYa8maqBq9fr5+a9LpjgKAmN9UusQXopUHBBqcLDfYUsJh80rRSn4YShiFh6++BE
 6sdJLHOqM+KigH0hSYIaTgtttGc+awNEpzLouCxVoyPnnwqvq51RbAVjMhHUG8C36JPN0
 tKMfHIse681NlxVw03urT3bSr1nH0p0ssEZU1tldWcFxvzU83k/nMmszMlNv2bIFgSKRv
 M/qfNalUhIuUnPCJZA02XxRIVpP8/MEGUm7nMhaZAorIj7xCJ+Abrf5+bl7ygGOKjStcT
 W3dbRUaXZ6TaHm8nuXB96ofqcZZKhFeTvigS6Zsd7QnHgJ0JHaj1+pGATzJFk/hZgQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791429787;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=AJ+kn2+xxMVYFjI7zAJFs0OW8jnvZuglmUvCW+abYkc=;
 b=byxkqfvL3GN9xEl/9mmyduzGXEFZMDYxpC16FGzF5GbV8NKndggkt8DKQtWePmm7PJ6i
 u1bBfl5Mou4wQpAxWCYRpJvemmb+nXn17ht8HN9tMZ62X8ea6hVvoc3ZHnKTBzDof6idl
 Kpc2IWg75N6O9tr7ck4PS4Xyb13e/rd2DpfGngWEK9wvETS3XVOcY7hLyno+IkKHBgSA+
 kJKLtagikU/Gbi1LgSbZsn2E41sDO1C3J75OwFEZAqh1gAZXgPKlwMOBtCjRiI8rowKZ6
 n20U9a2iy+efPXlAmEM2zyqAJdCfkf/Fjwz0AtMR73/NLRuZvpohVElh8yj7wfEGIig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oM6VezSG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oM6VezSG
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADCBB400AA
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 03:23:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so38607385e9.3
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791429783; x=1792034583; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AJ+kn2+xxMVYFjI7zAJFs0OW8jnvZuglmUvCW+abYkc=;
 b=oM6VezSGiY3BuXXOYZVYPfZjFuktiMkZ23Jf8Ar89qJhD8B86ibKMlna4VscnYvQci
 lbt64KSNRJr++jgwJGdc0LtX/NMmMFywbmTIx7uYSziiKC1LLKdpzxMr316vDRT7oMAJ
 5Mt2amqiQfuvXJWVzOEnhKVxtcvGFOwRenC5upOOcCVaCXd1n22ZxtxtHXIin9Sap2wD
 XyOXvQrG2YcBjZ+1cQVg5iNI6opApx42I/+2LjC6pxbsPIE1htX5SI4a8ar9hgmAWETG
 m3kxFUhicWpNB+vbgr/FI2djlTyJopWd7HsgbE2xZl4Eua90gX1JGrpW7xtERhOFHJPX
 HLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791429783; x=1792034583;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=AJ+kn2+xxMVYFjI7zAJFs0OW8jnvZuglmUvCW+abYkc=;
 b=EJQFSPp9XzEUO1Ttt70SnqRjzby6I7+EwgXXcNgKWx1Crd/yRWrnQEu2WvOSkovA5h
 6h+gQ9w1F2gsC5ud/021VWg/jVXtfYUGFjGDrbvchdLOi7GOiKDKvBUpnmNNckjvjuWj
 Q7L5WpFq9jOHi5s8S1WjyJ+q+3eOVQf9lxdRXDgZxmjo7HBIAPOXK3WbOtmhJEnvBfGe
 3nuP3tKEmUszV6faIb32atIHZqlLUYOp86CFzwquQBTqVKs7LGx/ItglTpJu22asuEJn
 ercanGYGpZ8ZMMJinOtcvh3S/ag3/1dZ+ZePQn3f02I7H4MufPOoXSNtH7YL9hoYaJvR
 6tpg==
X-Gm-Message-State: AFuF++kmaVbpmDA6Zig0vSnDOkxNIpAQJ0t34dphRbDRA+GCBu8cnHIN
 YqUxfE8ctJbcoSkpf2ADvE/6GcsBy3ddA8h8I1caIyqqNaYZmfPnuS8hpGix9e+I
X-Gm-Gg: AYBFou0nhS5Z6Bud0VVcNFgZPDt75Z8ehjesvGe3471U4+jv52yTEUjAYKiF8D6oZqY
 dWEHJ3MSzc1n5jmi+hwe2bkD/nI/phPdGnN5XSomYaZ3WPtjEPb7jBITRM3PN0L3lokUuQfkcG0
 wSFP4EdeGwpko2O6j0C7wfWZ5IeXTtLP6oriuxHY28BcM7h9qUQAd7TcyTj6AXFsOME9Pq0D5Zd
 bM7lwgTKKsa5QlT8823iKqUUbX78iJlYst0DMN1c9/nNBXhikUNcYaL+uk9FiiCDdMEzUAseNVv
 pXSTohMXgjL0ybWSkbaYwEAdw1aBTD2AHE2ce837KUZPGTcdS64mGEt4EHq7jNsmhuvefDN76qq
 mFXo4wck1QKRm6p8WRUhTIdTuuAJk2lSc79YrMHkd+QtsVgcNi2yo17d2jz4oNkrOi4Ej22eEJf
 tC9C3OztMKwyh0nnltI/dVxZ0ofaKsPcXFq2bN0PHKLgS1tnXkPteoJc9BmncgvZJeUK+uQiM5c
 Q==
X-Received: by 2002:a05:600c:3f0c:b0:4a0:251c:fa72 with SMTP id
 5b1f17b1804b1-4a1803038damr71657535e9.11.1791429783215; 
 Wed, 07 Oct 2026 20:23:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1803040cbsm62455805e9.4.2026.10.07.20.23.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 20:23:02 -0700 (PDT)
Message-ID: <6ac70c96.63afbf66.301c6.32c0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 08 Oct 2026 03:23:02 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-07
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

Autobuild statistics for 2026-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  8  |  0  | 10  |
  2026.05.x  |  1  |  2  |  0  |  3  |
  2026.08.x  |  1  |  2  |  0  |  3  |
    master   | 19  | 36  |  0  | 55  |

Classification of failures by reason for master
-----------------------------------------------

host-python-types-psutil-7.... | 4 
      freeradius-server-3.2.10 | 3 
                 libclc-23.1.2 | 3 
              cryptsetup-2.8.8 | 2 
            18xx-ti-utils-R8.8 | 1 
                   atop-2.13.0 | 1 
          cloudflared-2026.6.1 | 1 
              erlang-26.2.5.21 | 1 
              execline-2.9.6.1 | 1 
  gobject-introspection-1.86.0 | 1 
                   gvfs-1.57.2 | 1 
host-google-breakpad-f49c2f... | 1 
              host-rust-1.98.1 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
libfutils-c326ce0cc2a735438... | 1 
               madplay-0.15.2b | 1 
                  mupdf-1.23.9 | 1 
                    ne10-1.2.1 | 1 
               nushell-0.108.0 | 1 
                openntpd-6.8p1 | 1 
                  prboom-2.5.0 | 1 
                rdma-core-62.0 | 1 
                    sbctl-0.18 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/f4a3dcffb8d70daf9c4b24cf74fae0ef8b9bd6dd |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/48efa89a9e4ba4f311173883017cb73a62316665 |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/35a1aedfdf925f653a0c75a7323f6bae25995233 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/76cc8b7394908bbd33a5419f90e94698bca6dd36 |     
powerpc64le  |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/973d01eb008727f478adb04f78a4586590c5c2dd |     
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/4294e24f575c883151542114bc4ff3bf951273e4 |     
  aarch64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/10ac133a088f91365e6fbd7de58bf0f898e90008 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/012658b2b2f373ffe76aa16b8929ecf9e59368ba |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/a3baf670de7814332b7888ed09e3821274307d26 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/7456c73e1755c974eef708ba835c0b954d83200e |     
    sh4      |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/fbcb11ca175d4a92099a3e8c9dc6f9cf4710bcd9 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/f7c0c032f29f63fd466305c8441428bd614b929e | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/7eaf90f57858c1680079e3a2cf57a0c726bac635 |     
  riscv64    | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/6b6143d564084487db893008f358a6cce4e1449b |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/4a88d4297cad54cd4884e4696f794acedc38fc54 |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/71379f94f21befb462319b0bcae4d3ac0c1078ae |     
  aarch64    | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/fc73fc2f96e5116b62646a06d93bf03b83c001a2 |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/0b78d2d2ba124eb637a30bdf7bdc06506e2d7076 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/9ff87e131c21080ee162377e0a9b19bfb7793e78 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7acd34650df31bf6d409e63cd2bc547c0d71e5bc |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/85d3d46eda284f55cd9ae62968a99d2146f972dc |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/d73b063f29ffe8a66e0e542a6a31a0ceaefc9d85 |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/89a884458456170b66f5170b3733787326b87f0f |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/25bfd4775bc0b5be3d3a09e777939b5a7646d0c7 |     
    arm      | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/73446ebee6d48e298dd7c0a76417a69a00601970 |     
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/1cca07605ca02cdb29ed98618ebcdc9d99783303 | ORPH
    i686     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/fa0d6745401565aca24dfd5179241e777c4868fe |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/2ec8bab65a1a8beb0088c820bf7f5af2b52fd425 |     
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/5f545436c113cc94d5ee2268fa80945d2f99beea | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/e37174c57204ad0b049d68eda0c0095e218eb849 | ORPH
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/766442d522d87fc72899eaf6f5f937dc9eeec159 | ORPH
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/78beb837c45d1ac83050af924f7da5a8984c3d09 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/5f05776d5258fd3feadbbd7cda34e0b582a28add | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/623e50f2d745cd32a5e5e30b69053b117f3141e6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/13e2d98a28a1510c17b09ca586a1b1917fe90748 |     
    i586     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/3730703d846a2fb2ee3438f0d953adecfdc43968 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              erlang-26.2.5.21 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/1490f1937a3ead28eb3ebd9e272cc03bcfca9936 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/66257e6014b8885a636a7f15bc0eb66c41a430e5 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  ffmpeg-6.1.5 | 1 
            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/57812a51a83ee554b83a97210ae1903ad8295449 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/74b927fcf468310a218d14da1fa03c57e81e630b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
            18xx-ti-utils-R8.8 | 1 
             dahdi-linux-3.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
            host-skopeo-1.18.0 | 1 
                   iotools-1.8 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/7b8ac7f0d2e0fab58b87b60c625b670382fe7221 |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b43af4fa173c9df42c27feb8305381cc1e2946b1 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/deeea45c9f0ff2f3f2ca85a9ade0e5bdc034e7a7 | ORPH
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/6e012ceb51e447ac63a67d04e0838ce4366d8811 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/2d18674ca95e22fb145019b3ad503c79c4b91f02 |     
    i686     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/8f863a90b8b4af9faedbfe042498889efa8615b1 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/d9cb0a1437d304fb69bd13c538a6d484a443327e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dfb852a1cca7e12d1dc297d93b0675f570db711e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
