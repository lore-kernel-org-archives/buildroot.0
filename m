Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1CEC4450A
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 03:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F3F60797;
	Sat, 18 Jul 2026 03:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQ0gJDFZ8J0y; Sat, 18 Jul 2026 03:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8726F607A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784345355;
	bh=fQSMErqQwgA+4qf/o4nN1e7dKoMACG0DIQ+5WkH1bFk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ms90QtNdx8hUmCBF+2f2cTbpdmp6dg6IzQwza8WEeD+uHz+fsx17fjTQGTGUJ9dTo
	 Ca9AcHBYgdrgZzVC+Y2W0oK4EzmjMED7PEFTFSi0CsFsyyHJ0rxd3sauoBwZCMbPvC
	 yP3ljbhFd+1otOeZAVMerHYRTkEiVplLjkacdAdhngNHTmkxQE4U3QHuxXrYu+nL2R
	 LphXp3YF/Cg4zFDn96oTLXAgpgJ58nbRmV+7hZ3bDAsXivFovmNODq9EdM1D2+7FKx
	 6ZSSC7ElDeZIk9ap3W/UDIJy24ciSaI2yBoA5cM7+orCpBO3un+oF41ZqzPZmD6bhX
	 Qn1fbQFVRCtsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8726F607A8;
	Sat, 18 Jul 2026 03:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC9D426
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 03:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C625405FF
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 03:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyv62PMlL2iv for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 03:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBF6240A41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF6240A41
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBF6240A41
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 03:29:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so3994474f8f.3
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 20:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784345350; x=1784950150;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zeTKixqVT8I9GanP4b5H3AiQZOy6xKtgxjueMkzTNRc=;
 b=QUoaYx2FDA9xUNX4YBd1Z+fKkisuWSYGffIcGB7qwke45a5WlZ7qDE9BUY+R/BkO0S
 39OetZNE6jJfDTS9M2wUhI06pZI+L4MX+aPCOqJjHM6cFtkj7+xNLtPxhyVVwGTlZlkR
 xzwM4MDh4ZeJn9SYl549mOt15Imc/hTKx3xReQa37aqbl9T/OdVP/qOKBUov8+bBEhbN
 tyNnQrsWJ7izPJJ5RjyJvZQxvYyyr6gXhjjwAUknZEpUAlnyRUnXyczUx/LF1ujNeu0h
 yYvMbaGVCuoZNn/EimIRe8roxwo9KVKLB2nH0N2/BJ176Ls0B8F1r0tseqpch4QtPbM9
 fuaA==
X-Gm-Message-State: AOJu0YwQf9aRK0dhPNEw011+Nfqo0sZf4VvmpKC6zC47wiGCAoCKqMXq
 HWpCq5JpXSa1nzxSo/402+OBU/txzWgv4in9g1hu75VQI490OdptBXbMJRrlSNqT
X-Gm-Gg: AfdE7cmzBsGy/cHIh4lNIGaJ4WkqTf5tBHk8Wpl/DbIRJv48plnJRynFNKRgapv2HuD
 HmIUvZMtJCZhdreGqKa55ClwJp9r+o/K+g/QFLOME0FgkEzx1etkMt6ct6Z8N1NBOdSm+2+YpXA
 XUs/XU7IhpX9vBoVtDUDL5WOs4DdDIdYZJXA5pc6+7bSvCr+qqLKiMwzwDgCPtXuloY22jd0pRZ
 GcTSJE/EbeNlSM7OHaNR9kIFrXYqUabiJvGl10OuWcX/EbWpfrhFMjEnNTdHU/x7KYDY9cZmuHT
 mC7ljU5MDuEnZtABgy+ETbkuwDzXIUKdWy8HN97wsweB4KLoHv4r3jLJuMbp1dSeRopj2UygTJ3
 JLQ3aSdwOFotfIR6k01eDfReE+ar07WcMpc8Lm3PbzHB2fzyMbEPfXv6emHitIh1g1XbNnV/Q/Q
 jpOoTU
X-Received: by 2002:a05:6000:2f86:b0:47d:ee7d:c125 with SMTP id
 ffacd0b85a97d-47f62334b24mr5948143f8f.40.1784345349451; 
 Fri, 17 Jul 2026 20:29:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f6980582csm3239079f8f.13.2026.07.17.20.29.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 20:29:09 -0700 (PDT)
