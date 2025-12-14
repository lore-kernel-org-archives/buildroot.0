Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D1BD3E787
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 04:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CE14071C;
	Sun, 14 Dec 2025 04:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBrdbpXZqmSt; Sun, 14 Dec 2025 04:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D7A74075D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765685830;
	bh=kic3aazqEdnqpcE2X2jxvE5/CkhGSYLWadwOjPfvIp4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F2F73uCl+6yMCfsS2u7f8CtvNmyWskB48rkjXaCFF4/SFzGNOSBS9f9Q69OiHBtsy
	 nnnswZzT3lAT01rGmxT62MjJLqq3Su/uDymuTKZmdguCH7+DEyzDL3eycM+oaA91SK
	 1mtwrv9xQAr7hAzZkKqY8apSDguI6+CcHzbNsKQ6p3vLXlm7je2/eZoqgwEVO7vWoA
	 IW7n84MAc9gVgYk/YvNi9DYtnZbYiIKX7UkH7cGoXp8ArG66hTI69u3Jil3kGFdZI1
	 rgc3Y28LTPuxKSjrmqDxm7lgW07klufwbkzEjG9yaXTB8/4ORnZgSBSrcvvNcVdJZ/
	 VJ9kjD81x+S8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7A74075D;
	Sun, 14 Dec 2025 04:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC09117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 04:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F178981F5B
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 04:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V56DQj_skk3A for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 04:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B745813A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B745813A1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B745813A1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 04:17:07 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso1250327f8f.1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765685825; x=1766290625;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNGjA3L5qcxBuqmzGF1VttED+WOsAt+q05fLDuFOInQ=;
 b=dnheLMkQz0ByVp5CconvZ1Xru7jfp4TpAFGvg7XzwQCoILMgfNC4V4pqq92/mBuh7P
 j/s8qZ749XiAFhLraIbk7EhB+/KAVU+v72Ugyg9to/v1WWdFp78dj3pVUleEEsg7hnUL
 DL/twcU7p9uh6XD+0GsexIDjItbo+DoWnyc7+CmFhxV0p0b07YAw97ajQnKz6C22qz8X
 2Rm7OUOvTl3Tw5Eax1JvB/G1jbcDHrH77zZmZhPhDFYR1NOXmcw44qO2AztYLTYPINHi
 9jfvisYINgdf6D8Xwrtb/OlutZBqB7+nVyE6kwug5c6fLIX5zGgkyCWObW/4L6C+c9di
 nDHw==
X-Gm-Message-State: AOJu0YzeZVw3piUzwj08UEaeBQ8LhKdqYGaJlDSXscjZY/19iaW4ca42
 8fu9kYwX62NimDdSOibff+MpYU0Tkrs6CIJpJnQyisn4EOrEQyBGophU1x0ypQ==
X-Gm-Gg: AY/fxX776AjRXrQHigK6Bpgk0Y0O9h318wONX1+DcSFskVugUt7jnsmDoKEC1WJ3uR/
 X8XkYQRkk6Q9kOUlNJCKOGcXcFcUHGOzBEsM+8Td4wotQoq78WUuFnROLDapg6Kg2k7flX4y0TT
 3SXhTnivWWUc83w7CGSUJ/R94nLiZkHdc+u+s0IvqK998i8bSFdBl+3Jz+ZkHty6tM8cArvTmGC
 u/XOYy73G7YgoTMDgKT2H8x3z/s6l1ds3tM60X6cSzaZkQrPO7G56LUcV3/gqbCs2Nz04Y/A8sm
 1YMySJzZ/OldTRoa+V+i6yUCAsUVEgZLfjKN2uAb0Cyz+cMOUc7yICRgkkOADWlzz3sOpODfH7l
 bmC7u0GaugGKoQcK2+T1XfwsGxXEcB1RxBYWjgYZt2oiap6/eGJzwmwEcLrMJZZ+hNXmRnB1BKh
 vG1pYOodZ5J9wnXvqgoA==
