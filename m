Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35EAEF5868
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 04:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC4F40BEF;
	Sun, 15 Feb 2026 04:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qhQKE1dcXDP; Sun, 15 Feb 2026 04:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF7040BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771129180;
	bh=ByzwF0Rtof1v46/d5Y/l/90Sy4gmMEV+5xHCiSMpk0Y=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jIPiREPHTPlSx0mdiwoJ8Ntxj0Ab0hNhGufAU3tT0YTzB28KehOY3vTCeuxDo0s8w
	 gTJzIxYaNIwZpepMxF9mXElDGwB7xgjyLPA4V6O4jBZL5nTw5LpkZlFWNH6OonIn/D
	 2q9tDzobq5eqmVfD1tmyReT1LvzVRTTLiFD8HNFnIz++J9fZcRDN1IvL/PntmtqSyV
	 OsfL2DNCHs1xJ8xCFnIyXbvS2+m9L/YESZ66Jl5Pc+vNpaK3oSRab65cAOhkSMG5FS
	 knNXF8oGHHvRiLTLKs324YcUflKqMW2vU+fiPf+gPDMsgj1ZlkV5xcBAoehkXcX1bs
	 gPZ6410Tg4dYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF7040BCB;
	Sun, 15 Feb 2026 04:19:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EC1231F
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 04:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CE40404F5
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 04:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGgVXL-tpafo for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 04:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72E0F404F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E0F404F7
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72E0F404F7
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 04:19:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43590777e22so1280738f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771129175; x=1771733975;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ov4pOHb5tEaEU4PbHxmVE4btk6opyDPnnu1IhGtW9NE=;
 b=N+5OkPEmQSfiDJmVm9AiIzvScAAeu3MmndXjHVd+m9DrNG/3TqMrOnWOEjaflu9qD/
 mXNIW2WClvYK3tzoIe4EIZFRmZaCZawygIxhybWOnpaQ3bbiZXyjrfMHRB+OKWIIRjGR
 JpjPdLGekuaXS6TfxDeo870sHg7Y6RK5dWTFipitPIhS+VqMllC+Q189dEAFJVZssIqZ
 TPBMSAQpNqnyoEIrIvevxdG/g1FBzjNFm4V557rE3L+0YXRTXdb1+Ml3RdgJ6nI2gEQL
 IuVkFJo9K9utMasylKZzRukI2ohEKsoLyouqmWPPpp3sywftS1D+y+J3kLr+wQfcioxU
 I1/g==
X-Gm-Message-State: AOJu0Yw5iN2igjT3G2WuvzE687TSLP1bo+0OiEcz+gLmeh0OaTfF+HWC
 LyPHZ9jDhBnnKzum1kv88RhN7XscgZfzuAyaazpQjU+MEoJk7v30eZaa1/XEfQ==
X-Gm-Gg: AZuq6aJ+lVuyDzcpIXaraXLeV/bO46Fr+wcvpbtzJYZyKByXGQ2YRM8gZXOWIJsTcLh
 JFlmV3jdN3slUu8xmXTLxlFFYqxoSp2ZhlVBpfbGxixTlr0pya2oIfngZOBR8XVmFfv4fXSCwIk
 EtGFuoCRThvRXz2YNUywbWbk4SBgKPTp2nR3mXl4vN9T88iQe5IpKqYDIBIgWBuXeGRJaavvtQ5
 5WN05kRnHycFi34t/TouTLUyARByQ1nsG5quNOFs4X0d6A3Vjas8JrvV6ASVcm8x1VPpCFM3CRL
 A+1IgDof+tCsZpLFCEFFuopyvs3A/RL4v+nvR23HhMGgGaHMO7c2Kc3+ocRBHGJPcefwgMfI+Jd
 3RAYTOnvheFY7/cwrk19eSjSoryUp3v4BO9qw5lfYD69h6YaRrpprIIgBbWMWHyC5Q9LgPk7ZTH
 J4lbNxoYCvdretX3hOzsOFQA4WuLa8Xg==
