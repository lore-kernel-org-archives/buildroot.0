Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8F4C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 04:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A3D60861;
	Sun, 23 Feb 2025 04:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ep04x54X4da; Sun, 23 Feb 2025 04:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14CE060877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14CE060877;
	Sun, 23 Feb 2025 04:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E115B88
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 04:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C7481264
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 04:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2uJLOR5C0mU for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 04:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA8CB81263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA8CB81263
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA8CB81263
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 04:13:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so579971066b.1
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 20:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740284032; x=1740888832;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R4FBOx3zeV6BhiqciFbbUq/ufJiU9IfQUaWclnWQSvc=;
 b=u3ubAoLCtJ96h1sTa/BpCF+1zJIsQnGVeSTm/wPJjM5910sRIEVU3rrrpcuh13PFlK
 +05qbA5oQ/ya439tSzYU1k1Xy9eablIAXl15VvLJvZ9rLVGZGER9XtG2JCHtyjKNKXES
 Ma6vZImP6U90JIwEC/W5dskpuoD6jKqZs4E37mLwZk+f21VwcKKP5XkMUBFENnUas6/d
 Vx4vTzz2iCfua1gLvLD7yMxYEnLnkNPVNqb3I+JAsoVde/6WcwYN8zUFj6atboz4zOxQ
 NtDoC3ueU4c2yEDCQjTuDRrkXAn4lw9vqkP/JU1lFB+RO/e6NM1yQzGl3b+gnyjTVmpw
 CV3Q==
X-Gm-Message-State: AOJu0YzvSdRCMKn1z06CUSzhC4uucugkjZbEaZ3rrPs99yhLOmSyJOiq
 tMjIP7XGRbcWetrAw9sl7tmSiPKhqFKNZVVJHyP9Lc/63u/tYHKLP+ghVA==
X-Gm-Gg: ASbGncu83UqaVjq8xcwRGkqDvQPzB57MWMwNCdglMwBWR3o1f8nS9YxeeP9wd9VNoK+
 LlPXSOOmelFa8W2rfxWLK4ZodQJRIo/ELwdUXwuT/vzrSG4mdcF1w5SgaZe5Hjf3jUZgCWBpNsh
 4JP/ZNFV4PeOsK+NmEdu5xmvinov0MCHhPUuXjcJBM2WkEj86JHTdaVPTSIiohbJtsAurykNfD6
 INWrLmx/Bu3ab8JFWqOTO8VshZ7HjPAyYnRdxDyCnLw4MozLR0YyoWCMpED7ahRmhHRoserbE9M
 VdpStXE9Ow5lsZlIyzN0TjxsTKYsYw==
X-Google-Smtp-Source: AGHT+IGlyJOqSt5+9NZpSs76eF+jJSk2pRgZVngSEo4kghZxeKOIQafu+rbd3ItWrdkfPI4WxG3hGg==
X-Received: by 2002:a17:907:784f:b0:abb:b24d:c63e with SMTP id
 a640c23a62f3a-abc0ae910famr724867866b.16.1740284031696; 
 Sat, 22 Feb 2025 20:13:51 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8ab30726sm1401876066b.153.2025.02.22.20.13.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 20:13:51 -0800 (PST)
Message-ID: <67baa07f.170a0220.185d9b.54af@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 23 Feb 2025 04:13:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740284032; x=1740888832; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=R4FBOx3zeV6BhiqciFbbUq/ufJiU9IfQUaWclnWQSvc=;
 b=g25e3qcoycEy3R8aPvbEpERdeyVjgIYsjOZOcUdT6/w601QpS6o4eRmD/ZAatiTYl9
 KF7EuPYkLEWvFBQmLKWMIk7ajYqIX7macSl4D1Q1P04Z9QukJ5iD3zh1dJNTVB662WCs
 F1fhQq4v/OS78DxRrJ07yTmGpHpW1CEL8LKbCebB1YN8iM3HBg9P311r0BtI5tYygoh5
 yVt8mv3jAfjs/AtBsp/vOXAml7F8lPMqfdfB6kjD3YVBuf11AvD7wqGj7JVspQ7+rJU0
 69A6TLH/bN4TxFTIvOzB1huuEo+dsajIbQU1Ac9lKxZQCrEUznGq0US/uV5fqsjC299r
 M9Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g25e3qco
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-22
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

Autobuild statistics for 2025-02-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  5  |  0  | 10  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 13  | 49  |  0  | 62  |

Classification of failures by reason for master
-----------------------------------------------

                 libcdio-2.2.0 | 4 
                elfutils-0.192 | 3 
           oath-toolkit-2.6.12 | 3 
             fontconfig-2.16.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
host-heimdal-f4faaeaba371ff... | 2 
           at-spi2-core-2.50.0 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
             dahdi-linux-3.3.0 | 1 
                espflash-3.2.0 | 1 
                   foot-1.16.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
                 highway-1.2.0 | 1 
                 host-gdb-16.1 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
                   i2pd-2.50.2 | 1 
             libargtable2-2.13 | 1 
                libesmtp-1.1.0 | 1 
                libsoup3-3.6.1 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
           libzenoh-pico-1.1.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
