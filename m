Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E426FC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 03:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D4A606FA;
	Sat,  4 Jul 2026 03:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3flUXZB9Hml; Sat,  4 Jul 2026 03:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7790606E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783135415;
	bh=4Sl8lCjgGic+rbrVOiPzl/PFPaZGetWtuEVHuXAcJLM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pg8RkhIlgCj+0tLn9OaNhIi+DPF6hjmyt//alMEqiJkRGW26/EZUjMqOH66tToiz8
	 3lJUIwZPZMsgvn4/er2vFodELprA57fzB4TSmHSu2jGvTLMTDzJjoe5SBqzlU7CYdA
	 +FTCA0hn9+ge+4JCRkuhGLloxrITDG6wWb6vD50QMqmoNtM2lxFiBqEqeLVXQvpqsJ
	 5abrKqb73z6aIT1IJbPSF2yJf+QMWtWERBYwntRsxDI3ALyp4gDDaBWL0r1/Qc5qc8
	 AGiyFJzRV3gAXMwbhB231qGOyN6D3RoJ630DBEizDaDWsvyL2il/FBee8hG238L8ed
	 jUoEUstKMFccQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7790606E0;
	Sat,  4 Jul 2026 03:23:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D91316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 03:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93E7400A6
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 03:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8ZgbshRyIS0 for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 03:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DE9040025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE9040025
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DE9040025
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 03:23:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47488efcf30so731272f8f.3
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 20:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783135410; x=1783740210;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMzSJxIKFt8N6zgHWY4dkJzzPjkdbKF+GmRekgrGakw=;
 b=Dx/GCUSNTWXvYcXLpVywys/dR+/n8Q+LasOCO54NPyGkvO58dXfv/FaLAJW4VgrMBw
 5ReEVRfnHDziX+VNtVtrgUtNZ0oChVAbNcJ5RVdiP32pFUSd2GTEgEe7j5fN12k7qCCv
 0u9ftizrNRpA5mTimm2zWUgDum2JNsNX4xh6BsYGpFeXjARU5dhfiK26Yq5z/+HU0MqN
 XmiPUHUp8LYFrYAM6p/GoJ7POs62kwZtrl0lkZTegN9ujhkWZ9nlQVggQzlXEClCnH9L
 APtQbXySTlA2XSNMZOD4Wotm2Q3UCvimdTI9NSoEALQYsSo2ij9+zfq8J8/FO/DxRxHq
 l3Tw==
X-Gm-Message-State: AOJu0YxUUwRBizrKboelroaGqvzwixDNCBmtraiG/TM0l1vyGSqgtyVv
 A87r98p3btNOq+KihtZkQqlU3+1gX55ZaI/uuhtdgBqIigLQxHCqDX/huuutIcTe
X-Gm-Gg: AfdE7clrrmJXZRpaPnV51HaiQH2GCYCSB4NHtDgbxw9rkJxLxaP4ofmdo6cjoQ7xO2z
 qbCLGsOcuH7gCu5AZ++8F27FDk0aMpteP7ah6oGXqwHd4/iY8YVMZ9RU6im64dY4e7kkbOOouhI
 lrcm4diS1E7XKlZ+JqOv+gqShk+KzwJw7rDCISR9rr/cJmxhEjFTtGm8OTGpmXeqiQkFEWmApMQ
 64ulP5h0/NsHwPJxA0F7+2TKKpa5SENL8KV33OHESgxeXR/UmrqZ1vrtJgM/tAPnzd1kZF+U1e9
 LaMJCaqYe9JjQtJ9ZRotX/dOo0zhZMAmdXgiPUAID3usoh0KwxRPzhG39teWABj39bku5NF4D2X
 6SeC8udUkUPJRcHMWBIaKaDb9Pp/Eevgkp+tyOMmABaZaef7npvaRnQdeLmx7YJNTFyGdNAPB01
 x0by2VmQyLhgOmKwU=