X-Received: by 2002:a05:6000:2282:b0:436:30b0:75a2 with SMTP id
 ffacd0b85a97d-4379dba73c2mr9353264f8f.56.1771129174819; 
 Sat, 14 Feb 2026 20:19:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acffcesm15466238f8f.37.2026.02.14.20.19.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 20:19:34 -0800 (PST)
Message-ID: <69914956.5d0a0220.1c5c61.9896@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 15 Feb 2026 04:19:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771129175; x=1771733975; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ov4pOHb5tEaEU4PbHxmVE4btk6opyDPnnu1IhGtW9NE=;
 b=JM2graV7+oLJ4X5Tvtrl9xYdMTA0iT4ke5pk3/M6kKdGDJwzcghQbyD02Ycxa3YitF
 e+RaA3UC7W8KUAyZCsOU273gIQ154CN9dY0bAVCFxrcN4/Bcj/PXgnntW8R0timWT3Vl
 0Oglwq+CkKP0kTO+wHF7r+8TBhdLwJCjop40AoQ2OjA0y3PeZZBC6lTdq/9YqY33+9af
 zeXi94ITQ5LOmewCPpuFiPP1YldhW8pjBHUTFPNwvsIZzTaSLLwRvgVOOEzrgAB9PY+d
 T7wtx+LUv66hygCRNObUmRhlhm7B/9VDBoHbVGp7jCYjkJB3nT3qKcUbi04rB2D0jRGG
 9dPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JM2graV7
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-14
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

Autobuild statistics for 2026-02-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  4  |  0  |  8  |
  2025.11.x  |  1  |  1  |  0  |  2  |
    master   | 33  | 54  |  2  | 89  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                  cairo-1.18.4 | 2 
             dahdi-linux-3.3.0 | 2 
glibc-2.42-51-gcbf39c26b258... | 2 
               graphene-1.10.8 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                   perl-5.42.0 | 2 
ustream-ssl-5a81c108d20e247... | 2 
           at-spi2-core-2.58.2 | 1 
             bmap-writer-1.0.2 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
              containerd-2.0.2 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
             docker-cli-28.3.2 | 1 
              e2fsprogs-1.47.3 | 1 
                      fio-3.41 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freeipmi-1.6.16 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
               harfbuzz-12.3.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                jemalloc-5.3.0 | 1 
                  kexec-2.0.32 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
                  libnss-3.120 | 1 
                    libopenssl | 1 
                   linux-tools | 1 
                 mdevd-0.1.6.5 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                opencv4-4.13.0 | 1 
          powerpc-utils-1.3.11 | 1 
               pulseaudio-17.0 | 1 
         s6-networking-2.7.0.4 | 1 
               tcf-agent-1.8.0 | 1 
               trousers-0.3.15 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/196224c057710e219338b9f2f5e5c2f665876ebb |     
   s390x     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/d117df66c14c9376d7f457ea01e80242ae50b67e |     
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/221bd7604aebdc1479bcf31dbfd790972c3a8f19 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/43b9fe3fefa7a836c1e028507c4b834f4c576edd |     
    m68k     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/3b53d32dec6c1d9de54ceaa4146782b58a16d1d5 | ORPH
powerpc64le  |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/bc89d8088224ac671400d900453e522574d88d6d |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/87c6e8dec1c37f79350f02874b5c18143f624425 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b9cccafc090b40be32b454e858e849e971a93df0 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1f93397d1ad7256c7c7b269705e053880a739177 | ORPH
  riscv64    |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/eb041445d0e5e6cfc1a8f8db63890ff9604406c1 |     
    i686     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/f02d4e8aa6ae21f8a27748c6ca63503f099758c4 | ORPH
   x86_64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/41db210797fc5f036246063a9e3634b27158b3c8 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/5605f4ec575994f9e13f5367ea4bb919659e7b45 |     