mali-driver-d40c57d81c9cf4b... | 1 
            micropython-1.22.0 | 1 
            netstat-nat-1.4.10 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.40.1 | 1 
                 pkgconf-2.3.0 | 1 
               procps-ng-4.0.5 | 1 
         python-remi-2022.7.27 | 1 
                   rnnoise-0.2 | 1 
                rocksdb-6.20.3 | 1 
                  rt-tests-2.8 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/05550342a2f61eb6f739d977a3b8f26c5ba44b27 |     
  aarch64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/ece96437c4606bf0c78a57d42b0fc35f32e01b9b |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a928704b3c2f38623b06c8bbd1325de59a037322 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9f2f18ec679ab97ed9b8761d911ced35adc20204 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/125a1d1c7956d5f0bb8650de1080409ac7218993 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c330669e5e78dc2eeff1d55de22772d2009696c1 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ca172bb12e5ffac37896c54fc6b9174a346ae394 | ORPH
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/c97c9f76317943d64f724a783109d4db0af53460 |     
 aarch64_be  |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/93f2214e3b90082bf329fbf4f63bdb418f4204f4 | ORPH
    arm      |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/20c1c891742b610cf7ac91056ab326f553e884c2 | ORPH
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8e15626bb932d05745401ceff9a1880020f11676 |     
    or1k     | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/2d3a932978943104fa232e4914202dc8c51044b2 |     
   s390x     | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/27440b66324e30bac0010fd68f8907799f804fdf |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e3a1d0f545f4aa80cb9db4a80ed91b63ed872dba |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/880114051191d1f2195a8bfad6efc9744b38f664 |     
  riscv32    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/6b2aaf2b8f42aa2ad942824ff93955639fedbe54 |     
  powerpc    |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/5327e1d71a799c8e92fa2a608019f9dc1c69d2ac | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8f061e641fcfda6c09740516c560722da8ebaee2 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/92411eea4c447386120deb51934cd20c6277d491 | ORPH
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/48df9b27f22611015ec852b6107f181f2402ce40 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a38077f7e6249a7d39f447b83e1865a758b59142 |     
 aarch64_be  |          i2pd-2.50.2           | NOK | https://autobuild.buildroot.org/results/cee95d16b4a5a460c6fba28c31ca2c8ba9cf4634 |     
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/596e252f568f27111af0b1fe35319251ce701536 | ORPH
   x86_64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6398523886073647d174e22f089a71fa4a07b18c |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/dfdd89496b4b5534927cae9ceeb414d81ac37eaf |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/5dba4024dc5141c172d4f0a870ca14bad096d0eb |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/c22950af27bd8d37b00a34ee5272d8ba307698a3 |     
  sparc64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/b1986921eb68a35d1311e76b78256f4c3563bf28 | ORPH
    or1k     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/3731f443f387712292991d5daedbeaa0d570e427 |     
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/b96d6b344251ec6c2e8b6ff6dac81b2dd427d1c7 |     
microblazeel |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b31a7add446342fa66a5e43ce5b67c3dbff2307c |     
 powerpc64   |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/787277e96768b18f679175989a32a4f43d17ed96 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/994ae0adcd197e53543b221351b1cf1c3a5ffb0c | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f7851be76137b9e73442a58aa9727cba07e2c461 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/1697d9f0cd3d2f574dfff088ee91c6d88edb4ff7 |     
  powerpc    |       micropython-1.22.0       | NOK | https://autobuild.buildroot.org/results/0d685c9fe48a25ba224f6a558d8c6111861a63dd |     
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/cca978532226a67dd0fc49acf7ca519175b7a2ef | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/52a7ce7007c04193ce8e2481eb69ab35a16dd787 |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0767cc349f4b9775b074fd3c5c0dc1e8c82efe3b |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c79a3faf50b78f4fffa6da3b9f0dc98b07b6151f |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b8fc2b3e87a28d17fd46f96860eaf45e811fe15a |     
   mipsel    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/4781175e7dd4451e4c58370750388f77247a02b2 |     
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/1dcf2a46b32db677cd701436d2fabb4874a54970 | ORPH
  powerpc    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/0fc273208c52f4e18ba0452de0216eb9ad1c16d4 | ORPH
powerpc64le  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/a6ba4b38cfa74373a43e3af61c4661658ca2f598 |     
   s390x     |          rnnoise-0.2           | NOK | https://autobuild.buildroot.org/results/8a4040181c8cba45339d38647a23acd99ca2784a |     
   x86_64    |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/f34293d767d7a32f30cfc2f5de33b149daf499c8 |     
powerpc64le  |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/23c3d97b01dda7283d1f9eb39d3f4fe18f893ba7 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/efd93af9028db64d01d0e81658e9f9f317a67677 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    brltty-6.6 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
               libglib2-2.76.1 | 1 
package/postgresql/postgres... | 1 
                  procs-0.14.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/adfbfbd6c6a5f43a1112086d87938c277b79923e |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/a94eed7e4e6ca3d2750c6917a1fd5a4202d22206 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/581d9c528db4b466705fa0fb9684c5b645fe9c36 |     
    mips     | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/6d0a02fc8fff42c7c6de35c27e3432e3cad118fb |     
   s390x     |          procs-0.14.3          | NOK | https://autobuild.buildroot.org/results/854af7b806bc3a04d19d28dbafe6c5d582100d49 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
        gmrender-resurrect-0.1 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2e653a52e415ac5867db2a9e425d55006c9ff978 |     
    or1k     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/0bfad7ce99d4ae97d779bde084249946b23721c0 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cc38512264b277cc3979eb387bba2e0cf5a9725d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
