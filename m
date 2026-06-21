Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6C9CD4F26
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 03:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57CF547709;
	Sun, 21 Jun 2026 03:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iw6gwgNy2vyk; Sun, 21 Jun 2026 03:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52BD042BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782012419;
	bh=oK/LkOHksvH4RjwV8seoIEFVEu3wcFGwJj80fU+GYog=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n7+w1lNVxrrBHZkXr0G+xU2/H7Tq5JOITm4EMMpvW+0MZgz2qog4ZjQFNPFAVUhyP
	 /leHo0mpm/qydlsnnafD1UW4I7YsLsXRTn0vloKYfZq/ChAK8OjfqDDjqY6/gHOmnI
	 0SRaO9PpnRmNbCw/uzSnP2EbViWyFuEDxz/DdWbGcuiXbLL53UNn0GcnbCntn3Z7N/
	 dRGBXh8uV7y99pagya3/xWaq4WeD2q795rYrM09IacMRhD4JuKaAmjkBLr7Ndcpqzz
	 szufxzmVs923y04mrY/JePOb6Yqe8kQL7xVtj7iQgUVeI6l39kmIxjFw+TmlYOkCsV
	 A7AC78kJmeyUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52BD042BD0;
	Sun, 21 Jun 2026 03:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DEC6118
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 03:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4E842BD0
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 03:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8o4zckmm1gW for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 03:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29F89406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F89406F3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29F89406F3
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 03:26:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4922244f7c7so28052155e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 20:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782012415; x=1782617215;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgcKNh4Mw5Dxa75AF+qrvXM0HIiRh9DskVMBdwslURM=;
 b=BApSnwTHaYScPvcA+l/kNP7HgHtReSdEKeqoseSmR8czAIBt0kW++rH3rtaqdoFIjf
 yheiwh1TjpcmjlI03scgjsdwujih1tl9qA6yu6apKb9OtDJ+Uh48TpvhJ7+7u1i6lYxu
 6yIPTG/gALVvBssWn17UhWYXjTsgdejAFK1ASEgwCnzdCrYVaoorOtxVgJloVyTJ25D+
 NrkP5xKrQhMOkibUBWwH6SiRFcTqab1Lt3XiejwiDJQZei6tzypdFeBay1Pz6DezI4Sc
 E35gh2T9t8zqlvS7r+UXIs6OCA9XvYa/Nubme2eHtJ+l44Lmadtl75PDeG38Vw9tzETq
 lcyQ==
X-Gm-Message-State: AOJu0Yz8diTPtv2Jr1rQbWiGGM87J1sIklxGf/c7SI6TIPZB666SMt4V
 mlUK7ZDp6XBqH5lYaCddW5FfVwNc1LznjzIElcFYVS3/wkxGESgHi1/s5OWIczqP
X-Gm-Gg: AfdE7clZFPRFFGAT1emj6mXIVHyXRphXIIOXbLY0NF5GZ34Ggc5l2G+CztMcMbDtMUg
 WGT+Ka0nnONfD1Vekkt5cHNjl7w8v0kdtl0ge9ccJEgEKrDUcEv3SKjI3x49+GRBmi2DU3XemfA
 Yv4I7Kq1GA7OnFvNJMuOyV4MdnugaG2qxaopKSjlALoZuYeP8Yga6Uvci9jtK6uRHsRToH5+osu
 ZWWM0Phjup6ujHbWY5tH31NUoL64qLcjgNqX1VFnFOZT8bsJlWrxyIxx0GlfXqGxpdeKDCM8/r2
 LoAUPh8LuueOl6JFRi9uvEykf/IrRf29fP5un5yQBm65sG6lr0dA/eQdUYkltK0NJqsZGW89r1A
 +GQmYPfG/KHQEbCXfFE2RkKqFiZ5lM1IW+R9mC9gXDmafgiEzpzFh+7zbjkikBCeGTziK2VLLKS
 l/lE9L102eIloiR5w=
X-Received: by 2002:a05:600c:2a81:b0:492:40e2:358d with SMTP id
 5b1f17b1804b1-49240e23c30mr103140655e9.16.1782012414756; 
 Sat, 20 Jun 2026 20:26:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923c862sm98938575e9.7.2026.06.20.20.26.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 20:26:54 -0700 (PDT)
Message-ID: <6a3759fe.7f42fb59.3ca272.1d8d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 21 Jun 2026 03:26:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782012415; x=1782617215; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YgcKNh4Mw5Dxa75AF+qrvXM0HIiRh9DskVMBdwslURM=;
 b=s57PRuUL/7le9643FLAUwZFZSoXjgfryy4MJtaOIpTlsw0usfOUN0aIop7RhjNFJRL
 810RDFimGwGbhJblKp0F0mppKQNe/YYC98kqKtKCpUqJ1WKYfE9efdYEeklRCgld5J4i
 I6fy96ahihyQUUxVhYqyl28KmUcGPww/MQ3T0NYNo9W9aEe6NFNnxKFM+o4BbQiwJ3/1
 TmOh6eoXAiB1/ZGuL4cSbrHz6XPBBIic5Rf57Q5FuAlDDlXq4X1DDjuUyi4LP3YW/RFu
 W6Bz5nmbzWMmXna49g1XLb+7GMD+QAXVNxk3Gd1PbUmRCC9vI7dOCYggRu7XahL14DsC
 DolQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=s57PRuUL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-20
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