X-Received: by 2002:adf:ecc3:0:b0:460:71e6:e3b with SMTP id
 ffacd0b85a97d-47aad07dec3mr1485612f8f.27.1783135409799; 
 Fri, 03 Jul 2026 20:23:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm4180376f8f.22.2026.07.03.20.23.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 20:23:29 -0700 (PDT)
Message-ID: <6a487cb1.9099b29d.1420c4.659d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 04 Jul 2026 03:23:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783135410; x=1783740210; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HMzSJxIKFt8N6zgHWY4dkJzzPjkdbKF+GmRekgrGakw=;
 b=B+PoDsIU7g4QbHpukfJy/zSyECkW6zOMquMRQsnp2V6aiAgW0QVzXKiar/hHrL1jh2
 83sXelvQSXX8b53udqaCvOKiAxstsJVkQZLigcjJiahmy3L6RU7l2BmU6WP0vgPeMOSx
 yB8UUTLN1RCeRexTNJzfVIY9eL+RPKyuMAsmxDS0IfjVovhC6qVYKnJOEckW1kBUkRBw
 VAEmaL67AoujEclbVHzSIjj5D3K/NPOQSCkdv7OUg/iTswHnLez4m/TLDu5BJb9Q/ts3
 CJx5Fy/nt3cp2orqhUdJ8gWCYCEWdSs2SkfF9+GD2f39FtPfLPE0bKbGH178WJ+JlVaG
 7Bcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=B+PoDsIU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-03
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

Autobuild statistics for 2026-07-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  2  |  2  |  0  |  4  |
    master   | 15  | 58  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.6 | 24
                   perl-5.42.2 | 4 
        edk2-edk2-stable202602 | 3 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
              host-pahole-1.28 | 2 
host-vboot-utils-7dfa482d6a... | 2 
rtl8723bu-ac3d2f564bdf6816f... | 2 
uhttpd-15346de8d3ba42200249... | 2 
          cloudflared-2025.8.1 | 1 
                 gnupg2-2.5.20 | 1 
               host-dracut-110 | 1 
