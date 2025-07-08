Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF52C71130
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 03:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D8781227;
	Tue,  8 Jul 2025 03:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRUHTEDXQ4QE; Tue,  8 Jul 2025 03:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97E9E81228
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E9E81228;
	Tue,  8 Jul 2025 03:13:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E33E315F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 03:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D454A408EE
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 03:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYPQtsNu5iOy for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 03:13:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D390408FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D390408FF
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D390408FF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 03:13:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso7518176a12.2
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 20:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751944430; x=1752549230;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KjgO6towSdXMAPFmxitUkJIn/ROHPBoYi8Dp82oRXFE=;
 b=axhMDNFhQ566U2DsumTYMtiPRCHoM3jaYnoAMn+9UE6WBDT6pY02jfm+t8ooiSb9cE
 5wxJXYM7UQKjO22TCA3G+QsiWGfjJgllNCDpV77tI4vR4BOvzyHyuNLEUdR6FWPcg7B+
 EDgyaxOL5pvu2ThSOdLANPNb0/X5smupSSTjJcKxe4YmjU+70ZnauDcOiKk0pst5Jv19
 /df2XAl4NY7t6zej/jRASm0rMBRB2HuHB/HOECCPGEeJe2+6yHS0wNj0iC2PXpwHdU8P
 JSvwZEQqgqrce1ixsXZ3eQ+nZPocqSHz/DXu+KRayzPzjrcBDopfTBqgBZQJxoJtoYAC
 1Llg==
X-Gm-Message-State: AOJu0YxFsBitsF1isV0HPcysNeKKKWywRaaNrDA9pjv3dLqzEmSDFKAL
 jB5d7j2s3M2Ki1vtIn7IM2zcoIaCYHzFkavpxEMGG07riVhJ071GMJxUt7auBg==
X-Gm-Gg: ASbGnctNb5CxqAUyX7hUmXr1oBF/k9qssuUCotMCNwrofhPfvvLT14S/RVgPBvM+5k6
 ztdBSZWyfq7Og7Wz/W6/GrpIjOTC+6hcV+RetKtSZvSXVFPz2tJchlJTHe/ORtcDZ/vhq6HEab/
 AHzMRnt57fxaPHuKxfHGPuAX3W3nEJ5ZluyKNWOdTo2ruslNF0gDB0GTNgxjwVy8Z21I95mApba
 QgXZabGDXR8tqlFsbGxvNcz2oEkus00Y7zP9rgtR04KOmAixgldWj/IWfigY0uvgwQmsRe5x0GP
 g7zLUkkQp9+KxRidWcX0IZu3JeI4DzBdRR57JMv0lWzmwSl9iyS1WkBQVmKCJVW2TA==
X-Google-Smtp-Source: AGHT+IE+v1Ns4Ccf0sOWspu2H0y3zjo3mptor6Ddeul/gm03hIQ9YydUVco7yuiM2P+23QrdbgPJOw==
X-Received: by 2002:a05:6402:1c0d:b0:602:bfc6:f99d with SMTP id
 4fb4d7f45d1cf-6104ae417f3mr729267a12.24.1751944430298; 
 Mon, 07 Jul 2025 20:13:50 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61045467919sm837438a12.68.2025.07.07.20.13.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 20:13:50 -0700 (PDT)
Message-ID: <686c8cee.050a0220.3505d8.2dce@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 08 Jul 2025 03:13:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751944430; x=1752549230; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KjgO6towSdXMAPFmxitUkJIn/ROHPBoYi8Dp82oRXFE=;
 b=De83s13T4K+zriIgFsqq1sAzvXNLEVZgb21QFTXTVQnWxE/ffywJtj7zJ69Nuer1XG
 Ns6O1/kq51gJ4JcW57HaYGGINP6VYE96jhiMdf/8aicoNHTjNYBORqmWyFZearUxNFF1
 dN2BSRLQxxnFDg7cCX2Zck/Hv0stKjJ83sD+y6w11TZLtCcUeYBou/h3l6i5Y2vC7D8m
 bk8xwiz+XDrE7URTlUCxedSNlnw3MucyQyBf6OTctRidyNLZGDKTtSK4AQhfz3y8opBF
 CnUskznerEVMD19FptIJpmlQoC9Oeq/9DIk35cFTWS2GfPvLWDXsJIj1vGy1WUrq6y+o
 lW/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=De83s13T
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-07
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

