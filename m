Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49891E7C705
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 04:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19DD80EC1;
	Sun,  1 Feb 2026 04:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyU2skehvTxs; Sun,  1 Feb 2026 04:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA07A80F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769919562;
	bh=we/Du94euHxusdW8RLebawR+tXRCluL3SOlYZ43H4uk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dj9Gufw32GmSBidJyp8c4DpE7VfOY3F87vNwnoyi4qY2rGySIO93Y2HwrBg57Vhuk
	 0jbndrO98fYpfKeuK6/ULikRIHSd16vlYO4KCCdkrmci8GY0jWevy36avU4l5c73bz
	 PeT3hBGRK1qdw51ShrHDUaG/gTgDg0J/juCnwMt+YIo/oUCMqwsRv9xlA+v5PlLn1T
	 C7D+YzFX7WlH1YTmZ0YLX5Uynr9pw1XZIsJnDMGVMVTYC9wW1hUm4Crt3+2pY21ooX
	 oMtn5qYBVfTg7bF+ElOI4aKjBzGt9sz4efnJIwiatC9oaoBepe/MU4y4eFQ02Rkkyo
	 e4GXjGr3uZHtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA07A80F15;
	Sun,  1 Feb 2026 04:19:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 402461E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 04:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23D9B80E51
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 04:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OtPa6tS8lLw for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 04:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC23F805C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC23F805C1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC23F805C1
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 04:19:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso13487495e9.3
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 20:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769919557; x=1770524357;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLnsxoh+2EaFrIjkU2gwMmPHlMm3+pX0/kFMmRlamUk=;
 b=rczbPhJubWjbD693ipdef7im3td0jMZta27h7CD3uAMTc1PJdMgm91uJrVURjZLyuL
 12ApycMn1HBFAKIi+YJWZW/Bu2SHYhHgp9/VM4AJBgPzm2ufu0dCbTVN6FuW1AA0MaFe
 i5XTxQ5rHwBToqz1j0c8inaDoyOuaSP85FsllSLLEIwjikZGsXznC9rubvQs6mLC5r0C
 7CYrIYG+reiC4JV83WA8EC8CsrS+rO6clrcTy5/BscL316j9RnO43BMA6MTqLk2paMOQ
 JMiWaV7VfbQc2kMj2xsBwPyHp3/MvWET9JTWR7u5WM4SIzy81qmKA64l7l1Js5S/cTwJ
 JxBg==
X-Gm-Message-State: AOJu0Yw/KYi0a4qYWrMi9r3BHouJEVDGKpia1QgJq2wZ1rKwetGKZiNf
 iA09Qn8mx4CFQymiHw1MswawTeDICYwOJ7TUo61SOyWd6D/Qezb6x/HznP5Dgg==
X-Gm-Gg: AZuq6aKycseRN4MeeovpT6SCcH1arNU/gwjugWzKi2DktOAHmN1z+I3S/3lsEGz6hN4
 6WjYO0GFzYR9koKRScbEp3JDqnFjZVrPNHFMUTMYr5QIcnKewtMtVdqgFwYmxEVFhnQaiIMcnhi
 9jL2Z77lUbZKUDdvVKxMMGocZYT9OSzTFbHYTh0GL9hCamjvk4loOC1dwJB+RWtHr77NL5r/CHU
 DYQN/thzPqdTG4I4pX8ageT6gOvCyWLkbolz/vVd08WdtInr8OxIQbnRQ1pwJimvkoFwiK4JdFH
 Ivmirvj5BllEGT4A3bDt9eSBblCH06qBH5Ou3OljWz899uXXtuXJwzSduTNOOPe65DsOJTUmxMr
 LxFfA0vqLrejGbXu30q9aOeLyT60e7G10nnDE+4axdZE8m9k7VD+r106TdbhzingpTqBMjHHze0
 Xf6FFXYUe3XZvVVetG4PD9zu1+PcHQ
X-Received: by 2002:a05:600c:8b02:b0:47e:e78a:c833 with SMTP id
 5b1f17b1804b1-482db4a51d8mr89734595e9.32.1769919557328; 
 Sat, 31 Jan 2026 20:19:17 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e48a6sm33028184f8f.8.2026.01.31.20.19.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 20:19:17 -0800 (PST)
