Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04F2CA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 03:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5595084243;
	Sun, 17 Aug 2025 03:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOeGTZJkENgo; Sun, 17 Aug 2025 03:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE9784253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE9784253;
	Sun, 17 Aug 2025 03:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 453C5196
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 03:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B5514181E
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 03:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h7GyzpWuzf2 for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 03:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C6CC417CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C6CC417CE
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C6CC417CE
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 03:18:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61a1663bd7dso1060650a12.1
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755400714; x=1756005514;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=owNrganAttSOlgPqwYFrG+hXbbQJL/gW8rd/S0t687w=;
 b=Lvm5rmDevao7gbKDNlIjxAzl7Inm6JxpfKdTrSEhemdEt7+YzQ9tc2nzU5AAg0npJS
 XTKSIcFKXrzJX80mD7j2UraxFvC4ApuxjQwrhyLcoMGtkJ5CSy19InTzJVM9WS3HXjTl
 H2itHJazRu+KxBCB0RtwrrVRf7Acac2ammzy5VbCZoBoIgBnXeF2Ft/u1+SO4qurioN+
 PpEIIzr1XHiOKJAlmklr6wfoczwwqcLqGbtLiNl7QUSMcV3/WJs2QEoKjKQZ/yXSRA/U
 bPds+9VVQep9FxjBC2NL6dTafJhxD8nAcatvH+Mw51OpQAEnWoWnsyL7N9HSbdP7bXUQ
 OqMQ==
X-Gm-Message-State: AOJu0YzAQPcKrEIKHGV9BXe2hHtnNZX6b40SZ9XUg/cz5kU25xOGajp/
 STwod5vpZaK5DE7lflxLwr3oKee/8iLbN4s3SBjxsTAww0S5HPgIlTvujgXsmg==
X-Gm-Gg: ASbGncun4Su4tjmGlvAd+zVFRPaktKk/VptSMIym1e0AoermWTmB/fT+zqFb91xzeRa
 O5uNQAdzqaXa2W/1ZE0zAYbIcP38DDFobfGkZZ7OrpmACFlYX87xGQE5uuXkwFpt5ss/ITd1X2s
 akWCN8l4DulGB4T0uljcHGvI/1oOpE9y4AafBBiEsLRbMG60Jzki7Pa+4V0g+JG1HVkLwHTawNt
 8L2GKBOSDFrwQLieuoyE0/uS2zawqyfm5d7WqYlTOy+QWBMfdW454Llv0oz02zEGKWDPkUyKLCX
 Qpv3QhXQHg160hw8q1WlcIm+/atlD/ZaiXG99KoNxLuzbyY4FrGCBoCPEtXlLtPIJ6zDJ2FBRwe
 rThqo53I2w3ZvzRQii7EEXjRPAg==
X-Google-Smtp-Source: AGHT+IEkXwOthfFMqKx1ntP3pApFA2g0py74T9of5+wfjzmpgAegXcM+h6X+VHaX+nPVCmx7VIhTzQ==
X-Received: by 2002:a17:906:c116:b0:ade:4593:d7cd with SMTP id
 a640c23a62f3a-afcdc1d3545mr693915666b.13.1755400713799; 
 Sat, 16 Aug 2025 20:18:33 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccc48sm492195666b.83.2025.08.16.20.18.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 20:18:33 -0700 (PDT)
Message-ID: <68a14a09.170a0220.cb15f.ba33@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 17 Aug 2025 03:18:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755400714; x=1756005514; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=owNrganAttSOlgPqwYFrG+hXbbQJL/gW8rd/S0t687w=;
 b=LV4G6UAZUl4I5gMuneU+U4dgGS1E2caxEUtQkhIZVpgz016KPbkCGENFl10SnckSpE
 WCcOrUy5q8ne4oHRDxuoky+Oznx11Anhbx3Gcpz9yBUm+wHt30mufhbrZRKUIPrRDTtq
 omOyMV9hnl7wCB/3PoelTvSHS7EZZT780nUAEB5ljtmOBj/XsuF5QC8LhjxDsqYy+9r2
 acuhWWtk89gFWsIwbk+EEitcyey3EqJGV5CEQnZA+0oguVbguOjeKuwLC4c3Frolj7N7
 C5MDE7H7sHaYjGaoFVQg94aZcjA8il6WxEcBX4x+uuf2V6eagVTeVyFhTMjAiYvdqxm6
 IbSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LV4G6UAZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-16
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

