Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FC6D43369
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 04:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A5482430;
	Fri, 12 Dec 2025 04:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMQ8_otJANsX; Fri, 12 Dec 2025 04:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78040824DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765513745;
	bh=20RUVhdC4hZti4DyasNt3W/edEOW6Jx/Rn0i05KZA48=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RNfqQrl8/fuLJaygRmzjCAvh9xTR2PITGCA4rLodbVnJ1EQZEu5GsszmV7GMh4dU9
	 dwfMupcuat57t0bch6rE2tIzHiRk1RLWKA6q1SZJMrqQO7TvOlhe57ahtC8CkQxdcN
	 emY0kW2oh75W4EP7DfK8iVWGKUk6KXaF6rnZEy3/D8mJgdYSAssB3BZY7eUH9YmF7Q
	 Yu/oa20eOvSB1X0POUVvBixLJj6xNGvc0xncWYNVkR3baQvfeR5OdOiBJ107PtswCv
	 Z7WKvCC+2Ya9rCBk4xSqJNcfy5Mb85Z2u2/MafEjW0HCrlaskWizTcyYNiSswn9eJP
	 xGsADwo+tT34w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78040824DF;
	Fri, 12 Dec 2025 04:29:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46E732C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 04:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E3E340909
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 04:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dwvgVek0zd7 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 04:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD3CA406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD3CA406B1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD3CA406B1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 04:29:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso3651335e9.2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 20:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765513740; x=1766118540;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6+oDwANJ3tuEFc+jlmB4M+lXkX2qV9wOqkEGrwvkfM=;
 b=Y4tkfS8YlkrLJIh/ii38QUvEjWT8QmN3Ew6wPKSD51t+g+vrhP/Asy2oMeCA3VPIQz
 QXR69MTPWHyGwuiOgA7ehFg86aArCAayUsd3E793C0yLoxzjI/q9NZzj3i/Uy3vto0D1
 2Qspdv0M5nHh54iSFvETuW03cohQRld5MEk8OxVVMbclXIMMX6d3/MicsPgIEcFql+xf
 T4CViPS/VssZXR0HyWbQSjYqHDh9UWNBPhj3OhsoXjidxWsyVAl0+IWi986cNZJq5Gl1
 Jc7GB0xFqAnSvw1olxTSOWYLtPaT/WysS1hQDgYqMkpINDKcR7grt6FGIorA+qQRhk/+
 wbfQ==
X-Gm-Message-State: AOJu0YyopKTemkoYh512F8VquaX+r6fEARFCziyxCMdKxWek3VsAxHkd
 QEsphTLJfVuFbbLZRDpS+Fc+IY5vwUtOvFUsYLVKLZSAQg7xWGxWk4PI6pWJHg==
X-Gm-Gg: AY/fxX7PpKmfREobZZ1YUkc2nkWVMq6CE3n4/mGq+sPrr+ji21FsgvWA7c/XSsrxB/j
 Zgv2ZE2EVWlwUStJpra5c7p9Aour1pcaNIph8kQLB4d8teGWJuc6wVrAcHvTGx5SQjN26uOr75j
 58KooVO3g4ch9fzNMx4vI6zF9OJUea8Dq6cIF4Rd2p8uMf2VpSbE6IIAfH9HlYMg/FtsbT5TPcm
 YqgpFvST7CsJNJyVtG7tJHInQsj3yml/DVy4E80cpyghaSG8DjVQ3uct2MhkdphX+rULgEf6Z3X
 gDW/jTnXdY1DSeNpBdnxEQtiuDmvs9zrO4/9B+6bTwAl/xz8TBFuVe6jZr381aDsKbUgAN388BX
 a4p2P+jiRE6qvq5uKX34IFB6yH+NaP28cvLtzzsm7eKpKFtaQBQf0d0vsT3tLlahBv1XarsKYcO
 3j0vWqYKl6FNoDZcP2xg==
X-Google-Smtp-Source: AGHT+IHTXlkHoJiVbgxe0XkK2j1FvKv1DJn5PLjx3H1MftLdhpppHzBeEpicgvu+oTaUX6ZThBlsfQ==
X-Received: by 2002:a05:600c:5294:b0:479:3a86:dc1f with SMTP id
 5b1f17b1804b1-47a8f91dab0mr4614135e9.37.1765513739343; 
 Thu, 11 Dec 2025 20:28:59 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f39ed88sm11404355e9.4.2025.12.11.20.28.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 20:28:59 -0800 (PST)