Autobuild statistics for 2026-06-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  0  |  1  |  0  |  1  |
    master   | 19  | 44  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

              erlang-26.2.5.15 | 3 
                net-tools-2.10 | 3 
                 uclibc-1.0.58 | 3 
                 gnupg2-2.5.20 | 2 
  gobject-introspection-1.84.0 | 2 
                   perl-5.42.2 | 2 
               tcf-agent-1.8.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                 binutils-2.44 | 1 
          cloudflared-2025.8.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
                easydbus-0.1.0 | 1 
                    grub2-2.14 | 1 
          host-binutils-2.45.1 | 1 
       host-gcc-initial-15.2.0 | 1 
                 host-gdb-16.3 | 1 
               host-grub2-2.14 | 1 
              host-guile-3.0.9 | 1 
              host-pahole-1.28 | 1 
          host-tipidee-0.0.5.1 | 1 
          host-xfsprogs-6.19.0 | 1 
           libmicrohttpd-1.0.5 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
   openvmtools-11.3.5-18557794 | 1 
package/mender-update-modul... | 1 
          pkcs11-helper-1.31.0 | 1 
                  prboom-2.5.0 | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                tinifier-4.1.0 | 1 
           uboot-tools-2026.04 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         binutils-2.44          | NOK | https://autobuild.buildroot.org/results/892160174d9be0da680cc9067aefc35fdf9c840d |     
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/caba15bba850b79b201c644dd9b95325e6360aef |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/b43101007b634c08d40e4639e30767435d4c673b | ORPH
powerpc64le  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/917ab068379940b265587fa12d0214d0e95e13c9 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/7bc173a938ed49a728227a09ca1040d017c0fac2 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/1a038a739bca984cf80313d96e8bc34369401dcf |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/127e2aa26bf24839e4780fe8bbd5db6a9e03c05d |     
   x86_64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/467b9802a8d6669c25f96f974b6ca0cce93e2a35 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/66b6f36386a13ce583daf329eae2913072ab5b94 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9fa3b0f15fd41ff3507bf7805e2484971fe7e305 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0afbe87f4042236293d6525989fa5cf56f8d73c2 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/0a73e8e77b3b6bea682c794c30baf18b7104ea51 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/c007bfa1193717d8f7041f6b2023764ccf527191 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/838481bbfb2a3cb5e28113ff66f4360e983898f7 |     
    i686     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/849c23f6ee0ebdb789d039b41e755b03e064b861 | ORPH
    i686     |        host-grub2-2.14         | NOK | https://autobuild.buildroot.org/results/ec1d28fb86b405a532e5ab9e3763fd399d77b154 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e3fc1271792f9e0acb71459f73f5da0014c30bc3 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7aafe4c59b0920d21969eada97b709aeec1e9021 |     
    i686     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/3bc7f4ca197d7f6f5d90e8aeeebb2b97081fc180 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/368d343f9b4c679735bc55ee8ccff7b645cb0e57 | ORPH
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/35d8e7aa76d98c13418078f044e0bcddd2c8a7ee |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/4b684ece4f61b328c87e00cc28e168347bda2f02 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/d02c9eeb99742b7f66bf1c7f2ad7aa2f70ace518 | ORPH
   x86_64    |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/e686273eb41e3d4b5df41ca52c8117593b6df440 | ORPH
    i686     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/4072b9acf19973d45f1b7da61bead0c0aebbbfd9 | ORPH
   x86_64    |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/c76783126c933f16e4d02f9560b269c70e93bb9c | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/c31f98f470b4649c860afb45d58494051d6e20c2 |     
powerpc64le  | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/3697f691eb48033cb1324ac720c2c3754583e561 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/30c53a4499b3ab2f04f846e3aca5c20f8b9f1f10 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1e5b92f78b22fd4146c01cd59c45558d5bff883d |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/35090aa372eeabd451a24b4c9bcac3997afede5c | ORPH
  aarch64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/0912d216be2b66c4306d98e8fc788de3a4a5bf18 | ORPH
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/2971d1e3395da7b00d115037ad8e5acab654310a |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/95405e99e044f80bf4f3ff0b9acbd1df322ef298 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/eec822c63c2f607ed4b510e2ca9923bd0e8554c1 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/46dc7a7f00066a3a70d83547c96c82182a82e84d |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/c506fe849c39bc251642da54a3fd32ceeae153b3 |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/c7a64a58f66170435a69394d3f985348c1d9be72 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/5762037d2affc4eec656249df6cc4747ee5f5734 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/bd63765e8ac0d1de57e2d491353e649c774510f3 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/568fa33fa3d0a2b59ed4f1a5d15dde547ade6f81 |     
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a4ad01bdadbc18585bd6e552c9e88b331075dad0 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/dd4a54e5550c7df6445ee73c4dc3bf6fcad1778d | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dad4f5ce5398648160eb77a56afd60b295c53226 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                openssh-10.3p1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/279f53e5fc4f3042263337d393deb8e7a2d3a507 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 fwts-25.11.00 | 1 
                     kbd-2.9.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/2ef219108d73eb500d507c1b3c0570d2512ba702 | ORPH
    i586     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5f95f4a2ba579ca78c20c4a8f7147a6b5b323f33 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
        host-python-lxml-5.3.0 | 1 
           libmicrohttpd-1.0.5 | 1 
             netsniff-ng-0.6.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/823e47ad67cfcdac566f801b72ce1983a0ac19b9 | ORPH
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/726840a343238239afff8b99f8d034561ccee45e |     
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/cdcc21d5b84ca54daf274bd71929b4a970276e8c |     
    i686     |       netsniff-ng-0.6.8        | NOK | https://autobuild.buildroot.org/results/9e067d1175fe228240cabc7b90e49d6f5744dfd7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