Autobuild statistics for 2025-07-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  9  |  0  | 11  |
  2025.05.x  |  5  |  3  |  0  |  8  |
    master   |  6  | 32  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 3 
                   bash-5.2.37 | 2 
                flashrom-1.5.1 | 2 
             libargtable2-2.13 | 2 
                  prboom-2.5.0 | 2 
             batman-adv-2024.4 | 1 
              fluent-bit-4.0.3 | 1 
       freeradius-server-3.2.6 | 1 
            gdk-pixbuf-2.42.12 | 1 
        host-berkeleydb-5.3.28 | 1 
       host-gcc-initial-15.1.0 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.86.0 | 1 
               host-vde2-2.3.3 | 1 
                  iozone-3.506 | 1 
                 libgee-0.20.6 | 1 
                libnss-3.113.1 | 1 
                liboauth-1.0.3 | 1 
                libsoup3-3.6.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.15.4 | 1 
                 logsurfer-1.8 | 1 
            netstat-nat-1.4.10 | 1 
                openswan-3.0.0 | 1 
                   perl-5.40.2 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a2c7f0a58808231a847025cd828a1e6ca3afea33 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7fe2e2b5b0c453bd00ae885fbb591c9f71e56d5b | ORPH
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/bf43a0d00e5f1c4656a5292c164289ed7df54eaa |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6c6a0f9f223a4ed139205505824e6a6bcc8e0d84 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/027dcea9f28524a2bd91f4b35f86a8b48abeeaf8 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/45f8217b7ac7404ab77b614fe0601f819a120baf | ORPH
  mips64el   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/817a6c7ae35f1bd112c93bb57ca2fb442863e03e |     
   mipsel    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/bfc799b0a6ff9fe437154df159c4199a0d08c51e |     
    or1k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/ad8c293a369158bd0f9a5e9c379a4b9b363b483f |     
    m68k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/f11f891266ad6a352ff24767cc4108d5467cf358 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f9bf6f71e9afa2a685b363d0932ef9d5ab9b17f0 | ORPH
    sh4      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5ad4e233ba109a639acc0810ac411c9b73216af1 | ORPH
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/4bd6cd1e068ca037ea38f7feed9600e479fb83f4 |     
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d2d9f28af4dcc3d7568ee6ebad2961f29a43d210 | ORPH
    i686     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/a24b514a9b55881b64c3e94bee31aa849f8fee5c |     
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4bfa4618fa85e11a48dc60df132c3619ae7d5a8e | ORPH
powerpc64le  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/a488236a2b34e36867b694acc4f59c2d10bc7446 |     
   sparc     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/8a47d9d846d40b15fcdef14d1b84e114248ae94e | ORPH
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/d0f3630f0045d4dca330f1415a6d3cd8811ecfee | ORPH
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/c40f858e5e3166e7f78664f66b5da30ade292549 |     
microblazeel |         libnss-3.113.1         | NOK | https://autobuild.buildroot.org/results/2d56680e620e872d39168f079e94d5dd23eae922 |     
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a53296455fcec3f7bbcf8d562951db2d071696a6 | ORPH
   s390x     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/4c67d0f683c28a27dce32117440da9a5727aea30 |     
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d741f47fa851a96f6f4ca1f6320d4d5b3d8643f3 | ORPH
    arm      |          linux-6.15.4          | NOK | https://autobuild.buildroot.org/results/f2985a508d61838cca8dea00a98b95974110ca7d | ORPH
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/dd79ff97cc973c0bf7ce73b302256af4a0bbd4d7 |     
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/df68e97d2f7b3dd5cdbadec89e363cf738d52407 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/20fb2af1e3ab60576062509caa7e19b81cd720dd | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bf0cdf15f1aad0dd475872652c5abd38bb343408 |     
  riscv64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/005e22e3dfd549f78f8accebb8cd4cdc4b7e5b8a | ORPH
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/eecf9590788f266e0bca6612194b040ce65d4327 | ORPH
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/bd57320b04695248fc86cf6291d94b4f4ad3a2a3 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
                       unknown | 2 
                  boinc-7.20.2 | 1 
                  libbpf-1.5.0 | 1 
               libunwind-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
       shadowsocks-libev-3.3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6d89661cbf077262312f04dc900da4c5a425b0bf | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7e9ab149f67027e7d89fe206acac6c693f1c15b2 | ORPH
    m68k     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/50ae34c9632f0813168752a17b85614e6d36de18 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/086ae234110dc86b9110bf4352fc520b1be43f6b |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/e1f0b12f6ad3427e705bdf27f204e6af5e2510b5 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9a5309f183bb45260a8fef95040ef6048c359aae | ORPH
powerpc64le  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/432f05fbab8aec94595ea5cea6fa1ee3bc2c58c8 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/643de5e6c9a43ffd4e1574dabe06c3775a6f4afc |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/5be951a931c6993bc5740cecf2a80e98caee7f1f |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    mpir-3.0.0 | 1 
                    snooze-0.5 | 1 
ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f00c8380f36e08a8b2a4953aa7fc94dd25471c79 |     
   arceb     |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/e8d5d37523886c0e0be9d37e326a0622081e1743 |     
powerpc64le  | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/023137547459ad331eb972862ff056a9d69cf3a7 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