Message-ID: <6a5af305.d9578069.31de66.5531@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 18 Jul 2026 03:29:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784345350; x=1784950150; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zeTKixqVT8I9GanP4b5H3AiQZOy6xKtgxjueMkzTNRc=;
 b=TO16EJ9zG1M00rYVunuCoO9khMYao3toFVzPozjsd+fdFR7HMfBXt7r43pRZM2ey8w
 FL4K4kMTE/9QTIGXy6qGVHfWypZoo6v7kkSKLyvpkA6OI7PyEAWGnIK+lMVjPJ0ySsiJ
 zny6OWUaxaxbB6aKQUrLpEWbjYtepxw+OTPmzJm60wn6PGE0LnMRtHrEILgl2zsejF5X
 GRA87sdZw8QZRmausVWgTFAf3iK4OeR2FxDEmx3nQmElbJ6ur6hqLPjPKkSaitcmY9QB
 Ao+ZySxeFXsLnJJhXLrLpUw/fLx8z9lV1Zp1lm3RA7E8dLMK4TOcu/+fgp8iyWx55rIX
 85Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TO16EJ9z
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-17
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

Autobuild statistics for 2026-07-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  2  |  0  |  4  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  3  |  2  |  0  |  5  |
    master   | 19  | 63  |  0  | 82  |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2026.1 | 5 
              host-pahole-1.31 | 5 
          host-binutils-2.45.1 | 4 
              skalibs-2.14.3.0 | 4 
                       unknown | 3 
                    attr-2.6.0 | 2 
                    ccid-1.5.2 | 2 
        edk2-edk2-stable202602 | 2 
  gobject-introspection-1.84.0 | 2 
               linux-pam-1.7.2 | 2 
            18xx-ti-utils-R8.8 | 1 
amazon-ecr-credential-helpe... | 1 
                  bitcoin-31.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
                    frr-10.5.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                    grub2-2.14 | 1 
                ipmiutil-3.1.9 | 1 
                  janet-1.41.2 | 1 
