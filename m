Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA097CD98CE
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 03:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C43810F8;
	Thu, 11 Jun 2026 03:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSvmKoeByMbP; Thu, 11 Jun 2026 03:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E522B810FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781148005;
	bh=Wnm5EQQrUDf4bzOvfZHTGyaUakjDnWp7DLMLtEAxlqQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PFr6TaWhPROsiXDkYs4z05ZzXHht4Q9ObCOebq0MmdHzFrTg8N1uoUr6nKGR+1nkC
	 Oh501YHspEcKG1pbcEzkdp2StanB0D7Xdslam6IfduMH+qASwlRuNfw/Qol+P0/ajA
	 50XeTtHtwwsrC9iY0RITBtGoOKZkBAes5Kln8DF+X21JTbZAUcvC6k5/2hpyqIdvEY
	 Q/OrXXo4u/PgDHLfHUQKLZ7kx8TLMjJQQJ3T5Yxy6QgBcI0wWi7XMCiS+UFvqtD35B
	 U7h7/Xp2V9NVj2rnEFwooqWkY98vVMq2tuN/uvwo3CJ9FQhw/eV/HT/VfHaQEdkKeg
	 61ZMnrdnEF4bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E522B810FA;
	Thu, 11 Jun 2026 03:20:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2843112F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE3E4012D
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 03:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0sw1xSNGeFl for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 03:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 277BB40029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 277BB40029
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 277BB40029
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 03:20:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso62073745e9.1
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 20:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781148000; x=1781752800;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oYdEkbOSC6+q1UaEcD6L2mVowf3HHcLeXtmoFQ7PvI=;
 b=MF7fy3F2opIqwMsxNYD3J+yDT5iu62OQuX5RmazWrNFl9XAG8j6doF4Rf+CZxbEt9u
 +8PiNMhllEfXNSch9Yu2VB3qvFDz/nTz48HrFwxR6D50uCvmVJLz9RYbIJB+STz7CLTu
 bBIokZrrF99vMcqC/T0rkswx27h6THbLmDVHSW+HWkrWTVEBKh6u5kK6E1Hlq3Z5C/dL
 OXWNJLkouayj2AMa2n+YKKbmLH4t/zOlQ1ZnTJVUxZ3nxNYhjxUsSOOXmpmjGgQMX/8I
 8fanipETFqx6XBq28ZunNOEUvkn50ckcqz9tM+RBmy9AuSOta0G2AcSiqwi6LWgH0otV
 fxOw==
X-Gm-Message-State: AOJu0YwspsEtAj1N7H6cQS00+i9ClcyD5gJkF4tp6v4pjWLTD8PNdMVa
 oqGwLnmr7Ig3fewlOMzxizvzhBsxAL4Nl/TI55TyXW8JX6sXTp1O+EMa0twOqSMe
X-Gm-Gg: Acq92OEStFnvEPGt/pw+DrJ9hXzRpJslKzcARckYw5iFBGdAJ/csKFeJvCuuuXz3j7C
 lHMDYy/SJbRSLbXJD8fzqMjetVbROZF28vSSDQVMdwn6mvqyjyRkiqrervY2c/qUOWWjyq7IQeT
 K/S6SOc+Eo4cpEX8Ng40MTh4uAzAI0H8N5LjsZ9aMMhaZ7y7UT+RAd7Jl+rKEP2ImXYgY+rPs/Q
 Qcjumkzgb+SDMSqw8Xvvc8CmMWcY5I9iwL9m/CrCbbA6arbdbxH/t5uFaMoF6gbfoZpo3ZsvjQ7
 o4vX30WzK0mD30CQbwCLdNLNvDpmZkEw7thRJDtTpTiP6b/7JFmSwRyb/XIZ98mRO1xtVaO8jU9
 okPiom81LPG6dl5leUhXpbTtbqqmvce5uEe2r/vtlxVsH94T0reDJeH+yQQ8GAJaD3xCsMJKf7F
 e29Gk2rXKRnA5O8faBIIaMK6oSDkIX+Bj1Wv8G
X-Received: by 2002:a05:600c:37c9:b0:490:c2a2:e91e with SMTP id
 5b1f17b1804b1-490e5626f12mr5756685e9.34.1781147999550; 
 Wed, 10 Jun 2026 20:19:59 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e5153feesm12774495e9.0.2026.06.10.20.19.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 20:19:59 -0700 (PDT)