Autobuild statistics for 2025-08-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  7  |  0  |  8  |
  2025.05.x  |  5  |  8  |  0  | 13  |
    master   | 22  | 167 |  2  | 191 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.1.0 | 21
                   bash-5.2.37 | 8 
                elfutils-0.193 | 8 
                       unknown | 6 
               bctoolbox-4.4.8 | 5 
host-binutils-arc-2024.12-r... | 5 
                 host-gdb-15.2 | 4 
libdbi-drivers-0bfae6c43134... | 4 
                liboauth-1.0.3 | 4 
                  libsvg-0.1.4 | 4 
                  prboom-2.5.0 | 4 
libsvgtiny-ea9d99fc8b231c22... | 3 
                    linux-6.16 | 3 
                    mpir-3.0.0 | 3 
                   perl-5.40.2 | 3 
        vulkan-headers-1.4.317 | 3 
                     ed-1.20.2 | 2 
                    gpm-1.20.7 | 2 
                 host-gdb-14.2 | 2 
            igd2-for-linux-2.2 | 2 
                libsepol-3.8.1 | 2 
                 linux-headers | 2 
            netstat-nat-1.4.10 | 2 
                setserial-2.17 | 2 
                    sslh-2.0.1 | 2 
                    wipe-2.3.1 | 2 
                   avrdude-8.0 | 1 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
                     crun-1.22 | 1 
                   cvs-1.12.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-28.3.2 | 1 
      docker-cli-buildx-0.25.0 | 1 
                     dtach-0.9 | 1 
                  dump1090-9.0 | 1 
               dvbsnoop-1.4.50 | 1 
               ebtables-2.0.11 | 1 
            ecryptfs-utils-111 | 1 
                enscript-1.6.6 | 1 
                    ficl-4.1.0 | 1 
                    gcr-3.40.0 | 1 
                     gdbm-1.24 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.84.0 | 1 
          host-binutils-2.43.1 | 1 
host-gdb-arc-2024.12-releas... | 1 
              host-guile-3.0.9 | 1 
               host-vde2-2.3.3 | 1 
                      icu-73-2 | 1 
             igt-gpu-tools-2.1 | 1 
              libgcrypt-1.11.1 | 1 
                 libiconv-1.15 | 1 
                  libjwt-3.2.0 | 1 
        liblog4c-localtime-1.0 | 1 
              libopenssl-3.5.2 | 1 
                libroxml-3.0.2 | 1 
              libselinux-3.8.1 | 1 
                libshout-2.4.6 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        linux-headers-5.15.189 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
              mosquitto-2.0.22 | 1 
                 nettle-3.10.2 | 1 
                     nvme-1.12 | 1 
                openssh-10.0p1 | 1 
                petitboot-1.15 | 1 
                pipewire-1.2.8 | 1 
           python-bcrypt-4.2.1 | 1 
         python-web2py-v3.0.11 | 1 
                python3-3.13.5 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.14.3.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.1 | 1 
              tinyssh-20240101 | 1 
toolchain-external-bootlin-... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/adea1397720f9622f585eb2b43d173c1a0a41825 |     
    arc      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/c052c630ba2d5af695a6c0719a60d8af94cc74a3 | ORPH
 microblaze  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/01b4514bee2d099b5c41bb87a52c78395c9eac01 | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7f8473261b6df2b3d7f347e2f6fe8123663e0d8b | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/4b5be1a0bc6f09c745b190ac11cf4f857790ce24 | ORPH
   arceb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a6a610755b6f9c3b3f1519eb0b4ba46190c20394 | ORPH
   mipsel    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/9d5106c5812ad46a35781dde7668c861d1baaec4 | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/dd92d839fcb8ccbe98dc803d1f9ef8b10158fa17 | ORPH
    mips     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1ee74d546182695d3411358f028fcce8ccbb74c3 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/172efa89d7ee5e840b2419959397b7548b7dcaa6 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fccb67645b3d95cf562f7cfba12f713cd0c40ad7 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/525fe699b8c042757744c3aebff869fd2d9be238 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/82dd01bbc2cce1c077a4f8c7439f95ef584f5f18 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c6a1b5dc7631caae7d40007281f870d08df9b4fb | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3de102aa7f96107093c8cf5f9862ac2ebbff4e97 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4e1b56f061f52fd46568068cca935cd05ef3d6a8 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/a7a74e4dcf9733f33e62a9c82945b9a978e78186 |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e44812096f9497ba0695aa750972b4aa6e783803 | ORPH
   armeb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/939f060be09be00808eb018030a85fed458ca2c1 | ORPH
 aarch64_be  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/aea187339b00d4e41aa97129e5be0b9e91a747aa | ORPH
