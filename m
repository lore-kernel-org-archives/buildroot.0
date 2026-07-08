Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB2C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 03:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5B040D77;
	Wed,  8 Jul 2026 03:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnpAxJbDFxYr; Wed,  8 Jul 2026 03:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5647240D66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783481117;
	bh=qhZ791iYnN7DaLlIeRN5Lx0Y60aOPvBUN5WXnlAZn6c=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sh7xxVE7Oc0/N3bRhDRETfCVfDuf6t8IZ9cluff0FTiWdbk+WkgXNN5+YoKEUYFJW
	 X4bTGTtbnKMwIp7V7iVAadhWFMGdrHzNlWfvtqG99Cf6xjenkXNwK8CY+bUsN6bvkZ
	 bS7xyNrAU/zTv3rnKcx7ukMT9gteQ4bjwyc/A06H0hT1nDfYQxZVgJkhZRYkbNA8Ai
	 aQOrq9UKRaYXFhEnt44SgxdXDnUfZwVz9WzvIDU61czY2+CBHx4xBGuQV6gwTq6DvU
	 Hg6tPpUJOQzt+ZbZ8TNMIe4RSS/K0iTjaB+4TNlpxigbNhGdlnMfka+IzzeaTlgjyF
	 fqzet/UD5+RRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5647240D66;
	Wed,  8 Jul 2026 03:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37C5A2CE
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 03:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2982340D66
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 03:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAXHol3EfcLm for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 03:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E123C40D64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E123C40D64
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E123C40D64
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 03:25:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493b61b52b6so1484415e9.1
 for <buildroot@buildroot.org>; Tue, 07 Jul 2026 20:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783481111; x=1784085911;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wSHPLYjEfSAKGqo52PTJlu88WW2n2iEfwYLg/yIELcE=;
 b=OKmsCs8LszZzdQ5tsnEH30dQRzBNU5BRTZlTm/EXjeaEjRAjhIq7uyJAdk94PsFVqI
 Kew+eXn8xDg1fxPFQHaTBbj9RcyKUY+KLYsOMnf5GFOEJxKHfdiKCiNAT4lzRa+OwFfz
 EcFbhlN0jnwVn3wN0vxL+NJygnNA+IbnLredOGyIPW+YGYvaRCKfmzAGl84oxAr453MS
 IQ6Sju/bBxNhB67u99vVGGcTtNC9epuufAWR49IpDgy7SYhE5S3ZW3VCAKl+s59okXRs
 bxui7k1S/2NphxovMVcqTV24xtl5y+lhhuug0Z8ifmTbVma7wugOSQd+dzvnEaBTEziR
 MkKA==
X-Gm-Message-State: AOJu0YycOacPhXgA6TXH157L91x70ROm0lm8YW+SOpLAv5Jwt6oTWl2H
 yQCxSguiVExI3rzr9nPBinfl4oPiGc73Cmp9pbEhauLRt9fqr+77uQm4IWj04/cq
X-Gm-Gg: AfdE7cma/4ecc0Z0+5JRKI7/AVUTu5785Xjx/ub7j29IHGZIgwBU+0+OHvRhdZ4haU0
 WECiebr2rrzYFhxaMBgPoMNo3ydNq8ZlLrVKFisR4Q5gH5f4GNNLELI8z7JS/JzPRF9eaF2bfdF
 a9LdIzy1l8eDN2FzI0mNEp1EeivisvXycwWRw8SDopB6KZY3ns0ozuo3Mst+k7Zzt03u+occFpx
 GkpHsZZTnSVmzIODx/BxplSEX1jlSy/sVLqjS3u1nuOPRKGRUEcMXX9RWDcmJ1KLt5g7ejMiP2c
 abYJn+FWfsL3rZChmqJp+k/uoIO9qc4JbAsjeKLCY9FezI2dG7koevfy+mmCLaWx6lOloQC4HM+
 8F9MrIIxg3Z7t/MMtvbT2I04TDDg96t5nDcS4r0Nhe/OUpf2oW7zI7/BBtqxraY1xbFdALKT4lc
 kmmtmz6CrLwyBROKk=
