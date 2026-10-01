Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C566CA5FC4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 03:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8535C80F4E;
	Thu,  1 Oct 2026 03:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPGgsO5yppRD; Thu,  1 Oct 2026 03:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 58DC180E31
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790824962;
	b=JKFHMbpqYr2kObHoUVCqneuqLkpfea47aPQjAzcjaJvEpEre+pIl+XDRZ5Naw9y8Q4tA
	 VuPsK1JK7RYXxDPPvlTMDdia3ELKfHeNmQgAcGTwWyETmKvYS8VUYIbfn/pV0yw/NfuZr
	 JeyadyGkk723WUhjpuu5DxaUrRcvbdfj1rzJDwyDdKRRzoSBKel9TAsaGAom9oNjl6vLz
	 DZZNTGNM2JuWmPjZb5/PEVHJL/Jomf5g28Nl5SMiq24KIpcXQEy+5jtFc1KmRQB9HAfrL
	 UxucWerczQcKB22rCBBfQAt/kVkN2jNuk9qmdwuWVoxY6dt5O4bKpKT+uJhpQwHRdKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790824962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qApceL711J+WPd17pE2CtXEyU28rRkuxgDO+NaKoGLA=;
	b=hEo/8MVJ743NOXBI3Q9UTwa7M8aBXsLrxAioRJ8jFPJOkIiK02tjUG5GDC5dR5Z0R5ZF
	 HdjNSzQh6m9SdYAbgSx2/skaQqMRIpjFlS+sK03jrFF1FyiaJEH/vLbLTdSPJd+VEAr3V
	 VZIPA3KCcr2BeKqXBayOBIrshIXags4Wg4ZHBzolsavibmAi7sgY+lBPiEqTV4MSm7gWW
	 aiLN8Y1wb5tbEzRCPBRPF7sTzMZYuo1GoKccsW7Sy7h4WLI5XdwHpzeCzsVhlo9JK2VHA
	 1cqBLTQu93pkGqwOR/m6t/JFSUKTjmrtXeKKMcTOqtonD+5vVYnwG8Vp3RMn85YX/IA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKtXwIa5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790824962;
	bh=qApceL711J+WPd17pE2CtXEyU28rRkuxgDO+NaKoGLA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kZNiiYiTCpHUEqxrKWB4fCq9cImZ7GS4r+isvOnlFObZzAzcxSsZIxzbBJhnrPcws
	 P15GB+0fcuOmpiZg9e03LyZcYTbY3ZW/h+SCnYub+rsw0gbAO2DY4yQAIjwy+KMAl5
	 CpJMothnKv3cYxHN7c4gZWlU3joOfv0kyVLx/35ekhpmPR62brhavx0ltenN12sYPG
	 E/xYblDyyUAWArgDLTEKSc8/vtklfP9eNU24R5nWLLRO/EjTR+5THpvY5TR1H0Q4gJ
	 +i9fNfyZK59zfsEcIMg113IGbVEhSP59RyyCU7YAa4nKd70Yh1TsYzPJULMvDQp+lU
	 hMXqnsHOzihUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DC180E31;
	Thu,  1 Oct 2026 03:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3354F417
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 03:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24A1F80D63
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 03:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGxk1IuGmLwO for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 03:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9404780C8F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790824959;
 b=SHhYUaicrws1aHwiSDJWqdBL9kDkOG6lgJ9DrQTXVt0qspMmvVVaFr9yh+kyytnwfsTF
 xIQ+Kxk8xtr2yzgpHWCDAhIBUj0VD2gxN1ylGgj+jSZm8VrSc8GBT+NiUPjJ9B8Snwy9f
 5QXCNJPO1Mnk3Zh4a1LfFIuXqQH0sLqgWpAD0uG6E7lC7CBlNM0lGidKkBpK2hbqbyErm
 jguR1xuIF0Fhh/A+/irdqbYgtXKEVN2R96sKzSpaGEzVt4XgUAc+ai2d/IlODn9uH8iU4
 /QcAR1xGEqz9Ee5x8ruRXV81BZgN8XbLOMVFwAQk2RcHs3pEgTuWaXIdOr0zURmIXzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790824959;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=B+EEdnuSeCjzNYzphO49ppSPqrNMswgPNpnPAfAckBM=;
 b=jw9nOU3rW9eFc9pO+KIs37r9uzPsFCmak2wxoTn902zcP6ReZHPBv0ot942fS/sXzF5i
 84Y4nIOphBfmPeW1dWLzE+0hrMe/y9RgQ+jeOcJSmsSClq7qEcCaCKhaTKrjWEOeWqYxV
 mP2YlgHHLgbhAwMeSgAjgicridOAOmx6nu2YmdHwfCXOqxx/GlG3SDueIIoGm8wYaxqH4
 Od5XqP6XjG3+wobf+bgSR9dwpyxRwdBzpCwUwx7uMClV2+7R4xDr2NMqVQrenX0D3pIwj
 to6UXghDk7m25kB0Wc6Ltg8e6aubF9MAVN4SpTitcsNDcnITETLT11kq59Vhvym2IOQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dKtXwIa5; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=buildroot.notifications@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dKtXwIa5
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9404780C8F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 03:22:38 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4885a1480a2so3562956f8f.3
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790824956; x=1791429756; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=B+EEdnuSeCjzNYzphO49ppSPqrNMswgPNpnPAfAckBM=;
 b=dKtXwIa5zj7iiDMvLd5C9uyaoPfZsPUIK6aNEIMnlvkKxOXqn05EG4K1N1MLc8G2nw
 aeoBhRBTWOBc7l4VDlF9c/6rGPorEUJslXJol3RayJ5Sbxwtp19PKTY0fIdZQBWb90eA
 B2CFuoZY563nbnvhyUPRgDip3iij0heDjpTVzqJ7kjphtmPrY+uFrKE6zWA1I2QEKtZa
 TdQaRWJ/Kbt8oZkz/kwRppaEilCUJZ/pTrMI9GPTIo5qzHC5msj+mvkyaGpgsw9UIVH7
 nZC9eDhaIPNlpJcx8dJX7qHBW7b/DA8DkaNXf2Q6t1wdlzaX3ib5YBb6IoVB8RCXMvmW
 nb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790824956; x=1791429756;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=B+EEdnuSeCjzNYzphO49ppSPqrNMswgPNpnPAfAckBM=;
 b=C9Gvwji7TZWbiElMhDcxOHTvJOmWTQjn5D2Af54rfSY00CVSeQ4eXDNuOV8Fl8f0yc
 sQ5tKGhZ38xgUGeoAbjpHREda0Pjr/bQVjs61/skklqKnvw9vodDZyADNc3Xs5KyZwEJ
 FaMKomb7rYY2fNdx20qIzBS10/C0da0xhXJwZc8p0nq4oVmujVJNliqRlPY6L7A5OODY
 ro8SOBYS0uQuje9z/2/KNIcd7DVFfHf3/B5on36Zl7d/ecew6OAUaw0HSec9tZEsKC8I
 aM7uyXx9MbAhLKD3ivbrC5MmKPJURNyUdn5Xacee3OX2GJHOho/BiNv8WD+Sh09mB5gq
 DEYQ==
