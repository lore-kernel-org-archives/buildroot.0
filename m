Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03426FEA807
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 04:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131EC61311;
	Wed, 25 Mar 2026 04:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCLq5NX2zH69; Wed, 25 Mar 2026 04:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C7C6103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774412840;
	bh=2LFgthxGtg8WabRjnDi5w7L4RLPc4yB3IjWAfRcdRXE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ww9qjZgJ8WSh1FdYNxscGycX1NZVvWkzbqZc85dFa04nvAjAZGUmbpYPACACF34ux
	 G+HyWEAZjHTqESwQMDn/X3RhXiRSt/GoODy1Mxm2GGJlDP5SsWPW9EMWAv3uXIFC2O
	 C6tE5RrIYPRvU1Vrb039+Bazv/jniszEbQtyilIJQYExZjJ72jS+7AxZLALWiYB9oR
	 bV3HcY7riIWkQXjo6ZpxlGN+PebaQLv9qf4whO7BYs61cdGgBrdbN78SEMvZvUDHOB
	 LLPqtINC3GhySwsrpg16yYkhQofKWMgDV7tszig6uXKCJS0k6YF/s0uoGF5DptB5yb
	 St6ZgAxJw16tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C7C6103D;
	Wed, 25 Mar 2026 04:27:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 166371D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 04:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 089E040EC4
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 04:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu30zsKCQV3r for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 04:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1D5440928
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1D5440928
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1D5440928
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 04:27:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso40717325e9.1
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774412834; x=1775017634;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEzM+9L4EM2Dej4vtsQ0KVXUeE+1HJJafmlsu8XEJkM=;
 b=JnUNwLYvuseAvzrbT0Wx2zGyn3VDDCI14C5rgMxYcefQ2Xbd8LgBU27iw94rUaXk63
 t9B4/MXKqVgJDg2Jpy2jU2aIWiHrYCElx59TDRW1ea5lYpbCk8riG7uJ5b1IDAlU0RF1
 NttcLQcHmMiOP22pmjIXI9vLRw0Ysk3gcdsQgiHrfpqaCzHHvagWbmjXvGtcFfpGvC9m
 EGeLFhkJSDdLIdLRpfjwBFGZWhpKSjTUdnbqasJpA32JbKUU9GZcamFu3zVuuilN8FlI
 uKCNL1U23FHCmnX8vmvcl5B3X8ira21WHkv2c73xRK3HmTpRM6gqEeAeMtBPBAwS+M+/
 NKhA==
X-Gm-Message-State: AOJu0Ywb3AHqLigJq9No/zOybYx72LDL7/jwcjQDd0sim1LENvW3xIDD
 IoWqjJVk6LcqCQ0Ru5vHbCE+4RE4NU1ZsaIM6irjcm/Ttj7+LaQTclmLOvoPA/+9
X-Gm-Gg: ATEYQzzzqQ5h5IWR6omn352OkFhYdD52+0xs9XHvM7FrB+EMVasDntwAYtPTLyFPRC1
 8uSLQ5xX737dAhtnihtxMebDf9LP3vWAKmv4jVm9Ux/uHvbHpypiMQfTIoUr4YboGZuSRY7tBLE
 5nM9CJHPq6bz6Fv3MgXBJWK5Om9xsAUK9ISAHTItmneih8DwGzi4Aw3jARSQK3LdfwfT5grH8uU
 EzfjHGtIZ0ipBhdeyNyEl7SOJhPZx7hhQqfdSAQIj53Bs6is2+7njf2qRfZDxk//dOK/LiuJWTK
 6wgqr31K5T7h9ba7gRe98Z0rcYWXKtbSH4mKjcxNHx/HRdbcuhjaRttdgnn6YpzbzNimHoX9pCf
 FoZWsOmVO2iNNM6FEkCWpqdTPfKkHTx+ikeLoOzb6b+oDoOkoe/STskNZOPeWU/eJXqkFrTWCUC
 mVthFQHurzAUNoDKBpjZf3aDkGQA==
X-Received: by 2002:a05:600c:870b:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-48715fb723bmr26011785e9.5.1774412834213; 
 Tue, 24 Mar 2026 21:27:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487172f0940sm13565805e9.6.2026.03.24.21.27.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 21:27:14 -0700 (PDT)
