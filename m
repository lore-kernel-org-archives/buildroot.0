Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEABDC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 04:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F147608C7;
	Sun, 16 Mar 2025 04:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYCG4Z1hZCjm; Sun, 16 Mar 2025 04:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05EC608BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05EC608BB;
	Sun, 16 Mar 2025 04:15:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC0DF61
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 04:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B8E608A2
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 04:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9R4aNt28J1D for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 04:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DD73605DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD73605DD
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DD73605DD
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 04:15:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e5cd420781so6444978a12.2
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 21:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742098499; x=1742703299;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxty/vcV59YpS5hEcRy49zHexz2Af7Aa1soib1MJMpg=;
 b=Qjg437V5tfQ4JIzIoUhqPdCdjOxYOkSPdaqsGlZgJN22Ugb1xCQKBVZiv2YHWJVolk
 AUELgn0Tt4mc8l/TpJhxRWNdfb0fY/UOGc935oJ3s0AMq9p5uf3z5ZaDDUyaClGg0iQ5
 15PHKRl7E8rZmsM6MLeYa0hm0qjfP/JxWOSEEwkUujcgLzPPDg4+qOyRAa8D9qDL9mSf
 idGCePq3DhSdW52NMIUjSR9mD6eW77fxCUB37LcgQGwNU7xde/ZnhiC33o0IbOqb47fI
 vP9DlJHanO69/j8NymPZQGrhUlS1QqTC5/TmvLIxDju+EC7BFsoGdtplawCVI7BBHype
 k1BQ==
X-Gm-Message-State: AOJu0YynYP5/kl8SdX1GBeqwJAYVJ7hH93zYiISgYzOBWmrWFgA6Fb42
 HEmVMft01QETTMOsAOHW01nQOCxqNmiz9Wy4mKltEVruiHECmv7cOVeBiw==
X-Gm-Gg: ASbGncs92nevdePOzaaoW9Li/HG198C8kAswD8W+Udq/0KxKm+gSfgC3gc1o4pb6x/E
 aqQx/A/uoappOonAyz+WLQ0V3PplzZFmb0GGyu7+bxWNIrq6NAZJcRzLDmLsZNnNVixq1abCzRt
 b2kGnglX01r5XvDzKbsYQ6szSMPCSIW8MHYcmeXKlmXjdTkPIvZT4c4IxSs2rHI1K25yFntoBWd
 gN2fN9bqKQEXaI9V1lPBo7aA+Xu+WWLwzDnWJaka/Q5qicXsAFobI7XWUmDMEYuch1MHjWDkXK+
 PStb1QOfiUN9IojpCaIGVbS54iFIkWpCUe3xWvbzx959DTZX
X-Google-Smtp-Source: AGHT+IF9RYEutX5+LYbQyZ1W0LMShz1BrUqC7eZTtCyviQTLBE02DA5EtPl5jqPtZJBbVK5jW/PsJg==
X-Received: by 2002:a05:6402:2350:b0:5e5:827d:bb1c with SMTP id
 4fb4d7f45d1cf-5e8a0c14048mr8414107a12.25.1742098498882; 
 Sat, 15 Mar 2025 21:14:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e81692e63csm3907797a12.11.2025.03.15.21.14.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 21:14:58 -0700 (PDT)
Message-ID: <67d65042.a70a0220.961fc.cacd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 16 Mar 2025 04:14:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742098499; x=1742703299; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hxty/vcV59YpS5hEcRy49zHexz2Af7Aa1soib1MJMpg=;
 b=OlAnLVFZDunVrtFl8C5VwbE8ILoU/jIECUf6IhsN13tf6fQ2Tf1dmqHzD2DEKA7fKz
 TBCG2UwrIBNsqN0ZfN6nF6T8iLp/MU9qHop9MRXnD/+dWrd3lMO91qMnZGtiOziJYF4B
 XiGhMt2bJdcfeZyEtVaB53pHrigJe7juSLWlOQ/7gtkoqol32O9HWrwYaGIK1ZB5/ohF
 jZpGf9aAGWERfj1i2EKfY8reQ4XgA+LOVn7aaX9NuG0pvub/tqeU9PTc1Xg8xq6Mze4k
 B/E49RWIVA86XJpcHqrjZg87zvwEkPOjqdnJcEUbyQU6eJHVR7B0BVf+GiUzEsLuVQLQ
 5dcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OlAnLVFZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-15
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

Autobuild statistics for 2025-03-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  1  |  0  |  5  |
  2024.11.x  |  6  |  6  |  0  | 12  |
    master   | 22  | 38  |  0  | 60  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 3 
                       unknown | 3 
                 coreutils-9.5 | 2 
           libzenoh-pico-1.2.1 | 2 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                   bullet-3.25 | 1 
                elfutils-0.192 | 1 
