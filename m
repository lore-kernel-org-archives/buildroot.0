Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CDEF99FA
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 04:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE13E613A8;
	Sat, 14 Feb 2026 04:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-Np_1v_4hZC; Sat, 14 Feb 2026 04:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58E0613DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771042637;
	bh=PVYVt+aJgINcgOCam5x/Chnb70egpn4kfA7EeXMQ6ks=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z3INe4UR2UeTHmwS030EeCdFtxFte/uyDvek5WtAI/l+THnIdZT30Mh55ZFJuThwr
	 +FNWpa3qfBelk5vywJ5Dkf0z3MUdtHbmPynXsVYBfNgtHEPHxTzZim59+fXqhu/Uue
	 nmJ6L7rO1ZqG6RbUpLtfZsBxCyuol3ANIhQvU5QzmNAuG1BX7ANuufmNUMD+zjPOuo
	 xjB3dxLGEixC6GX65oBkN1Uu9RrUNfhjTYA9SPouC4kEE/nbfBaRNvXL/LsiR6Pgmi
	 JcwJHAgH9ztow744LIDUGiDgIySScPn1EbbpMFf3GJZg29M6rZ4AVUOlmYtb9HA+bo
	 DGc/uorZQp9RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58E0613DF;
	Sat, 14 Feb 2026 04:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57BF6EC
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 04:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4883884511
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 04:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz8YLAl5CA4G for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 04:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8E0184502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E0184502
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8E0184502
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 04:17:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso11687495e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 20:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771042633; x=1771647433;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gBzKck7U2+JldC/Ce09nDqct4Qjs2eHBYp+BWn3xLQ=;
 b=ooeQNaHQc8kfEsglGqDN+b9NKjJVBbDwq7zYBnX3j3bSVFtzXNewoAqGVq03dWMJrf
 eEXCCL9elSLSfsa3VTGBunAhtTP17OmQAPHomcey5ihDwUvd2Aryy8zbv3OY0j699a2k
 yQqdDtEf4CPZtkDGtdIitJMGMjDxDbnF7eDuWne+LHjZenpVk7xt0loDCN+TDQ5RDGlS
 Kfg+INqxtran2oxQpT3FqGeJum2i6iCOOVanNTVuYm3oJSFa7bg4aCT+f/N0w+AgNk0e
 dfAVGdHh36Xh4brp1KmTa4uXXpZN2+6NGyOD3IV40b/QZ/VneyRf0O/ETHteEOZfXbDw
 2wKw==
X-Gm-Message-State: AOJu0Yyk5rE0mzW2kF/awveEKSGbg7fgllqWqjSQYWRSkdZWEt02AhNX
 sTQHdERWNBeLiD/fjDa/lwF4oYbNZWK7vgg9ZrbreqYZVjx+OZ7NbC9eYLugqg==
X-Gm-Gg: AZuq6aIikgZRXQUPwc6qgfBXJF6QRv9Cw07SPmviON6CZI+cyCFQjbxDmcEQkrpZacW
 pQcb+PnVDQSv3zTcJwn9E9BpvHXj0ZKRH2+B18qHk6HMhQ9LPYDJsiUF4FTLzQbMA+mFWlwRH0B
 bnjuEcThhwf2mYdhDnIJlAWDKHtFOiT51M8OvEPbYCZllCCHzKy7feh980LO435hdmaJXgrJssk
 8ZMhjwrHGGpSWxXwDcjh+Vov8TuxlwBN/F4qnI0gkoGhOenB4hvtQTqto2rFoTexJkMj8acfcLs
 jNqE+2l2N/fptgNPNx23eQNL7xjVK0zYC3syizPm4dEA2a9+l/QpvTo0ov36UtbkYPKdNiw0nqv
 C1UcFG9zA0uFUzL4SRW+YbtLUXTFZvohvAsMsWIIi5Ur7HZc30Tvm/OJZzJfrXT79e/zRLf4Yhz
 XKMr+uaA3nTo/+onKSigeA9kM80NTkT+01rINWR9pt
X-Received: by 2002:a05:600c:1907:b0:477:73e9:dc17 with SMTP id
 5b1f17b1804b1-48373a79afbmr68890675e9.35.1771042633266; 
 Fri, 13 Feb 2026 20:17:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a78c89sm104420805e9.5.2026.02.13.20.17.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 20:17:13 -0800 (PST)
