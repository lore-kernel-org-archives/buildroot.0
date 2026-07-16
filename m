Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F89FC44501
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 03:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A550E4054F;
	Thu, 16 Jul 2026 03:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjfl101bBuYx; Thu, 16 Jul 2026 03:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75436405FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784172385;
	bh=C7Sb/ammVOuIcWGY15U2JHAjoLkhUXJiCtWkcgPrGgY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bGHTg6ZhtfjOO0K7fmWeYvFKBjoBbJb9f5g2EzsSOAv7faQqKkniNIXMlzPBLSx9z
	 NKY2LC2f/p4DM5i7vXozIHTmu0TcspnZb4RWk6f1DZ9s3+nQU0X93tkMwLM33tmvNN
	 OWQ0T6mn+aXrRiZLvr9NByDnHj+iJ9uANVTqoU3HmcjzDGX8KA6E+Vjan/9hpni0/4
	 5vk8uQ8PHW+Pk9pJkDUIXF/DVSs65nO+8+yE/OVSXlh6au8Pb2kxbgDjTHj9jt6B6B
	 rt2w4hhzdb3PUVA2JoRrsipa5/pEU2q1u993WY3kZhgWglNrFzm0zB0n3OYQVgNcyg
	 v8r9CuAKJt+LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75436405FB;
	Thu, 16 Jul 2026 03:26:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4E3F426
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 03:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B258280DB1
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 03:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4F3FAo61X-Y for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 03:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31BDD80D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31BDD80D97
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31BDD80D97
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 03:26:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-472326ca506so4944171f8f.2
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 20:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784172381; x=1784777181;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zZfJa4SVUjiF7Ws2v53/tLJc9LFwDQA1I1/JOts0F7M=;
 b=fdap4EGL+eAdxahwMHRA3MJOyYzeos9eOU57QgZpETkN9v6sFMCIz/vVLBq8amHu4z
 VOkWA1ULVI833PI+J4+R4yjs54adujSwYz3T1YHQtESe+Yqlu+Nh9IQg4R2lHPRBOIcH
 pZRTTeGq93sFJvcerAPLw6KTl7NROpV5Ul/rPVN8VPU70zqeikqAfr3gVyJXqW5o/Hq5
 u7FyPc8AZV6q72aa5XN450HzA55dkYgcgY0BKMV3eCxiuQCpEbPwT+pCCOeqxot5LVEY
 IkVeMpaH5RjPkZ9FuebjMFjOUIxMN2/f0q+w/HbYKMlHsDiZI/g4ledkqRXxeiNi+exl
 ix6Q==
X-Gm-Message-State: AOJu0YyHwb4aGfUwjc+nIJVb7Pen2h+iitR0EfqkGl8k8MDGP8QsqP2N
 5Dje5Rxs+M54ZGyaHp69hLpKVeX0mJQ4ohPTLD26L3HXCVSTJzz1m1GfkPBec0az
X-Gm-Gg: AfdE7ckNu2P2qO4Y8G3QkLkGPsUE5f9eYxMJxKc2DAdGGlhWvmFHhSum3QY0gMgPWLC
 T000CNU/Bo+3F/DKLasPcWMF9gNNx6CtXBoZ+qnHySuXapYizsxF0gFUlL7zK94rfowQtB82Ub8
 lVasbKIQY7AgVGl+EMJiWq+hZtkZnn+KsocO8+8fMKHvH/nAAqINytMg8/dt5m+nE6ovJiz17cJ
 nTaCHuhzSG2CR4I9ilPyUEczGaqAFPVa46/TgPJJqcyKIurE3ocpDctM6fGNnjyHAOfVfVC0Gx4
 AybyCXTIkKMmhqiv3A4AWDmBnunRqcmcsQqNu5kSpows712b7bJBtW92CRAZI6MnTOU51R4Lrou
 5v4L1t+GnwtuB3W+x04WFPhzKncnV2yc1FKDFENtjPmDSFJFVCujvALvoQxIfY8cEqRXKyOI11v
 zwXHn1
X-Received: by 2002:a05:6000:41e8:b0:47d:efd0:c026 with SMTP id
 ffacd0b85a97d-47f4632fcfcmr13113134f8f.11.1784172380738; 
 Wed, 15 Jul 2026 20:26:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4634e029sm21125591f8f.3.2026.07.15.20.26.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 20:26:20 -0700 (PDT)