X-Received: by 2002:a05:600c:3492:b0:493:bc4a:c6b4 with SMTP id
 5b1f17b1804b1-493e68dcf20mr4417515e9.38.1783481111018; 
 Tue, 07 Jul 2026 20:25:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f4ef53sm114956225e9.8.2026.07.07.20.25.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 20:25:10 -0700 (PDT)
Message-ID: <6a4dc316.f6661fbe.30fb76.ed4b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 08 Jul 2026 03:25:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783481111; x=1784085911; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wSHPLYjEfSAKGqo52PTJlu88WW2n2iEfwYLg/yIELcE=;
 b=i2she1AmMnXvL/6n/LHQvOc9uK6aM4QjBeBqUIqbjNKjqeQN2cfYrIHmIsas2n/4km
 w4/Q431IGsRZBgsqZS+lmsErg6HJQ/dqvZKW80Ya0lRJ/bDwS987+1BF+8FUjeBFeAQQ
 EOjoEA0xr5OTQ9oAac//FH0fqUI2UmHzqVL49oT0GwS1Ol56STphQDAhtgA6IlU4QkCK
 r+p7pXRg0VapMrUYOHtKLitw1Ruotk22iqH8Mk0pBK2l0ZcrpKJLObQkeXR5e9Lx7GFs
 EqQ4D9RNhROZlQ/12Fz1ZFAKz0RTExkXLDEfnDmERN1STHGsAXU/2wyG2Cjpl7bKlulN
 RU1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=i2she1Am
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-07
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

Autobuild statistics for 2026-07-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  7  |  0  |  8  |
  2026.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  2  |  2  |  0  |  4  |
    master   | 39  | 186 |  0  | 225 |

Classification of failures by reason for master
-----------------------------------------------

                 host-tar-1.35 | 17
               host-dracut-110 | 14
host-gobject-introspection-... | 13
              host-pahole-1.28 | 10
          host-binutils-2.45.1 | 6 
                   perl-5.42.2 | 5 
                       unknown | 5 
                   dante-1.4.4 | 4 
                host-odb-2.4.0 | 4 
                    olsr-0.9.8 | 4 
                 systemd-258.7 | 4 
                    fmt-12.2.0 | 3 
              host-guile-3.0.9 | 3 
        ltp-testsuite-20260529 | 3 
                  ntp-4.2.8p18 | 3 
            18xx-ti-utils-R8.8 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 2 
amazon-ecr-credential-helpe... | 2 
                  bcusdk-0.0.5 | 2 
                   bird-2.15.1 | 2 
                enscript-1.6.6 | 2 
                  ffmpeg-6.1.5 | 2 
glibc-2.43-45-gdae425b55420... | 2 
            host-binutils-2.44 | 2 
    host-mender-artifact-4.2.0 | 2 
                host-waf-2.1.9 | 2 
      libabseil-cpp-20260107.1 | 2 
   openvmtools-11.3.5-18557794 | 2 
                  stunnel-5.78 | 2 
                    szip-2.1.1 | 2 
toolchain-external-bootlin-... | 2 
uhttpd-15346de8d3ba42200249... | 2 
             alsa-lib-1.2.16.1 | 1 
                   botan-3.5.0 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
               collectd-5.12.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
                    emlog-0.70 | 1 
              execline-2.9.6.1 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
  gobject-introspection-1.84.0 | 1 
                    grub2-2.14 | 1 
                     gzip-1.14 | 1 
    host-gcc-bare-metal-16.1.0 | 1 
         host-gcc-final-15.3.0 | 1 
                 host-gdb-15.2 | 1 
host-google-breakpad-f49c2f... | 1 
               host-parted-3.6 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