Message-ID: <698ff749.050a0220.2a08b2.b426@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 14 Feb 2026 04:17:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771042633; x=1771647433; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6gBzKck7U2+JldC/Ce09nDqct4Qjs2eHBYp+BWn3xLQ=;
 b=lfzf7g/p0m25J7Yhwo5YaK+Nt0kHaLbNOk/96Xgvsb6Bqkq/NBa/2gFqzE2koNUFZ/
 7oja0mP6OIJY6/nKD1isP8sml4NHv2vOQFwV2ltd1VU3wEJM1raUVBC9KU4f8iY4B51w
 ELxC1ZC+7jJJrmuWPkk/yEIcaqItra3oqoCdjIpmrJi9hSGrwdZ8Hu0tNtqVyPHyPI5+
 oQpzXE09e8EuHTyzsoTTWRtPy3Zo3hk2IoigOZhgH7Nru5hoRM9eaEYJ0hAUkUlYtPIY
 pKzcHwpGPCA7F3augKffwUi1VfIwe1DX1/c7c6bQLmCBz/rjo+kA+xEjuBtoT+7j6+vz
 Rehg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lfzf7g/p
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-13
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

Autobuild statistics for 2026-02-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  5  |  0  |  9  |
  2025.11.x  |  2  |  3  |  0  |  5  |
    master   | 38  | 68  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

     libphidget-2.1.9.20190409 | 4 
  gobject-introspection-1.84.0 | 3 
                   perl-5.42.0 | 3 
                       unknown | 3 
ustream-ssl-5a81c108d20e247... | 3 
                  cairo-1.18.4 | 2 
           crucible-2025.05.28 | 2 
glibc-2.42-51-gcbf39c26b258... | 2 
              libopenssl-3.6.1 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                tpm2-tss-4.1.3 | 2 
               trousers-0.3.15 | 2 
uhttpd-15346de8d3ba42200249... | 2 
              containerd-2.0.2 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.3 | 1 
                    ficl-4.1.0 | 1 
              fluent-bit-4.2.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
                haveged-1.9.19 | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
                  jack2-1.9.22 | 1 
                    kibi-0.3.1 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
            libargon2-20190702 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
                libmpeg2-0.5.1 | 1 
               libtasn1-4.21.0 | 1 
              libxmlsec1-1.3.9 | 1 
          linux-5.10.246-cip66 | 1 
                   linux-tools | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                  monit-5.35.2 | 1 
                       mrp-1.2 | 1 
               nushell-0.108.0 | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
         s6-linux-init-1.1.2.1 | 1 
              shellinabox-2.20 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               tipidee-0.0.5.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/6599af2c0010155ec3cea40aa3075220dbd81a6b |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/cb614e436c020f99ac98b0f7714e95e7651e0512 |     
  riscv64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/9fbf46ed142e141583485136810fd939994915a6 |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/0e8ecf6815e409a3bd1b991064baa5d3bd145445 |     
    arm      |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/55d147d22109a489079ea501379825925eee71e1 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/724c896dcf23a74c5cb30c97ca453afcd7480d60 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3bccf91d917cf634fc384ca39daa5deb0200cba5 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/5d11b4b90ff366cdde92552d43590ecd282933f3 | ORPH
    i686     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/41b77973a963e0536f7c66e1aa179aa913ab9f11 |     
    or1k     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/fb1bf10f93db7268682942392c011290942eacf3 |     
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b3bd4a9155e20e44115553ee4fe96bcb460793eb | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/6be6f0fb2f486bb8593fd546e12333bd139a50d5 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/e8c95f17d2631975001e24ce4444dcded0e430b9 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/19295472addbc40ee321f2c5517e9cb8ae771359 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9ea7fc5b819ce5ee978ffd23d15267bb030ef186 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0bb7714f26159796b8a306960d43aabe964cb652 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0a0d0274c4dbdad0c7ed0f433677bcede5f6cf7e | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/2a78bbdb20c06aba90c806414c1a5f9925d842fa | ORPH
    arm      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/9debdcc0e82091dedb75c4d0b0bedb9b5b2c188b |     
    mips     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/5a56447679c49abd18af462552a4d1497d7cc601 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1be933d8d16bdbc54bfe9b67fde5ce65ae01cdc0 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/7dd5e80ec5351905ed2767d144f6448b1808987e |     
   armeb     |           kibi-0.3.1           | NOK | https://autobuild.buildroot.org/results/12f254efa78d49eb99a0924505605367d82cebe4 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/ec0258dc71b30e8e5832e6c21165c24bae069de6 | ORPH
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/717e190af68b11ba0bc0297faf2007d46418179f |     
 aarch64_be  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/7ccae131e8c02dc126d7c82a010f3cc64f3f19c0 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/816618488809b77d345f131d7780566e00c7512d |     
   mips64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/b10af83739d9c0df24831cdf012381bedc805974 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/79dcb4fd2f2a345fd4fd0c1830d21217e9599aff | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/41273d862cdcbecd68a65a0ba37c0c3b0372b9ef | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f9ad484abaf248e47fafde72e474555bcd6e231c |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e1f75252fee6182bf2534ac0d5e45ecd8126b2e3 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0d46c0638eb79fec0e0715ac787bc1fec56599e9 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1fd2f4fba43a32022b892b0a881c0c3aadebfaf9 |     
    arc      |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/fed6f8dbf7b30815fcbf39f0f4300978b6df11f4 | ORPH
