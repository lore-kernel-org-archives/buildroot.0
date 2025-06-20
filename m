Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E95CC7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 03:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C0240ACF;
	Fri, 20 Jun 2025 03:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcV43PYU5iwt; Fri, 20 Jun 2025 03:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0E740C6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE0E740C6F;
	Fri, 20 Jun 2025 03:16:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF07C154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 03:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5D674011F
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 03:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA3aYy4Ivzn3 for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 03:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FC114013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FC114013D
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FC114013D
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 03:16:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so228217066b.0
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 20:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750389389; x=1750994189;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ggoRk/+5+BpDFDd41wMsLDm7f6hh8uj3KOfodYYkZGQ=;
 b=IkPz2sEiiUIdRORVvD6pDxkB/frx6CnHjFeR8AVCskjztf+7WxHvdcj8J+sXUKDPXs
 FSvu5fQKk6AJeBvJIGwWGEG+BnIlHLeQ1wQno6mqU2huS9ug7/pGhnVnUt15ltcJ7Nmd
 rcL0DQc2X+2WNzEPJ0lI6DxoITa0od+vVky/gn/NWTtxWEmcjIW7z5K8Mggy4Syh/wF8
 3BeSbXINnf46XvSKuNy4wBmJ5j9+YuL1AeRd8vjNC3AMCHNdGeng39quUC7QWDuSygbK
 Gd1BSjXFrGN9RHRughXsJmgFmZLuxcmP0AbYkhzQDT2G9Om6PtogsCgjFWKowQ39p72L
 Zx4Q==
X-Gm-Message-State: AOJu0Yyh48RDn9CkTpDtZAYADYtGIZJeaCDXvZbC6Ba+Y4kLQzolVYyA
 g7nqIszOvkOHovKD5NV40dIkwhgMpPJGbYXKAtvbdocpzuiW3q2ktTZML0wIcg==
X-Gm-Gg: ASbGncsWQf9sC6Et+pRaqDHaqJetubdvnLE8u0dBrdh/FvfRTfGgLdqoCqH1mcdZJy/
 cczqpioLzBoG7m4b74CdVwWFWhOLQTdPZiZQTuMYnviG4fORoFWPPJSwO0E2XfK8+zVy/OKeZKu
 5neGB8+E9Q8HbuCU5GDSeGmQGNP0f821hzBfaovpU4gTGrcxuO8eFcBlWvAll3gWaL6Z01PLOv4
 2jl/qoCsYye8RwNAOJODfhrc6j93MQUw83KFnVjqEFsDXaP9B88akOVeJSkAx5luBwc/i+0D31P
 hqE+MA4AGXSPgdHcleDeCiHRrRELJVKu5GVc5Xahq42atWmCjBgPjkpvvNP16xwADNvaOk/w31/
 /
X-Google-Smtp-Source: AGHT+IHfvTzHiOCsUeRq7KtEU3s14JfqiM7Q0Fohi9dz9/bzbAeLHRhkglK/OppJRzBtcqHEHBwNNw==
X-Received: by 2002:a17:907:1b29:b0:ad8:9257:573d with SMTP id
 a640c23a62f3a-ae057a0826bmr96692666b.24.1750389389119; 
 Thu, 19 Jun 2025 20:16:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053e7f2cesm88243666b.10.2025.06.19.20.16.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 20:16:28 -0700 (PDT)
Message-ID: <6854d28c.170a0220.3344b4.2322@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 20 Jun 2025 03:16:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750389389; x=1750994189; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ggoRk/+5+BpDFDd41wMsLDm7f6hh8uj3KOfodYYkZGQ=;
 b=RnVYqIybJMlFMUfkbcpyKD6iE8klQLDZcHPK8XqSP4LdmjwbD2H3Du4Xw4eyi37YzV
 lc9XBbs98N60juawEeLcgW5yX4bc68OfJdiiMcK7IpRp9VrXsUJ3PmBznbPqWRWNVcWw
 vWjmSE1PJprzHdqxr6h72Lg++dy11/YAQyyE7iTknhirtb8uYUTnMpodZ0dfi4+qCrhX
 bAOtqunSZLAHbq2w/Gp9OLOPvm4fi9fFt5s7bMwHOjT7joCbhTvLP9C3Q1aeCa4iAbi6
 +47iiiEIDUzeY3l0w3pzMFTqrPxZS/zkcY7OUIwIGOENeMvGnXbmwNfK0JjZij8OTmti
 +sPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RnVYqIyb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-19
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