host-vboot-utils-7dfa482d6a... | 1 
                  iozone-3.508 | 1 
                iproute2-7.0.0 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
                    libev-4.33 | 1 
              libopenssl-3.6.3 | 1 
                libosip2-5.3.1 | 1 
                libressl-3.9.2 | 1 
                  libva-2.23.0 | 1 
                   linux-7.1.3 | 1 
         linux-headers-6.18.38 | 1 
               linux-pam-1.7.2 | 1 
          lua-lunix-20220331-1 | 1 
                  multicat-2.3 | 1 
             openjdk-21.0.10+7 | 1 
                 opensc-0.27.1 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
         python-greenlet-3.5.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8189es-0a5d04114fac3c9f4... | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                      sed-4.10 | 1 
                 sqlite-3.53.3 | 1 
                  swipl-10.0.2 | 1 
               tcf-agent-1.8.0 | 1 
            timescaledb-2.27.1 | 1 
                tinifier-4.1.0 | 1 
               valgrind-3.26.0 | 1 
           virglrenderer-1.3.0 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5a8f4be9273806bb568979746bb0cdf45ce4aa53 |     
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/0b273445a09c2bfdd5e732cb4a0d09509fa94ed2 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/0e4d6e1abaea2e2cf4f4b1948d1305c70a6fda44 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/1caa8d9aeb710d026bfa198c21bf37626fee67f1 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/75b4522b466c4e48bec629b7d84b08ad6abd457c | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/affc4b9debcda01901260d68ffe7c9920488de0f | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/e52096b711b8a3ece6388352567c3787741c4a49 | ORPH
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/fdc0ccd1e1346ed1223cbb7617de55f2b35d9ba6 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/754ee3ba2cded7a0398718ea3ecf6dde8b3402cf |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5b512391de2a5b5975b31c937c552fec879cd90e |     
 microblaze  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d15a036fd9c7cb71334998b270dc286f44b0a442 |     
    i686     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/115ad755e24068313d8fbf684c4d969d72479b4e | ORPH
  mips64el   |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/3cda920cc8e52277b417ef7b841eea508aff82e7 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ad7d2ad10b16e23d52aef68cce9c7e290152406f | ORPH
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/a61367d314f93aaad8d5411b0f4a279a6edf8bb5 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ff79da5de762ff9b6989e736acc23708b2ec0772 | ORPH
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/877b5930352086f5aa2c3ea32067b37c3dd8695e | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ac133ae3614586ab4596e00d73253426b696000c | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e004e62c63b2b30b4c6819035e7be87bf4743b22 | ORPH
    arm      |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/ab6572ed28315f125514915a49a0fa337f8bdf98 | ORPH
powerpc64le  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/7468f1fc57e592c257580cd99b7d9ed4e7a0073e |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b3916e7d5e4c4692289714a815533bfd9268e00d |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/964a8f36c8025726304a0928742808b52b760460 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/295d3589393b9b50b3bddd056c7352771a878598 | ORPH
  aarch64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/695bea9cf4fda6dd8015a5062aea64632219bd26 | ORPH
    mips     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/31650ee2f77c0354340dc9074f2c3bb291266c2a |     
powerpc64le  |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/da14bcb95dcd0a7ebaec684ae9fd4383824fb84d |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/142cae94b1bab4bc7cc1f06291081af4b8f22865 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/39df217ad5a1036d5e606ae0e8291d885e9d0e1a |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/fff11a472621f5404f295032e87f23ace7362718 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/daf08b1f7ab00f900181474a35296324c4d20344 |     
    i686     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/1212c1bb4410e9019ae18705d0701f08fefa53d4 |     
   mipsel    | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/57d9f92ba6b930bfa177c38831e024bdcaaefb81 |     
loongarch64  | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/b32b8ad7b54945526a2e1ebb2b12645ee2760bb2 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/288048cc2f625965f6c1c0bbb132d1debed02d74 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/5bd322243df8a59716ec9ae45eaccd37ecadea89 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/a70d721eafd581940f8a30e4bd9a10811fbf4053 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/336ef741ebe13b94f40153acddfa46be4fe9d294 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/95ec60d6ff24bdcf2423bdc96ce53231ce256fee |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/7af1f27e1a53bd477e933595ea8a88c077150ed7 |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/d50b5fafb47770d9fd060f30946012077e893a39 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b8722d6fe49635cbcd0e3ab901fc1184d095b50e |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/4876e9361c5e7cba19e389edca532c8e5648107a |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/5bd440df3f825aa185a939f1a1634f46ba84d02a |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/a565c9b1dac357689099fba73ed1b5526e17cfa3 |     
   x86_64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/255305c6a3b5db6a269cde39b5bf9be22401f599 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/3ba9fb821218c463a9870fa40137eb1f9c5343bb |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/250f52e907455ed6c76937a0b639cac503b899a6 |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/de83a5776c7758c51f814fa9257f54a120587f8b |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/da4d7a8643c6f2ec87a75195aa0f09ebf94a5914 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/7ce10e953eb0d62f148b2d73962cbc5e0675aa54 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d572f6672b7bf9a7bdf0b5b083fc14034c145b07 |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/ac75101f2df233cbbf5ed0d704a2d7d858c07375 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a529451772f7093a5f1ddb5f7d2e8c0805496452 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/002fd3d5725e05ac791de9509c2fd3e32215093c |     