Message-ID: <69c36422.050a0220.1527ff.8877@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 25 Mar 2026 04:27:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774412834; x=1775017634; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hEzM+9L4EM2Dej4vtsQ0KVXUeE+1HJJafmlsu8XEJkM=;
 b=By0+GGMVKGCPMO3VhG6J8DDbRDmEP0RYigN0CK5mx1o7mG76fAbWEnJU/sO4mADHXP
 Qt/myq05ey08uC/XD4JvNdmMwRBppIQ04VN+XX7fZLuYSr43vi88UsO36MYrWq7o98lq
 JAKviayyeDRxuwsENasyIDaC0MaifkJbSe2VvR4pvxGSF7B/QrST3bSy5W4LHG6jqG0s
 LK1YRhks99tc0m0zZtGUHjvLceMukcviuZchPwfWSXH8mgoaOW/LPhJp39NpYMXhJaHe
 olL0Tr14Bw03Vzpaochip+3Zi3IOG28ThoUYpP1f67iIdNHnBLbzEHJrdYnYL0CfYMNy
 h1+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=By0+GGMV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-24
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

Autobuild statistics for 2026-03-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 43  |  0  | 60  |
  2025.11.x  |  8  | 13  |  1  | 22  |
    master   | 52  | 140 |  3  | 195 |

Classification of failures by reason for master
-----------------------------------------------

ustream-ssl-5a81c108d20e247... | 7 
                flashrom-1.7.0 | 6 
                 libmbus-0.9.0 | 5 
                 mdevd-0.1.6.5 | 5 
glibc-2.43-10-gc3ceb93dc4f6... | 4 
                  libnfs-6.0.2 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
                   perl-5.42.0 | 4 
                       unknown | 4 
                host-odb-2.4.0 | 3 
               iproute2-6.17.0 | 3 
     libphidget-2.1.9.20190409 | 3 
                  cairo-1.18.4 | 2 
  gobject-introspection-1.84.0 | 2 
               graphene-1.10.8 | 2 
host-gobject-introspection-... | 2 
              host-guile-3.0.9 | 2 
    host-mender-artifact-4.2.0 | 2 
                   i2pd-2.59.0 | 2 
            igd2-for-linux-2.2 | 2 
libdill-32d0e8b733416208e04... | 2 
              libopenssl-3.6.1 | 2 
                  libva-2.23.0 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                   linux-tools | 2 
                       mrp-1.2 | 2 
                openocd-0.12.0 | 2 
                 sqlite-3.51.3 | 2 
                 systemd-258.4 | 2 
           at-spi2-core-2.58.2 | 1 
                    bat-0.26.0 | 1 
                   bird-2.15.1 | 1 
                bpftool-v7.5.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
docker-credential-acr-env-0... | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-c42a3bc53da8... | 1 
                   fwupd-2.0.4 | 1 
                    gawk-5.4.0 | 1 
                      gdb-15.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giflib-5.2.2 | 1 
                  gnupg-1.4.23 | 1 
          host-binutils-2.46.0 | 1 
                 host-gdb-15.2 | 1 
          host-mosquitto-2.1.2 | 1 
              host-pahole-1.28 | 1 
               host-parted-3.6 | 1 
            host-protobuf-34.0 | 1 
              host-rust-1.88.0 | 1 
                  iozone-3.508 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
     kvm-unit-tests-2025-06-05 | 1 
leafnode2-9543ffaf82406f943... | 1 
      libabseil-cpp-20260107.1 | 1 
                libcurl-8.19.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
                  libsepol-3.9 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                linux-firmware | 1 
               llama-cpp-b8117 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                     mdadm-4.3 | 1 
            nodejs-src-22.22.0 | 1 
                 openmpi-4.1.8 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
            optee-client-4.9.0 | 1 
          powerpc-utils-1.3.11 | 1 
           python-brotli-1.2.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
        python-selenium-4.39.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
                   swipl-9.2.9 | 1 
             tpm-tools-1.3.9.1 | 1 
           uboot-tools-2026.01 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.3 | 1 
                 vmtouch-1.3.1 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/54d1baafc202b77bada20e59bbfd819db8c237fb |     
  sparc64    |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/4e694a3493415c137a65d1f07463776a46c04242 |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/70a031cbd3e770019c842578d30d83eedbb69c2b |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/9acad38669d8a3888f2ef93519b9649081a14e8c |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/472797ad018c01ec8a089aac1b6018ce367fb15e | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a5793eadc0b4f630311c5f15ff8f8186514afc5c |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e34d3ffc2077646f3a7057e25df2bbfff7e612a2 |     