Message-ID: <6a2a295f.5dfca4bd.5cbc7.9b8a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 11 Jun 2026 03:19:59 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781148000; x=1781752800; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7oYdEkbOSC6+q1UaEcD6L2mVowf3HHcLeXtmoFQ7PvI=;
 b=S9D+0MNCbQ8WVoB94DH8TbDpmCN+AmMdpQ2o+mRuKLFWMPGJCax3geQeS3uI99Y7BH
 fHqrC4oXswoeeKmOYvw99/pDXaHgMmiro+rkkWGMfwiHlHYJt5DKtSEYTUNKB+1LvP7e
 Qc/vfaOQF7WYGHuCYuzP9JS5ncKC0+fwSHqxjGUAnu3cDnugR8sle/fox+XOgVAjGfSB
 UyH2fhMspsqmYb73OnzU6DSBX56XaCeEMNHqey/ShumXa5T//cj34IqR6Yltied+Ythz
 x9p12P84OOURgOADQJFrw2SkCDo7CzGuEV1DJMEqaFYtAZqUpwev5JLMY1yrb1uWWqsV
 6g0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=S9D+0MNC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-10
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

Autobuild statistics for 2026-06-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 23  |  0  | 31  |
  2026.02.x  |  9  | 12  |  0  | 21  |
    master   | 47  | 90  |  0  | 137 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-7.0.11 | 4 
                    olsr-0.9.8 | 4 
   openvmtools-11.3.5-18557794 | 4 
                     apr-1.7.6 | 3 
                   guile-3.0.9 | 3 
                   perl-5.42.2 | 3 
                       unknown | 3 
amazon-ecr-credential-helpe... | 2 
                   dante-1.4.4 | 2 
                    flex-2.6.4 | 2 
  gobject-introspection-1.84.0 | 2 
                    grub2-2.14 | 2 
              host-rust-1.96.0 | 2 
            igd2-for-linux-2.2 | 2 
                libglvnd-1.7.0 | 2 
              skalibs-2.14.3.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                  clpeak-1.1.5 | 1 
             dahdi-linux-3.3.0 | 1 
docker-credential-acr-env-0... | 1 
                    dust-1.2.3 | 1 
              erlang-26.2.5.15 | 1 
              execline-2.9.6.1 | 1 
                   fwupd-2.0.4 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
                 gnupg2-2.5.20 | 1 
                   gvfs-1.57.2 | 1 
                 highway-1.3.0 | 1 
host-am335x-pru-package-5f3... | 1 
       host-gcc-initial-16.1.0 | 1 
                host-mpc-1.4.1 | 1 
                  kexec-2.0.32 | 1 
     kvm-unit-tests-2025-06-05 | 1 
      libabseil-cpp-20260107.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.6.2 | 1 
              libsodium-1.0.22 | 1 
               libxmlrpc-r3335 | 1 
          linux-5.10.254-cip72 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
              luabitop-1.0.2-1 | 1 
                     mtd-2.3.1 | 1 
                  ntp-4.2.8p18 | 1 
                openssh-10.3p1 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                  prboom-2.5.0 | 1 
                 rtl_433-25.02 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                  sdl2-2.32.10 | 1 
                 sudo-1.9.17p2 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.58 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.4 | 1 
               valgrind-3.26.0 | 1 
                   wget-1.25.0 | 1 