esp-hosted-927a34f99724bb74... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
               gocryptfs-2.3.2 | 1 
               graphene-1.10.8 | 1 
                   gvfs-1.48.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-mender-artifact-4.0.0 | 1 
                  jack2-1.9.22 | 1 
                  libnss-3.108 | 1 
               libunwind-1.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.12.19 | 1 
               mariadb-10.11.6 | 1 
              mosquitto-2.0.20 | 1 
        network-manager-1.50.2 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.1 | 1 
                 samba4-4.21.3 | 1 
                     z3-4.13.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/f0ab0666f391cd89160e417bcd6acf7914dbb597 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a603c6f93f7bf66d9923a6244e7fd17659a98f54 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ebc0c7b521ec187b4f0dd2e4dbf1a4255946755e | ORPH
  powerpc    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/6d02f391caa551f4bbf15c42120a7fc7c10149d0 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/582ab38a850a2055b2c42e4242c10ef601e30e60 |     
 powerpc64   |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/47ce55330257f262c5d3b1e85f1d9aceea5e9714 |     
    arm      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a46bba02e2c84d9ce0da9625f883e5f8be097702 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/877f7ec6806080151c32e09d8f07768de974e95d | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/88fda09f88d2020e5ba2abe8a9214fdd45627bc9 | ORPH
  powerpc    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/f2228041f6843392471b161f9c6d9dc3311c9e04 |     
   mipsel    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/1ee340c2248c7280cdd9a956b67fc7b048f8b562 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/34582228fd2c331c0de7fff0493abc78b4c2b22d | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b21176860907c06ffa9db1548b652f97507dc2b5 | ORPH
   x86_64    |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/943199b89cc9d6fefdb6dd11094a5669205c9c2e |     
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e6a51300f949274d2186ee9c1e56d3767d783f69 |     
  mips64el   |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/9ef7f0d9a3e3fbc5e04709f9d89fdfc0b7173e0e | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ec4fb9439aa5ebcf0d364ad7d045571ebd069c34 | ORPH
    i686     |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/fbf79bdf315f4961a35744627fb89022972f1d18 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e0f549615ed9de8ed34438d92b7424ad81e0e99f |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/69ddb8e9322043c8230c9362ee91912debb83bf2 |     
   x86_64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b9575d181850c7511227a49a38236904db141201 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/78db3065f6740ce7d8e3b5cc75cc89b91b761f2f |     
    i686     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/f2d821b631c679926f3b6217ed5d172029080cf4 |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5966c96414aa69f7b96fccab8b7c648a89dd312e | ORPH
   mipsel    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/7545571e0663c2c73bc03b8ca93bb7250d1f8828 |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/0dc31b8f1a3766eced40efbd1df9adbf98866ee6 |     
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/46041c60961a25feac3ce75c801f062e86d15348 | ORPH
powerpc64le  |         linux-6.12.19          | NOK | https://autobuild.buildroot.org/results/2034d7331401b1350ba30c5bb0d57d41f1a94934 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4547f960d08f08ef93dfe0204b1a4ee271af5213 | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/a944e5a6d71e7a8be3679855661c4c1a4e3df171 |     
 aarch64_be  |     network-manager-1.50.2     | NOK | https://autobuild.buildroot.org/results/6ae39e4b1cd6fe000528151a50674079fb7125ff | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/0c6b99196d963fa3b85293b2692687c74f1c58db | ORPH
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/ae9c098f82012c8d57d3f851dc0e7d7c4eae98ff |     
    m68k     |         samba4-4.21.3          | NOK | https://autobuild.buildroot.org/results/66d35fc501a20b075d84f6ce87a76d2fe43a7676 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/fd07d73000ab10959f039a12086c16ecca47485d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6e4454d79f1aa430c71bdf9d2fe60b4ff2544ad3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6e9908083d72cc2b772fa089a854af6463748c2f |     
    arm      |           z3-4.13.3            | NOK | https://autobuild.buildroot.org/results/31fc68c2493a7c214256bf095e190378f5b9adef |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   linux-tools | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6e79bf5e667e2594bd78ba3c12722a8aa821dbb6 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                acpitool-0.5.1 | 1 
             containerd-1.7.23 | 1 
  gobject-introspection-1.76.1 | 1 
                lesstif-0.95.2 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/399d92510704c98967a9bf3cece708f99626a94e | ORPH
    arm      |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/6f49a9c8afe4c83aa2db1202ec185689ca4a507a |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6d6709d62f3a889bbcd0422da214bef11bd4f4bc | ORPH
   nios2     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/8756dee885aa0d85077e76ef68c12df6fa545010 | ORPH
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3b5a87aee70ca049d36cfbeeab542d3416632d2d |     
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/faa10a4943e8d564fdf6cce0fc4ed1cd3eef6a0c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