powerpc64le  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/c8ebd384c452a5f472967164d4c05faf3834375c | ORPH
    arm      | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/8855cb0c086c8e1395c9096fc33c1c997252e66a | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/f966613c4ffee5190790bc54ed5e7b09cf7a2d4f | ORPH
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d9c5d570b819bb9d40dff210482cf9f760a2e71a |     
   sh4eb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1eb2beb43c94cf3f542c4c8cc21922cc4538e82b |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/b1d0df4b4ea83169a5f0174d5cfe56b8e9f2e8d3 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/3c6bf41325ffc289324bbf4499aa5d2c064414a7 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/0c012fa393e9bfb678c0af1c377880d197def3d6 |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/5ae9b064e5411802cfeb72953cab37eda988b738 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c4fc9cb3e684589650de3c5e9b4809ce6c96d3b8 |     
    i686     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/e8eebf15cd6c8f56c75f32f30ee08059e587e8ac |     
   xtensa    |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/dab27f46d5073464712f9b1b5399d29c80e0203c | ORPH
   mips64    |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/8e0b54e301fd3da6a8af33280a48a125123f2dae | ORPH
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d2bf67e97945ce551c9d83f15d593b061fc36f07 | ORPH
   mips64    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/49a396c8853e2bd2dc4bdbda259398ea6b616475 |     
   mips64    | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/b38a7b13d0c15b622639d6c01adec1ef2fde34ec |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/b446d4ddfd121d7345d91d8e4caec7e51465ba75 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/4cef0f14902ff8ea63ed2c27a205e2cd0a034a58 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/aec21dfddfea1a165fdab316630b180e6e9ac90a |     
    hppa     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/7969a1ed1a41bba51cd9e2113191754263d2d007 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e9442b2fd5f828f16005199fd7bd7a81aa532fca | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5064c634adf020bae403414cdd1a4c3bc4ebd5c1 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7512455b514f9c4e436a3d8f804669d987c146ac | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/767a1b99a56f424871c2439f6e74a55cd626a24c | ORPH
   armeb     |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/f55341f3ea7a33be6f072e9387d955c900fdb7a1 |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5683b4e8f2790b2220ef0b6d319fbd46237e3f96 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d3dd1eb9604b075a2b30da68f5a126cbfd5fb884 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca3f8ade183c562e82d8e4490daaba4ddc485473 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7a376b97cef0b2c6cc9f74fddc9e9dbf1b9dc587 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/78208cbf7d9802c89e2dbe1c24882026b4f35ded |     
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/5abf80224a81830f2f21016ce19403927dc83c1a |     
  aarch64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/bd2ee4a6928c54e895c88cacae4a3ad37bf1de3e |     
    or1k     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/26f42164ccf61ce0134b5722cb5d3cc600aedc5c |     
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/267417e5fbbd79b2b7a16c132c564c0f49541e42 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9747ee02579099e196bebb45b72cf7c5d88b5018 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/78453e2a4c66c2b490f56d1801a6fa301f27510e | ORPH
   armeb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/16e472e93a0256e0600107718c339c1b337cf23b |     
  sparc64    |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/447d45ea80936ee5bfccb72285909ff261fc08c7 |     
    or1k     |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/df0249588949c4e302ee19b0580066d3a43e7c22 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/587c9436d9fffc578dca242d89cd89c9cfc11428 |     
   sh4aeb    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/af9f3b95beb4f9450021f5b6044252859f947e6f |     
   mipsel    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/cdd9b3f9d729849a8c19c1896e5fdbdd2ca88d40 |     
   x86_64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/dc0bb42fb8464eb76855cabffbe7db66e500a41e |     
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a6775d6b9310a4069b59247f2054a789cb0c4cc5 |     
   xtensa    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0d32a2a54047f75743503aaa5945418e859b8001 |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/916a425d4e8dc0a31639da4ba10be973a5d86d8d |     
microblazeel |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/613266bdabccfab3c47e4333ad1352f0cc4133ff |     
    or1k     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/3b3712380e5cc18f77a0ce656c860481a034fe72 |     