host-gcc-initial-arc-2024.1... | 1 
   libcdio-paranoia-10.2+2.0.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.1.2 | 1 
         linux-headers-6.18.37 | 1 
               linux-pam-1.7.2 | 1 
               madplay-0.15.2b | 1 
            minizip-zlib-1.3.1 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.33 | 1 
                 s6-rc-0.5.5.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/e3338c83c1e7b5a0df8114e2fd523b5d9a9237d5 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3883b75c133bb355c03b7f24bd02a98abfaa2b96 |     
   mips64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3c0ed06d373562004e4e872212618db2d3cd88d8 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c4b7a047f47fe0734bb1a5b27729c4d0694d12a5 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/41b9acc69ad12b34b4b090940e6fbffee97a6aa7 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a6cef4c5965fdeb40d3b39cbd40941329f4fc1c8 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/21a4850a7c96d804c534723a61bc7750342d6d4e |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2ddc216320dc05b9043cefd21ac393db905b482f |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/1f78ea263f9a79fe615d726c2e168ba7f0b6d443 |     
   s390x     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/64fcbe8be336f1ebf78411e133bb127d457fd20a |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4525d56de3de6f71f22fc1681af187fcf44d1091 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/13d97a9c9b091c5c36d8306b9899a6ac16b0012e |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4989ac59b21e2dd0fe53c44d9488bcf33092faad |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cfd5c331deef5eaa535979e6529681c6b1e95217 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/77cd5456169e04c2f92dc328c4b6828513d1195f |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2f7e64825e462bf11a0c0e126cfe1fc3836d607c |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/779f6b61cf4837450142fe6f1da81f4230e51e8b |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0f62642b76b399b78a3b5677a9231843b5ad80d0 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/7a4fb2b21027f98df607871d9fe0dd234d44aebb |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/934b11f8d725569b9c66df37dc20a1938b1fe01d |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2d32ed668bacfdc18c04bd9118fb8e7e23854ff8 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4d1dbd6eb7a3dc27cf0ac7c1129bf24f8e5ce964 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a89c77481eb3f04b8048331173e88374fccbd969 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0c5a7f082f4c47931d21c7dabfa548bbef7fc14e |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/cc54f724e92ced92badf871a02492e4730499c35 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0b50ac8de94d2d9288c3dc7b1a2d26f9723b3207 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/70a2cb40ff4892613a80fcf44d54aa13300501f4 | ORPH
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/012c14e80ff0fd9e4ba0c0c6d7ca9011473203b6 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d94b723e2488b66836d974a938256661d4d5f477 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/22a519ea8eec70c92fee6dc54f2d8a51e3b412ee |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/9110816dc536d195702710932520a9988a174ec4 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/90a8e79023a41a9e9714e54299f487eff96a2daa | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e13e9299f123d1e1552f40604f440e171f1f7f79 | ORPH
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/1d01712b9b997431bd3d6d1781332b3dcdbafe8c |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/7024c5379d42a7b3ab899f7cd5d834d46d36a1cc |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/d1b54a6750aa92c141a1e61127fd4d9b140d809d |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/db69614378086bad84e2492e4c5753c02a21f713 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/5f4fe75e8bba9676d49f08fc5d738713bf3e9b03 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/a5846591b851475c5dbc2e65d960a20cf49530fd |     
    arm      |  libcdio-paranoia-10.2+2.0.2   | NOK | https://autobuild.buildroot.org/results/7115cbcb905b8f766ef48a54ddc8b3b9083b026f |     
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/7344fd58b0abf3ab4a96e7ae51fdb8aa882a5194 | ORPH
    i686     |          linux-7.1.2           | NOK | https://autobuild.buildroot.org/results/14f67ae0f584a0c24f91075a264820404b8bc5f7 | ORPH
  mips64el   |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/5c0685df3aaaf4a8f9e5ac886f56ce72ddc59d18 | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3e178b38aec32cd01f1c47ca30852e57418f0c59 | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/8a7f7490c366ec2192c3c72daae6a054efbc9c48 | ORPH
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/39a3dcb8c5d57f2e16fcb0f90fc2bc0375e65ef9 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/33f219fda072423a62e345609f6554e79f773c3f | ORPH
    i686     |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/afa1472d5b53ce5e3ba8ad318a839d266eb973b9 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3853d85e574a027c15a1e1f2cb5206cc527eb7f4 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/712105d499db36926a01147b9bf8e89e6b8efea5 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f8d47161673fc925ccf2a73b94a01ae244245f07 |     
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3c6b95b65e0dc6a8fdfcbf334a037f3492a35a69 |     
  riscv64    | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/47c32c883ff62fc8e56400f7381b37540b89aa78 |     
    i586     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/1016ea7b0d64d487985fe1d656ed118d73190f7f |     
    arm      |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/bd5d04936f622c924f3ef6ce30401fe9a91d5455 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3adf50740539c9fc75967a22976bc383ed257499 | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e1d8da3f9530ab365fca22e7e7058b93656c7877 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/80e2bcca0d663e12d5fe2bdb970b9a11dfd4525f |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   guile-3.0.9 | 1 
                  linux-7.0.11 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/7c666284e7ea8632f80a641ffad462d54665f84a |     
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/06f9f049d80456853371015e0312a132033caa89 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

      libabseil-cpp-20260107.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/0333b8201323ca105892d36b418ec3f656ce4ee2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bitcoin-28.0 | 1 
          cloudflared-2025.1.0 | 1 
        host-python-lxml-5.3.0 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/955a82d316f975dfec5a39c7e9e357a407c014db |     
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/6ed2a2ee2f0d29188542adcce1648e8276a0ab48 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b718384c21bf04094efd7120435f607c83f51254 |     
    i586     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/77869bca31ecb6c63695b270713a9d7ca5124611 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
