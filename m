Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22939C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 03:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A001A81E10;
	Sun, 22 Jun 2025 03:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ls-6uVvtDYAK; Sun, 22 Jun 2025 03:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A127C81E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A127C81E18;
	Sun, 22 Jun 2025 03:15:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B7D154
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 03:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF5DD60BA1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 03:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibThpuWh8_-b for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 03:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0A5C60B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A5C60B9F
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0A5C60B9F
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 03:15:19 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so500544666b.1
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 20:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750562117; x=1751166917;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRr4ycteIxXm9cRN4sS8WCEXCu9GkzmOhU6To4bxRHk=;
 b=a+7ZN+rlrsZhWb3yZnhz3NWa1FTpZT+5bjINbWLb2BCoG6VMr4vLPwGeWg0T/ihf59
 wHTHw+OvHdDq0nth9hSzugULRosNiNqtsibgZInL07LAg+FpJlqUcjWB2lpRZIO8YihY
 bp+KnpQuCQD88EJe07G2aX/1LWv/9xotAjN/8PXGFKpf0gf0Jfc0kXib2+c0oBAqBw1S
 5y2yxxpJtd8fDrGaq03gXVu0/u1ejmPyPOpVkONksrk7LM3Zy0Y7luOjgH5bGPK/Zcwo
 dA3oBAYbD4g/HKj99ac3oyyDR/pgHBLF7aS+cH5dKzXlQTWMuGdylgOJl5swgH9P0zW5
 ZRRQ==
X-Gm-Message-State: AOJu0YzzJET2SElIDJjNcEMUob8AP3T+8WXIDEpXe3SVD43xnli1Mb3j
 Lkc4iml6vBIWHINrXrUA58pYPu9Or46WiNVKY28C1iboFvnec1s8Z15/9l1hkQ==
X-Gm-Gg: ASbGncsl4QHBF/tVGEiQqFKYCTd0/EfCREX/ml86bVr7iQ24Xe1tknFpf68Vl0QJP/A
 zmCNBKH7JRoSuOqcTTcC6ztSuIfkgf6ETY59lM21lNxjZmTGOgkx17ZoC52RTulH2mlN8O4/ZKS
 YDpVE7bS8IWuUIceze9OkB900+1XyYTAp2F8zvSfKuwMfLIe99x5SzFRw6amDknhBMGoo6BX0zm
 HJS7R8GR7si1+dHQZ486I9etAOgzQlDIM9LeiN5mpIlsFsNaN/ZYpEvurm6316WNUUFxRbMT4HW
 jQgW5n2MRsclIAcHa4Lk+DtUBImlcH7rgCGZq2ak3wtknsPXLiMyhPf2CXIWHmEKPg==
X-Google-Smtp-Source: AGHT+IEI1IW9XVNNuADXBphA64vYBinW6pV5NUyAPtOrM4KWxSLWpA+Im/fvfA96E3fL9rr8FiwyCg==
X-Received: by 2002:a17:906:4794:b0:ad8:9257:571b with SMTP id
 a640c23a62f3a-ae057a65b43mr708193166b.16.1750562117366; 
 Sat, 21 Jun 2025 20:15:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae085beb7e8sm34053766b.41.2025.06.21.20.15.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jun 2025 20:15:17 -0700 (PDT)
Message-ID: <68577545.170a0220.135b67.0f3c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 22 Jun 2025 03:15:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750562117; x=1751166917; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zRr4ycteIxXm9cRN4sS8WCEXCu9GkzmOhU6To4bxRHk=;
 b=FheNYUP6/7lATizNr3Le8nV6AhnVGV6hxTbghhSD1JA6NkuB66orNwz4Y5NpQ2vEnk
 YqJxgfAftmO/iZJ/HHWegHo4kPmMebyEIdyJAPoIgj92ZRUfs2y0Y9G2eiTJ7zBxM+am
 +4BSYgIe2Uv3aQGjhvfiuv/U//UN1NZNCPNYPePeIGnQwO+TB7gtTHJE3U4CMJvskcc7
 BeSrS+cQ3BjeqbBplbhAO9s5V3Avksg/l695HI2UETCdWGdXU+qy2yF0OhtE6C8jwIV3
 SjxSym/1FdR0P76e8hfjhpTSdXLv7k0mu6yPmRlg+dnzNEVJBcfhPtGKsKXp091zdB1+
 Y87Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FheNYUP6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-21
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

Autobuild statistics for 2025-06-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2025.05.x  |  3  |  6  |  0  |  9  |
    master   | 10  | 35  |  0  | 45  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 4 
                   cvs-1.12.13 | 2 
       freeradius-server-3.2.6 | 2 
          host-binutils-2.43.1 | 2 
            netstat-nat-1.4.10 | 2 
                   bash-5.2.37 | 1 
             berkeleydb-5.3.28 | 1 
                 binutils-2.42 | 1 
                  cpulimit-0.2 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 expect-5.45.4 | 1 
                flashrom-1.5.1 | 1 
                    gpm-1.20.7 | 1 
