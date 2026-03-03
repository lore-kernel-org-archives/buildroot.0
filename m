Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6ABE67A61
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 04:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E25761369;
	Tue,  3 Mar 2026 04:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5XJFVC6_6Mq; Tue,  3 Mar 2026 04:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8176135B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772511913;
	bh=MNWZ2PEk5inmCjXGTsjU0BUv3sfzbvEQ2xBBs3KhDPQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mm9gENG9Hi3J+IGBoHWt/MUuuHRN/9ShHXVL0i9qM5oFsM+IJIdr2PWlADQgS+pqn
	 n0iIkdRC3Tn2LeSlv88qBOoPQ/gYGXZCKVXK7LpUHU24H+9R8niT50YmN+HKv6wuKO
	 csgD7UJZ5iwC/oCsJ4EpCq8xyG+2zSOIJIc6mdwjx+UzQH5R18sDNEwrJHA/g3mbd2
	 we7/SZg1nV8DqcyHlIphJBmOQs3ougzxk4oFoY47pyHyWvbvJ1KqZ/IlZbUDQoG/ep
	 d/gzQnzZsgQbRc7AOew53qVDP0nl4Zl02ddrIaPsvBuxusTuiRQHt7ep0jfiAXczhg
	 WOqFljfDkg50Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8176135B;
	Tue,  3 Mar 2026 04:25:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FFC25D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 04:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 565BB84006
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 04:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtyWrByoBAyG for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 04:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ECC183E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECC183E38
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ECC183E38
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 04:25:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso44163745e9.3
 for <buildroot@buildroot.org>; Mon, 02 Mar 2026 20:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772511907; x=1773116707;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iEP5nkg73+o3h4HTBU+xoC3/xjwh7wUwFO9ws1RBxRA=;
 b=cpzluHgDQoFel/4XOT07xZlBqS3FNoBK/LXc+/vrn3yNF1Fe/SOg2Y01irWFGXcpz4
 PV6MM6oSre2lZUoNcZ8uipR/AeFuGpzKS9I2QvRnbOoUuXuZR+X0+ReQqw7C03vXD9uU
 ADCnEr8OaX6g2VuQiFQbOzmFkigy/2v1yBpL1Tx2iYe6diihkDqanHCeeTDU8YwiIYdI
 HXd0IJiED0Bub3b1SjXq5Ct1kq7y6T+GKxggCJVRfEjljJe6q6LMsxInjLrJpqB+FuhF
 pPns8jb18NkYXQWG6dW9WvBb8FLgRNO53gEq11SS9EnP+CrfYd0Q1p5vYY4dME+6IzqR
 ow+Q==
X-Gm-Message-State: AOJu0YxBlJxxtlGXy8wemLmi+IvWGtT9znVrml6J3MXCqVTD2WfzelD5
 Nvqh6VUzqkwPy9GWsJDnfkMouDniOlQvh5uWHzfyfW8YioCRs6L8jUPGZpurQq1i
X-Gm-Gg: ATEYQzxpLj99P3sFdd3DcWKMiuCqiXSZsLupvDqWgkLYnCDFYRugYNNmYV80fqroZMI
 pJlm/CGL2lzLmghMoWIk2KhyhCjSsyPIluzTOxm28Yk9FwmIYuhLH+gpbHGTjD6tktOkOQslQgP
 Xj1+cAhp6r3uHdXytyVcx+ceXCF1alfiP8k9WEcTjYbbOQN7ZwRAx+i3o1KsXqtc0s8TiUBTtmL
 UqhLC5pqN1UKKhOaev0oPbB4few422AHyuJ4PxXEEECpJnxy72t0spRStHRVQKSz/8gwAq1oxhM
 ctjrZYoRrzMFFIB3jVwk/2ewIjcxNNnGXIgXH/vLX1c71OxLKD/y8W74Kck6I6z+xO2TZeVXMo+
 Lome7bKh7235Lfbng3VqqO4z/tmH6VVbstNNNiE/NjIf5xO7n1YGLbyRoKuTx9L+LGIng281kn+
 6zC3UiAwTQT2Wl+07g1H3ok2hfBcAE/A==
X-Received: by 2002:a05:600c:3e0b:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-483c9b6d539mr266462855e9.0.1772511907182; 
 Mon, 02 Mar 2026 20:25:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851335e1f9sm7460115e9.7.2026.03.02.20.25.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 20:25:06 -0800 (PST)