Message-ID: <693b9a0b.050a0220.3716c7.363d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 12 Dec 2025 04:28:59 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765513740; x=1766118540; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=d6+oDwANJ3tuEFc+jlmB4M+lXkX2qV9wOqkEGrwvkfM=;
 b=eapx8hkv/DwIU55wgMzFKR6lO5Vdrxag2xtIoCrlrc0cZwhbtRpQXAqoJnDVL4XVyc
 erQ2OcMKCIaS2QytwnGAdqKYggS9915i7toXOnyHQWvISiKGl/tmHhYBvsZtZgSvNvS6
 uX6rpUwgvZ63gzVEwkg5jByZfUbjlaOalS8pk6NDOkgPAaza4QnfSoSz/zk7sz611jRf
 Lfj3P/BykTsSPiM2H1CU4johlhwbgQ/maA8fwCNHYjQCtlCRVW2DKmtJ0jyndZiimNkG
 9xc/0E7YahwSnbYa8cxiIYJ3QS1G3GZ6+Omosf5aAIXVVC1BFCvFZB3yrvC3Mhy4FEY6
 9+fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eapx8hkv
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-11
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

Autobuild statistics for 2025-12-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  9  |  0  | 13  |
  2025.05.x  |  4  |  1  |  0  |  5  |
  2025.08.x  |  0  |  5  |  0  |  5  |
    master   | 36  | 64  |  1  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 4 
                    mpir-3.0.0 | 4 
                       unknown | 4 
              libopenssl-3.6.0 | 3 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
                 mbedtls-3.6.5 | 2 
                apr-util-1.6.3 | 1 
             batman-adv-2025.4 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.8 | 1 
                busybox-1.37.0 | 1 
                 c-icap-0.5.10 | 1 
           crucible-2025.05.28 | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.3 | 1 
          esp-hosted-1.0.4.0.0 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-4.0.9 | 1 
                    gcr-3.40.0 | 1 
                    grub2-2.12 | 1 
              host-llvm-21.1.6 | 1 
              host-pcre2-10.47 | 1 
               host-runc-1.3.0 | 1 
                  iozone-3.508 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libglvnd-1.7.0 | 1 
             libstrophe-0.13.1 | 1 
                  libsvg-0.1.4 | 1 
              libzenoh-c-1.2.1 | 1 
                    linux-6.18 | 1 
                   lsof-4.99.4 | 1 
                          musl | 1 
                netdata-1.37.1 | 1 
               nfs-utils-2.8.4 | 1 
           oath-toolkit-2.6.12 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
               python3-3.13.11 | 1 
                ripgrep-14.1.1 | 1 
                 rpcbind-1.2.8 | 1 
          sane-airscan-0.99.33 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                    szip-2.1.1 | 1 
               trousers-0.3.15 | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/e1cc56502fcdfa9b7c4385640ba067e9999cad9b |     
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/81361a1961318d5696e50a875b9a242abecb7081 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0765cc9cf39da3fa1032fd79ef3ee9d8b0f66bc5 | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/eedea4c939be15638078c61744eb82f82db864c9 |     
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/1f3d6231854dcd4fa594e48227a0cbea6e54c5c8 | ORPH
 microblaze  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/53497ae5995084783011fe4d0e55c7195369484c | ORPH
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/c685cebd2ff84baa4d47ab3b614ec62d88814a43 |     
  mips64el   |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/746ff6e3a521d2f321b50538d0526de55b50a77b |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2f535bf2e7ded2df26c5352ea8c03d0941b9ad4f | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fa965f2e9e373eb4a57f691387c5bf9ee6976d11 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/989b39d1cfe1c8c6cb1797711bf800c9204e78ef | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4763fa76f6e7101abef700f4d674c4f1e0ba34a7 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4df35c9cf2c8b1bf009413a6b825d59a56784bfe | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2d53d994f50b22557e8ecc81ce46e34c656d3e08 | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/da641a36ce3c23af0349e4d6f84b5bbd3a352096 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/ac76f0fc5f19456d9d8c6ca16c12039b11deab7e | ORPH
   armeb     |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/675838317ce26afefd25dcfa0094719ae3a2dce6 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/36ab35a9461fcc2f710ef5edeb944e3446cad4e4 | ORPH
    mips     |        fluent-bit-4.0.9        | NOK | https://autobuild.buildroot.org/results/be4a93c89d666047bacf94c3da974b2a43cff453 |     
   armeb     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/d9796324210019beeedabeb5a585e831ca2e4149 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/661d018b55bb760a44326b69f88fde5ba6fbd727 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/27bd091271cfbaa4d658003922615598285840b0 |     
  riscv64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e411dce4442497a301691de37891dffbb5107658 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/37f1c6f2a760167637f45d305dee9370a04be0b0 | ORPH
    arm      |           grub2-2.12           | NOK | https://autobuild.buildroot.org/results/f040c4764fe054222f98a072a52c5a78acfe209f |     
   x86_64    |        host-llvm-21.1.6        | NOK | https://autobuild.buildroot.org/results/3c16da7d793d87857c050e2b848ffdb7f9254c6f |     
    or1k     |        host-pcre2-10.47        | NOK | https://autobuild.buildroot.org/results/20d802fb3e29f9fd3dccbcd27165ec6a16018984 | ORPH
    m68k     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/4d137adc7d6911431127d79e0cb2988b2607b933 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0bc623affab3e76e8b53ea184887949ec903d2da |     
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b971df4a5bf6fc91f8eda5a47bda7f9f60de47b7 |     
   mipsel    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/00ee59c8c3ad4ff056ac721fe4cd805c4b0de92c | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/116aeaf853861485ab32ff3f7505bacbd3fe7fae | ORPH
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/8de92e7f254ddee61ee0edeb9598a77635a8098a | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/b768be74b5a5bce84b0172091f3f8720279f1028 | ORPH
    i686     |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/c3e15fa286908dacfa6c48e760cbe20cf2c2cb8b |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f3c2df954bb443a6b7e2b7a91a3ea47a7cc9b61b |     
   x86_64    |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/fb4d5917dc11b14bd00ea504385410ad7eebfb0b |     
  mips64el   |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/3912583ebb02b62120f41f3373d8d3e9650ce1a4 | ORPH
    or1k     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/3748484ead6575ae720fb1b6cd307f2b63e936f5 | ORPH
  aarch64    |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/46bb79bfd3fc34324108f747bd6a57b546d1cc2e |     