host-binutils-arc-2023.09-r... | 1 
       host-gcc-initial-13.4.0 | 1 
    host-mender-artifact-4.1.0 | 1 
                 lcdproc-0.5.9 | 1 
             libargtable2-2.13 | 1 
                 libcddb-1.3.2 | 1 
                libesmtp-1.1.0 | 1 
                 libiconv-1.15 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
                libsoup3-3.6.5 | 1 
                   nanocom-1.0 | 1 
                 netsnmp-5.9.4 | 1 
          sane-airscan-0.99.33 | 1 
                setserial-2.17 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e2db2d9334cea6ce398252807a9b5f2010f748bd | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ab61a0c50f408e03524c95c11f2af0e0b660ca15 | ORPH
   mipsel    |         binutils-2.42          | NOK | https://autobuild.buildroot.org/results/380df36d30b44d98557be6098b2f7e383ab314dc |     
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/780e254aebd400b0bc178d42c04611111c9915f7 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9f643851fae914bb5fd2ceea4e38383382f0b779 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e39f4608d0b7544f3c2e45045cb998feeedca684 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/44d2b86f1b693f6c741d78e856a6787da721192d | ORPH
    sh4      |          cpulimit-0.2          | NOK | https://autobuild.buildroot.org/results/adc385fe35432be28453b8ed9f40e8a6647a4b28 |     
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/abcd7f8e11eabb437d193147c6ea9d2db3090510 | ORPH
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2ca57a12f045ad07a6f1379d3af9b66af68dcb92 | ORPH
  aarch64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/0f89e02f8096f786186b01f9d0ead374661a0e4d | ORPH
   sh4aeb    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/b48df20ba0882f519a1c339d18720aa6b445391f | ORPH
powerpc64le  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/02a01d41505a2609b6189043918b1943ea51f2d7 |     
    sh4      |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/4c7e197292c2c3a3f6bc08e8e1c7c0ec742d9f90 |     
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/e5d75382f031adb5dce532ce20c0198f8ce43e9c |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/2c879f66926f8272a71fddfb961c124c4bdfefe0 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d94554f6b8071d3cc7dac7c3e1203dbf829b5556 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf066c07b679c78f2f66161ea741bd497fb2751d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/15e04e03e94bb66ceefa63d69605d5f1cbc30fbc |     
 aarch64_be  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/918b90aee0b65f01efc241622015cb847b4e23a8 |     
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/8f0b6b6d654cd2f090cc8080855710985cc0cd2c |     
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/8245a3290b5232fed1760c46759427e6f84eaba7 | ORPH
    i686     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/b5a114cbda8bb999893d5ddbe100817d634cf14f | ORPH
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/a18e657f9834bd4b119dd821c3dafb5975414bad |     
    i686     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/5c042235779abd75817f886b2fe3a4c39826eb7a | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/a20b6008cf6ededbb40eebac980cefb8c4703134 | ORPH
  riscv64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ec8c77962b527d23adae39154f6ce5b7278b3b41 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3c6dc9d14da024845b5bf05a766c4e7c9455b711 |     
powerpc64le  |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/beea71b019fc0c56eaa3bb2982f3898f0bc9791a |     
   sh4eb     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/f4b86baba4eaf357b7108c2326bc7024af883eb0 |     
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/f4f31a528828c26ec93121f67a3d774b72394a28 | ORPH
    i686     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0b4118c2f4e4c50b8519e037deacf8d06807130a | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d77bbdf370bef56a42ad3733efd4c030dc0cc219 | ORPH
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/a906f0005291c86c01d6fed3f6ea33b9d9415405 |     
 powerpc64   |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/cf2550538a1dd822ae8b3ed477f44f03f2322f86 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 expect-5.45.4 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
  gobject-introspection-1.82.0 | 1 
          host-binutils-2.43.1 | 1 
               libunwind-1.8.1 | 1 
                  nginx-1.26.3 | 1 
package/gstreamer1/gstreame... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/8be174ccad03b20a43ee2982369b99f8eea05c36 | ORPH
 microblaze  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/c27cf0a6eaad55ba1168276416a3347a8ead7275 |     
    or1k     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d2ecf6fc5381c61d66e2bc9e1e9b1361bfec89eb | ORPH
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ce6d1e43f2e22654861324427033943e4bcef7ee |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5f13d2603b47b8f3ab5866d6c7e0550401d43da8 | ORPH
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/cd59180b05608425addffb022813031eb666bf95 | ORPH
powerpc64le  | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/9e1807cf5ac7bb69ae9bbe7a6a71411eb500188c |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

            host-libp11-0.4.12 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
               pulseaudio-17.0 | 1 
   python-pydantic-core-2.33.2 | 1 
                python3-3.13.3 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/e6ce1fb3154375e5eafab2053e4322296173bb02 | ORPH
   mips64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/c0ef780250c8ad619c4577949da442fa71dcd956 |     
   sparc     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7891d90c866d56206469d290034a6791d56d821a |     
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6b17919ca89d594f79e96c14f2ae67677db33829 | ORPH
   armeb     |  python-pydantic-core-2.33.2   | NOK | https://autobuild.buildroot.org/results/27f03da1c9a971833ff3396c53e92e6cc3debe1b |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/96a035df05e1fae396227c99bda111d84ce26398 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