X-Gm-Message-State: AFuF++nPBlrrIC4D+U3ef/l5BoalSC1GGYBNbCMB+ngLNP/QC9qg2/Zp
 sj+/nTu4adz/nhkerA/oBNBty7wJpaOjJA7/mg10yJzHGLv9FStsbbdECjrVN9dy
X-Gm-Gg: AYBFou1UbZlcjY1h31BnxqhIw/1q89K8YV//D/ucq3yfvzpv/Mk2vSB67PsGVtcq0yJ
 RQMt1jitVL+tskQepznX6H/5F7kygfNhDQv3JngLLSl4KEIYesQUXvA7qxymyI9IVooA+2JisFd
 RlH1QbHo1yb8CnWunT+8asbiV7XruMhQ/GL+Q0Ess3NiBw9rxuB05tt9jEjSv1MX66WxAd1rG5N
 650gRvolZxkG4jtUWY+TVkgq4RLgC5ufmtxEjnNWLFlE4T3SDhV1ow+1alZJeNVu0lKC16HIJr7
 Z+og/O00j9iW62JZswflN96+ywVHiD3aYrxknT3Zh8dJeJ0I2NDBYdl56hMBZMqnU0t9/BFFAcd
 fVNsdgAMN6Mq9wedYp1FB7FZBQi+AmgcOdGDb9wdmD1P+j7bfaCca6cYPYKhbvS91dsQUe7/oML
 o1jbrK2nUUivsh3Ca0Pqy2wqz6uFJpO2RnHbWvT1DYeo4foMiJEMSChPKj7gxPVb6KjP0WSiF6F
 hWAZqGTQQiU
X-Received: by 2002:a05:600c:8b88:b0:49f:fefa:cfcd with SMTP id
 5b1f17b1804b1-4a01adddf75mr50072155e9.5.1790824956081; 
 Wed, 30 Sep 2026 20:22:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01fa153f1sm28083545e9.0.2026.09.30.20.22.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 20:22:35 -0700 (PDT)
Message-ID: <6abdd1fb.8fb0a6ce.33fde2.43ff@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 01 Oct 2026 03:22:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-30
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

Autobuild statistics for 2026-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2026.05.x  |  0  |  5  |  0  |  5  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 18  | 41  |  1  | 60  |

Classification of failures by reason for master
-----------------------------------------------

                 libclc-23.1.2 | 7 
     s6-portable-utils-2.3.0.4 | 3 
             alsa-lib-1.2.16.1 | 2 
              erlang-26.2.5.21 | 2 
   openvmtools-11.3.5-18557794 | 2 
              tailscale-1.78.1 | 2 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                    ccid-1.5.2 | 1 
             docker-cli-28.5.2 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                  ffmpeg-6.1.5 | 1 
      freeradius-server-3.2.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.86.0 | 1 
         host-gcc-final-15.3.0 | 1 