loongarch64  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/e44cc3a658ec5f0ab917f6cac290b8fcad914ae8 | ORPH
  aarch64    |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/84f9add177d8b853d9b7925c963f58dd85433615 |     
    arm      |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/2fbc37bb46c67acc762d9d6412ffd3d8a2e24d0a | ORPH
   sparc     |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/1ab2eead8309c138ad7a5190e2489e086c3d676d |     
microblazeel |          dump1090-9.0          | NOK | https://autobuild.buildroot.org/results/cab96cecf4960cdb1b24dcf13a94a712d1ddf990 |     
  sparc64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/8d0c34b9168c063f099944fd3e5a797bc1009ea4 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/cff7a7289afce64d1446e6bb05995b4facb04e4c |     
    m68k     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/e92b092f2f008ac59fb742783f11fae3fc12d75d |     
  mips64el   |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/3d523440dc7bebe12fd95564e3c5b5e90bc39af9 | ORPH
   mips64    |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/52112908a8f4016820dc1b0250b8d384a9695256 | ORPH
    m68k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/b89058a56bc35521080dc6873a6763c3501d29a6 | ORPH
    or1k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/125e9375f976daa14e34b865825a91a2d2f0f1f5 | ORPH
  mips64el   |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/3da97897ea89655d54ccd5923a0cdcb25be45d6d | ORPH
 microblaze  |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/b697f1847f6f282805fc036e4697ed505a8e63df | ORPH
  sparc64    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/b46da317fc97828e4e8b3451a914350905bf023a | ORPH
   sh4aeb    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/65b4681838ca7fc09d85a3be1523eb9e47591ecd | ORPH
    or1k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/6a29a69d26db5b683910b1ab8fe3511c61308862 | ORPH
 microblaze  |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/45305cc2be3b255740808ee1f3486d1a10abfbb4 | ORPH
   mips64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/58d00fd03aca18f1770ef7218788a600082da726 | ORPH
   xtensa    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/db6236b46cd9243820e2f9b833b2c6abbcc7534c |     
  mips64el   |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/fff7ed0f55e87e37e5457287c14384d37d9a9c4e | ORPH
    or1k     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/ba793695d94a4e3bb80ffd6b57a2b4d66827c65c | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/181d11323e82c91f4e70cef0f880fbe4bb9f709f | ORPH
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/3f6fc17c52896d22a1961574016eec5d739be8b3 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b78c8574387b5473940ce71b72fdaa5225f52f86 | ORPH
loongarch64  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/eb510201111afa8b2a694f33e6592bb861ecba0e |     
    i686     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/cb73d7c091648bd62418d3f0c379f63d3dfe5c59 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/478e24af1a03dea5ec64b77ca611b4f7225c9d39 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/048aab8a104e553e40bbbae3396888cbede2fa76 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/bf590fd7ce5c0da0d82fc69b948b395f5f5c3563 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/e47a3c644f85c227efc0c25e0dbedfcb9b3fd825 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/d0a2dfeb868912077598a52eb25d0ac33ad0cd30 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/2460d29746723cc71f4f30a6d06f49f6b4f530d4 |     
  mips64el   |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/d7931211f14be73eaaffb2407c54b50abcbc125f |     
    i586     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/c2032d844f401bf632cdce813f46ebcc51151fbf |     