Message-ID: <6a584f5c.3c943127.2d094e.6241@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 16 Jul 2026 03:26:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784172381; x=1784777181; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zZfJa4SVUjiF7Ws2v53/tLJc9LFwDQA1I1/JOts0F7M=;
 b=AUWZaUvKJkyVE/7O5YEEitMXU2XzgqvCMkKcVjxhz0xPDooXWhNyyrp3ucQEiR86xC
 DVMjWbanScHlkOiLjjD+BdZ0bMe216zoXlxd47C4w/FgQQJZ4C7/J3fVbyOnsZ9+L3Lh
 wFsPlUIrlwQr3WEK/4keCDkpFCqXcXF2cWlHM54raHpqBTdhBIbpdf78jnMrYwCQQ6Uz
 qUv/B6iDVwDXaavky+ObqwcDYhrI8f34LrfpDIZK7oveG1kIoKVes1/VJI7xSb2LNWBD
 eur9zvT5NozYI8qVAjZqYW9vuPlgV88yryYw3LeS4UWoZXJbn5BlXh8Gd8OCTjI36mUt
 WYxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AUWZaUvK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-15
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

Autobuild statistics for 2026-07-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  8  |  0  |  8  |
  2026.02.x  |  1  |  4  |  0  |  5  |
  2026.05.x  |  0  |  3  |  0  |  3  |
    master   | 16  | 61  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2026.1 | 7 
  gobject-introspection-1.84.0 | 3 
              jpeg-turbo-3.2.0 | 3 
               pcsc-lite-2.1.0 | 3 
            18xx-ti-utils-R8.8 | 2 
        edk2-edk2-stable202602 | 2 
                haproxy-2.6.27 | 2 
    host-mender-artifact-4.2.0 | 2 
                   perl-5.42.2 | 2 
           uboot-tools-2026.04 | 2 
                 uclibc-1.0.58 | 2 
amazon-ecr-credential-helpe... | 1 
                   botan-3.5.0 | 1 
                  broot-1.58.0 | 1 
             docker-cli-28.3.3 | 1 
                    emlog-0.70 | 1 
                    grub2-2.14 | 1 
                   gvfs-1.57.2 | 1 
          host-binutils-2.45.1 | 1 
              host-pahole-1.31 | 1 
          host-xfsprogs-6.19.0 | 1 
                      icu-78.2 | 1 
                  iodine-0.8.0 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmpeg2-0.5.1 | 1 
                   linux-7.1.3 | 1 
        ltp-testsuite-20260529 | 1 
                  ntp-4.2.8p18 | 1 
                    olsr-0.9.8 | 1 
                openssh-10.4p1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
     sound-theme-borealis-0.9a | 1 
                  stunnel-5.78 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/538f376fba2b62b64c544b4ea80acefa7145be22 |     
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/9ffc06a6dcd6a1386d4a4d3cdaf55fc28f0a2276 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9b4e3f61317cc9ddb6f6439b5518362aedacd7b6 |     
    i686     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/4e21213782f107a1ed0e11877c215028669aa5e2 | ORPH
    i586     |          broot-1.58.0          | NOK | https://autobuild.buildroot.org/results/6a061672092cbe0b56c6adb9da3b2c02f1244656 |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/ac352adad480e94f73afc51c37b605765bc8f482 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/320f567a4b93b011dece7a159869fdcc57172b0c |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/504b50a9a075665da71adc7140531ff76877ead9 |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/3722b0d7ceab02c6487eae19b56fe0a320615bd9 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e440bf8be3c2829676fd99bc99c0efc488b0a55f | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8b949b57e7d02e7d588fec53909da98c88a9d20c | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f4fd774da8271b3d2a4fc685371b327ae142570c | ORPH
    i586     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/57d46362e4af874e950621b948d04810b6b7196a |     
   x86_64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/9d4eacf4589f337d44007d9fe529063d48d8eeba | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/99c994ec977f82fe9027d18d2a010b2cbaa1bbbb |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/316989f202997452e7abb6c91868b89e5e74a732 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/80776365b1cea0c01307a5aff417c58e70024f9c |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/843fb408af92b203fe76b2d57856e93ef29bd261 |     
    i586     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/4eb98b2c6d4d535de6bce31dcd272adddf212061 |     
  aarch64    |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/1ed14d758e5639b46ccedfc67197001948e61d2e |     