host-google-breakpad-f49c2f... | 1 
            host-libtool-2.5.4 | 1 
           igh-ethercat-1.6.12 | 1 
                libcurl-8.22.0 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-tools | 1 
                netdata-1.37.1 | 1 
            python-iwlib-1.7.0 | 1 
                        qprint | 1 
                   s6-2.13.1.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
                    szip-2.1.1 | 1 
           uboot-tools-2026.07 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/d9535c1db6feeb5d30c1a33e348900155855c042 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/9f44fc690b0a107347927cabdf9a948f969b6749 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/46f96c20506075915b319e8bb7291248c288ea46 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/6fee2a2638535ab74b443a3114713aa5fcd25eec |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/87c30f3496e80ef1640079ab4f59fd06f20af151 | ORPH
    i686     |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/ce07e25414d79345742d81d198f478f56a037caf |     
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/aea0c9b437d49efbb86de67a5c98c269feb45439 | ORPH
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/695b54b415189cb75936400e45974b309eac178e |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/ece1e6edf92c82b27dc7b21b561086ae2400ed26 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/e8c70010cd2124f3639a1e0995e7d62d645a809d |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/848bcf3fad2adcfcd3d591486cfe1cca7d9c3047 | ORPH
    mips     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/a59cce2c2ddb4c06f5687f1fdea0494b0d6c7e7d | ORPH
powerpc64le  |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/2222cbbfe3d379285f6eddba58489e4016e89eb3 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/252090e76ce23957fbfeb3ebf62671d13c3aaa42 |     
  riscv64    |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/e24b3a94f52c539e1df6bfdcd7bc3559ef8198d9 | ORPH
    i686     |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/5c48b38fba102c38630e546eeea05cf206eb9e53 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/c9326d4b1935cf904f3de8bf37a245073189c103 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/44dd0c1ae31cfb596738f526ff5b36948bb70c10 |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/1bb4725d77ba2de56043a13ca707fb83654eb179 |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/8099087dcbf2b2b549c7c51e7bcfc2f4f4331afd |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/6514f7b1bf4015b03c6ae200195dfb87bbc9b2df |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/239b87742b799a79bdcd615e70348c2b653ac857 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/282c89b29855d288921978640bb12f2e6882e761 |     
loongarch64  |         libcurl-8.22.0         | NOK | https://autobuild.buildroot.org/results/bb6e6267bc2c1ebfd6480e7efaec8c0801f9a678 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/8bd34129c84783112086f892693e1d74361fa5a2 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/52b8c7a2a424ea99f55c5f8f44d709fab8a68a3a | ORPH
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/057aaeca540fa2f675514b048764d86e817f18b1 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f89ebdceb6cce6ed18d5bc79cb2b370d213214de |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ec3ba55af7f909cc592df22640ab8a0d403fd3a0 |     
  riscv64    |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/585db12d1828345f27e567bb564a0c9b909ee4ba |     
    sh4a     |             qprint             | TIM | https://autobuild.buildroot.org/results/66869764fdbc3e8ebdc4d50cda11a045a769703f |     
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/2744354c03187a4761ae502659479e5032107505 |     
   x86_64    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/fbaa92f4820db37f343cfe4637a78cc6ec1b8b99 |     
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/3217ebdb6c3a6efe2bd1aa9fbe8f116e43aed858 |     
powerpc64le  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/68efa020b4d78856248776eb239ddfcf43a64688 |     
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/30effd9f0ca214f78bdfa167080d0df9c3dda2dd |     
  mips64el   |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/6ca21db11b8057e4cd0a88666300055c005d9218 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/d06bbacef7ab0b34a66af567e17a628d3260f4fa |     
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/d7ce81963fc0922adb19a7f4b66af67a740cad38 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/775bc45f30e7ce70ce684a6c5b2b4749a7a51007 | ORPH
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/40858c28921fc33ac74871728c49397156d6c610 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                 lcdproc-0.5.9 | 1 
      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/78fb448bcd4ebe892dbee8bba3c09dc13f630217 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a539ce1826e88bd1e25c5d842649032ac6b966d6 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.4 | 1 
                      fio-3.41 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bceea7dfc82ca9bc7d13e33471ffe72efda20a2c | ORPH
  riscv64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/31cd2875b076df27910414553a5aabfae683336a | ORPH
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/3d7a68fc8605338cea3b5a80b9785f2188adb1ff |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/f187a62a53057a3dbdeba5b22012c7bd171be17f |     
   x86_64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/d9c674e701a82594191e2e66f6a58e67d3a41cc6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 2 
             python-lxml-5.3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/967c4e5dade7fabfe2a67703a6779c6eb53997a4 |     
    i586     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/7daede3073b535e9bcd006fad8d8772092383af7 |     
    i686     |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/a97182717cf9b55ffab91f4b3a25adbc195dd4f1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