loongarch64  |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/5dd30f33a4f3cd161363c6fe7ea5a6c75092a41a |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f311bb468197b5b7d3ff678f9a7929cef1039a7f |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a4fa570e6b6a933fc6a765df2da4bed1034424de |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f3808de2dfba5c85e6d18458f0c3a69a0ad8e9fd |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bbc177e68d1a51b9c57fbefc4a30c9d9221081c2 |     
   mips64    |              musl              | TIM | https://autobuild.buildroot.org/results/a802eba1f484ce9bf1045217fe9e79ffb6de3da7 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7cb977591f5bc53c28588235661dde579412f37d |     
  powerpc    |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57 |     
  aarch64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/5048deec912fedfafa14e6c50a9d2fa4b0310d20 |     
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/eba396d2ea39e4c2cfda7870f8fdc951d7df336c | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/645a0b8767ed6f8f5c311f4cecfd8152a9cf3968 |     
    sh4a     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/aca1812415ee84eef223b0fdff88f31a39775294 |     
  aarch64    |         ripgrep-14.1.1         | NOK | https://autobuild.buildroot.org/results/e019c55a27cb8868078c81464ace332922648d84 |     
   mips64    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482 |     
    mips     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/f026827fbb8ac38d4a760a452f6b28f8aaa08030 |     
    sh4      |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/8189ef5ba10aff522dd83b78aa65c871e141cf43 | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/54d75c827c7c0311a0edf9f8d04cfa663424f2e4 |     
 aarch64_be  |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/62327b1473805d2d0f000bddab5f978c76396a50 |     
   mipsel    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/3dc0ad831b8a07a0c15b0ca3a818f99b1cd9e4fe |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/677cd627f00da543284ae392e5bca1554162f334 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/2a26ff793807149974e21b1b9c62c003aac4ad12 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8443e956b051aad3db9bc1fa6866ad507beda190 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b56b50f1f33d60b0ced088df306af87680743346 |     
    arm      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/85269d73df055012513a49f6b66607ecdfe1d9e1 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/34b1f733fdfb5c5e30e631576f875398435ad115 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 1 
     libphidget-2.1.9.20190409 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 netsnmp-5.9.4 | 1 
                     pound-4.8 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/73a63a64ca03312cc6f3c090442a9d29436b3a07 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/91b6c6c129893682c642e3c225ba67418524d476 |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4d6d8935e7b1052ad53e0869ffbb2190c68f388d | ORPH
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/08d2aa7b6f2b017a28cf318a659fdccb9b27f8bc | ORPH
microblazeel |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/d52d842667ae505113b9749455790debb92e76f9 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  binutils-arc-2023.09-release | 1 
             cni-plugins-1.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
gemmlowp-16e8662c34917be006... | 1 
                 gerbera-2.4.1 | 1 
host-binutils-arc-2023.09-r... | 1 
libuci-f3fc0b76040685829191... | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/827708f47176368aac6439692c6e43ff6f2a0487 |     
   x86_64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/58c6aa211152445da2eef362f74f965e76886f67 |     
   arceb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3db9c4c04f8487680359cbfa5294b42d5f1e3ddf | ORPH
  riscv64    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/a1c23fe2e43cc40c1b2ac79e62fff739bd55b0c6 |     
   s390x     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/c231152b77a359182dfec4cc0b2844e62589dac3 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/057ce8d9a4b86970954f8cbbc91c9f14d22ae87b |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/65ba0919dd574bbb63ba607743913b1c8da01ff1 |     
    or1k     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c833e1d258ba114f58fea0c139fd913befa5cea5 |     
   arceb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/10e7029d1bf2b8d26f12a6666e2ec2bcd193fda1 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                openssh-10.0p1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/e105d0b430484700d79884f2d639fe2c4af78c53 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