loongarch64  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/28c93403d15ce95bc4e3f32e2c313be196dc4b6e |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/b78a0c334ad875fdf387366205db0dc624f5461b |     
    arc      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/a6d65c4765456e5ceb771b3b90ae10edaceb42ac |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3866abbeeb1dba75cba6bd3fab4ea8c387525c36 |     
    i686     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/c6506af4508dc7586c0b6b5569756886389dc727 |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f07bfcb1c3454597ba36095a633119c8b1cf1882 |     
    arm      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9f4805e56a16915280344826527cbf2d67fbb19e |     
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/ec2ef705e6aac48d0aff53a2a6bda1f227075856 |     
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f1ae10ecff6e8ec6ab94db8012e787579302063d | ORPH
  mips64el   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/53e31b2202f117a383b2d2fc04011238a64da0da | ORPH
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ca3233968229786dbf3af6d62e75cac84c5467b4 | ORPH
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/50698c81eed9d50bb9a60c6456a25019c374a60e | ORPH
    sh4      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/e12f82c9531ec4e90be4c31b383b94dcde072eed | ORPH
    hppa     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1d6ac45971b638ca6f0b5863606ef92a3525344d | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/335698ecfd61e8094a6ba14eba917d4dc2ec3f3b | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c7f4e573d7222a045b5c2edf8d801c17959a6968 | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fe82decb58f46d8bcf700d4f1bccdbaf23e193ed | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/d5aa760c3d38af8253616d5f0bdeefd583fe6b46 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/370e729d9057ea92b8ce66b2c6d8a58091d854d6 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7a9e4dcd85f32db7831f668647ff7df2d2f38d43 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/707571bd38aba040bdf3edd123f4bb23e9052c60 |     
  riscv64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2298e1d748e2ddd4fbd7570f22cfcbca949c0655 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/cebb8630ad6800419299dbebd5e5ed2631a1eb4c |     
   mipsel    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/842fe03d308af9a062c45c82b6266ba6478a79c6 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/d7f082d09c0f5975b3e291259b85bc59e7b5c861 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f7b5e053822ce2688d3dd302892932042137caf9 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/571519cfb7c84765397299410d9aa4a6f3def79b | ORPH
  riscv32    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a10d6fe5e5489e35bc4e217bf0933e9929220fcf | ORPH
   mipsel    |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/810888c34abfd16f118005a8f638947cc6a4310c |     
    mips     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/03b1175f2099d07a704520879447aca371febd97 |     
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/faf638d26733c549adb218e9b5cfed8d95d43e66 |     
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/75c6dc5e1a8e50dc91d181b51e8f2d8dfb91fac3 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3ea69d4ad176fdaf2f0c441ac4f3a8135089a1fd | ORPH
    or1k     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/4d9b9dd4bd97a54cf9a7524ffca078cc173adb39 |     
   armeb     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/567d726652d77e8f4a3d4e74a69cad82faaee496 |     
  mips64el   |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/0066d8548b82a8d11cd3481fedf24a06d4bfe39f | ORPH
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/4d26e1812c1da9f4ce3cc1af317e9e3f0fcdbe5c |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/4f6cd53f151faf3feada053785ad9ead1c42e188 |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/de6941931522f0d5d2602b59ced320e571dbe28c |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/9f18f54cd2e5fbe598926e872fe8d6ab32c6efeb |     
   armeb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/bd344ac9cd0a381e6794a19c7d2cc8857dbd00dd |     
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/85d2e15ddd8211277f6710d943308ba0867b570b |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/92cafd10500d929e5f559a52d1b727fb0b945be4 |     
   x86_64    |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/0904ddc46270ad320fc7146cb9ec84582d6a206d |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f04df2fd68fdbf26bfa0d29b30f6f2a08aac6299 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/927641cc02b7f630dfbe17bf3da3949863644ec2 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a8865a7f2f2ce355258982f19ec3193c3137c5fa |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/375e82b9c2ff7560703ed4879b19fceed843b43d |     
 microblaze  |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/5cf0b9d956ec961da89d2c9485a095e2bfa90dd6 |     
    m68k     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/414f945a1251a5c3573d53f6881a0e10afd58d21 | ORPH
   sh4aeb    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a3d9006d2993d685e41193f1bf083b7b9d19df88 | ORPH
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/acfa2e9a64eefec261b2e8b25490a4f2034e198d | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/3e0e54e4b4724bf2f55ab58cf7ed287685f21b41 | ORPH
    mips     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/223e876f59dee4d494fa8039abd4ca1ce3ddd909 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/c2c47279ffe2b4f8ef9af0c01d0cc37d7325e71f |     
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/7a0607ab50c69f21103d024763fd779f97f7f169 |     
microblazeel |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/f44765b0b55bcebdc2b4a4fe7a95e84dd5329e37 |     
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/205efeb4aaa0e544ebdca9346f9fec4cf23ab14e |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/36a03b4a6f43d775e3d53b245fb4b8d604efeb7a |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/ad4eb4c7f1dc6cfc6d3b043e55e7dcf40183f6bf |     
powerpc64le  |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/b2db142ca4cce32b624167da4f35b017696e0d82 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/a1b045f96d2067de2fcd354d9803aa17511e2aaa |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/1dbece89a8437fd45bb5a5f633c2c8825bbed0ec |     
    i586     |     python-selenium-4.39.0     | NOK | https://autobuild.buildroot.org/results/ce1a5e6d8b61d06cc828235c6a66fa515e5de84c |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/fc3660a2d1bb5ad948aaf800f346ea605ca9e225 | ORPH
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/18ff18f1f5bfe0bdd498b82a4f68bf0a9d7703a7 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/4d8d59d540f70816780263edd645f004cc0a3ae8 |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/4a200512f6d21d58412f10e88d046f5966f0995e |     
  sparc64    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/f8c03133a21e641001ebc98e66700b7b4d5f0feb |     
    m68k     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/3c5a6c73a72ebe9034b8b9e9771f00ff643a68e4 |     
   s390x     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/479bc69466248ec62657bff43ca1a2be1785ab72 |     
    mips     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/a9891ce5a52df8ec59c533c761efcbf3a63ed783 | ORPH
   mipsel    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/843334a786d50df2f4d9c784aaa0035abef8c15c | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/442b399cbdb7452d18d5e4f653d115b31ee87b3d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dde8acf29edb4f0025c2ebbdf7d5fe5a9b4246ec |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/a753ad593978b54a7721b0e1a249fce5baf9ce7d |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/7fb765ddfd6c99bfd7832da610ecdb38d4f213bf |     
    or1k     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ab76a6ab816633b92ef8a8edc4d276e70c30886e | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6fa90fd1e05813b434cfb104685c57894c954ac6 | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0fece0f8c61ca01e4548be029825b4d03007b949 | ORPH
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/389c36bf3821643765c116a934a138089eb5a442 | ORPH
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/17bee88ecab06316ab3ee39b0082c2c905c91b6b | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4bf7d94812fb3c0f164a428332bfde34f926def5 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/2fe9260164692a8ac93185bbe408e8cc082afc4b | ORPH
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d77aa5cbe5e43cc24292dda2794abbc94bb1792a | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/7fea708818f86ddcd501d07b0f63686c92f63e88 |     
   xtensa    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/0ac0096acc33129bea81fe00fd9ac465488d528e |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/5f7cbee0578913f1f32a5dc7c0402a1a13e74913 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                       unknown | 2 
                bpftool-v7.5.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.6.1 | 1 
                   host-gnutls | 1 