wilink-bt-firmware-43fca73c... | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0f8e62c21ca78dd497d53b512c78b452ea708c40 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/1ba449438487bdfb31360e4f2391f5b5bce7752a | ORPH
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cfbf15adf7141df7e695b4816b1f7bb19fc30409 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/6ce94da2c2325722c72e215c390840601e2402c2 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c043facb77e298d2beb32a09fbf809792feceefa |     
    i686     |          clpeak-1.1.5          | NOK | https://autobuild.buildroot.org/results/947b6ba23eae1d33832579f476340339385bca58 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6170fd664039a391c5cca8b4484956ed3d76db7e | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3e2cb6a084947f8a207c3e8df102cd88a75f71b7 | ORPH
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7e0e1aa4ed5d7c954909ca20f5ab4c615059a79b | ORPH
    arm      | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/b5f64b53f55f786f60e524e8597aefbb2b827999 | ORPH
   x86_64    |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/a38f08002d6e8a7a122abca82fd80251f5dc497f | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/9d974019718fa010d195f662d4212d6069600131 |     
  mips64el   |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/c6665ac2e99db0ecbacc854fa2891b60f514980e |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e4ea07e52d80a50a6eada3c7ab2d18e19ede6544 | ORPH
    i586     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d3e4d342edeb3a752d48dfc374d26d7ce61484e8 | ORPH
    arc      |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/482c3878bcaebd07964b66f3adcfa6828b019cd6 |     
   mipsel    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/d75af54c3b1cae13c61743a973555d914c63a04b |     
   x86_64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/c4d4b74b3d0e49326af60d1c777bfaa8987755a7 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6a458dcda8ddc8e26e0d775435f92877dc143ccf | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/655a076ae8abece9d6a2051872be8a696ada957f | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/6ab7683a709056a065e027e337e5ff9dd5dd7bec |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/d082dda987493808cffb341be7d476f1836fe6c2 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/5a222368f3236735dde3e0e03a9dacfdb5614313 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/c88616080c9593784a6b6234054b1fdad9ded6ad |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/2d7b22ea3a2351a3c037f458589e5aaa49021fd0 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/6a52698cf8db1ad51c02cd86be6a00a1b4fb33a1 | ORPH
   armeb     |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/bee19bae16572f89318bdfeea19491491938ee79 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/46792d6935aead9c330176591d6ac8a490dae088 |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/4c47636608ff259e5e5c9821a6f8e7c743a8e85c |     
   sparc     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/516536ffa51540e04ce336d44ab41ccaec7c3510 | ORPH
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/e9ab1d8944539fb3b4cca82955ef6a7dc6812016 |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/6cbd28558ba01f5126f0cdc08698ca518cc96af9 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6654c77e7b0ed443e431c8ccdb2b7a619b970c6f |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4e0d0b5981374ccb29f5ba6583cb81dc0f6dcc5c |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/2e12249de8d0ebc06837b7c2f8d9c571382f77dd |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/e7df82a8576fcd3cacd2aaed4a95b49282e4ea5f |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/1c6eb7088012e3abac96bb1712b9eb4b14d68982 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8b12942e5b249d22c4a5ad395574f7bb7f803aa3 |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/cca0137f6a4ecebf094b760caf8d2c6fab87ff8d | ORPH
    mips     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/b16bcee6830066f2687a7f099d9e8bdd37498b7d | ORPH
  powerpc    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/63df67164a6551ee98a6934b35c7d2e0aa5811eb | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/d98b7f1c486ae773ed5f8f0df036056c6426b2c6 | ORPH
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/be66956b9884cb6cb99293040d7d288cbb240f27 |     
    i686     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/6f0aec85e57787da4940ca2f1c2bb90da37ead9c |     
  powerpc    |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/aca5a18f0cccc173c73e0fe78b69ddee36ef90e3 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/bea60c8b218a1fead9abadfa5e4a797329773204 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/298b61c4d5a5062178fcda29ca97fe22268c3e66 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/d8ed8a56e0a0edb7a296b769b1087ac4eabb07a4 | ORPH