Message-ID: <69a662a2.050a0220.1e5129.3857@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 03 Mar 2026 04:25:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772511907; x=1773116707; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iEP5nkg73+o3h4HTBU+xoC3/xjwh7wUwFO9ws1RBxRA=;
 b=fOawISJTNgRKzmJ3juS28MATarewS1qZhTKCqo6BnRifrWBCqwG0PJ3nP+hV8TNXJN
 qKS3xZvaJGniQJj7RYcw0Opwm6pswDAouBM5te7FMBlUEcrh/63leXrR/TqxE3k0BT6l
 K4ac4cRueE9lTwnFn1AHXV35wkWrclFJ582vZBYIheW3yjzuoqn5RAmtIkFC65xUpq9x
 OTBOpcWxFbWnDlKD+gYOumpjqtVz9jc9FjSPk058ry/hRdU8S/uZlk4q3VpHArvmtlhu
 D6tiD8RxvXX7LO2IXGaaCxqizbKw4tjP2FGA7IS/x76I0eduIlr+4iX9lRjmlFfte6d5
 OOHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fOawISJT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-02
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

Autobuild statistics for 2026-03-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
  2025.11.x  |  2  |  2  |  0  |  4  |
    master   | 44  | 63  |  3  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
                    ficl-4.1.0 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
             libgphoto2-2.5.33 | 2 
              libopenssl-3.6.1 | 2 
                 linux-headers | 2 
        ltp-testsuite-20250930 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                 systemd-258.4 | 2 
                  boinc-7.20.2 | 1 
                 cdrkit-1.1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.3 | 1 
                easydbus-0.1.0 | 1 
                  ethtool-6.15 | 1 
       freeradius-client-1.1.7 | 1 
                    gawk-5.3.2 | 1 
           ghostscript-10.06.0 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
                 host-rust-bin | 1 
          host-tipidee-0.0.5.1 | 1 
                host-wine-11.0 | 1 
                  iozone-3.508 | 1 
      libabseil-cpp-20260107.1 | 1 
libdill-32d0e8b733416208e04... | 1 
                libglvnd-1.7.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
                       mrp-1.2 | 1 
                  nginx-1.28.1 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openocd-0.12.0 | 1 
               openscap-1.3.12 | 1 
                openssh-10.2p1 | 1 
                     php-8.5.3 | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-46.0.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
           uboot-tools-2025.10 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/04ef03dbc5556c6b3c22d09d796d32bc0f33728f |     
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/8d76c04f77632c1f01793086ca451fdf0251fefc |     
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/4f543205f6a2ef512e476d9ee9f3b6b116d1aa62 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5f5f896347ec6c4c3d9772d24262d954fcc306f9 | ORPH
   s390x     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/4b016d3b686ebe0202e41f002af1070b7077f3eb | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/b21ef42e6ec80fe26cb7e3397322099036bd4143 | ORPH
    m68k     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/e01cc3ca8d61494c03ed7c984b67e571085513b6 |     
    sh4      |          ethtool-6.15          | NOK | https://autobuild.buildroot.org/results/bd1e35ed06342ba1ed8c2e95bf3b2ac52acbcfe2 |     
loongarch64  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/a7e0eeaaeda0170fd4142c9c25229c34b34f1e35 |     
   mips64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b8f32481e011df80b8c90a9489c225105848422e |     
   mipsel    |    freeradius-client-1.1.7     | NOK | https://autobuild.buildroot.org/results/6d2e73445c89db61923e02b552668b6130fd4a41 |     
loongarch64  |           gawk-5.3.2           | NOK | https://autobuild.buildroot.org/results/f174269c8e345c057c4fee984b85bf45d3d4088f | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/f1821d8fba4a086f25f69caa0b0efdf1865a7085 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b6385993f478aac7d93237c1c036748829fd20d1 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6689c4a7223f5983a7372a35ccc56fe048b1e2bb | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2fbe087c7c3d6c605dd10bf22a7703fadd091dcc | ORPH
   sh4eb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ab2280f5d9ed69522a0c0e0adfcc73445cc779db | ORPH
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9d2767e5b9fc8912b93e969d93df47baef2c35c7 |     
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e1fc45f17ccb8c236873b4299324d0ec055cf7e6 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0731eddc5191c42a8d2081e78bd6ae3b737e001e |     
  sparc64    |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/7f6608e96fc5430dbd6728fe540b14e9174fa5b2 |     
