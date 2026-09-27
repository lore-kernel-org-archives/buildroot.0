Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F9C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 03:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1459A405F0;
	Sun, 27 Sep 2026 03:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYb4F0mqTzoT; Sun, 27 Sep 2026 03:32:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E1E8740621
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790479949;
	b=mKPyjU5xvyRCM0axfz2Nl7UQkMZWWj2pGjq6KK/m4qWQ9mHnF52YXm6F17wudmKs1RcQ
	 AlelyemssLzjha/SQG9kkmTfP8BeV5cd1835EhUe+WEFB8TI7ZNehcExD5zp/UbIDozs3
	 pXEu7lGZhgWMrp7S/jSKy+Fnn4ep54OZS61dWO/xMojOb8L0ObQhExUfl5HdVv14+3hFz
	 jxqDgyHzn9qNgyoYmj+FNRd0pA3ngFH8YahtB8jivwu7CsJOsgyF42P4I2ZzWQfCZ3y9c
	 q7gbaOMENgRAnx4LmF7epTmVuVyOJoLha87uWMk4b4G1acsa6iCk0COk9RX+WRC9Ngg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790479949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s2pkB38PfDq9mBzD+FBy4oMsOKTknBXHQBWDuG+IH7Q=;
	b=EGrWZ9NyDVtc6/06QNmMRV580XGgGtKhEelEgO3s58KnRSxU0BlB80281hRk+Pq5CQZN
	 7tZOEGt8sLAl/0UlTQ9wuRVzWi1XnmnXPXPKF6crgHdePg2l4/Ovlsiv9spKm7mqDXeS0
	 IXWrFfzwYWFafuw38vnmZpVGLi7xZ855lkXKwYz3aYd2SEuU+l7/BylPDA6Y4t2mJh7rX
	 TsxuTGtuHM17oC6zxuHo2IoXtUXiwAUWdPtNw1bJGidIcaZwIqFskLgf0H41ko/iG3sv7
	 pwjxgOw9mz3zTIGwg0th+/8efQM2LcklSa++263JzkDfrqOQihJ1TNvLHHfztfgrDoQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFi3JQap;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790479949;
	bh=s2pkB38PfDq9mBzD+FBy4oMsOKTknBXHQBWDuG+IH7Q=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LoY4VC3LADsxSi3gtf72Md4031Vq1plBl/2g07Ht8wUv9E7xQBw18duE/v7dHtBm0
	 Z4t0Zsk24ieUw/wXHxes6koFyu7gTp/opJmYSxTwPHD/7JOQbpeCDvdgiHagJ10+7q
	 3KO3wxAw9Bp5GlNbtEAjGi+X9eadLFY4lJTRD/qj0XRxMSDFU64medZVWYq5rfgtxW
	 lRIXHCiiDKUsYeE8KbMYcurfTkZhZdEchIcxBq4t01lVOpAuwGMZBhoamCkeAnjmb7
	 5fFch6nINaomAv6KtEY9o+S+3PFFQBmBueu/eAodW9/o78EFiZJYTNW26mAOYhi8q7
	 il5M54whhwSOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E8740621;
	Sun, 27 Sep 2026 03:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66848194
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 03:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C08140621
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 03:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pv2pswqS_O2a for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 03:32:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AF788405F0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::15"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790479946;
 b=ahycqxvxnPKvAA5Fv+SKkwag4SZJwekSlYFYR++aYO2p4pNQiMgbQoaOrvNs6ZnlEA7d
 2bLUVoBxkHGIbBrb08Eqe20r3g/Xlda/w+7h3ygBZdJ0sdyTBWaDr6PLPpw4pWu7xit6z
 4Bfy9cz7z88OFwTOSP6EzR9omDRranIBrTGDT+tu1pds3mwsQtebu739/s4tVtUZwy/Cj
 NVxKE8pltGxzmhzjGgaRsmPCs/A1l8e7I+1XQjaKelceUZVf1XEtAyoEIA89ju6gBfWWw
 qtKOaEA3TRtD8KKM5cwS7BUhWP8MigSbQRzDhZtEWMa16/NbP/XAin2wj6zylma1NSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790479946;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=tuJ8h2anVAHQUQx2dfVDInSOGdMpNK65C15ZCPytN90=;
 b=EXIPo/NaZ/gIcf5Z3D0Y9rGt/3UCf0MByzxso3fDRcj5zbOrUouApIenrP3x9iuD1f04
 nGMQo8MsMaor/G4hYS3E7FJg42TbwX8SdPCpY1lduHH/LALtA2QaeKqJz1/fieeLDPA5X
 C7BKdANZx9hSzFFgLYBq+wiy+LkquKL2J4xzmkktl9KibddUCZUNLORLLMkZwlmdDYhJ4
 MDZiWBg5pwF12Ppt04OpIYfjxpSLoUhoKXFQTwbTgsTP41SiHey09uKF261lWQdCjgxuP
 KiQkmbjNKsqwS+MoICZk/gEW079+lh8w8A+kj2+c1qzzw1WFIV4z5JuNe8v2VCUIWdQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EFi3JQap; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::15"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::15; helo=mail-wr2-x15.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EFi3JQap