powerpc64le  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/d1b2d1fb132c83409c85aed59a0e132eadb3cea7 |     
    mips     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/f5dc7453adb957c89383907e6feeb8c2e4a982c0 |     
    arm      |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/4e1ea11b4a6ec03c84a06d020794a48f456f7a4c |     
microblazeel |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/ef76fa9d08412d9d9e1897cb030fe5e2b3bab8c2 |     
  riscv64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/b35cd1965b72b4c67ad1d3b5c3ef96c96e4aaea6 |     
 aarch64_be  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/a0a01e0f90ebb973c80c6191d53b261b3741b957 |     
microblazeel |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/7662fcf10b60dc81142ece182e670f1d395a2246 |     
loongarch64  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/fb5a1100f8fc00cca06cb1ec2689ea56562410ed |     
   sh4eb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/55131e12197785dbef9a240691cd6dd42a1b8fd0 |     
loongarch64  |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/589ccb21a0d72c2f4773b2657e0430c994d7ff56 |     
    mips     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/34948cfbda1243a7a419dd04a2e95d00fcffdf51 |     
  aarch64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/5baab48607862626f094e95ce5bb1d77e3ec9481 |     
   mipsel    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/1a84b006b909d33230f661473f1dc15cbddaf2e7 |     
 powerpc64   |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/d6693b1322470867193522d33f5dca3ecee43356 |     
    sh4      |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/b2947dcdfa4ec5d721130d1f8f7782e0010807bf |     
  sparc64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/1e0c75eeb8dee874fe9ce4a520c26c1268c38086 |     
   armeb     |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/c1cbed7d1892d422dd776b476dc58adef46bc1e8 |     
  mips64el   |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/a9fc437f141ede1035755b26205822ea6849aae1 |     
  sparc64    |   host-gcc-bare-metal-15.1.0   | NOK | https://autobuild.buildroot.org/results/d6f227df3abcacd9f74e188298bf30175810593c |     
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/19f7ef81e8977c1e25580f2dbd53efd81f648951 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/20a90b4748ddf544cf8341ebba671ba26704ad4c | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c01358a3274b2a5c62ea2985bfaf6e22dd4d093c | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/43ad53d3db023e7931f59b0898247e7134cbb654 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/281551c9d5c5a6c3941f6c9f834545befb05d42b | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/643e2b89664995d206171a3a0909fbde3b5f8ae0 | ORPH
    arc      | host-gdb-arc-2024.12-releas... | NOK | https://autobuild.buildroot.org/results/2f2616a4ac7d9cbc06ba7775eb57bdd2a0419cb5 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/328fc363f88cd9028db5725c5376a454348b1aad |     
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1a039411558cca07d6f5838211b949f43d8310c3 | ORPH
loongarch64  |            icu-73-2            | NOK | https://autobuild.buildroot.org/results/93b662636948df02a51813e7d8e6c22541a374df | ORPH
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/61a36330619d19aae189dce1387bcb97f05a45bb |     
   sh4eb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7169d4aaab70bcda651aead72be90ad71326d0b3 |     
   s390x     |       igt-gpu-tools-2.1        | NOK | https://autobuild.buildroot.org/results/05a1a5c20acc15794e52d23ab6e41146221f9796 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/db6103a9ab19da700fca8090099407a4c567f622 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/187f5f8afbdaf95a1f29b7a2b6f19faf469c0982 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fa4027fae5b9ec4d257ec99a6b693530d15222d5 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9c5a60fb85569f7918df8a7980c60d6a5a4fc6e5 |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/6177203192f8689fb65fd6badc01563148963f6b | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/d5aff6d60f6740ebdffcb0a5d011f074caefdaf2 | ORPH