libfutils-c326ce0cc2a735438... | 1 
           libmicrohttpd-1.0.6 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
          lua-lunix-20220331-1 | 1 
            nss-myhostname-0.3 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.42.2 | 1 
                 pixman-0.46.4 | 1 
                   s6-2.13.1.0 | 1 
                  stunnel-5.78 | 1 
                 sudo-1.9.17p2 | 1 
              tailscale-1.78.1 | 1 
            timescaledb-2.27.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.5 | 1 
               valgrind-3.26.0 | 1 
                   wget-1.25.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 zabbix-7.2.13 | 1 
                 zellij-0.44.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/fdd6ff752103660eca404aa7a5af6fc5351e1b9f |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f604fd0932c155812559a58ce7236c52ad46c020 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/04e4bf2b21cb32b2fba741f7033c7bc1ca27805f |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/a5e65cab6c6f5912b81db0df326a1ad1f985bfd7 |     
  aarch64    |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/80e05370b6542ba2f5d2908bad7f420f76dc6831 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/f30df975217b4393aab936adbb5290f1a7c456b4 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/816f7415cfb4bbcd4448da2abec1ed9bcb2290ca | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/7bc58ece0687772f26a114a0088deaff632441fa | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/e14599dcf3c7faf7d319a0710bbc591c8325902e |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c3472808bcda4d3f109a154c42436cc63ae7b1d2 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d6f9b3c3588fa3a9b73c97aa8ed35ff16e8b87fb |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/e504ee6bd2ff9d3937c78a81733326e5f9c8c4b7 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/111d43b2b054210d5fa8c597cfeb04c85b712014 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b67ea141ef5928051f314f680a479aa7a5138fbb | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8c68341e0c4e560d53a6d26b8fb39cad63e5f0f1 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/ee6ddc9e4541960f3d560570274b4352ca3c0dce |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/60a93ece0d2319db000a4ae536a806b682d3b5f8 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/877c107dbdb58062d988b2b7065301803b1141eb |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/7b7f6b9726db22cdbc2e19e193be5164e99771fe |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/79c16e1b94f263cb0db7c5ec938efdcfe5b426a9 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/b6fea36932da65905de406112a48589a2b74b835 |     
    i586     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/f3ae1ce6aa28b68d9d1bb51df3f5554933b4a24d |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/49b1f0ac8a597b96b6d7967e4237ede7dfe235d0 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/0ae098c008967448213ec8020eed60de83e9dc56 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/4d95975c27ba38ddc658bfdb8c6760e5767f4e96 |     
  mips64el   |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/342cd91c7648942d53255229579a6aec5237071d |     
    arm      |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/b6cb4df222a895cd3ee24f073f182004ef335e1c |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/3b717982f298e6f0334553b9e8b7da3972316d8a |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/4e6e125658339978cc9da42cd259892bf7b0b768 |     
   x86_64    |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/d9ba6334ea81d54c4d45ea1ca82cdf43c4fe975d |     
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/e3fd83043aa0a39a49efe8c5a8156f3de0bd8b47 | ORPH
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/3c8c97170bbac4827dd60f1c284792134fe5f4ca |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/2c4914396a885f9ea643b222e994b9c906fe8bc2 |     
  mips64el   |      libmicrohttpd-1.0.6       | NOK | https://autobuild.buildroot.org/results/1e5031858bcb5ec1ae50296c5c19a4e320cd1aa1 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e0d51e130c93272108272be33361df3e255b07b7 | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/278d2487fa41b4af9ec48d431c76ca6aca488d70 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b051c067bcbd4f9a801a4d7f994eb461bc55e4ec | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/81ad16a79f0d7928bbe37577b94a481c7390ee4c |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/b41f02335c39af1b9fc28ebd77d83a495d028b65 |     
    i686     |       nss-myhostname-0.3       | NOK | https://autobuild.buildroot.org/results/7d7dbc092b775358c4ea743d5c858f173c962956 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/137f03cb649024a31d70cfe999258230485be151 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/294daafdc3a0aaf6514a2b4182a3045f880fd528 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/c17dccf8c20251f06727a7c129a735509c5bd4dc | ORPH
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/0d4a938cea475b2647868e391eff15e57019866a |     
  riscv64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0c366ae596a5eb751baf70cc589f48adbbf3c593 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/96bf4e4e4950c97220e0358616784ba3a92ba8a4 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/48a3ca32632e4523c30a9eb42fc8a41bc035b041 |     
    hppa     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e13befedc2055564009aab5b36cc9f91256230a1 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/c6571f6a0194e6120b6e9d558df52333aefec4df |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/480f317c41a6411b2194ed3599da19f8fffb3777 | ORPH
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/163d67c5ee639ac002e794685373a3129ece42c2 |     
    i686     |       timescaledb-2.27.1       | NOK | https://autobuild.buildroot.org/results/2e842bb3d15ded693835dec0b955fc2930815b71 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/559ae8888e4222451eb4ef03c6b21103a7081d75 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/48170030370c70de061c8eaacab2cf340a772235 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3816f0f6fd9d9b51af6948f9c094516d168badc5 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ba885baa2c8ff115492de4487377d34e69e987c1 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/15022b7e4ff3506fcc27c8a73b0e6501ecb18769 | ORPH
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/f3931537b73d3aa60000b4c5f9724e7b6afe60e9 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/0b65484c17b9110832f5b298cc01822d5ec5b1af | ORPH
    i586     |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/0ca2d91a214a912b4caebbcc31be4b0a502fa8df |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/f16896d3992c7868408ffdada50214f1fb1eed89 |     
   x86_64    |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/ab11bcab978cef6bdaeaf3b69055af406185df30 |     
  aarch64    |         zellij-0.44.3          | NOK | https://autobuild.buildroot.org/results/b6ec546217a77f571598622f9b3e52117cdab266 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

        edk2-edk2-stable202602 | 1 
  gobject-introspection-1.84.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/334e2435f7efb54386114bcb05a14af3bc0ae549 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a00a69f1493651df623e4f6721520f927ee38c07 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

       host-gcc-initial-14.3.0 | 1 
        ltp-testsuite-20250930 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/8338ae03b2d01b8d291208e48486a49042ffa8b3 |     
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/bdff569880a4eb67f89610a7a5e8f8b3afed1941 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libopenssl-3.5.7 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        libopenssl-3.5.7        | NOK | https://autobuild.buildroot.org/results/8fc1a0ab9bcd502718934836d91d0d6164a827dc | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c477d20f06aa6c123fd777784b87163989602f1d | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