powerpc64le  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/77ab16cefe53ba47f8e6abfa723ff99ac0a25e69 |     
    or1k     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/460acda5483c353d558d0eb7ffe5cfcae0a92c36 |     
   armeb     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b05bb2397c47949854468f5e559ea3ad8b8d33af |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/36fbd5a73cd8980e31d88705c7f408848ef250ab |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/bc1c876bc37e6c3f44044a9a436f85bf755f99d2 |     
  riscv64    |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/2c26c48d1e5a66f038d484cb1ea4dc2fa40577ef |     
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/76f39be21ebaedc8d7bc90c44b2127496be48c3d | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/00c6a40cc4cd7327d3f6f869f13f28903c5fc5e5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a9f75ae758c0bae86bc2ba6b0ae5fb019f1146e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa9cbc94ed6fb7437b03895a3b931624d50238a6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63ac4263b01b0227f27d60fb1f812625265063f3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d3c53aa9ea21702dd05c7e8cc957420625ea0db6 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ad78fc9377269e9f742cdf74f43055c7b09f90eb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3dd1725b2b49383e0e9a4d07de3821dfa7371a1e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a729c3b00bb7ebb5a991c3b1d6486c38a41985e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bcf33725d5f039b8fd10bd5e46bfc5e275b53a6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/96a808fe7a88e2ce5cd36c7ed854cc369c3a4914 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44cab1713f9c595a2eeb484a0c050dfdd5dbc066 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/544c1797fa342e96900b9533cdc8eca003c4643c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3ad19aab21695de8aa195502dc8d3156bc9e3ac3 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/af567fed6506ec9985887990e04cbd0ca358b335 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8c8acd34ace6a8aebd6157edf17832dd00046a65 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/12a16c8b99d92b65434eff99dd7662aa42c96863 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/88efd2fe83b668ab0207ec684638c595c663b43c |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/23d45700376209dd1e4374243531d257c5ed7b61 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e89d5311bae933658eea0db25a3d0c0fb1a68f7f |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1137a87894ed669909a5a60484d727ab51ceaad8 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/00298eb02e966f6f8d6e4886111ed53619efbbbf | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2716eff41740495afc7e72c0cef49d0350d0a11d | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2cb14fd5c201776bd40e621a8ff20842fcf8975a | ORPH
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7622dec5844419c2ab9cdd9b88d07c04f669380d |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/427a4b48242edf95a8b182dba880f728bdb4b564 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c0c14aeeaf924916ba37b9e243a2e0029742dd01 |     
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/47008dcf2d36860eb397b783fdac3aa081131829 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/64001837918f560e2c1fff149bce92614587b3c0 |     
powerpc64le  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/1d97bfc0ffbbaaa8880a2972b07aa0b9fb06ceba |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/410ea207f3ba71662bde2d6e3f0282f540447676 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/15a445b2103372b3bee4aa733849d94e458bd836 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/b07382638c11443ba565692fce0db61f72e1330f |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/eb77cd96681dcbfc0da7fa7e7d5cf693d8163375 |     
  riscv64    |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/ff26b69df3aefd8de2c9df533369f8268d97438d |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e9fe67a123603eba032af6846887e5db631df4e0 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fc45f7615a646bfe39304cb392410cc396d91c44 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0a28e9238a1fd8585c2c04c19b0f3ab88c8095ec | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ade2e36f319f326edf1e4f6fcea5b6e502e26e44 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/707e036fc9973b415c8957bfa1d231d87a2f5391 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fa507d71f5dcb730f8c12b528e63d63bf42fa07b | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7b63f6f877844154cf552f3a826b85070c43d05a | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7703d8aac5530edf359503e027a80aceaa8d4453 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8f2a6827b4a30ce67271de38a2089202303f7753 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8ae22cff3ba5bcbe5c6d772089cbadf3cdc282e8 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e79bc507fa13f21dacb10485023e4b1dfb488383 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0e0c494ae762d972d55cfc5cf5815d34adc3b1bf | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/31e5da39b5d4204fca4e97afea7f3ce581e682df | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3e20c24d0072d4ee98c2a9862d60f709e3c70dc2 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/789bcae5dc61beb5ad12db902dcc096502c50163 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/15405fc5dedb6664bb78348ac0eb07b756f2d85e | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ae934c2745d602cfa3962ed1c4c7c097b3da7211 | ORPH
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/7e459ca8058ff347aee310a2d503706a1e66c78a |     
powerpc64le  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/f64d8054a88d9a0fc89234998821c488982946b6 |     
    i686     |         host-waf-2.1.9         | NOK | https://autobuild.buildroot.org/results/86bf5b857d36844416e5072daa409700e4b8b74a |     
    i686     |         host-waf-2.1.9         | NOK | https://autobuild.buildroot.org/results/bff2bd5c8d640d93b62a69e269566470702c2097 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/316858707ae733bffb6578c279c59d7d2bab2ef8 |     
   s390x     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/a3d446d1953ce6b1e72d17f829b1d94bde1c8297 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f6892d8ed3352357f17d76020ed614adeacdb93d | ORPH
 aarch64_be  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/fcbb28bf394613d48a94643934743203fc8de7a7 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/1db4a48d317bb3b47c05dd403fcc3a01a8111260 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/1fa23f98c079ec75fd1b865e6025ba64e5ddbdbc |     
    or1k     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/7eeda91240c28988c85e84360b476eb67619f42f |     
  mips64el   |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/99c0da658ccba60afac69caed6364740d440d3c7 | ORPH
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/4b835ef6d58bc35800080a6418a6e4fe4fb95ec0 | ORPH
    i686     |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/2e132c385b660a5fcf28474c6b56a5f6e3bc645c |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/23bdbe3406ad66a80c466297cc2dc04f8b306c00 | ORPH
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/5cd0b9c078dd16d93113ee784549fe668a42e2f9 |     
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/8579919067b2b2b2f103b57df7c110b855c2fc17 | ORPH
    i686     |     linux-headers-6.18.38      | NOK | https://autobuild.buildroot.org/results/0764f117d6cc6c9df79acc2154e419fd045481a8 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9a01346e15761703866eb32252ac4d3096c8c42f | ORPH
    i586     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/e91f809ba5f843de57b96764584bc8920835dd4b |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/27db39d34e67f241527c877d70cb198412fa4749 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/46c0d9f77b07ff2b4e2e5d7ea6b6eedd068c481f |     
 aarch64_be  |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/174d4bc679fa01bd5899fd2e40a27f62de1ade74 |     
 microblaze  |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/73236e21492ddfc19b687054be5c7b6ddd7e0330 | ORPH
    i586     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c37b7f9c3368e697cfc8552b183f612dc78ece02 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/769ffd2d6213ec2988a1352f7507f54c662218af |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e9d3f9b7a2309ed18ad11426fca55e3a8a317e36 |     
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c5875fcf26ed7759f15f9e4f7907929f8486fded | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d1225f8ca0903ddc2ec932806e72ae7a69dc8b7f | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/2a79201fb711ae01f01ea2795dfbcbae2aae2ddb | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/751d01a560f5b0b029730e37255ec74b2d8da857 | ORPH
    i686     |       openjdk-21.0.10+7        | NOK | https://autobuild.buildroot.org/results/34cf5551b6af512901887f79037074f6e8606e44 |     
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/b1d4b748638545cbdcd2cbde033b21804afa6a02 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/dca89544250dda28b7f18d0e08f59b38f66c2ad3 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/58b3e502231b04666b4467a84a8cf64b1e7ff42c |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d1fbd4c53081f875b1e05122d2b63b6e04c206e0 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/60edb13b86f38ed10e7431dc3b4548fbb3fd0c35 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/395972b437587d79d07a02ca8b64df47334dedb8 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5a3ae3d713fa06cc3f2bcb2003bfbd992090c2eb |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/43fb877e0ff868607a8e258b7f24853344d61861 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/72c263b30f70649e33c1ec1587ca14806bd97843 |     
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/446678044f7f25406b55cb991bb427278a9d1abb |     
powerpc64le  |     python-greenlet-3.5.0      | NOK | https://autobuild.buildroot.org/results/d6abe6734147f1853f0437ba5871be4c1cdad727 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/31ff679bb6a71f7a94c1d52834c907d54e7843ea |     
    arm      | rtl8189es-0a5d04114fac3c9f4... | NOK | https://autobuild.buildroot.org/results/0dea1e48ddb72bca510f8efd0b3e3d0e6b46af5d |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5bb13c1a884f43e9ccb6aadfcf95583323ddec3c | ORPH
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/739d8b5f40f37220d3b48a8f9d353e8811c26f61 |     
    i686     |            sed-4.10            | NOK | https://autobuild.buildroot.org/results/31964c71e40cc59dab2850142fbe13b71e5fecda | ORPH
    m68k     |         sqlite-3.53.3          | NOK | https://autobuild.buildroot.org/results/64521cc1f841a045a9631f2d97aeac1b104a9d11 |     
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/11463045b1b251abbe365bc917fc8221291eb42e |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/d7bf0d24ceb2be9161f64b5a3988b1e34aa664a7 |     
    i686     |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/e3d38ed52b2b665c53d46034d07603dec91df262 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/f143711a2acb225da5cff700fcd9e6365b615985 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6915ee8df36b0c6ebc07ce1f9c86c35fa75a0206 |     
    i586     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/282de1fd8d82d233d6db4171bf2fe1de58038ee2 |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7d70da8c56bb9bd0ff4ed414d86cf584221d10e4 |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/12eeb7926e2b228947080d0555bb271665812cc2 |     
    i586     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/a78a52f7efd8f758f57f5ff027010c1710872a74 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5d930fb9e81ce882ad53d907211f3a92457abb91 |     
    i686     |       timescaledb-2.27.1       | NOK | https://autobuild.buildroot.org/results/d8f67e4e23d9a366be4fe519447a1e24ec6562e1 |     
    i586     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/6befac33c490dc8b8f9ef3522e6dd8975a62a667 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/625e09b41bb9f56cd6d79954b82e2361b97ac8ca | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/f658d543822590da332650b79d9cbfeff338b5fa | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/be04b222baa8e084a47524cd1f56adb493baad8e | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c6097718cda6b1a19dc63a3a9fae363a99eb525b | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/240d91df1bf6329a7affc77b9a11fcccade443a0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7e170be6cb4e510ba25f66e84875c8d24447b0c9 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4261cedc923a9f727bda20b4fd46c58c128ff0a6 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/5d3a1a8f8aff0736b99c4dec53a9fcf36a4cfe82 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6eb458e07094d41cc8173a09a2187fa17e8e26c9 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3826cf2c7bf8ca29ece863c1488564aaeadf6e7b | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/53a80b7d08c49e898cfb08ecea70f865b6897782 |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/ed3a0e210dbee8fb3a3614caa2dd528bcbf17cf6 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

               linux-pam-1.7.2 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/62efe6fdbbc04af2ebeb01f3755ac36ee7ab93b4 | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/19fe304cb01fd4eb5e31a091ab9d6ae12559c537 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

gemmlowp-16e8662c34917be006... | 1 
               valgrind-3.26.0 | 1 
                     wine-11.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/2a812ce729f8228b2c332e04b8cdd6db9fbb42d0 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/7b808e2932f06f2e49a346373c74e3d153b93a3b | ORPH
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/2b9d8652789c2da0513552e65fbfa9938f0a4228 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.82.0 | 1 
host-netsurf-buildsystem-75... | 1 
        host-python-lxml-5.3.0 | 1 
             libtorrent-0.13.8 | 1 
                memtest86-7.20 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e9a3286585f4a14d007ddb2cb45f4085b4031507 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/566130b3d066edd6b68255f9c1a9a29f497ffb1d | ORPH
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/e250910551d0d8a4c18512ca54a2ce974b3c9391 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/55570917f7383f3d377c399780465116f3bc97a5 |     
  riscv64    |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/004be2233f3e4a3e5f75ba118278800d66740a2d | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2d6f5a833069d6534fbc31d1c25ae948659165af |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/70f302cc93144c906d41675e09fa01b068fd30ff |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