powerpc64le  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/e5d405875bfd0ba7657c101b394afd1c15c8d18b |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/3c9c1318b2f70c00fe49b7aca490b32cd79eb012 |     
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/35b756224ca9f2623bd9e08fc841410317ecbd28 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/41bed7f0b714da415bfd8cd5cc3d8420c8dfb424 | ORPH
loongarch64  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/1a3daf3ee439cb4abb6a29c8d91ba7a4b111aee8 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/11804fe8646f5be3e3c2235dcb6b193973aa8b1c | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/4741a7bea34b8f6dbad2c3338b31aed9851a3072 | ORPH
   mips64    |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/10eac1a6a9080d73b4b46beffd5c82c5eb00aa4e |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/11f7c5fb5e214c814b5137491453c640071f0c05 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/651a3b08aecffb4880c6d2b139a535dff4a82967 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/ac2406a30cbbd4efcb339989e885b117cf154021 |     
  sparc64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/b91b6faf87a118f9194de576256544068783a7b7 | ORPH
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9c0592fc44c546227782a65d341568ef1ad7cfe7 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e0ea52f4fdbec6bc8bb3d24895586b50fa846d44 |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c3cb8413655c78c52252f34593367ec274c0034a |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0e87780baf7949cb527b50a5a317f0eb0e4f585e |     
microblazeel | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/bd550a5af65fa196dc2e7f910c35cd66a3e4bcab | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/fc4625d6533e42d7532727e8e41261210172b4fa | ORPH
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/2553a52862d74176913c3754d143a78e8c99f2a5 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/43104696031b0550bc141d274a62fbbc865104cd | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6c74ad653c109b7f2d5481e7551806421aa5ddce | ORPH
 powerpc64   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/612cb6e90c12d0b4d719a3bb4244d6d07ac933d6 | ORPH
    i686     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/e04d740d2f65639df2cd8843853ecd9ff511cf93 | ORPH
powerpc64le  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/9c272ec18a26882d44811127757df5e0f1e6a7b4 | ORPH
   s390x     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f0b470a2d09f68de7094e118d234b207b1e1556b |     
    mips     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f2acfce38c5566f24de232c488bbebf54304bc9e |     
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/1690d6fb69b9c5623a1c8a3e9dfd03d782bbf2b7 | ORPH
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/042e1f931e03d14d31c6c2a7e19a1a42b7c43874 |     
    i686     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/a6d5b48e506cb7127c97892ea3ba1d441e190fc7 |     
loongarch64  |        mosquitto-2.0.22        | NOK | https://autobuild.buildroot.org/results/7f4fef7a0ef855953f8cdc9f92e0c2bd7d2d0368 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/87b8976fc50c22b79292a0b6ac8fea19cae4dd0a |     
    i586     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e38edf59f2d48806865d4a6e37fe1c4ce51268ec |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/facd9f4e6e9d6f44852b84b11badd6f096fe9269 |     
    or1k     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/33ac3809a7d18e729fd6a459d4d27f7305708366 | ORPH
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/1b07c3de43c506e2d8f17a4a75c2990292558868 | ORPH
loongarch64  |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/5226e8c42a2e1644214a7fbb1de2de492bea2412 | ORPH
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/79d5746ae2f2a1d5e55dbbf8d7b98dbd24bc847f | ORPH
  powerpc    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/bddae79fd1731e31de68de5801ea793daa375c23 | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/513d754802a987d6cb185b76bd79761912be22da |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/45e07129fad3eaecfd31489f2105e48c92a25cb1 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ed8fa65695b3afde8c8fa4227104899e23f1e189 |     
   x86_64    |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/2531699f8f4896b83b43cb01dde8ef1f2962d6a1 |     
   xtensa    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/f0a8cfae6ff9e95619e8069775dc75e46f3224bf |     
   arceb     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/91d958b9185db4d78d22c278b3ad6286a5578101 | ORPH
   mipsel    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/808961128fd45cad7366680dfd873cceb561f6dc | ORPH
microblazeel |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/8bf1feeb47bcc7ec6a84dac6263b0ce2ab0bf53f | ORPH
   armeb     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/a52bf20fbb9350e7da6baece5d7887d560f75875 | ORPH
   s390x     |      python-bcrypt-4.2.1       | NOK | https://autobuild.buildroot.org/results/d525099e0cc5cc270ddc49ab86f64a18f88ab833 |     
    i686     |     python-web2py-v3.0.11      | NOK | https://autobuild.buildroot.org/results/404b3e593edf780c00469fa6e0030e5b4882faea |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/f9f3c080521cd455df7df921771cba5a06dffdfa |     
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/efecc4556dd443271342102814b5564ea866f024 |     
   x86_64    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/6173fc3f82d0c7cde80b1cde25c8474d75855e67 |     
  aarch64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/8dd101b171b1d4f4b78c0849ea7585c95360017e |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/5a9c8b271bf5204dea5ef584e2c8b5779aa0b6c5 | ORPH
   mipsel    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/df6469315e8b4222de0a63a0f52c4fd7a963ae09 | ORPH