microblazeel |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/830b63b5f5c7cb0adac125533cca238e32905237 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/db12feffa492999152b07a8a1f91d01b9818e2aa |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5ce27a28ec3c87a68c8399c9e4aeb5a287524111 |     
    arm      |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ba5c0f2bca4ce088da841ada431a802122689f62 |     
    hppa     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/0797fde348cca05dfc2654124333751a0c8be34b |     
    mips     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/d549b75fba3fcc8a686a71daf8aec21e8272cac5 | ORPH
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/ab6e10ca6afd2daa464eb4d8d240abcc81eef347 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/17eda6ae9096dbbc007735ab6d11a20905cd37c3 |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/6190eae54042c15ca71435b37fdd961158f0c181 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/87c3cdb0f1af2acfb7d201c8ff2a4a8ff05170f5 | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/51958d0fb2a5e33c6612fb18e2c94feeae3e27fc |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/dc77eedff5c4b78c2a0a372e7f10eaf8d0b6be61 | ORPH
  powerpc    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/fbd2eeaafa157272881a4dc6bd3c9aa3b55bda48 | ORPH
    sh4a     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/e67e2978482402af87def447b547e1458fe44811 | ORPH
    i586     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/33f34d9c635f23e4b036dd06ccb7f0226bf52631 |     
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/53c84d5f9d7f78433a8708c33cb729754b71bc81 |     
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/029eec3d6a8f270d3347ae9ce4be171dadbc2291 | ORPH
 microblaze  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/3b18572f8f528c1068f765a2b8b43088107c74bb |     
powerpc64le  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/795106bf2a1343e67136984a275db6069d4873a0 |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/e0e7603dc5f6a419a9c87922c66a3750e63c8084 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/8526bf4a0fb73517608327484000a8a62f79246f | ORPH
    hppa     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/e2136518566b91a69fee46f607f2027045afdf0d | ORPH
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4660cea0377dceee2bb8ef92d4862e9704b4637b |     
  riscv32    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/063cbd1ef64d63d30abac9efbdfcd9a2086a15b3 | ORPH
    m68k     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/3cf1072440b1d704ab4c76d7bc8c03026d3e05b6 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/17336c35dff2cf2f8e3c35814222bdd8b4cbf7a9 | ORPH
microblazeel |           php-8.5.3            | NOK | https://autobuild.buildroot.org/results/8ba91b4c1ac878c08908218f001a0cda51c71898 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d0122db9f0786804ad6a9326eb6d2750489b0fc4 | ORPH
   armeb     |   python-cryptography-46.0.3   | NOK | https://autobuild.buildroot.org/results/af6fbc89bee3a79f6fdb38a7b3f92933b2b3e230 |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cb0b49bb08a83b87e5173f6eef95b6459b3e9599 |     
   armeb     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/89576f379be7d7eac2a586308ceee5bd3f088ba6 |     
   mips64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/b2c8b33646b4b7baafa429037b57bbb253bd53e6 |     
 powerpc64   |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/d45fb0a5b11f99b9d587589cb9f0cdb125e0b074 |     
loongarch64  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/b343fa8696e5da6db3705acd7716a9ed5cc6ac39 |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f8aca77e6f86682493eeaf86885f76277e001461 |     
    arm      |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/d3ee96f1dfc7562d2b7afd018919f8865a7e67fb |     
   x86_64    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/7978b9ca41171c662b9c1324072b0f8220ca357a |     
   mips64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/ea272d5270ef6795894e06ab2ee679746d4863e2 | ORPH
  powerpc    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/50b0b994711d01a12ecf47dd667c39c324af8c1f |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d19d5462f749e444949e7d8d1603d10987e0cb35 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6f1d248f6fbb4d4c1c7f03a01886ecb7517152a3 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/1ef0d5409051404f6411644d2c301b1978ff40ce |     
loongarch64  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/36cffa23745349bf8dacc6653cf7dc271325f60e | ORPH
   mips64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/8f96de0a8f62156479d817c7104dc1d3b368be06 | ORPH
 aarch64_be  |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/04d5f11259728777af3ece116a7f2be8478c1a03 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             libiec61850-1.6.1 | 1 
               linux-pam-1.6.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       libiec61850-1.6.1        | NOK | https://autobuild.buildroot.org/results/06142a577ff88b3745ca073ec5c76833520827ee |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/988fbb531f64549256fec22dfa5bedd3a979ee9d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.3 | 1 
                  iozone-3.508 | 1 
                  libbpf-1.5.0 | 1 
                 libzlib-1.3.2 | 1 
                   linux-tools | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/0d7562fdeca457ec94e07871a2ed6e8e77d481bb |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2cf5a01c02fdc95fa48331c2d4496642aec2f6db |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/fbdb0f196a0e3831a7cb24324eae6d02bc797d58 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b60cd80d286b7222d17cdb441c43892953bfe073 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1363fc32832a8ed2a520f1066ff1a29c586ceb0f | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/510682a1990cf56df35ce8c3ff85f13697cb1df0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