Message-ID: <697ed445.5d0a0220.76be2.e106@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 01 Feb 2026 04:19:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769919557; x=1770524357; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WLnsxoh+2EaFrIjkU2gwMmPHlMm3+pX0/kFMmRlamUk=;
 b=LWCmdA2lnWkOVpPkUWTDjq44GxRViEiJR/hvBrwAlJEtSMaHDRBmV620cBI3KZAdMD
 suOOiB9EbSlkFIxoDRYKzVRglX2AZ9wNwTZffdNrpkqLuLsdS3x0UuSo7OfH+L3+kxCq
 k00Nd8HRt7I/sOk6RpFlFkhhZZYQ58pza7H/eKnySd5Koz1FGV+WLnOnvhB3iAKstxTG
 dDd/0EnA9peVf5oJDE2ZlmrTLokTXsUnmotwpAO8+oAESd3dXG0NFoorVd+Lb6j/yDzR
 uF/5GAk5vW8p6NYfKp4POVqQe4P0BepouT9n0/WlidG/UXRZWjTqIFRTo/LFitIC/HZv
 SqRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LWCmdA2l
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-31
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

Autobuild statistics for 2026-01-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 10  |  0  | 13  |
  2025.11.x  |  2  |  4  |  0  |  6  |
    master   |  7  | 20  |  0  | 27  |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 2 
              host-rust-1.88.0 | 2 
                 jasper-2.0.33 | 2 
                    brltty-6.8 | 1 
                  cairo-1.18.4 | 1 
                    fcft-3.3.2 | 1 
  gobject-introspection-1.84.0 | 1 
       host-nodejs-src-22.15.1 | 1 
             igt-gpu-tools-2.3 | 1 
                  iozone-3.508 | 1 
                jemalloc-5.3.0 | 1 
            libargon2-20190702 | 1 
           libzenoh-pico-1.2.1 | 1 
                  linux-6.18.7 | 1 
                netdata-1.37.1 | 1 
                openssh-10.2p1 | 1 
                 rtptools-1.22 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/3af0a43ffa8afffe9794596378dab49976322740 |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/9ec6ab0cd36f03e23b7cd8c09daa54a407a27138 |     
   mipsel    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/23702db2686a5d6b4dac47922f7bb41f29f6cf92 |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f9d9039f3280b72d8d8909f9939e859b6933fad7 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/6145c1d7669b52926e6da90b8857606d8cdacfa5 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fbd8d2c7119fd30425bf548703fe3bb4d6a4eaae | ORPH
  mips64el   |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/da82dc03cf0d42463fff1b5d9bf7a3c18cbf44dd |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/f6987fca2a2544f6c72e3209cf16a17262134cfc |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b40d1821ee4d9a464177aabfb518faeb226c674c |     
 aarch64_be  |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/062e48f19bb78f08b54df534ce7db1a90201c306 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/8c6b20a571a846eecf0e023a35f571446ab8ba14 |     
    sh4      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/53e15e9cf641e4f2b2549757fdd72268075a0608 |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e9b5df11ea0ea3bb7b8c0defccf33f4c4b9f479e |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/3901b1ca5f9753ca7561eb26e8d6f1f9dfde023c |     
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/3435562c38970e95e1dbed38e3541ae5e3fad7b9 |     
   mips64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/9314c41891ac6b71529b2df71f5e0627429ad3e4 |     
loongarch64  |          linux-6.18.7          | NOK | https://autobuild.buildroot.org/results/d6b491f5264b02b79c30827c54ec98ab6895be07 | ORPH
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/bb44027552e0e2b491b975a39a061e44f20a22ea |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/7960edde74bf8b08147a43c46b8de2d3ba85b419 | ORPH
   sh4aeb    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/680c36adf215bba511df98bf31e06e853544c837 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

          esp-hosted-1.0.4.0.0 | 1 
               openblas-0.3.30 | 1 
package/wine/wine.mk:341: w... | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/a3fc303036532b972fafc23151a1064be92a1d7d |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/b40cc1724998869dabe47c057e2b4495c2767916 |     
    i686     | package/wine/wine.mk:341: w... | NOK | https://autobuild.buildroot.org/results/4b7974bea831c3390269386a42ccaafcc6418be1 |     
  mips64el   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/26e32db060e27aaaf110271d1bde800de39a2627 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 4 
           host-libselinux-3.7 | 2 
              xmlstarlet-1.6.1 | 2 
           at-spi2-core-2.50.0 | 1 
                netdata-1.37.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e7a5bbdd01691e71e2bc09732c82c027409a8ec9 |     
   armeb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f7fc45868760697eb39f79898c3fa387e54d3cf7 |     
  powerpc    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/0b048a716626f7606476bd97f0484d96450c8191 |     
   s390x     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d5e4241b402b5ed9f5c083e9381ee4d9821ec75c |     
   sparc     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/e970042c07b725269b764de20da7b66787e96187 |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/1f14f22339819b0b1cb7eaad39426a64b520e015 |     
 aarch64_be  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/5a6856c1ffc60d845e44b1f38847c516208db34b |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c8224ca9f37ee5b78cb4117f77d0c14f8d8d59c1 |     
    i686     |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/01df66a9834f8135288ccc51737ba9bbb970638a | ORPH
  aarch64    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/e74602adce20a944ab1e6da443209be7038fa479 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