X-Google-Smtp-Source: AGHT+IHcJeJDDwPw5nbOuaU40XZ4e3v1P071AwSHFFdpHLy48T1bXBlQjAG7wi/0LeMtWtXKMbIwqg==
X-Received: by 2002:a05:6000:4285:b0:42b:41d3:daf8 with SMTP id
 ffacd0b85a97d-42fb44e3d94mr7639612f8f.18.1765685825263; 
 Sat, 13 Dec 2025 20:17:05 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a66614sm20761840f8f.5.2025.12.13.20.17.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 20:17:05 -0800 (PST)
Message-ID: <693e3a41.df0a0220.1999bd.bcd5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 14 Dec 2025 04:17:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765685825; x=1766290625; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oNGjA3L5qcxBuqmzGF1VttED+WOsAt+q05fLDuFOInQ=;
 b=k5Wn/k0zaGLQz6PcsdHi3QwqlMljZ/Ye/I+1rV8/t+AUrzyAkNokN/8N/B8CDzKohr
 Taf1j1/6Cp0dAJaVg1DExl08U8sHysphsT+mfVOt59EvdTmEwSa1qj/1s3/Kw8InZ58f
 GsbA77zwetmhGzQPZ1CvTPKoKimktErJSH+4Y7iz0V9PxMr8bAAY5FIh0h6ZOX9NyL8m
 iE7zVqRSdinRKA5jn0s4mmS9NODYiJvuj8Ac38zSq0r9UP7Xt347AuNaZXO+71I+wcjG
 X0FXX6rXSoZ6TYzzYfi7FFdh1sahpsK1G70JpakjrN8nD2Kr1JP85xl1icGo27ZspPkM
 6eNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k5Wn/k0z
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-13
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

Autobuild statistics for 2025-12-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  1  |  0  |  7  |
  2025.11.x  |  1  |  5  |  0  |  6  |
    master   | 30  | 49  |  0  | 79  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
                   cvs-1.12.13 | 2 
  gobject-introspection-1.84.0 | 2 
                 jasper-2.0.33 | 2 
               linux-pam-1.6.1 | 2 
                   perl-5.40.2 | 2 
                 apache-2.4.66 | 1 
                 c-icap-0.5.10 | 1 
                   cli11-2.3.2 | 1 
          cloudflared-2025.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.3 | 1 
            erofs-utils-1.8.10 | 1 
          esp-hosted-1.0.4.0.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
gli-779b99ac6656e4d30c3b24e... | 1 
glibc-2.42-3-gbc13db7393773... | 1 
          host-binutils-2.45.1 | 1 
              host-json-c-0.18 | 1 
            host-mfgtools-0.02 | 1 
        host-util-linux-2.41.2 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
libcorrect-f5a28c74fba7a997... | 1 
                libcuefile-475 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libnids-1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
                    linux-6.18 | 1 
                 lockdev-1.0.3 | 1 
                     mdadm-4.3 | 1 
                nushell-0.96.1 | 1 
                 open-lldp-1.1 | 1 
                parprouted-0.7 | 1 
                 procs-0.14.10 | 1 
                 rpcbind-1.2.8 | 1 
              shellinabox-2.20 | 1 
               tinyxml-2.6.2_2 | 1 
             tpm-tools-1.3.9.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               zziplib-0.13.74 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/79cd78a27e42fd5a4cb7ae905587bffe6c3b9958 |     
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/fac0553fd3b38c2ac80b246cb123d0f5ba0a2f4a | ORPH
  mips64el   |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/2d70c8e9721b2c6e2f80099fc926a8b47e35bcfd |     
powerpc64le  |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/17dbe6007dc9b23544beccb5389ac1194ffdd354 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0f63bf48e50c8532594fb792f9c6c3a391b7fe33 | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cca6c74a0969371991f0b2079f6fce7a2a1ab2a8 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/308c50647e95b2056544ae81dc7dd196b53dacb7 | ORPH
   arceb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/c35e12a7e20e2b58ca041cbf9b9b00ebb03d22ca | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/6b2fe66c86c255290d16c30261e9885168a0ca24 |     
  riscv32    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/5f36ea0691f5f50d525a93d921f9fe142ed49881 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b807756a703688a6ef0eae0609aae213616f5192 |     