powerpc64le  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/8eb43d5a20f93c96878de4871ac9fb082c8e7c95 | ORPH
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/75370dd1165512137842499396b01ddc30947c78 |     
  mips64el   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/2a56a4be8adff47b4437fe3eadb7382755df063c |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/41d397db1689b49c046788595cb07e5b38fd1d7c |     
    m68k     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/f59bb8a7eb2be2f51e3c878dcd6f056d352e8073 | ORPH
    mips     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/0b60c014280236d32a89b252c828120ce15d51a1 | ORPH
   mipsel    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/b56b39ca4e26e51933cb1443633a6c8d96b294b3 |     
 aarch64_be  |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/f182a499e8403cb356ceccae183ca8a9923a3853 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/b52286bb543caa06727b2a37d1762d40f3d36866 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/38d3ade74ccaf6fe1b68c5f4cf99c535ffa155a7 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f0146efd471057c7c7531f405a27af5086d2ccd6 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/fd60789fdd6afaa89dd841fc294bc0bd4dbb563b |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/d5876fa7dde208e0800dfdcd6e5c3f2b75687a0a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b4de7218f3221300e8e42d8a0428cecaa6aa5cc1 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/f46a92b9a53eed49d9b78628c0f234510692a106 |     
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/515c86c6836b8b1615b414349b753c7208fae8e7 | ORPH
   sh4eb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/3dce0327213187d8f6b5136b2998432fcb9cfa2a | ORPH
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ba10905470aa3e05423208f1d6bafea23e66796a | ORPH
 microblaze  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/def91096660b8fc031182a9957997228f579098d | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/0e355dbbfaaef210d43bd4f7f22d5f812dcb1b1e | ORPH
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/9d4b9003d5edb049bf3fc76f9b59645d2f732e55 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
    host-mender-artifact-4.0.0 | 1 
                 linux-6.12.41 | 1 
              netopeer2-2.1.49 | 1 
            python-yarl-1.18.3 | 1 
              skalibs-2.14.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f7c9a58b40ee5a1da9de9f3e6bc3b4159763d475 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f708e53acbfd2053101173d24291e11327f0313d | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/046b153991aa4ec05814aa2f017b231c3430d977 |     
microblazeel |         linux-6.12.41          | NOK | https://autobuild.buildroot.org/results/4245bbb2c451a429ab513bed2c3cc83c5b34ad98 | ORPH
    or1k     |        netopeer2-2.1.49        | NOK | https://autobuild.buildroot.org/results/3a64bf95190db9f043efb136193a1ac37e0930f3 |     
   mipsel    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/d367b69b85a65fa94e923ecff3ba03723b2a6e88 |     
   x86_64    |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/3e5f02e89f35657137d59053ff5472261d986e93 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                       unknown | 2 
               bctoolbox-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
    host-mender-artifact-4.1.0 | 1 
                  libnss-3.111 | 1 
                 linux-6.14.11 | 1 
                openssh-10.0p1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8b5f58a235e93713908d1e3d9e322a5c47142860 | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/28f289a6237258a925c8a9b8fd2cb3df9fd1fb3e | ORPH
    arm      |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/76d7742af24cf28352439f390a1f82174323de63 |     
    or1k     |          libnss-3.111          | NOK | https://autobuild.buildroot.org/results/0e5f4f456f91a43ec74a868082f6be759f3e6368 |     
powerpc64le  |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/b85b0aacc4f7398c58ddc9373b5407e77690a6eb | ORPH
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/47a1742474ba934646df9f80c209e82997828dca | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c63324bc1dc9a4df3a49e7983c7191d91a0e825d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/f5d7af14eeccc523df65ab5758ef262a66f38c2a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