powerpc64le  |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/2db65dc1e84255eef74beb19a44eb38bdf469724 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/365e0293a0cfcf4cc4b3d97fd9e5933d8b1b41a5 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/e36da8ea33ecde0dbca96e5ed1a70e73884c9f19 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/2b9adc3244156bf0c29b4e72b5dddb483d967116 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/5bc9eadfe6d022f04392159caaa5439fb0ed6838 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ff943cccbbe53ac611334bc0f42eee1020e19d31 |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/1a453c5232a4bf89a3f85dd54575cf2d495c8936 |     
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/1737e82cc7e2ea1a81faec90309c9a58f99eae38 | ORPH
loongarch64  |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/fd5b8eaad4477187c3b8b1a5a197e4c87feb13dc | ORPH
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/c7f7c53bbef4d68d32a3a5905e6ff2b0310a58ae | ORPH
  aarch64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/a18510b4d05246ef98f82d43d5d2bc93b5efb07b |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/3f7986cc348b9b551d50d741eef0ee2ffcabfaac |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/22a945b314c9be15f5897b3bf390bcd6aed0b36b |     
  riscv64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/0f201014215409526dde8032c524648cf7e2dce3 | ORPH
   s390x     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/e0f6e4b59497fb90427c43cd089907c8942d0695 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e6b244f763cca8c779c453471596aafd0153c7ce |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/f575d19a029e9d524716aee284aeac310b8ed543 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/930e11944d1fa3f0369740a1977de646a5a3caba | ORPH
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/be3ca5e72d1f9ea76a0318d237d7fbdee48d2366 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/19a8015d00004bd63c23b83a14bc3f51711cbe24 | ORPH
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/620dfcf25b0571f5f42c1600da8c7e7f89a8ac96 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/982653b8917984024f808cccb22311acfdb4d3ca |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fddff045deae17686c7927cd5c1e7d81072115b1 |     
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/9bd0a454ddca72d2e69be3c9b187c1c8f4c182a8 | ORPH
    arm      |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/aca4569a7b3ce955f1481e0f5863a0c67e9d9525 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/23ed6da27abf1209a72d2737af2af33f49932d92 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/9e5ed81f38318cb928de6f3b8b89cb233ced6fac | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/9b22e7cc268bcae9b2e61c7bdee415b5872036af | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7e3855293761d0d2367f4d0ad3ec15a94a40221c |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1863e809121d6efd3a4d97f813cf909e58c39696 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/ac82dbea9a9fb7d0781057e47f120f539df5aaad |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/d812759e40ba1e6d1f98fc0e72584e1d791566f6 |     
    i686     |   sound-theme-borealis-0.9a    | NOK | https://autobuild.buildroot.org/results/c37b441c1114cd59f85bbdd89a4fa22ffecc2a1a |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/dbb3fc2956224d697b82b55ab2bce1daf2385877 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/914d005da2dea9bb2a13ffb28d54c77a8ad37445 |     
  mips64el   |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/bc9ef2e669ce3700b12ecac679b88db0ced980e8 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/6c9b301c1d4c04f851c15d02c8a7715b91ec7815 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/9f20f1c16fe2ee3eae1247eafd25a67ee082a414 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/e9c5c0480c9181278336ee83e5510cb768c85743 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/8d8748cb44d091932ecfb1480d875f70329d2c43 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/72601c6d00cb427b73831eeaf72198a3d7a4cfb5 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

              host-pahole-1.28 | 1 
      passt-2025_06_11.0293c6f | 1 
           uboot-tools-2026.04 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/384fa334332508e706e75a37f7af6c1aad9aef6d |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7387724aedc953238d4f01644eea48bc1869b317 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/59633a84a9f63fc3f059557407f633d862c30ebc | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  iodine-0.8.0 | 1 
                libglvnd-1.7.0 | 1 
                memtest86-7.20 | 1 
                openocd-0.12.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/a56e69bfcebeeff5b872a2fec150c3b78c2c07f7 | ORPH
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/57aa481bdd02106e662ac0c152e39310157c3e2e | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/c29fea4e267327c8f8ca69f7b4ad26d488cf7831 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/6568c75399f548e9406063d78484c5af64f55c54 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
                    fcft-3.1.8 | 1 
                  liburing-2.6 | 1 
               pcsc-lite-2.1.0 | 1 
       riemann-c-client-1.10.5 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
              tailscale-1.78.1 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/c47745fea96bd0a43116521a81108248472166c4 |     
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/2eac859ea4a81cc87ede29ed525a6413118df264 | ORPH
  mips64el   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/61df5ff6ed0d16d3ee2eece6e9924a42cd4672a2 |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/f09ac76b36e9895aece0756029ecfec3ba9e507f | ORPH
    i686     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/9aba0fa310942624476c3938a7865f4317046796 | ORPH
    i686     | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/d8b5f1884f7f64c2b0abf163bfa14167631eaf6c |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/66835f19fee97b39be63117002f137cac917152a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/6f8411268ce51e45b1f02312614b422e050c3f42 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