loongarch64  |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/b3a4ec41f3e859b05583ef562ceacca7aee90670 | ORPH
   mips64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c1dcaca21d4fc1135949137daf85f93fbe66148d | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/545afb59d02465e1a8654b8759448e3684e58e82 |     
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/fdd70123df5923c967011ead6c10e6b935a199cc |     
   armeb     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/713c106871a1f40c5a03b738f0959f28bd5741ce |     
    hppa     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f8c8dfa2dd07d3bd1220bdbc1369dc4d7a5bccbf |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/3c90dc0e84aa859e3c47a92d98a386bd94ce68cb | ORPH
    mips     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/be4417845c5043ef924216e25ac05fb40ad06bb7 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/834ebb6706ec15e7f60c8fe279e0d9703e6626cd | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/3e023ca0f787b7c32a5c37545fa7c89dbc624cd7 | ORPH
    i586     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/1f2471e9e6e2d947530079537f1fcf6f7f40d153 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f167d556e2437df565a69546f6fc8a0ae0c23846 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/eb48bbc27172ad0c0884feccaca9b03f49558872 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/229bb108089ae9a8c47bf48a017acc1075c8e762 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a6654829b2278dd6b5903478d529b13c26d236ae |     
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/3cd43646d640715036c8075eaa5ac1cd8fa3ad17 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/53e64b52a163599fc3289eb0da43095e5e7c6bac |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/92eeb63f247719ee3dc8811f293a7bddb50c9a8d | ORPH
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/36d106eeedd95da9ceae1ad45ebc43617fe3675e |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a2350a5ac3b074050edb39f5835d74ad5e22af6a |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b3330643400c0f6b0300f1a897f74b9b8b07ced6 |     
  riscv64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/36c5b432b8a0cf013f03e7e0ae8c3408c7930344 | ORPH
   mips64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/a52c753a0596ace195c53b5c420369cbdcb04091 |     
  sparc64    |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/72b0d4f08ba52050a80fc552762ef1b4a23c117b |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/968608bfd41d40ecec3c2cf9544cdcfd1693da3f |     
   sparc     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/657b69a649d78e536cf7681df1212991e161faf5 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/cebaabb80bfdd094783f5ea92724c5085d3fcd13 |     
   sh4eb     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/5b14bebe1d8a9edcf3a1af1a4ec87ba48f57ca31 | ORPH
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/bc503cf0f382e763421baa651043716eae9aa0ee |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f41c8e311915b137b0dccb34d3c7a5390fcbe7ee |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/b28acd347a92f83ecdf8111533a5854ea18dbda4 |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/4d2bfbbcec994574e08cfad9453ae69928861ca5 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/15f3b592a49348dfcf9935056a8d47c67dc59f21 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/76a1a7d9301f7ca6a12190df763a0a0de2541db2 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/cc350de3327a0fa07238dca7d2da0deb019449f7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3d8701aa1fc2d86d37edfced738997aa83441320 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a0007b523f2be8f3055b03bf6fb4f97141e269c5 |     
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/52c6bebd755c1d8ac1a01c38cb3bd92f1c246dc1 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3b5575e634d9ca94259cd77bc39e789df78e6c13 | ORPH
  aarch64    |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/bcb2518036228f5d592088f90e6b021e4727b3e2 |     
    i686     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/dbc2f547267b27cf756a00ab1a83296cf9e55418 | ORPH
    hppa     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/abe7af57890d72b6f0b04f823da0826f8effcd84 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   perl-5.42.2 | 2 
                       unknown | 2 
                bpftool-v7.5.0 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
            host-go-src-1.26.3 | 1 
                 libiconv-1.18 | 1 
            libxkbcommon-1.9.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                    szip-2.1.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/20e36ce9b7fed66caa2df59a42e5a717af08c91a |     
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/115e92a20077cceefc98da934e3c9d98491f4b6a |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/31ba46e998aafc47a2d37b80e72669adcf04d0d3 | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/f0a547ac6317a1178562f1f1878f859d2cefb052 |     
  mips64el   |         libiconv-1.18          | NOK | https://autobuild.buildroot.org/results/6bb9f111f7e2e7b3c0dcae941b30ae554c80a660 | ORPH
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/fd8ac19afb1c0c16f96f84cad9012271b7f17b8a |     
    i686     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/bdc724f68d79e89e6fb0ad520f262bb585dac592 | ORPH
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/40b3e8db3a94dc084124b70b19b01fe94806d4a9 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/710c87b5886c75dc96043eb22227bb6a9ec1204f |     
   x86_64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/132e1e7b9015faa0926d66df737c80e6378b600b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a1be97c46ea379d4968f385cf590b5fed5f6e912 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5ebbe506447c512c36a9556c620e96e81145ebc2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

     libphidget-2.1.9.20190409 | 2 
        ltp-testsuite-20250130 | 2 
                memtest86-7.20 | 2 
                   perl-5.40.4 | 2 
                       unknown | 2 
                  bcusdk-0.0.5 | 1 
                bpftool-v7.1.0 | 1 
          cryptodev-linux-1.13 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.5 | 1 
                 fwts-25.03.00 | 1 
                  iozone-3.508 | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                   linux-tools | 1 
package/wine/wine.mk:347: w... | 1 
vexpress-firmware-901f81977... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/edb6053af7bf60f82a6a92ea03a4b43ab0756c5d |     
    i686     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/e95bebb33adcbb8a45cfe724ea43f90ba4a41611 |     
    i686     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c10157d22283b0e56dcadbfa0fd300ef2afd6d8e | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/f71483d1e4b2576cc1ab8018d4961991739a97d3 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e0e24c19549aa83562f6689fdc4114216d164694 |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/2a645d6e65e1f2f01b4e25b7e48d5a3d3af821cf | ORPH
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b9adb64fcc8c28c0ed5d7c925d3b037db6a43b0e |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/c2085922822b9983606dea08cc88cbd151319f75 |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/57d97e7e6d82c5d31b48bdfdc2c26bff20132922 |     
  riscv64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9fc110b212480089c8d1aa9aa5dccae097498772 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5172755511d6c3fe181892f73290076b9414c989 |     
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/f9cb15cb28585950334c8cc4473b431e41eeb7be |     
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5fba520fb9905941526131568017d8266dfbb229 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/93f848697d83088c28d62cef985d217c8db4e543 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a66df813c5f042e4545363d238faf82bfc493a4f |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2f3f9936ac14a00dd99625f37f441ed7eed958fc |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/bee5c971a0b4c861a4b96b2ca496057ac8cf5431 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/f25ab6c37123d37d7362761087513f142b02b0cc |     
    i686     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/c7748fe12a3501d94b3ebdbf75f2dba913ea272d |     
    i686     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/7f0da47eb4617d72b0359cd245307c9ce95a6a37 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/785c5913d979ca34d43e1f8e5e1d268ef672eeb5 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/bc4d11cf3303002ba127be0a63db5bb3bd74346d |     
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/08c3570af1c26752380d012b8fd936e64c35eca3 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