loongarch64  | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/85cc39808ef07a6daea8803f0636b3558ef17027 | ORPH
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/97a464b0188d18a0c17388d673aa5681dcbe289f |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2c3664ef08a40a405e6f54325e93d5dc77991181 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d56cd98aafa6ea9d309252c351ea2e5c1d3efbf1 | ORPH
 powerpc64   |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/7dcad98b784331d0809cee9dfd3b78b56dd8ddf7 |     
   sparc     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/bc86fda836065d576588b42d48a36be6939fe798 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/f7bce6c7443c87bc70fee8ae3fc8e4bf27e73d97 |     
loongarch64  |     host-util-linux-2.41.2     | NOK | https://autobuild.buildroot.org/results/273610b8cc6c6f14a25669b7c8e93eeb8c5beb30 | ORPH
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ff395572ddabfabef2c95a32cfed90cd437eb6ba |     
   xtensa    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/3a621f522e3077fa8bfd70666dcedca68d1be122 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/b8af8c9f2bb3cbec9e6382ebe64de95d7fb02c8c |     
  powerpc    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/f8f1b14bf8da1c0d763840b944865556798385fd |     
   xtensa    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/5e4d6a79edfd8f3555609e18574094c2163a6cc8 |     
   arceb     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/90906ea1673a9058c86fc98c3772bd8c3a8758a7 | ORPH
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/c9dd874d19074c4ae6f7a3b2cb80639b632684db |     
    arm      |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/516d0e48eeef50876ff5cbde373367a758bca9e4 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7065f753e8d6a7ecd74df02d75a2cd792869a071 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4100c85f47006ea2f792f649813336f0574aef40 |     
loongarch64  |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/27cd559223c756a9144e77b19f4a36e07ce262d7 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/381775feba51df699befc5cbb0e2a930476003ef | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/15d999add0571063979005e21b67f99ede38ff1f | ORPH
loongarch64  |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/0dfc47ac5a6f70e78cbd2583f5a5689348d260d8 | ORPH
microblazeel |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/e43e4a6e4aa0fb4da9786c3f420df20a1a63ad98 | ORPH
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/c2992f34695dde3b96d0506e8a0147a95921717e | ORPH
    mips     |         open-lldp-1.1          | NOK | https://autobuild.buildroot.org/results/d1e107f19942ea3fbf23a342cd43cf79af150ef8 |     
   sparc     |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/0a7cbc27cb8a6845429ccce0230126775331748e | ORPH
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a17347febecbd987a887e85b8b1f995f33e341d1 |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7dda3899279221bf2c44a6eb17913546349d4c9f |     
 powerpc64   |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/6b4b3c2b8c775572b5cc1ce4bcbc131c96571c5b |     
microblazeel |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/f75c1c0398a2d345396eccc15cc99f307a4d651c |     
 microblaze  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/41c020a01e762807d368d39942ff8309f416b30a |     
  aarch64    |        tinyxml-2.6.2_2         | NOK | https://autobuild.buildroot.org/results/5fbc4e5a99664154568a4e3437f169b529e0dd09 | ORPH
    sh4      |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/3e3026a9641c026c19f50cd2f5dee04c11c81f61 |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/58ac32bb502694e8651b17713592a6c05f744a32 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1ae4d860fed3b846715d2ca9f7da4278157e340 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/1918bee7a60553d4e2c3d4480fac6a3e2663e8e9 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/2b1dc3841d74156a676c72fd92d05acebbd8e549 |     
    m68k     |        zziplib-0.13.74         | NOK | https://autobuild.buildroot.org/results/578f1eb0f129a9fb5da19f5f33d137250c5b8db9 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

           at-spi2-core-2.58.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                libcurl-8.17.0 | 1 
                  libsvg-0.1.4 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/c5edc1af4cab489db8b61fa27114b6e6640c0e4b |     
  riscv64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/fb87202dc3aae0c45e95cdc6325020b1ef81ee01 | ORPH
    arc      |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/75efcc83cf1456895ff5bfd5c8c82ff47b78403a |     
    arc      |         libcurl-8.17.0         | NOK | https://autobuild.buildroot.org/results/d6ccff0ef786095b52035868cb73b8fbcff2470f |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7734aaa3e5451b3bf20cd48ab8da9ff32ffb8dfe |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   duma-2.5.21 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/5fcfebefdcce46bcde88f6283a10fe4b338508bb | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