loongarch64  |        libxmlsec1-1.3.9        | NOK | https://autobuild.buildroot.org/results/3e15f03dc0211c622125ebb69ff7230ce900029a |     
    arc      |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/e1c426394263a2e56bf840a5b355d6d9fafa2164 | ORPH
   armeb     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/f128e61b9012611d19bee75520521dd5cd7b116c | ORPH
  aarch64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/26784dfbf15e1b2bb4807e2607ce0356a47e7c48 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c66c4b8fabab884303118020eae10b5406b65bff | ORPH
   armeb     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/336e2fad072c7985d8dfdcfc9f49f0a815d80b89 |     
   s390x     |          monit-5.35.2          | NOK | https://autobuild.buildroot.org/results/47030ddaa2c8bd44b1de6e1fd0cdfd20c2aa0084 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/9ddf91b6b325c4a9d47a6f47e9707e1045dd7702 |     
    i686     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/d56f0a72e10f4d30ece98dba0ca21d77956e3c2f | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5d78cb23121884be4b06efc715bc6bcdb8b09340 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2a2cad67526cce5bdfe3a8c3e69eae49cd6270de |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d4f0994a42a068d2013bf1a2c375fc31f35a7451 | ORPH
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/d15ca48dbc49ee895b5c2e5b83128030e1712720 |     
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/d39b6d12366b40e0dd11a1058314becfa5dc73d9 |     
    m68k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e6d33657936b04f37980a6d270b5e498d569ba3f |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/abcac90add9252a53b52c329fa3d3f4cce330f6c |     
    hppa     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/941bcb5b4a610c15477cf244e94a130da1af6247 |     
   sh4eb     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/d0e199e6b1a6cade49bcc472eed182a49d873ea1 |     
    mips     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/240bab0ed65a04a35a4e4c4a82cbec50ab2fec93 |     
  powerpc    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/b9a6a92fb2a34c8277e313adb7cb6c52a9abb212 |     
   mipsel    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/ab11144854b135f6076ecfee8ed8b1b47ee1c3a0 | ORPH
    or1k     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/f806d2a60d28f51dda51da202540a877f8ca855a | ORPH
    sh4a     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/99f6e1c23fe00927c1328d37efc9678480baa01d |     
   x86_64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/d16c37a8667d5f5a39b4e80d4f97d3bf75963a56 |     
    hppa     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b3d839784399c56ba52b56599d29cf53b8dc3a70 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/adbe6a10a42c83c26c82a534a18c1e9498e3cd36 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/798bff6864568a9cca0c5e4b7f1253af0a1d5b87 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/3b74bbedaad5f944b4644df8ec98880796c9182d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f4b720e888d891bf312330f8e5d23cbd91a3967d |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/aee66cc383b45f862a24f941663991ed785a5acf | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/151e1ceb2fe4efd7c6d932dbe99fa926ba0d7b9d | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a4740199aa986a2b28bfd2117713789e3729dcc1 | ORPH
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/75769e23789badc2d6781c871229197bda3a9d4e |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 c-icap-0.5.10 | 1 
     linux-5.10.246-cip66-rt29 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1b3e5b487b37d0cc05c475c3d3b0877c5bb14efb | ORPH
   mips64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/3b28211b975a2a8a128d6687eb57977ddc9b9d2d | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/6bbe3164b059d23c58c702ed7c7e28fc0db5ffd8 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 3 
                     ed-1.20.2 | 1 
              udpcast-20230924 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/b6bc5e34ec1d982810709397738fed2b41672d8a | ORPH
    arc      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/f04b76ab4df4b2a40d4db80581bd4ebbc7c92bc5 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/14e94b94006202c77599e43540c60e95f943363b |     
   arceb     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/92152e5d10f6bec286b34350b18864681abfb79a |     
microblazeel |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/1379da77539b8fe0e456233f62fb03832ab71041 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