microblazeel |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/c8ab34c53f8f6e222e4882d27bba46602dedc6f4 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/05011e84072c05873d5fcf6654ee183cd1b9bef4 |     
    arc      | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/73d4f6e140544d5a2e187a7ba6eb1af10e80a78b |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/6b7f62c636a0562ec3bb8fd127b65abd9f79616e |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/dd8ab502130073f6f6a0aa66555f968ec6a64541 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9c84157bfb71cecd3c5b63da28e07aa966bcdac4 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/2674c9e90f5ad665c6bcc4243860c751655dfd01 | ORPH
    or1k     |        harfbuzz-12.3.2         | NOK | https://autobuild.buildroot.org/results/36cc5569468cf9c74645310115120ed061379935 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/05c8befdbdfa3c38ba8bf803a73ff546b47f2200 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f59b30a2e503dafd32ead950110706275b43b2c5 | ORPH
   mips64    |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/92462003f5a6a3480aba3f57811f638445c34cb0 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/bdd111f29ed340dac426363dce0a495afa1a1acb |     
   mipsel    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/26b3795a388dfe7a5854ced1e2ad095658a6122d |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/5db40774389e717401d7947279c32dc863a1c89b |     
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/293b4f696011dd841043ffd465fc2c7ead0f5a6f |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ec54dbef3733b66ffb5b2562336182383ab72a23 |     
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/2764a1d351516a305fcf7a916560a096fbe23851 |     
  sparc64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/c6f3dee48b2337ddf971987d33a238fa1d333ab7 |     
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/95d82631490ef16e6a4d314ec203687c62e88508 |     
powerpc64le  |          libnss-3.120          | NOK | https://autobuild.buildroot.org/results/640a840bc6e407cacd7ae3f8b1ca46c525144815 |     
   mips64    |           libopenssl           | TIM | https://autobuild.buildroot.org/results/6ecf08ecc5ad41e48bff5b5df2f62b4499b201df |     
   armeb     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/57d01bb8f4e139bc1fa8b91828bfc0ebe83aeb08 | ORPH
   x86_64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/6ae3d14560f9853db558f98da48b1b17ffd9ee45 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/48b276c1b282bbc14e1d78c417a49bde3ddc342b | ORPH
 aarch64_be  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/fda9a349039f0c1e2a71b8eb56b22474dcd0ad26 |     
    or1k     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/8d31ece579791b83a3e86e841a8368a898726719 | ORPH
 microblaze  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/0ed85c65713eb889685ffd1b51407996c2c54e15 |     
 microblaze  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/809f9a9154ef91a7ade1c1230ae6d982dd9a82a4 |     
 aarch64_be  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/fe987ee3deed906a9d79d5de39e28305ef552552 |     
    or1k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/fcec60b9d135a53beed5146968e0367c04f1e8d9 |     
powerpc64le  |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/10a0cf32084d46ecd0b6ddf67dfb2c698b5ebe0f | ORPH
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e3221f892b733705628ff05f12bfe481b57ea701 | ORPH
  powerpc    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/ec3983670a63d31a774dd4275f5d26cc5dd4b24b |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/549c8d2213d3df78b8103f1f460739e7fa74fb1b |     
 powerpc64   |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/987d80f91f67f3e5e2f897c1590f9d6609a2403f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/4fdc2e1876c83992f0d1e0b9c4cf33cd86dba30e |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9d1d5082b359fc654edb2a83d2c43b69eb43a923 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/9ad12c4953ef0442184a83edce39836ea2898f4e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/57faa06a0f056f2441d28086b36b76231689ed68 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b2ec6aa6f342bce766d50949e454c1f5b7d00d5c |     
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/398af93f1d2875dbbeeefbb5bc1fa32ae65c667f | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/87a91fff58cc34d47e882251c80db32444e66654 | ORPH
    or1k     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/dd035cad3c00756e00c244f84cbc7bdf57124e82 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

              mariadb-10.11.15 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/8c6e6468de376d36e0781e6dd247eb6f00bf7051 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-netsurf-buildsystem-75... | 1 
                  libbpf-1.5.0 | 1 
            resiprocate-1.12.0 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/14b53a5b74435cd96f9be9b5d5eb3cc334e67429 | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/764eea6db4dceb91356b7967ab590dccb76b65bf |     
    mips     |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/1f95b85e77df021ac72cb24f53d491f31a9ffc73 | ORPH
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/80ea563fb4f60c505ef88ec6d17f1c0dfff6ed29 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