Received: from mail-wr2-x15.google.com (mail-wr2-x15.google.com
 [IPv6:2a00:1450:4864:30::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF788405F0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 03:32:25 +0000 (UTC)
Received: by mail-wr2-x15.google.com with SMTP id
 ffacd0b85a97d-488780459e2so2009732f8f.2
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790479943; x=1791084743; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=tuJ8h2anVAHQUQx2dfVDInSOGdMpNK65C15ZCPytN90=;
 b=EFi3JQapcwc7Sxoyvltf/cFmWaXnWOGJeekT3xSmN0B3nhJNBmSPMxOwySOijK+onT
 UtPD646ebns5VpEEbtGsqJm6wFk6r4pENXeHsayIj7kNWwhpPPJtDoyMGZhmSkaq5Aen
 v9n3e+jSFs6wXUK9ME1YqppnIVgF6+dkeuFP+o3XEarwevCAebPt9ClUeB8eVmKmaZGW
 RTNkdnU/SDur5Rnh7St9Ou+qyW6/Q8QVecLAtUcxMuzRBTVhNU3Y5ww49F2DZKDRGxVi
 2UjdZXvSODYCkXDqWm4B2wakajmK/pLluLo5BpUZbnZRiZB9Qnkh4uLN6bmovMDRZ7Ic
 LiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790479943; x=1791084743;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tuJ8h2anVAHQUQx2dfVDInSOGdMpNK65C15ZCPytN90=;
 b=gLLxcPqb0IOJunzeYNn1IV08JWDAbArWwgTpaK615iyoIKYAju1y3Sqebnbd0Wt2Im
 QWPrsjr5NhWiDq/tM8zJdOwyTzs6RgSeX0DzquuHL9/DY48jvwBJLwvu/cnrz9xL0ft4
 0GylkTN5pGWVO69t7FoLGcKYFe3OPvkkiRHZxZtd5YG0D6oDUOM3JbqYMzTA3hMB7e5y
 hzD17bJhc/rMjDQ5csEGCgRvBFsGPVI/lF1Xhvr76+tCfiGDUUH2JvkDFqunDqRqaDW3
 7bSdHHcVuXoQxSAAbpHCkkEiEtL4LGeNxtTPj3M1w9/9fPVTrq3A+P8SJpV9GfxWDF9F
 C4Iw==
X-Gm-Message-State: AFq9FYJQPxBDnbZ0qeaXoCgd3lv9CbpMaIwxCoovuU4s4Y1zVQDqL+yF
 JrbZqfQAWdjiOqhVRBoCWCAhQfqyzWGbahDQvZKewYXXCa4MO4byJlIrYXbF3nm6
X-Gm-Gg: AYBFou1RQ8VKOeVytD0WUy2Xhiv7ZhsQGxNNYbbFFA09vJkSxMY/TiyDdCrWkOsV9wS
 Z/hG/RoKJyg0Fw0GJJ+SKKVS8uKelO4cnIvtUHhusc5nY+nLSrFMQ19M2XRjojmG141JFNBoQYg
 4IOZwi/T74WXrHU9FD7tladkUgKtIlfhfKFwS/ZkJrXA1glfGhffBsvCtp/kVbL1J9TNoysmpvO
 d7j33+kzuX9X6K5ldWyqynfdFx5scPeoWHCWcU9dwlkN3pxNIuTChfiPrIIPru5Zux5AMwi1zmG
 3RT1Sr6g3CX6Ko/ov6WiV+0p1siY0LS8VEOWtzFOWXwLupJa1FPWVwXXDdZSmP5V+SZX4ZdPMPW
 w4X904nKzWf3P+r+8hskHNI8LDarloOsYCddwNVQqpSQ17p7UyFTuX14NZ4yn4lt8b7xG5pe1Ga
 /X2qNxHPDydIudjp4sB8mU8Q2Iy6FjZA0FLxvntZoX1povZnbSZRLdgPrIM976j/tcIXWkmmiEU
 8E=
X-Received: by 2002:a5d:59c9:0:b0:488:8232:d16e with SMTP id
 ffacd0b85a97d-4888232d398mr9320616f8f.45.1790479943215; 
 Sat, 26 Sep 2026 20:32:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a648895sm17529101f8f.28.2026.09.26.20.32.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 20:32:22 -0700 (PDT)
Message-ID: <6ab88e46.f8441ae9.1a439b.7f97@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 27 Sep 2026 03:32:22 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-26
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

Autobuild statistics for 2026-09-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2026.05.x  |  2  |  1  |  0  |  3  |
  2026.08.x  |  0  |  1  |  0  |  1  |
    master   | 30  | 44  |  0  | 74  |

Classification of failures by reason for master
-----------------------------------------------

            igd2-for-linux-2.2 | 4 
                 libclc-23.1.2 | 3 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202602 | 2 
                host-wine-11.0 | 2 
                   perl-5.42.3 | 2 
           uboot-tools-2026.07 | 2 
          cloudflared-2026.6.1 | 1 
              cryptsetup-2.8.8 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.5 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  gnupg-1.4.23 | 1 
                   gvfs-1.57.2 | 1 
                 haproxy-3.4.4 | 1 
            host-mfgtools-0.02 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
                ipmiutil-3.1.9 | 1 
              libsodium-1.0.22 | 1 
                libsoup3-3.7.3 | 1 
                   linux-tools | 1 
                moarvm-2024.12 | 1 
                 nettest-2.1.3 | 1 
           oath-toolkit-2.6.14 | 1 
                 openmpi-4.1.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                  prboom-2.5.0 | 1 
                rdma-core-62.0 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                 rtptools-1.22 | 1 
            timescaledb-2.28.3 | 1 
            vorbis-tools-1.4.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/b9c7e67961d373393322cf05105ac370f787bf72 |     
  aarch64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/1be81be5ee9f9ade5e79a1247f4fe0ec448af408 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/178edadf40dcc97d8383af25755c85abffc0b518 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9972a656c3974c71815eb4ab83f1bef752eeaeb5 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/95346a668505732ef114a4fdf0b4161ac1be9db8 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9b7ad718ad0f1b7d71e6f7b9cd7ab43fa2552b10 |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/19d164d135b73744f7225893d9fbc38ac978ab40 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/281288ca50e321a3af3ccfb4a015d5cab0ec67b6 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8307556f89bbbce7c66618536d9e603d07b44390 | ORPH
    hppa     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/4bd475948fc3e0985635ff84385e652d4da00356 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/d1f17caef9e454e6b4a9a79a50df8368b410f3c6 | ORPH
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/071f15009c1d819641a40a2cfaf2a395663669ea |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/9d96d637c2b83a56d94a7c26ff311d34182cfd6e |     
  mips64el   | host-riscv-isa-sim-00dfa28c... | NOK | https://autobuild.buildroot.org/results/2dd890374cfae21380d59e1c41b89e52367627b8 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/19edd696f15e0129d9ae9bc61c68dd6be743b705 |     
    i586     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/8ef4017edc07fd833cd064f66f1c6558288dc8a0 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/da076427650c32bb7881b8ea49cd58203378d37f |     
  riscv64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/571262f40047dcfc1ad703463552f41e43993a5e |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/36ea1f6ba6081f1ea4532eb4b1c7c3d9b547884b |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7e9da1ab4a0423853034d0946e172b0643d9d24e |     
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/c866f8943e7a06848ade45698d8fced1dd56107e | ORPH
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/e709332578c2e757f73b883e4fcccd7c8c3cf722 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/a74129055c743e53d7b306ffd4fb4c26ca5ce9c7 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/c30f9a979dd376e1e5c9b5eba4365bf9a578e797 |     
    i686     |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/0ee36fb0a6cdc48eccffb8f54a22cb99c73eb891 |     
    i686     |         libsoup3-3.7.3         | NOK | https://autobuild.buildroot.org/results/4effebe5fc12146749e704dd56f695363cc8fbc3 |     
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9718c0eee8a827cd0ed66cbc4c692385adbd8914 | ORPH
  mips64el   |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/98552cc4a82cf4908c0755296f8176fdb488a5f2 |     
    i586     |         nettest-2.1.3          | NOK | https://autobuild.buildroot.org/results/d04f770538412bee77851142ee007f2ff107e0ec |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/079cad853b89c6c6fc4f457aa8fcaf8571c4c38b |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/3e6fa19a5777a9ad8444f04b2efc62c00e46b9ad |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f20ed4a4df5f64e723aa43eff38bada5d8200441 |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/16ea0fe1bea5d1e3fd89d307aaa93854f0f3082b | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/101b989a530e1dc6095e61504ab20f5ad33073b4 |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f19a2930bec25819b4996c433ad7ad8c29414f05 |     
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/79f31bed32d0e58b01085c58bb7b7a6446a0b7da | ORPH
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/f49059f9ae44b2d362cb9d4ccee2d2938676ce85 |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/3fa6591b13db98eabc4bd88d91cfe7c3870fb7af |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/54ff24fcb6e9b52a6d5f8de54824df13126f30ca | ORPH
    i686     |       timescaledb-2.28.3       | NOK | https://autobuild.buildroot.org/results/d6b0d5fc5a8573c75650eb4315458ecfc2214c84 |     
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/45b297d3e7abab36b0827dc191e57c86315defad | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/819a8be547a6f1ac3089b003c0be66d43aaa3764 | ORPH
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/3bd75c1a9120890ca0dd02285872a59ede549108 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/28c9ff805c66391c83fc7d6182974f30507ca8c5 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3c6cd5bfe8aea062af11cf50e1a614ca56965c7a |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/dcee2b53294c09992dada40813880dab25611391 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                freerdp-2.11.8 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/3c6b1523415c3747b3715d88cf0c8437535c657c | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/bec74c9e50c6151766b13f3523403444264400a8 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ce6d0c0a9413ac13d1f05d2b3928d5d27445ae3f |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6f32de58ef64f2b31f2361e37991767c1ea22a31 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/abd8ea1d517e8bfb8876b1c4d7861554fe481e61 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