Autobuild statistics for 2025-06-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  4  |  0  |  6  |
  2025.05.x  |  2  |  9  |  0  | 11  |
    master   |  4  | 37  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 3 
               bctoolbox-4.4.8 | 2 
          host-binutils-2.43.1 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                libsoup3-3.6.5 | 2 
            netstat-nat-1.4.10 | 2 
               asterisk-22.3.0 | 1 
                   atop-2.11.0 | 1 
                   bash-5.2.37 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                 gerbera-2.4.1 | 1 
            host-binutils-2.42 | 1 
             libapparmor-3.1.7 | 1 
             libargtable2-2.13 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
        liblog4c-localtime-1.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
               memtester-4.5.1 | 1 
                   nanocom-1.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
                    snooze-0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/94834d9cd645a6c604d2f0470d57783b2b9b0482 |     
   mips64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/90a291f4bb2c64a8bd4a712f2360215f3f465b07 |     
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6e68ed45c916c4812a0d62a2591cd8d01785dcc1 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9209a1a92dbfd60a7d0e632180e800cceef8f68b | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/60fa0d0c07f8a558fad8190f6c68ef96bc97b33e | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9bf1d7d79b61617296a1eca4f973a5bf608ff93d | ORPH
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3475983553f7d207259fc6321072058ace3d74b7 | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/cf2a123fa21af458ba59d7f124c78bd564de5056 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/24c11b6867426159848c20b767f48d49361e7536 | ORPH
   sparc     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/8d03f5c1e23cbe57450e0e4a3f40ed5469f9ea6d |     
    mips     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/aafc3b0ee245121adc00cb64ef80cac2d4f9e0f4 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/013592ed96a24ce861a1d238e2c5fd0d81b5715c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1bcaeeea4661a7159181cb17f7d0609e464e0d7d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dfae932b8cf83dfed0e5519795b08072d1a1a7cd |     
    i686     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/45b20a5952d59586e415ecc45b83f46e326d3c5c |     
 aarch64_be  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/99df21c98fcfc518924da8dd237192fdf6950aab | ORPH
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e57072fe5eb3f9160378c06afd1d80dc6f64f379 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2210973b6a8dbf86603617df8f1e43f6108b8402 |     
   x86_64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/6f9664796b684c4add2a650b8844bf10ef3839d0 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d1679bdcf62004d8d0fdd2f9063c5499ec2806f9 |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/6cfd2908218422ace302f921aade895436fd0141 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d7ccc1fe424e6e0e5589366451ef3b28276dddf2 |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a3b65551934001737f890d0c43518c25e2a65f83 |     
   s390x     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/fd1a8b8662cd9232d5c7f81805f6b6d1068edac9 |     
  aarch64    |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/4cebd0f0cca7ccb60ee1b1da2ec7e217a8b7e70f |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/330c7afb7c2eae2a51e999d65e0c459f7df8ea68 | ORPH
microblazeel |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/731f4d20d2b4d03ec3013f46ce97a8dec5bd51a1 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/07ccb2bd0d67e0af7fb6cd56af1e3603ab985dd1 | ORPH
   sh4aeb    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e34a7b7d7590278b72f5577f137f3bf6d27f7865 |     
    arm      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/8d8bc2f3f7b8588a2870bedce82b45d7d9799fbe |     
   s390x     |        memtester-4.5.1         | NOK | https://autobuild.buildroot.org/results/6d4d4e8ca4269a3d8f795c7c186ef70411f2dc79 | ORPH
 powerpc64   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/1f9e2a847d1c586e37aa6a17af6fc100d552b397 |     
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a65666bfd5a18d5279cf0c64c6488d5e9d4ea127 | ORPH
  mips64el   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c474c3ad18935fc6ecb9e7412ac83778ea959e2e | ORPH
    i686     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/4c8a43eed5ca69a6ce5cb2fd6bbc6c2065a4bcdb | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/211826a5051053b48552a7fe5c809fb8157b7dc3 |     
  riscv64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/01cc9136e3a1899f7a6a2d55268626cdd0a76036 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    brltty-6.6 | 1 
          libcamera-apps-1.5.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/8326267453788865aaf188fa3849fec70d95c307 |     
microblazeel |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/4c680171746f439df45c72bd0a9623b0767dbd2e |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d20a091fcee199208de32371824317a3fd9fd9a4 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/93ba30910403a8e49a0855b566b8159cca3e359d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
             dahdi-linux-3.3.0 | 1 
                elfutils-0.192 | 1 
            host-binutils-2.42 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
              libselinux-3.8.1 | 1 
                openocd-0.12.0 | 1 
pthreadpool-560c60d342a7607... | 1 
        s6-linux-utils-2.6.2.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d4aeb297f62b7dec93d514f934d16387d8b925c3 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/826b5b9161a199f48da7d49682b389e2b42db063 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b7ca2e9736b4e8ebfedb1b643a4da4d5fb5d1d74 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4655a4540bed0f051befc98752cedad61f5ab6d9 |     
   armeb     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/04633ffa385e06538758c90d3bce4f75935e772a |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6d498c68267d80ce3afa79640bb2c2bc2ac30925 |     
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/50d08db42e151dad4045aa5e85dc01c0b6208d8c | ORPH
   x86_64    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/0d0b2047705135289ed48ad4764f8573a68caba6 |     
 microblaze  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/3f3e9d63c43ee7cd7d9dcc7bde95a58dbc8e52e0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