host-gobject-introspection-... | 1 
               iproute2-6.17.0 | 1 
leafnode2-9543ffaf82406f943... | 1 
                  mupdf-1.23.9 | 1 
package/linux-headers/linux... | 1 
                 protobuf-29.3 | 1 
             tpm-tools-1.3.9.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/9f8e42aac2f70d4c5f53e88036a6cce42e70acd9 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/20ef81ad95a547b1202e437999ca4ab6a695fa71 |     
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/885acac62a7577d613067cfa8373f402cff1e8a4 | ORPH
powerpc64le  |         gerbera-2.6.1          | NOK | https://autobuild.buildroot.org/results/9bd4bd4c5400368f62574143c8f848d13fe2bb7a |     
    mips     |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/3612fcb9fa3bfccf05792858673831fd37ac66ea |     
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dde7a70e25c5dac791ec5537c0f1b40070e337b8 | ORPH
   armeb     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/8261ded54a8b2b2f5e7a48bdf5940d08696ce40e |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/1da0be02f48231fc34007812e8b029a2c6bf8e91 |     
   armeb     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/e0b4909cc7e993d53c4b77e6e5f7ec6cb64e8e9f |     
  riscv64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e5ca375cb1e87d49ea8d58b5414c0f33ec7a1054 |     
  sparc64    |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/4300df781ee960fa8e66c4df5a9924af069331c3 |     
    arm      |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/fc81af3cfe75940cfbb2acc944c522a88cbd13df |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8cbd1e7853883a96d62ae366fabf707ad7067ef4 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a064f3602519313e90cd691d649a4cd402e814ac |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 7 
                       unknown | 5 
                host-odb-2.4.0 | 2 
leafnode2-9543ffaf82406f943... | 2 
              libopenssl-3.4.4 | 2 
                    bat-0.25.0 | 1 
                  cppcms-2.0.1 | 1 
                   dillo-3.0.5 | 1 
                  ffmpeg-6.1.3 | 1 
                freerdp-2.11.8 | 1 
                     gdbm-1.24 | 1 
host-binutils-arc-2023.09-r... | 1 
          host-faketime-0.9.10 | 1 
                 host-gdb-16.3 | 1 
              host-pahole-1.27 | 1 
 host-softether-4.30-9700-beta | 1 
httping-ffb9201042813c58d02... | 1 
                 libgee-0.20.6 | 1 
                 libmbus-0.9.0 | 1 
              libmodbus-3.1.11 | 1 
                  liburing-2.6 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  luvi-v2.15.0 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
                rocksdb-6.20.3 | 1 
                setserial-2.17 | 1 
                    sslh-2.0.1 | 1 
ulog-0389d243352255f6182326... | 1 
           xtables-addons-3.24 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/9c9e52cbbdd6af13293091c32a28932a585304df |     
    or1k     |          cppcms-2.0.1          | NOK | https://autobuild.buildroot.org/results/7c06ea665236496e44e581c2dcf6295a8de14b2b | ORPH
   armeb     |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/b6e4a6ca194e0c4a216820c52868da7110a88721 | ORPH
 microblaze  |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/cdcec109638a9fbb1b56dd839457903abf3d4224 |     
   mipsel    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/9a1aa518d54ad98e01f684fccd3a5be35d056dee | ORPH
    mips     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/9bee03bce6d9f3e67810b96f883050c78cb624be | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7b16279a78c5d17b2b11d3581f523e361da67299 |     
   mips64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/f76b9096783e5e961b370be387e32609ca8c3b55 | ORPH
    or1k     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/e1746611be0f2a0303f4663711593fa54cc42639 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1d78da228bbe93bb7c5d7661a763e63c9e9268d0 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8d94d59a4545a7be157da6f710d5484cc1719211 | ORPH
 powerpc64   |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/45cd5b10bcdffc76d31cc1130ad831830b597a53 |     
   mips64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/aefa4eb4774a404b44752bbf0beca6ba0f45ba0b |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/3be4ce9249e3e47fae8023b8d43c9adb5f5b2304 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/58d69267952ada3734a5a2be8c03d66aad0de6e1 |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c0285fd053dfb03b57bf76908730eaca26153b7f |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0471aec38ed490e869fa59e5a1a17906be3f3419 |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/26045bfb6f1f7b40df38dd317904ae864d4c8501 |     
   s390x     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b89323cba2d7660df3b9810e0a5f071d8deebe4f |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c11a21a44d98ef0a9cd3ea876a9f409bbfc52821 |     
   arceb     | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/bb9ccb407850deb5d7842ad8be9c144a6cc8eed6 |     
   sparc     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e5ae314bb50de3f95cdb579865119f452997d297 |     
 microblaze  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/b6c8758bb8f15245af9160570a994d4b96701ed7 |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a3cd14f9279802c031049dfa57926ea7df7af098 |     
  mips64el   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/bca71724e81fe8eb12f871430c1dd72e7256ece6 | ORPH
   armeb     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ea6b748db5ba7fe6b649ad4edc9c0041bdfd2975 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/890f68bdefe65290a4028801826c2d40cb9f8c18 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/1326440decc9c3bf132027c50b0b276ecdae501a | ORPH
   xtensa    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/a5a1c4350742a6156b40b888586d3a5896b6b5e3 |     
 microblaze  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/0ed862a46f01c043cc93bcf6e5306543283d5798 | ORPH
 aarch64_be  |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb | ORPH
  powerpc    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/efb26032e752774673a768794deb62e54918300b |     
    i586     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/934645bcd89cc95217ada8c5da56ad654ca16251 |     
powerpc64le  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/75400b023d909257e8c4e0bc408a791e1ae5d5fa |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/8c37a8551ea0ff4466dd44ad5f029bb32098aee4 | ORPH
   sparc     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/5aa464e7a8806213a921b33f72cf40fd5c2166f8 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/c13d766a7a089723b43eb40aa102e57950a949ca |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/504fedbe6e8efd1e38e008ab9e80a0f6b6bf606c |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a70151eb0baea894138d2f26a6a8923e4b585e93 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/8dfc179b15277f1a5c2c59b0b6d77c1f63bc97a9 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/b009bc5758c6430145c6c6f9242b773b210b0ea5 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4382d6ae84c08a7274089f578fc7d58b3372c759 |     
    i686     |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/e4d496ace5c445690e64cae4d1228b6ffb9dc7c2 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
