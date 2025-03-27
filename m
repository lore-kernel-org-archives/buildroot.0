Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F5C36002
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 04:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D297C417C6;
	Thu, 27 Mar 2025 04:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDZNxtZk11UB; Thu, 27 Mar 2025 04:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A514143E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A514143E;
	Thu, 27 Mar 2025 04:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9659219A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 04:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F62C84780
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 04:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sDuyWuj3syj for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 04:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31B6A8471C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B6A8471C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31B6A8471C
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 04:14:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so76569566b.0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 21:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743048889; x=1743653689;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WlVihE/H/3VilLjg0ilI7f0K6ZJVfycR0I2LVlnNGn8=;
 b=gqVt+G4I4RUHfTwYUtNAOa977jStXlf0bfbjox/SfAtGxyUFtHzbhQd8lTdOc81ybh
 bjZljIqC3a9204Ay3UGJg/PNgyr7449U4GAyCD1JV1sEI25v1555cr8lu8xmpqt/xhi/
 s/VcbTmdaq+SGsMROyL7WIsqBeY2nv4LmhSM7C2lAPy2ZYQDsUtaSIl5PZPZgtTs8Jms
 urraRuO10HmSugK2cECBIkxuOWRtEH1JT3rmRV42/rhMvE7zqNhBdgH3N64rBOYDQ+Cw
 DG8HLnolQL53+oiUuHMhTBrlZ7A+iB7CLHukSMyiIztB8q2Ic8I+IqfJkqMUQoJY8vIa
 oIvg==
X-Gm-Message-State: AOJu0YzFN6+V+0+iGwYRhjzHUgtSyQ78jkQ7qCFKwVqLi49SSv40D5Tt
 V8eyLR6C+wjKgHNlLf4oPrUkUO2kg9w3/1F5g+x8IuIcJQNCIW63A3QIjQ==
X-Gm-Gg: ASbGncs2mXBclj4E28i3fXSuN6hu331tlFt0fwiSz1Iz7nuzGrgjVAzCV7bVSNmiWZE
 r0mEgjU7zm2NgqgVWh1BIHOluKHi+ErSbRw7JeuNL5y0DPxz7pX6jeDX5qEjEQFEsgi7cP3q8dz
 P8CWvUp+rQigNKwgmJh+jvl6DOWgS8GHIht1JNjyHiY1YpD/8o4wAz8fSmrTL1wAhDaib/qVZG0
 mM9EyJ4JIOaGkwXtHhbmgiIyE8sRZsUSRvh0ayJcngRxM7KV4xa8ytNpBh6ivSvinQuewzhGXib
 uDP7VjN96G6P3OaS1QNRkd9mSolnre6vvji2wWe8hdkLWZ9c
X-Google-Smtp-Source: AGHT+IHvKgcez4LPES9cpvMWB85jnodM7j9lnlgBd3r130PKW6nEGkAtZxfUTW1TWGh/MPezZ47Lxg==
X-Received: by 2002:a17:906:f588:b0:ac3:ad7b:5618 with SMTP id
 a640c23a62f3a-ac6fae44e59mr172286766b.3.1743048887890; 
 Wed, 26 Mar 2025 21:14:47 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccfaeeb1sm10318268a12.35.2025.03.26.21.14.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 21:14:47 -0700 (PDT)
Message-ID: <67e4d0b7.a70a0220.388c78.134c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 27 Mar 2025 04:14:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743048889; x=1743653689; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WlVihE/H/3VilLjg0ilI7f0K6ZJVfycR0I2LVlnNGn8=;
 b=iatffwJSpCv+QrIhpnvHPk1S3WdbN5Ga9ndbo1VKBuEcXubaWzLCmwdkefewOGd0BS
 50xnau4ZB9N5ke8ia/WvHM4/FXJDiNSWLJTLnWLC8E4UO2RhR44X+OLWXT08YwPTyMu2
 om8BIqYqmqTm62rwPDciAbixgyyc0QqPEgiWII8pqm7SND/1zVeSWIhM+j0bdkN2LMCm
 /IZOk9AhpUj8e6ILwxCcbQ9YAplWDwPx2fUIN2KcRlnCitig6jhYzY+Nr53QnvJtCJQ/
 nmYLPButaLSREaQ9YlLc3DO+PmW46TYu+IWGYe5FhMTX7BEXTiPJ8vWnJzy38BDBIve8
 Tiiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iatffwJS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-26
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

Autobuild statistics for 2025-03-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  5  |  0  |  5  |
  2024.11.x  |  2  |  5  |  0  |  7  |
    master   | 14  | 832 |  0  | 846 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 494
 host-binutils-bare-metal-2.44 | 57
         host-libopenssl-3.4.1 | 35
          host-binutils-2.43.1 | 33
       host-gcc-initial-13.3.0 | 32
    host-gcc-bare-metal-14.2.0 | 27
     host-ncurses-6.4-20230603 | 20
            host-fakeroot-1.36 | 18
                       unknown | 17
                host-m4-1.4.19 | 15
               host-flex-2.6.4 | 12
            host-ccache-4.11.2 | 9 
           host-python3-3.13.2 | 7 
        host-util-linux-2.40.2 | 6 
               host-attr-2.5.2 | 5 
            host-binutils-2.42 | 5 
            host-binutils-2.44 | 3 
             host-libffi-3.4.6 | 3 
                 host-tar-1.35 | 3 
              host-bison-3.8.2 | 2 
                host-gmp-6.3.0 | 2 
                 host-xz-5.6.4 | 2 
             parsec-tool-0.7.0 | 2 
          aardvark-dns-v1.14.0 | 1 
                  bcusdk-0.0.5 | 1 
                  dlib-19.24.6 | 1 
                    dust-0.9.0 | 1 
                  ffmpeg-6.1.2 | 1 
  gobject-introspection-1.82.0 | 1 
       host-gcc-initial-12.4.0 | 1 
                 host-gdb-16.1 | 1 
                 host-isl-0.26 | 1 
              host-libcap-2.73 | 1 
             host-libsepol-3.7 | 1 
    host-mender-artifact-4.0.0 | 1 
            host-pkgconf-2.3.0 | 1 
               host-zstd-1.5.7 | 1 
                libesmtp-1.1.0 | 1 
                  libsepol-3.7 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                  ntpsec-1.2.3 | 1 
               openblas-0.3.29 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.7 | 1 
                 samba4-4.21.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/6879be6adc5a3c4dd8a70c788e3acb082beb3174 | ORPH
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/72dda1e22807f9bfc7b629bb8ebebe4a80f5f690 |     
 microblaze  |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/aa685a6a67d053a6e2255b84b3f70c87878925eb |     
  aarch64    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/a62097033aebc5bda1a92a19f75ec7a8795c4dfe | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f31837337a35c01397296a906d598ff2a7de7a7b |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/15a317c5db397b697ecc73ebbcc21f6977d2670c | ORPH
 powerpc64   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/603a9edf9fb01644e3d6f75c4bd769588a2f7f51 |     
   armeb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/6a1714fe16bf792a3d3318cf2d9ee21b50898ea3 |     
   mipsel    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/c54c7b8515d7e6b5d4814d8b2ec8d5ea060138d4 |     
   sh4eb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/f6378505fa80c3e42a749ce52cd4ca611bfae785 |     
  riscv64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/40d5a1de286912d1a9af2a023afc61c5f9f25100 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/239374a7f76f309e4eedf289546c1835fa2c016d |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3632e246f3e996e989a3c2cb2170519f665e1a71 |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/dfe66b8b2d7a7f4f646ca78b80ac55d556f35bd0 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c8b5fa6d19f64360fc7f5666cc4b39e9b4741169 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/19b1f22dad1a8b94491d08458ec2ed869e0aacd7 |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5d566ebaab22d094346e1045e15fa47e71685751 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da84b6d6bb066dd3bded28c7c01ecb04d203a9b0 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cc1fc4eddd4d5879b76af2ecc8e165716bafcbc8 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/28ff8d6d8cfcabf4d2bdc6ec882018812149f09b |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8a70da8eb68603228305ce33f5ce4fd3a6a4c3fc |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cf972b861d41c7c2bf983e8dadd3cd1bb82c6c07 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c1c797e7d8dde940ba9048dda70abb2bfe619706 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9e2f2760573b9a2934bf70e8ac4f253712ee4a16 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d249b8c96506ea24b5904e70e387176e960c77a |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dc0e09bbee2fb930acebf70674ab105415489ae4 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f1ce4dc8bdbc620dec0962f075ac761f9b7bbf40 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4351c38889614757c2c5405f2a6c4ef510fedd68 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/263618ff060bfc66810d697091a3d3bdf39be909 |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/248ebdef505309ff00e6eeb1f8a5a35df6fdb475 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fc52b6d086e289cec70b11f3bdb4485a1aa84042 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb17205b6de0ea069cace6fdaaf25aa50ec1356d |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eb7bb501e584a3d5d25dbceafba821a34afb6c89 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9ff2944d426b2a2776f66ce001da2d39a413982 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fa3e330055a0d1a6b4edb118eec3886af4656d7e |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b2e0d7ff419ec77e897d8473953433e7e114fbd9 |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b903371a15db4d3bf308632c4a7115b7b5f33037 |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6d8dfa99f588c5466dbf9b2b1a61f320f0325ad2 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3f9c8efe8b2e3d05213ae60bdad1b0223498bdbd |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1f5aa3fe84335597ecaa6b9a224e3cdf0aea0edd |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ddcba3c5009988b14d46329abc2de41be8a59f07 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/792a302c1e427389fe221aacced047def16dc2c0 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b06e8194c1f2349e8f564f0cb4de70d90a5f649e |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da4aa6bdfc350ca452afb006c63c84f8f9e3ef48 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a60eef6e12d6ba341abd3e48308a4bdc8bd72c8c |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0fbc30a0a3fa1178fad01b1d0ca00f427c683faa |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/57b3363d377a59ab9d4933cddfba2e5bf31f3c51 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/92c06f204cd378f0e3dd626fdcf77d6703689223 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/29b9e5c0016ee8155dd79300d65c4443a9e0e839 |     
   s390x     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/10f3374eec0a623a1650f076463e094729b9492c |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/05e3b550ef8c61e451fa7c907ad862ba07863de2 |     
    sh4a     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/1c767c35d6893097a85b62ce96364cc1ef21a7a1 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3b6b25b63243b60641fcf986e11c1946541cef86 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/05b66f4b90797643e23145af038df9c1d5c49dba |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/edec65131956a374f68dc4d00562a914d2e2fc31 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cbc11eccf3ea61df32673e73ed6d01d3ce1d9070 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2867d6b70b7a262c0cca4d4bda4953e49ced29af |     
  riscv32    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/798c2ee9cab0802955aa23cfb77355b47cfdb83f |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8c711c2a926ac6489f34d2249322dd70220c844f |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/821534577b4bc8d6d289bf0afc5d211019263fd5 |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ee2327e622a7e32340bd54d26d72a080fba78447 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e38d3183502304f34f892cb18b14f5f4fcc1d8e5 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4a8bb8fd007ef04e4c0053abac7f4c3081453edb |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/5c2b78bfc6fa489e695fd0af356d3b500e64f137 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4de963224ca1588dfaf301c86de81ff1029b0c41 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2cc21b01604f802d317731066f2c1c2bc3c0aaea |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4393fc8aea4fbb45607c9988fe3a05c61a662664 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f642006a137c70c907b622449e85aa4ecf72b5db |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9f9d37462e6d2c95a4209c41f5c8ca2deac34018 |     
 microblaze  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3df3004c0bc74514363c91236b8b45ad9b503993 |     
    sh4      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/719564a05a006a212e87d57f7d2b704c9f1eafc5 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7f0b9117a7a69e78af1182f5a431d71dcb8ec243 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1dbcf5fbde1d4dc33db36722b13f7f757bec5863 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d7e3b5d88eb4d09f29ca64d6f17143009e00bdd2 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e2fe7207afe17588047e8ed53cbed940f880f6a6 |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/104d3dcc0944d39b25b44a104f4416f26bd56160 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2c219bbdf4282e3f5eec66e86eba882537eb3dd2 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ad8bb00a33a24736aedd26a74586eaa1dc912bb5 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0b1a0717d54deda9bda133b3ae36dc7dd0c0c4e9 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2076a7019dc039dacb4a590972ab5a6fc85ab656 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ccbcd584c42b95a46a7b04dac0ad8c99d4162fea |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0d8525a49c03274fc0f2bea3e7debdf14f661339 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2311195efd3614f9b494a5bce5a18617ced13ec7 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b13f9774c8d25326b67f90b3d3002420d3f633f5 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/235e76d0056c8fb807d2937506f1160acd2e791d |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/634c2d84b65240b1c04e918162a32314570e3b85 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a2cf07145e281b33bc61f2cde114cf602095ccb5 |     
    sh4a     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/938de4fd2aa4bcc0e4db8d81672dd78358e5621f |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6cca0b2a6ad0955f9366890f16c72f64526386e4 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a6f64536523ffd121bf5bcc7bff8f96ca7514f88 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a2c252b3ba2b14acd1ff6a653edbb0e7eaa85193 |     
   sh4aeb    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7d1039e10a34849554bc4e2fad8f1a7e4a6a44cd |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/887a3a8e3c74a0b3605e70ddc5bf674c2cd0bf9a |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2353b7e09d4d53cd6c83b6636cc84e2da3c5e376 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cc9453494bf52e7817069d702e3a59186f2a511d |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0d30efedc474b31db2d0318e36c596744647b2f7 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/fa8636d99745911643db3aa85a3a6e97606b1166 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/85341bee15408d9c43c02255726c2259044adf80 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/85add7cb3f8abb6690fe8fafb22f964f96042dce |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c9ccc1987870b7630014bd08e93d69ef7a9b0c70 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ace36c5af229849bb4285c6219c4f3db8fcc9a67 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7161f8170e30c3e0060fa5d2d15726833b4283cd |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/acf8683397438f532de962e420b68d800d4666f2 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4d62cd4b7b803372352b1d8452aa5b1eafe8802d |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0af97157de419f8429251ce6120b314d6a53a39c |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/34ea5c66838e4951eeee307163bc0afaaa34db1e |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/75dd6e4b928812b850d0954f23c27f41d917984f |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/967b14a8816881d74e48f52eab10fb74a70a2a09 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/457f62dd14d34248a3f8c8969a6ea11bd88de642 |     
  mips64el   |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/5cd38a6d928b93dcfa8ab20f7e35ba1804209860 | ORPH
    or1k     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/b57f2ab39ec8fa6a857e914a888ebe38cee8b7c6 | ORPH
 microblaze  |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/09c3fe3377d300928e0f6017f611be1d338b8d86 | ORPH
microblazeel |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/53290129bef98be0ab9626c825fc5ae7a48305c6 | ORPH
    sh4a     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/7004fd8f19ebdefdd6166c743bdf13f086999048 | ORPH
 microblaze  |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/e23d86c2b1a5faf03a3e873e39e17080dd30accf | ORPH
   xtensa    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/aceac49b42a8711e34bc3c8339fb994f920ed157 | ORPH
    i686     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/d8c741e53648bd8dad4f508af23d5bb7c2cdcd42 | ORPH
   arceb     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/dea772952b748c72e5cebdb4025d6adf13bdd2e6 | ORPH
   sh4aeb    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/92c5ec602cee0f97a3a680f659b359a723057ee0 | ORPH
   xtensa    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/faf5c124832ceff580ba5aced006bd65763b8d0f | ORPH
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3bca28f55c4ff3844ae765ef9b154237f31d567 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c1f0fa17d4c7df8c10f9d780d71dfda0976b2c34 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce2078dbab5317a0000a075c757b048ee72ea433 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb49764da4eb0eebc2762d938b45eb6cd38a6195 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e06bd81c070dcde44e954ed5b2d1d6199ef59fe1 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2903f89a6bc817ea8750baacc3a2f544ae0dda8d |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a716d26d422f412801d4ab61ee5fdb85f7f3442 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ee40efbe3c42c133c456b2b1034b9b68e37e941 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4582f87456f689740fec9589e0bb3442ceb2a374 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4f8602a9f5da9bc4b4dafffdb75b115a8d5c379 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6e5136d5b90dbecec40e3ead17a2c2c92d197d56 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/df40d540938eed08fb104e3016646b93bb078e19 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b72182ed4d9011f12f6552179065ac1c6cdca63 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25cc22459f4636e58ecfbde8365bf18a9e43d59c |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/87da128a3ea192b7f3cbbcf9cb510cc27ec16802 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f1af725bf5771c46c6c9e7af348f449a3c5254b7 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a842a1bb5bdbdd5204dcdca78b3c2e84aadbbdff |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c1e8257914e48966e58cca2c516eccd5286fd5bb |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/452c3dc70096d8d6cdf9962dd4d3ab9fd37a2f92 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dfbf99f6f2cf054daa0160d53a8a53f6e647887c |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4cdc8fde451ab85abac9175974da86b6c2ba9b21 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f3d0b7e87856bf63b55e0bade1793f6c56a17465 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a0ebd508b60c05a163b374710a31fc5eb1aaf3f5 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/917243c3ce22b675c748216a2c35b5b280d921a4 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79d4eb01a2b9b52bf4dc618d601d61e0f6245a69 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8e511e537c4c5bfe9eaa5fe980c91796a18cf979 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fa71e1521d3b9687663817e49670fa484efc0c99 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4170ecc05cf42bf8c9f92af6a7384bdaececeade |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ca2a8c4ad7872df8f04ce448c85cd1f3ffaecfd4 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c9b4c481cab3a41d7da295826153fbe27c7f79a6 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cee9b471faba5f28960c96ce83a520c0de109f45 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0a738b00ed3ca19a3c99844d3af09e148d49341c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0bc95670875316420b7ae0c44ff26bac6374e6c4 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/42d889f4c241661687e9d9228dae24de15dd93cf |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c165f70468b6d55f2873fb162cbf561804757ebf |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e4a9e785f892ee10c6311955aa5efe9e8321de81 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/32e63176af90d196498b52b83e2c4204a83a1af5 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/18c809af6f0a495116b378b49cf2ed231f5986c3 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f078b7ee3386aeeec987f24052c9ddc7a228234a |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf909447cc92d19bf61ed5e2a56453b884fafb1d |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b575750f043de609de28484bfd566d960342b7f0 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e085d8a6067908ffcebc30198053929472ab4e83 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c9357fcb76410d9c8753fa71b550883f0df853eb |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d2b3d23455359a3ff1b5cba1ae1fe48151aea28 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5af0af995410f9d14d2e956fc2c2e98d16608c3f |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2bf3c6b0c97c77b71bf1dafc4f2242082838675 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/90997462b033063e523f234815092d4bebc7d4aa |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe5d2ff0ce660334b79470f12a6bc764742f7a93 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/908ffe20ac061e776ab2c6e24980dfd33fca9f30 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f437db4b64152d86320747b45f7ef7fc04c3119 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a7086cc7e9e4266bd0e3d911bf82ccbd6d0375d |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa98dc430165596b6d1a9eecf3c217ffc058577a |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cfc2250eaf930e92f36968fb493a59ed5a38f657 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3216184ad1508d6184f9d87fc515041efa0a77bb |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a28655ed4ee1228da1277ae7273d189878cfa354 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e47221a56117d9d773ead533feed58bc8dae6dad |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9d4e80c14a18490d230fd45cd6f7f40d0b4904c1 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d59aa8f8341e20a5f01a5e7270ea04b2ba7cde3 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97163c699d059f77f1c27e3935c99abc45dc7cc6 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5208bc8fe9de008616b982576926dd2c32b94aa5 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54499f0f8925d4cd6a1d9056200bc8a6194ed349 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ac75372fd4424cb53d4d4fc52ab9cb40c3e2bf19 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9e3b8daab105892f08dad39bda9614b38534f73c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/484ac16275027c308b76de1a14820a46654901e9 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79ca0943db4ab4e9c0ff3339769ace5c65f13226 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3b8d7dc4534ee52b7038322a93999624daedeb1 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/021dd791c1cbfcac680d98d58bc0e4e63d3c91e0 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/00a8ea07afbf91752cb35028642eedc47612e66c |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd0fa31db486b3b6b3ca3b8c6a63c2aa8463877d |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29dc15b473830780d0410caba82dad9fc12e7eef |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd3aec0d782d33167c16648a4ea05f6b1b2bab59 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83587b58bb1c587036393ae483e6f7ba4891ae8b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcce64979f20b16bda6ea540b6438bd3d89aed5b |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d7fc01a0f81869f6a1dcd5f0ef6f3ec8206d65d5 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c18beb4891257d49cd528ce85998b1337d1e301c |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9d4abd52b7406402824921b9ed26798b0f96424 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ae99d480731514415cff281bb3749816b30c5a0 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d5e6cbbcc7cf31a9f4ea1a5b63227daf35e72fe0 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82d9f1a2c9cafd9d40f5015de46182fb3518b657 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b635ade362f53d4652e0f3fc7f70ac96e46774a1 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6790da2cf9e9ed44700f79989b3f81247ca19502 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/161c57c16e942ee5d1c11b364f46f3947a121b5d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2742884c3ad30eb89f81e50036dd3a4894303738 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7335cc7511447401529383dbf7d11fc3ac1978f6 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3611d89c74c4591037c1d16add0c8105d7af442a |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6af36577fdb4a7442930bc4c382cd6f27515650c |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aef8a51c1977bbacbc8a2dfca63cde25985c03cb |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bafc97985a1a90ad97e1ff74ef8e2e1762a09c8e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e9edeeca4d848c56b77f6389a12a23597ab5e4e8 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa0aaaaa987ba0ac230836aacc6b191eec284763 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0818a765434a724ce4c1cbad62fe226e0959895 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e423e23401bda38f654ca97a1a38e44a07ca556d |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46533a18b0c8972b1bd6c2cd32377aa79f4ab16c |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2536331eeb519e82711870e5ee7140ca060d9adf |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da0641fc29f0e999f4075d1ccb65e135c65772a9 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70fee7686f926e80cf75f8211a81feef471081c5 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70ad4f72441c301073c9316c6728c04ad794f6f5 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c6c961c5de0b8a23eb10682ddb2e2cb6bb55cf6e |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4499bc7b1e4a688fb2054ce3b911190b2fbfb876 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aaa23da22b4b4ea08cf4e629ee9813272526fd9d |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9b61de9963f28bc4b0d59414f69a1ce4dc9393a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aaf1be92b2efb1286f46116d24381d6341497184 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a83e222e4d16024311274d23d057c949e284f448 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/acbdb9ee69aa0eb59f87ca25e739291891052cf3 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d60b4ed3fa1506ad9759a46c89dad4d83293bdec |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3bb544cd4c9399fa810093db25293ac3684899c9 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/adeda520e2e16b13ebe0ceb5c57de6c20c29b149 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/69351b05b8575c999aa4000d36cd09fbf65409af |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2f30a537e548be2906acdddb9b3dea2020bb8961 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0a77c52fae8ec6a9699f1bc553313d6a01f08a5c |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/933f54ff5722fc09de5ea9adc25f5de1856b2de3 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c41ce3b7f883791decdaa0f24bcb927814f44b2 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/399209daf0f1e524e99f63bdaa5d80fdbb6eaaa6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8da7e76e833eeaa63345703ecee617ee336da179 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b9941fe9fffcbe709f78bc0f46f071cb7524478 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f624c04ab6e399425a450a3c238e3cacde2d5301 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d95b229f25eb69da0fd9f10241e06d2edd83cd93 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c47db0c03f1cf43df9a61d8fa9cea1324dc4a554 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/502cce7907c3838e9b87ed6609d5177d4ee3acf8 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b78d1bdd82a522b5b9b4d3e15cf50899fa18037 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/12496013bd1f6bb2d0da4c280807c9d85e5ba08d |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/55e04d2cde7e616a478fc6c7e1c656ba148484c5 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2c3058063e90e2ed961556d6ede8f5cb69c8b0b2 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f5629e534770d36f0dd00124f458f078f2ced5e7 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/19d3a91fc3fc72332ebebefe0dc293cdf0b20e62 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a5e80b75a178252103b2099c5cd6af5432d4891 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f3e4348bacd77bc969f6580bb963bfe2de39cfbb |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b5824aa997da4689886678b269e48a36e50e1c8f |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d35e97954fc3b03eeacec628a2e8dd9377cf380 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ebe156ad72048dbdc624a635ba1207eeccbddf95 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af718048b78447a82967c807292b05767e34b68a |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f9b660dd245b3e12cd64e18361a3961220c2175 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f7595e242d0fb054b50cac6a9357cc04fd2a43ad |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a3ea95bd486b230a7396a1e21bd6d93b512e864 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/302c2157949f3eafc0ab964332df7f71b598b4e1 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d586564b8f4a3c5b1d1ceb4928717a6f48ab6733 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0737ad2e0b8a37fdbef279da06a0e84e7bdca003 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9d2d2033aacf45a784418cb98d3ca30dd5d4ad11 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/20147cdd4990804700c3b9f2cd08c3edfe70d6a4 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea3e3bbf9e321b98bea4170806e779df0a0c7ef8 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e035c611d0981ba5d9f7c2c96e0dd59c27bb519e |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/601824db188a8a9ac10aa0376b7d28c0ad0b032b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5d8853da9f11ceb6a25cfeef0d35e1cf8b862562 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe6802bcd6f6e4cb8fa1b7a477e431c731a10fd8 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/18b777a6247ef53860a7561071e04d3b46d2cae8 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0c676cb9cdf4e2101f68231e3fe2b438c5499f6e |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ee9f4e3359802481c9406624d1b5994487868367 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff219c86e8d95a785be0e1200b822a73720b6e6b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17841e4ffe294f54fff7e72ccdf6bb46f2ab7301 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/095dce07cba05420a0705eb54f70a5743f8a53d4 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bb38149ff5e16ef362644d4ba232056953b77369 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f7922ae5122f043721226503bf627f3da7289f87 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/830c922099195e1138f9395ae2d5466d234a95da |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f30ba53e306d18e5effd28f28c55660fee788e4 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e15f0cb57dbc04dbb81be129d3cfa278830437a |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c98a1a830ba938aa4a68a008cde8d49a2d2f8add |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cc55dc692dd85fe66b8be5cbd10e3ed61b8731b7 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3365aa3fa30ef1a07a3b1b2e9189d2c2fddf6477 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa14de9f1cb398c4302ffcfe8162f08cf21e8341 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2777952a08e87d1fc03bd3febda2a057ee5068d3 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b195e49b8cb235a813b279a015c9f4530fc9905 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84f3681f2cdc96735dbec71d382f98c07b0f8472 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d7192b7cc44bb699d6716a73717005040faec8a8 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f82cb3d81a8ae2f57e56803fe7e2dcb7b2fff1d7 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d7fbe13def8a6a55c801f83c5386f3eac0729dda |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/23bb7a8f7dc9d5d1111f6bbb2356915eb6414e97 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2690ed38241e484e9c7368c102a73c75bbd18182 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/91a7c3c36c036d6f000c97676d0021250814502d |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/005ad254fab934b8a60319ae93538f4516c31cc4 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4833d8884b3de04704c6f00b067aca3ad4ca1a5c |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/71b039f5634c347aa557d63abf81c2ea22f658da |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f97751df2b6ede42ca3bc45b6911c063d45adb9b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/75b71f1a8c9aff5059bebae45bfceb1ab633fcba |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84d46dcd249c2d3bc5c295049956a4c762c092af |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/051cdb5d1fe052d8403d86692e87c43e3d820837 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/02f6053dee07509cac299a9b026c4d5e47f1747c |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f8272ebe7c02d838ed6ad6007f150f968dc53662 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd12f653a56b3d488d98801d9e0de89cd12b69e7 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f254dd409d925408442a92fbd6816f29f538682 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c1bddbce1e5e73b2382c2ca70c5d67c8b2b4168e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/afb0b5c17382686bef504ae9ff499ca05c81da83 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9dba1e603fee83fbb868602d480bf2d9caebbb41 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d9cb243bae68762d9ea95515d875d621261cb38 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47657bd5b3ea688995c43df9bd1bc9b78c661c32 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2740f7c7fd58fa2f78202e12bffa420443dbbf7 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/41c510705bec15b20e8a96b4cf00ffe9edecc198 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8dbc77a855bfbe1f6ddc98be5bda9cba7bd557e9 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af61d62db52d60b4e97d118d97886ff195630b58 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f4f97a8b3e6f62335fba98d975326f31011df2a7 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d0db4be07eb2cf9e6c650504603db7e665b29b67 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce6867edd1d447777426c207a001d32c6a686bff |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8e5139d6062fc7580440d502d0d70ce0868a8fcb |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/984366c4acb5ccd30763c6ae1699da35144453bd |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/baacc3bd6e748742db9a53526cef306f99c94b97 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/35f63ba19a4d9f4385caefd07824183d99fc387c |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c7ecfcb43add470a1034f21d658166423aaf1e12 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/144d432dd8f9321739b224109a083d0ac7387997 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9c129333e10b45e3c0dddae278c1080fa399fd29 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8676286f1dd2a4642bffc2b5249e608a2c75b614 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79ad9d021d287eee513c2bc078a7688a827ba2fc |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/60b5922685b0737238980d59bee28039f8a8e7a3 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec3ded3185bb00a4c8134729fabf39f3fa0c40cc |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cc1630983a9430dbeed8d7b779f8818c5fbe2ac |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dc532e27ef65f95e57ed0ef5b93a74f83d329bbc |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a6f48514c0fd33c44b5df4cbc7e836fa6005f0d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fff349b7c551e021e1197a141e9e926e3da28dbe |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7bd1d9f702a97af96c63c7a180453e11ef479f8 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0e5017af50375da0c7027a0b596981d1d823ffa9 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b9e82c85765808a82e0c22e84dc6db8ded4758b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/882a772db42e542d17de246ea7fd9e9951798b2c |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d625ce5809760f25a5b6af15cc6637eb6da66259 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a6d878fd84e0e24c270c02d38d943247664b942 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f684d9cd94e7d473ca8de72b2eb0884dbabcc3f1 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5a8880ca2c4e66af291e22b8a71ea3ffba41960 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3e439e9ed9f92efc385b09dff491c685d82546e7 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/807f26d6e2d9af433b825b070e8e08d9b0f50c1b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/23243ee1a59798b6835a6fd761ff398fab329e04 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/383e386e2fcd43b22d7572d59d69a4fb9800cd99 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5d675c625e5e9b3a90529b973018ee042d87305 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea14fc3b0a75114fef85ea1465d7d97bb1999d9c |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5f505a7b78ab566365755bc9f2edb22625f1fe3d |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/02566fdbb153c1b04bea1747b8244e38a3621050 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ee4b525faa26e0f5ed2bd6a835eb4e6f292cf16 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7921ad1739ce5c02687063bf27b1ce76a939e6d0 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/34acd1f9ea8d0a1aa5330f8f339f100ed62637b9 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1790a0bcb5adbccc3159e2e4f97690444b0eeff3 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e55388e0d064b5938014a1014ab33b3f99911cd1 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d305cdab5de43ef4283470c4652880ec827c0932 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/867cba5ad5a82479cd6deaee8864715ff29ff78b |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e8eca976a84a641d143eef012a94dc71c4cea7b6 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/efdba9b85dabda85b5dd7c20f94f2de42e78b3a9 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b370f6fd8bf2e3012a2de8120cd6a2cce500d9d4 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd3375c458a4dbbb972c682aaa281e8fe24d0a95 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/957534a6714b4c0801ba5030d728d1a86a06fabc |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/51fe2b421a1211ab5be09bfe0a058d31837488c7 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d64d6574422ff198c9ee6345194630fd3c16356f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25ecc4ef8bb48f469800f644cc31d1c48b864c9c |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d4550afd19d1f4e7a4e9ec887a0daf651d20bc6b |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94a42cfdff091abfbb2377aaa02afb26c60d6864 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ea11a0bebe7fbfd2205a90e59126e96985f08d9 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f4821382de74d05468af6b7d306670c238f1fe9 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53f680e35efdfccf9b565e5b99c3ec65982d0ed9 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dbd1e29d5b4a992cc1ee0ceac95ae5b7b462fbc4 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0bdb2d22b5dfecb15b8aec7ef66330a135268515 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c41d1e480010faa23afc63f407d45f38c3f00fef |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ec5ffd9c93c57731f131614d1c3a8983296f7ef |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/849447ebd89fab97ba2174ac9d4812a0ac8171ff |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ecb5243ce798e71ade92575a605ae3b06406a129 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fa99b1d17f9f84ff8e1a2ef69d3ac621fb1f3b10 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0090edab45aa9bb4ca252023b34d5bf05d63fd16 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbae20f03a77c1e2e2a6c76cfcbf802ebc7f27d0 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c528a4c46c3ef0d9d518594d44c3e585c8557497 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/660a87a731ddac20d0736b93c564e8abc506dbc6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/38c8bfe6383f30ad2f432af359c06e8f35c17917 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4569f930743459229fa629ce221f89c9600bb013 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e8df11b2efdac333094d238eb7d8c883364dd94a |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9653eeb4e95340ede04dd470a45c5e1ac90b08b1 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e480afdfe5e48f46648fb45c9fa51d5052911502 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0fe30965085270fe35b6a2611d3ce49b11fb4441 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4c667c725b85203975d021776402935355c458ab |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/35a238593fa7263b73827645ae5726dfe6481cef |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad21155119403b22ee724aa48e4f82e6d89a2416 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c316e800a1864ffe14e5de951ffe6f48233acb36 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/986ceb5c191412648a31f52d2fc0d3e9379df41c |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa73e6f8bbcaf033687c3e13307989f010a835d8 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bc45a515d848a1a905de5a1a9c1509590a57708e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/317f35e0c9385d42a690039e74399fb464fae13d |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/15f726f224d1fababf9fac9543e431e9d7af3fcd |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/34dbca9d619a6abdf6dc4946d575881732c25769 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/419cbb8eb1e21473fb9e7816c3bd694167b9f97b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13da60442fd3ffd48f7a1515bf31323b33ba491e |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64f35a8161353c53fead56414feabaf5ff962c1b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1ec191d89b7e5d9d2ba16bc04392f49fe5ae9ff6 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f7b351d362b15eff38076cc1865421a2986549f8 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2ab428e6d72532d2b03c6e2b61b509dced7d2dd |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e714154be906c85033f2b2bc3d3d95bce897b5c |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3228c6dc4dac741323a1a60ce3c1160b854df274 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f11d53b0cdb7e94129e2086a914b7ad78db5336c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5eda6559b32f43bd375043708d642b52004d3e5f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/956f6b8ffb11c862617fc1ef8452e0a46f173f9f |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44b7329a7242a5909fdad515d8a855dafe278616 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2bf9a9589f10b4fec7af130fa0f63072aef8aa8 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9e799de581a952366bcb1328a10df9d700e860a6 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b93ddca7f3254781384ac3ca4f4fca8ef0348f27 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a96b8cbc62204e9b8d3e9aa183f2905de7bdab9 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/90ec8c421dbb5846bab45dc6b1310fd10c183dcf |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eb646776e5ff03f70f6774ed718073c2f49163e0 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f8bd76e2b55a61768f2379c602470d08ad536b48 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/624b89023a075637483978e7a899356f59181f61 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/73dd10037419a4a37d442bf5a2a88d9922febc74 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1a49ba14c89e7dd5db7886f6c62b03af917a6f1 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b506eade7aa346261c2ba624edf8dc295d53ae2 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/870b5f9a20d11cf51d14389ccfb9bee9e8c1ca89 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c54eef78dcc361111403e694ca50343d8ce5c7dd |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f059cad1c1d815707f4aaf85290cb5dd0c8fbcb |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d6c2843bf97c34077d439c1c7c1ae549fc746b6e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1d1f0eb93929c280f64e439cfd0f336a6b0f76f8 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbd0ce5657139d46a47edabf86c68166a8a75a41 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b79f6cde26722783e4859cf62e4255305460267 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7aa4ff3355a619fbe366f266e64ea3958d7a661a |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b7682e89bc31eb17d84b563c125800d6f737a42 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1dbff3c64a084c688c2a443f51b7fb9c7bc320c6 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5eed768312a1277752669e0814f86d95394fa329 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcbf8ffbada636a133ade0df5590879639a1ad90 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1df176796a6ffbdd45d38a5962ed120599a6dc79 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13ab36b246eabf95da68da80f32df91650ac3312 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/caf4a07bb310cf9883a814c38b02013ac287ef1a |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f43d23d14236f7b30dad99ace891358ac05903d4 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d8b9ae0da337e5e5d01e5790fe3b3c03e5eca3c5 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af57941b1f426a06aa942b97efe7a4be8facc93e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e0de0ba024b1ca7e5fb3334f9d9c02333cc24e3 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c1874fe6e12c4c4dc87104e91f774f7bf498c346 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f0920b78f59f9edf197c673e992239232d7488f8 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/930ea75a763c09d0a09ffa5f814f3c8f51403457 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/57ed71baeb7b3c60b99558cb27af095114490728 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fa7a37489bc87568092d4bf6b95f36d1dbfe51fa |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c02199f625a7a00b46c733b06ee00120e38e4daa |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e666b62a6241d0d363d2f9b1d954f4c25f2f6bda |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e765e2146aa1a443b730dc7a578feda6ca77ed8 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b938867b0f6fc648e8fb525764a1f1b1e6813731 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d4f2b4a23843b49f84cdcb9aea8d898f20c5c95 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6763109c61dcebff25c6c904f858008fadedc0ee |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/412fd8ea547888b8db0f8ac846ab32d9aa8f5bba |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bedb5f305e7736420af1439c247c8d9771f2cd42 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3059c91a785a1622f52a8dc3422c4b2a8d958374 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec75035f2326d3a895a72fddbd07a5f67c631a8e |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/95395c388d61994a0b320aacc78163d97331ef8f |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/48e7eb449f9211cacf628ed367bc96cdc2a6016c |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/85d4d2595d0a835e6582f35ce68784937f591dc4 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1282f04c13acc155d0029ea838addda5d3b92a3f |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dfae9221e2ceb251529431b0d32d4b6c4b75d96f |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7af628f02be8109a4ff79870a5979ec78db968b9 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/65924f1d9f44e12e10af528630187f539adf8abb |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5ed18b236cd09ff74febfde0aa444d3b6208b24b |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb9e71dc3fda93ccd46098f84d6d811e4bf4a019 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5507ff5dffa6c3e0b67b77cf702375a06244ff32 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29ca15b5bc3a3905294ab1da66e50a33a783f158 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e25821db122dac00cdd45c99fa3ab2fcbb0d682a |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d4b6ff3a246472aa4881699118157d3ede4cdf7 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/243952e5a742c342894f0e83a212f88962983698 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e142cd33450b5ae919ca762c2a6f845038379a19 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1af425630df44ed5b34c97266b72eb5130e052c2 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea675ab09af5b7489176310814cdf7231715ee5e |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8e379a478b3f0d701275aaaeb763943345d90883 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/66d3255964e1911d14175dff429abbcd63573846 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d285b35843adcdee7eff4d161e645e093e1474a |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2476766b6a155e5ce10d7df718a0ff36b7114303 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9181a1affd1bd577c7071ee834fb54e2bffd29e6 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd5853c4571a12fc64e9ad60caf8d1a3ba0ab0a9 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9149344e2a9efbcb725fb06a4dadc2946610dc4b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e1d7359eed9f154e4f15bf45f0b12a642956a188 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c966ecfe937cad1d4dbdcaf8e10c865b604e97fe |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/093dbe19d2989bd804bb6399467563971b5864eb |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f9120ebba27291e45f803183eb2a9b1f209a6f7 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/180378cd6b75da22271103855eff975228aea124 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/45500668c2acedfe76652797b8d3b667b336059c |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/522e115b5c981bfc2a7afcb31e026e8dbe7ff43f |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/15176d17d7d84d1d34fe93f6b840e3c8948a2666 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/489ab9d79c1bf30004521849c3326e80aae37a53 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fec29d61f200be19ece831207c6d289618f555d0 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/820fd709fe1e51fd42e534e287d0969ea460cba1 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22a9e052c4d7454fbcb643ea239ed6990bc691ef |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5f45bb287ab7ee44795f46c58bccf87114d19d7 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b7a776940c1809df38c6b37b20fbf7a53da71ba |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e9d45a2f51d08d8ac9415acafaf41e43ccb08aae |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a6810ae32aa37d838c8084a8782c89b180d7a79c |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d362a6b8a4f6efac6f6bba1454cc2e1bc27dba47 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/169d9008d44d506cc67a1ec8c62b93545c6baa9a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4ba6dbc22db4de42f72e00ebc9cb75fe6d013412 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/80965f2d1364b55542d14ca28235dc5f32f4b6b8 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a93b2d09f260f3d826abfc0cb88c6c3214c3ee8a |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b2c5730297100a976d756002ea72833a07e2ba56 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/122489dbf31fae5da3ff25bf189f251d62d8f90a |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9820349ab0da5d5d7b5aba6bbdb9049d6a64c385 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1fd721c0f75791a03984de7e4079075aa21121c2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c04715545c306f46b6b04feaf691386fb8177846 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a28a0471b1e84d9b1c4b49a4229f956505d52ea6 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb92a40cb26003ba68a98bafe33ac0b38b329de7 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c310ad85643a0cdea502bdaf986ab1bde937741c |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d46962e65d5e68324fe369f028f5359175761ab9 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1a44d6d94a68d5d1effae2c529e955eb861765ad |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9500366342b2238921888a572fc2b6a3977417b9 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9baa1bc42cda671b97ef8419754d8546dcb997ba |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/66d1ec9ddf75f5210ebaf75dbaf9aaa5ca4271d7 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/abcff1b1ebe25fa912da20ee5650774b089c127c |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/810c73e026700b99a94c64dd0cef0a9d5877207a |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf27a5fdf7136e7c26231bd924f09017e0ea13d6 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0f4ab1f79b717819015f5a74fe39fd88e0c0dec0 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bbd777d9c10f1ce8cbbc665943434b48666111cb |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e37edaba1620800797399d4ce3e1f8a1b8b0a02e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5c35af7d9b992d74631c938630f5947c323616a3 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67d49ffe12721d8d9cf44ba6ddc08dcd90b492e2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a27da424dfe8a36a94f2c3b805c10ec109c9d73 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/06ace1fbfa61e492bcb824f12e6d4db257b887a7 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94acf36b2a710c9f8e59e4a458a802e401e27f22 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e44e03fa534cecea493fe3c9bfe146a69d9e60d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e4c97816acaed395b97b2a4b481fef495902ff7 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54e6accdb00e3f5eed3407d2ea83ef3e029f9f5c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/768ce6c76b340070a0c68c3d2158e8723dddb06e |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f85de93657a5072e66bb56af76caacb739dc36fc |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/484a0a9ca882bb7f84ae891cb6238277403fd216 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/429c5df6217671ecaa09b8d3f24abc10f93d937c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dafffb1e7fb430d3f4b402d369dfaa536daa08ad |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/57805f6d57e97714aa274ccbfa3d684789b6865f |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64f7996a577c4e97aaef28e16a7fb08c91974b6f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e3c3bebb8f806f850a75c255b23e81f4a30b9984 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6254e407628d1516a836e0909c67ad6fac59df81 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9f378d732e21712c9c91a5d4876a78a01510352 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4fb0fada45dfc5937909bc641eae8c70c14db1f9 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e56a2e3fea3cf74cd681ae866d7aa1d48d2767c |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef2759afcdff083447d98addcb4a0c480034cf5a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/77d2a884c6068e92d7b9f8b74c191f957a612853 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44e9931e4d0435ff12e7b67ef65801d89dc6e4bc |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8cf558fee3681cb3bd538b18d5464b8d3d5cf43f |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/34f9de677ac0fae5a98c0ae82e3a3f766a8ee824 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/81e08dff0243f2f86d4e937b43821de06de1f6fa |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a47c7a82ebc0e2c37074cee73bcd7742d7eba86 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/813f9e29b0c5a467a6507bde68884e24ab89c755 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/59350fb61450af8832eb442c94b8062bb6824c21 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46007416fdac887e4dad3e0700bb4a792c2e5740 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/adba56db12f568dd04370469e9fd639857e96691 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d1f0340e3635047cf98b3fa69e67d7c19523cd16 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ff2f3768a8dfaae4b4b50afd7e81a61610c899c |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aef1a7e11821ea63d8095375d0aeb50351df02f0 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ca45419b6dbc661fcccf20fc77c8ae6432dd945c |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/03cca180e09c29c37e3758035396aa95fe88b942 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bbd219535a1a502c92e365a4aa37bbcf4078f5b4 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1227bcee0497d2056730b8468414b064cd24dddf |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bff0475d763f3b7608eba6dda8d34129ec3c1119 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27b79a127740f05767095c30facd9d384f18739c |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29194d5e53078952920d15aaf5d88ee3d4de726a |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f9199542c4de7e528e07c7c0144a85a15ce787ba |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6121316956df3087287dd192707f2dccdf6d4c1e |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5bf4d264c262cd4edc826560033495810642c744 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b0f730cf348b0f0c0c5803d2a13072710f7dc27 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/812faee77118b6c3d93dc10af0d3453446f73c5b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e1211a90de8e9b9e99dc9ada0d4025bf7f64e405 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe061cb991c221bd1e7fa1ca195b15dcfbd9cf89 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bcebd03bd37e40deab76692ae42f6d7c4d8ce26b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2ffec13ce2dee98d6fa4bc85d24eef9d8874295 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/752939565c8e0849c999103e69f57ee4de44c92b |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0881f6e5a6f79b20b0cf3a7e9af5a3d192d02c12 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/be1ce2eaf62f7201d180114c9879b0bc45887f48 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/738cbe654ce13b3e30854b58f490f63ab1ac1916 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c110b89eef96f8e71b0d7f8f1dc0b2885eb997b6 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/afe4d6a77e226740c96365fb21a44583b13c0392 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/697603620b46b52d81da6ca89d10f5a013ba31de |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f3f6a8b1cca5cadecc7eba831fde7053e0b13ba5 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94fc7d0ec97039d5e6125f0ba0bf018d98f470f4 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9154a98f10f1f5ff060e8c21fb49dfcaaedaa6c |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f36375fabc6ecff3c32c233ac89dd2291b212d3 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce81331d9e50ff3beeff0f12101c33143d8e35fe |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/30c616a5e5c9e01a5eee17e07acf49336c532571 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/00cfab57b216c8dd88d37f9878dd5d89e8767c2c |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7593d292a0527c671f85a34880a4b4fe2f8c0673 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ed9e31e691e52358f7acc6477d223cba2b71da6 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e14c8fa03c5e6296043c65ba89851f1d3a9a4d3e |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf604976ce0b4e847c53e500ceca4e1d514654b7 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c4bdf749832d42bbb9b8dcfe7db0abf19ea92fe2 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f36dfd6bb4813eba4db4019bce94d87ff62089b4 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/88e09b581f7a997c9763edb13b5fdeb0d3562b06 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/febed2e1e7dc138998c7c1d535d5cb2147a1cbbf |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dde73a5e23ff607eb84c55932fe7642bc990006a |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/725ac82f46ff837ddefdb490de5738e4e107e969 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7b4908935f5f668582d9327029e4323a5a134ef |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ffb57e896c7f99ec6d1da5da7b22bc85c361ab86 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/38a6c44f4f48c65e76972d87bf2c3054118460ed |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6761cfd9ce3a950de76ddb8328e357fa653dde1d |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9609c4a60314df045f32226614f3b526717d4710 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce0f6b252bb1d2c4e54193884b9828e3541b00ea |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f004f9bab08e847636da1e4ed16a41ba5b9eb5c6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5fd0ed56aa00968fd6b8884dc6a36a362f0d5dd5 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec3cfc13b5afc4497d8c0d183fc5aec22618a340 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed32c3f547cc2a7b06e2f74ea4a1b1a899315a22 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b08f219c41b6792edef52ca0a12774703f264061 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94b7c21cd1170da34ff80255de4553ef9d86781a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0e93587011174e37f26152b0946d15529093f5e |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa7b08c9b3bc0e698532300447d1afd12d879250 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07fac358d6ef8bb6ecd762f9e6222cb2f669c79c |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53436847a7712bb6c7014dc1c4724238b6a4a9a6 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53034d410d1f1b5104404b05ba41b9a45cc41d75 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/75c0b59c54a163b416feaf88920bffb17bab9071 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e964775e16bf7babec45d89c0124dcc1970d171d |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b45566eaefd685e2bf7747e275416303b9a2574e |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4706d90eb6b987900f3ca97acae08b1332238773 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/69b307b7ce5277f04a2ed43ec0c4a31ec1b77d34 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d079fb812c8ca6ea71616f40819a5291b27bbdf3 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c576351ad877f7d79ef382bae3a289dc44a1939d |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec561caafd5c214b37bb99123a3ecfe0afb21afb |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e779c9b5021464e55341206000ba4b9da550573 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53de5c8fb44d53eef0c2d884f44853f23553195e |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4727a4060a070a32e7407631335e8678e819679a |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47d5551bf4e58ae9a872e1cdcf7645bf186b988d |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82453175a8bb04c27a8df678aa7900f40f2abad6 |     
   xtensa    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/747e9b4943f1788dd6deb215fef520a63fd15a2c | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/06ba1f04bdb1d7858f343c65e31dc62b67939b4d | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/75b6c6a03f9c3840d68293de3ad9d1189091b526 | ORPH
 microblaze  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/54f4e2b495a4cbb3670217a665c1d7b9c8b7ebd5 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/f7c51296d2d614da865113f90df901151fa3dbe8 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/f8f7eeb6bc52aa69456f3cb7a48b8ea0c651ffdc | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/891e6add05fc541ea257a1e0ccaa51cd68f3fced | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b0b6763cd349f74e02488e2ee5ed42eac9503b96 | ORPH
    m68k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4486bd9d38fe382439817936b235d72ba42a4fe5 | ORPH
  aarch64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/97959ba78d45b49b3491e814429d34eb703dee57 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/774eee2d2284c3b6442fed8580383e33ff746080 | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/2de9da69df7fb7be97a73f3f0fc4620a929b37b4 | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d92ede5e363f56c55948eec753bc6a5dac649020 | ORPH
   arceb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/9f03a6918d5bc908a4edcff058bc62b58f735a0b | ORPH
 aarch64_be  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/12f989ae6f062dd82b383f1d908640836055fa2c | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8d926b0f6fcbac019cc86c0cc98683af712e083b | ORPH
   arceb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/028cf2165bbd8297dc4ee9ee08fcd34e190fd267 | ORPH
  riscv32    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4c0263bbf4f392909a146f88a1f2974f8617b650 | ORPH
   armeb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/16cad2323b713b3c9ad369e73358c39a0ae9defe | ORPH
   sparc     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/9ce0f333e2cb5ef6ccd79306f30d627b32532116 | ORPH
   arceb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/e5fcc8d51678ab0e9f641eb59f516730b63063b2 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/8e119c1d27bc5cd64bc78405a3f64cd3f2f6c7b3 | ORPH
  riscv64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/c0147d8425fa3380f405dcb45f9d2e0feb6e7b83 | ORPH
   mips64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/784d686a738c7c55938dd1d028f288a9a7913642 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/23d8a379401e0e57546ce97e812e215a2f6bc5d9 | ORPH
  riscv32    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/604c8082474ccd984def6227bb7dd6f97281a210 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/e644f85121be77de15ca86ea05f487497bb7f972 | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/abdf3d89de3626508aeefee3cb224412cb3efc2f | ORPH
   sh4aeb    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/877f703e1214a62391cec376abe243aee87ba1b7 | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/3d0f9e7d89194c3bf56ff1753c43a6c22aba190c | ORPH
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/ed8f1578226f185726d4b378e2cb610dff1a51ae |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/b692f1aeea7c7721f08d41a5a7fc9a5f8518ef8e |     
    mips     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/e62cbd2faf0c362030c2b68b5429dcc1f1b33f93 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/2e1b4b94079d07d2af859171bafe61d4fd549900 |     
   mipsel    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/0058ab11e9f667e24652915805e4af1e1968c670 |     
   x86_64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/fd6f3132d5e3a6b20768060a733f5e399830e173 |     
    i686     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/67a30322063d81fd47e7fc2e23db989a9ed40a85 |     
microblazeel |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/3e6f0adca9905d13cc43c1c075a25077140173b2 |     
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/2e97a3a4c374dfe34051e72ea12f3fb02b8c3335 |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/be004d9026ec75c65027f4acc6027763ba445a1c |     
   x86_64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/425ec6c5bd63867336a5e727da665cc1413bd9f9 |     
   sparc     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/a968292403b4ab71d8ecb4998b5d77c4328205d8 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/48ee74383d69589e865c77088a20f437407eff2a |     
   x86_64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/971a542812cee5c90e5dc49d8e5bf2826ca1e06b |     
    mips     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/a15cfd6205e8ecc002e92aa83102020caa823ced |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/9ee0a1b0f925c5c257e86b9a90cfe00d582daeed |     
    m68k     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/6a7044e566c9f8090486c490ac43827a11bbb87a |     
  sparc64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/cbfc5dc188fbfb881d06cd72674a4f018a3fcd23 |     
powerpc64le  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/4e74a90df836e2f2e2fef6f1583b6c5d8c42a8b6 |     
  mips64el   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/20fec914e1a3fa4c9a81a63cf043c554bfb0bc7c |     
   mipsel    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/6345cc37b2a068dfa9133a30fb307876e6e5abb1 |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/36e87aca59a811a7d92a4d7d0f5f470d8b1c2961 |     
   xtensa    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/0d2387073077d04db9ec80eb483d08c7ca6047fa |     
    i686     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d336ed1cf259b6f4fc15aef6214ebb59622ebd91 |     
   arceb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/4c7c7119e9558823cf36fdb12231c3bdf9924296 |     
    i686     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/0a3217de6618a079a68810930b8ee55643f23c58 |     
    i686     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/3558602542d87662ff49f4b6ac591dc17ee7979a |     
  powerpc    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/4d5aebbcebfc78df42d35933b8996f9eec6c09b3 |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/bd9d1a067a29cfaeeec6089a8ce04465b1d441b2 |     
   x86_64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/42affb3425f590138b5c044f2196098c5540831f |     
    i686     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/bb7eecabd33037a28827745122fd0e05aceaf921 |     
   armeb     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/ace77d13d43648d63c5b1bd90cd5a7c27765e0c8 |     
   sparc     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/21194b443c5f9b8c79c62e09d1b0786bf577f884 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/86a3b7e532080e954feb34c86db3695ed25fca52 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/5047988ecdb2a82a01013201ea9f32771634f4fd |     
    sh4a     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/25b54dc11029413dd8cd010ce61308fb2fa0f899 |     
  sparc64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/c59db70f7338ccfd260a0716ce62833d9bb856d7 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/65b0c4faf3fb50276519774f519a13c2e2d98162 |     
  sparc64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/483d5605ce2a6dc159a7c7773f53e853838de13d |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/40c32d5aa3140934ab0a14a76c99456a9ea55f64 |     
    m68k     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/7b2d46d6ea27d9196c236121eaa4dd95f0ac8a8e |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/dd787168fe4b758a1a7e7dec25c8ac6f4f510b4f |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/0975b1ba7eb4df383a5ef6c8b8d0c0648a4f5683 |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/ca75448643a5f8502d016142c1b17b4a38b6aecd |     
  sparc64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/c34f5525ae09fc488a6c88c3d96448fb2ce9043e |     
 aarch64_be  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f6e0ced6c1d921ea646cf6e7c7f87d6c095a720f |     
 aarch64_be  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/e7b807096e4447d62ef062eea4bf640ef9b4015a |     
   armeb     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/d28f79c584216725704c57b525eef68bf74f87dc |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/0f53889bafd74ee2cb040ac17d711e80d6587213 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/6b788c0ba31a072dd1337130f4fb7bfac8a32409 |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/a06d66ffbbdc057eeffaed3e1925fe68e0c1ddb8 |     
    i686     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/45dcd5ac54f6f045820b5c0d320881bc95ec37f9 |     
   sparc     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/d363036a090add78ca340181d66e697b3ee9f417 |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/1b18555b04fb46bbc6ae5d7a3df4dd0face4bd32 |     
    sh4a     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f442acb16c85b5ea781ade571188da1c93412622 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/831293867f138f0a7a32e644860891a6b383187b |     
    i686     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/687763254eff8f81d6252df304e81837e36f30aa |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/6d12fd91caf0827fa000d492601ba1cc9c1ed2a3 |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/e9f837554b996e9e3e2d72c56201d409e7afbd19 |     
   sh4eb     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/72c83269acf5a28faf4a53e3b223edb5d7b3f4ee |     
   sparc     |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/b5f2cba242e94da41b1acbd8c54e7bffbc82d25f | ORPH
   mips64    |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/329d2c151ec054c69f11d882a2f9fa27c04c4d85 | ORPH
   x86_64    |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/18dca2e3d91219073c11aab78693b5e3c3b26a05 | ORPH
   s390x     |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/f6282009435e2013325cb0edc18bdb8e67bf7452 | ORPH
 powerpc64   |        host-libcap-2.73        | NOK | https://autobuild.buildroot.org/results/d5e085abbee529ad7a15f31d0e79839734d07b9b |     
microblazeel |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/60203e57ca2ddf28106f234bac2f1129d88ce79e |     
   mipsel    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/7bed85d8bda4e765074a2b25b20061eb6b5a63d4 |     
    or1k     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/d5be9d02117c6a3b1e8837ce8a4d2bc2cae0ff9a |     
 powerpc64   |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/4312c5a2a89a003269c234967ee72f9e18bb2d9c | ORPH
 aarch64_be  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/2eb4a414e0ec5cf015aba006251a0984d700c4df | ORPH
   arceb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/daca0cf06d41837e58e8aa234d95ce8682e6f6d8 | ORPH
    mips     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/10184e59061a57a83d850b6fc66172458e5d2cdd | ORPH
   mips64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/aa994781aa0f56911bd04129770c74e180ff789e | ORPH
  powerpc    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/3bee8c68b4cc4f54a7c52f2b3aa37ca5ae0c0e44 | ORPH
    or1k     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/802b95f1f86da1e9780b5c939fcdf3bd972f0eac | ORPH
   sparc     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/b463ad8f62447b6d29c0e1bd952ed8d656568dbb | ORPH
  mips64el   |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/f9a50c5f728293e8db7c3083c4fb2b256ab35a25 | ORPH
 powerpc64   |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/5a5da11105949f2561224c2267a427b481ad44ad | ORPH
  powerpc    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/cb87e05d90485be6cb9c66a2e017c16c85a5249a | ORPH
powerpc64le  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/eafb44770baff308a098fb181dd7c62ecd3f0db3 | ORPH
   s390x     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/e343b5c8bed64e3eb269bfc33d87f0cb0153b676 | ORPH
   mipsel    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/bdf11275a09a3be16a50b41dd9c8f3d72aedc298 | ORPH
   xtensa    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/fd28a3a7cd41c5a7c7bfda8cdaf9edcc3fbfccef | ORPH
   mips64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/4ef42dd0e9b980e5068aa3c6f4a1c6c3ef819ffc | ORPH
powerpc64le  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/baa7a6b6a5745ff6497048f4b6467c1c07934928 | ORPH
   s390x     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/0e1530bad30c7ecd33cc7066d77630826cd60a63 | ORPH
  mips64el   |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/84222153ffd9ed29244ad636d7beb0dde3568285 | ORPH
microblazeel |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/b517c5ff007b30b63bd9ec63c4ca8e345a50fc93 | ORPH
  aarch64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/d926231381d4538a53f78039a4863a5ef9f5e8c4 | ORPH
  powerpc    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/9ae07d858c9ebc042cb81bfe6e883ae6cfa97d00 | ORPH
  mips64el   |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/f93040ff206de2b7253bd0d0c6f9d7148c9880f1 | ORPH
    i686     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/c2bc9a61db82d6905d816d9cdf8b1a0044584743 | ORPH
   mipsel    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/419ee3aa2bb7750b384bdbab2d4e05f310d2b287 | ORPH
   sparc     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/88f3f10d3d5c679b3501cfacd053ba17efad9146 | ORPH
    mips     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/24623e8302edbf8b11e5749e0e278bca2d51c4cd | ORPH
   sparc     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/d97c55f6236347b1b3e33ba532f188dd54dece28 | ORPH
 microblaze  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/b7a9507d223c1fe9086cf5aac0325471d22fbd72 | ORPH
microblazeel |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/a66ad32755e9c6cb348d2c8f4e675c177b2e1a24 | ORPH
   arceb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/fdd96a5f0124e4ab5ebd25182e7ca31438ac84b6 | ORPH
   sh4eb     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/8896f1959ffb16bd7b94767cf6c08d5be2be4f44 | ORPH
   xtensa    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/15b910872c8163e5515ac86655817a16a8769d90 | ORPH
  riscv64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/d1eea6d7db84b7fa59ab4dcecbcb47ade0bee613 | ORPH
    sh4      |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/ddfb6e8eb8e8abfc80bd1067ee363add20f5b575 | ORPH
   sh4aeb    |       host-libsepol-3.7        | NOK | https://autobuild.buildroot.org/results/cb74c6c06f1f97889273d6be0f6b0d3b77994aea |     
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f5823da23b90f4953929609371df800c8bbfb1b8 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8af94794ab076225968c27e7b38db119925f032d | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c23aa9114a773ee10b1903810763f1f09d219eea | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e427149bbf87c81b688d869b8818861340b94064 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/47eeba313f32cf9744f76a31aae3e5a9125da511 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63265c94ddce3be36cfd1d58fce0a9f47507ae3a | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dfd69dfcc913bd94368e79b0dedfcaeaf9a3426f | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/912c5ea422a1313405165e677c58f5b46e01b62f | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/219b183be50e43c9e08daaefe896d35b79747994 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de471e6feca21bd37a03558c2a27f9cc18ffb542 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cb314cfc159302720f63fa195bddc1c36c71e74e | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e1341cfc11f5df30a2322bd7d09e5d18664d2344 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8898b6529abc728cf311b23d628a488350a6e922 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d2b5fb4383408abc7fee55d03d752a39d4c2b114 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3d8bed9c007a3954b0d2f04db478d1e099993448 | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/ec56000584c2a3030447b856e2943a5a7f2b0bd2 |     
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/9c1bae4cecc944ed3cc5f3f2a060f557a104c2ff | ORPH
   mips64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/de5356d4ea979eb8104e84e53b14416155469123 | ORPH
microblazeel |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/1ce9b68dff557f52f6d6570eb82457c1d8ffac30 | ORPH
    or1k     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/600a07b9a61c93419e4fc4f60d61012d05088291 | ORPH
    m68k     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/191140bcd938d240c233fb52633d070d1f01a5ee | ORPH
   s390x     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/1653d22c4020a5b5aa89767e04765d4ad6d9d814 | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/db227b4fd5bdf87f4100059fc487b68a3e892900 | ORPH
    mips     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/00a3d448426d26efc4c04dc9b674a10e4e734801 | ORPH
  sparc64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/1ec2097bf1f95a734930c41df4519c0bc964797a | ORPH
    arc      |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/9deeacf87bcfc3eb2d8262ba35be94cc2247d0b2 | ORPH
 microblaze  |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/8c7aa75019f45c0752b44bcfb403805507f0f50c | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/86cefb646cfeb758eb0f4a2008ce1504d77a6c7c | ORPH
 microblaze  |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/20051e1f98d0ec66be0634a873dd0417864c423c | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/c41a6a4c95535baff9219c8963394457b0181472 | ORPH
    arc      |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/2c106e9140152cdab39bce0068294ec7f2c9a06b | ORPH
    i686     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/31b5904c2aa092086ce288cb01538f728c339e89 | ORPH
  powerpc    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/55953b91cc8f9509234a4d865325c4908bdf938b | ORPH
   sh4eb     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/8cfde4429969b5e83ac443607174174a310470d7 | ORPH
    arc      |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/eeadbeb5aae082bcc3f9f4b4d5958c3e292d7bb9 | ORPH
    mips     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/5b00fbfe4100e97c81c649b51d8159eed63ff66b | ORPH
   arceb     |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/86025da84a9f7e1fa92848b611ff04d6c3b75639 | ORPH
  sparc64    |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/f8514eadae5ba9cafacba42796b46f655cc7e92e |     
   arceb     |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/b558f37bb1f1b5a16a2a7e35e273996d52bee7a4 |     
    i686     |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/7bbb8ecb3d69a2500fbf2891088d98e8b9cb9262 |     
    mips     |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/dce15087e2a36c0df9be56535861a01bd808b7fb |     
   s390x     |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/d74f60857bcdb26ab695e4db4094fd493ba16df7 |     
   sh4eb     |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/9370ced6a3fe440ecbec5ee983afc855cc03679f |     
microblazeel |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/0be71349e05946461059e98a14e8e024ff75442e |     
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ef6c7783a124a8db2150fb9544b1b0b6cea8c30d | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5799476ffacf7e7f92e11b8fbb0b36c9057f6ade | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/69dc12a1669b88e521a1df7257ec24a9778422c0 | ORPH
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b3699458b8005f1cf45bb38cb02e88c8a2181f64 | ORPH
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/72136bd141482dc2e3559fee361b759bf1b261ad | ORPH
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/db50cfd20a2f69b2ca20a74c2645eacd6467a769 | ORPH
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/1a851dd45ed6c922d02cc6450d528abe2a7f352d | ORPH
    i686     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/2a6061000c09864eb4adf7a34445adfb078e6c7b | ORPH
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/861e01d15e87ca61c6ad1a753dfc2ac38b2e2fb9 | ORPH
  riscv64    |         host-xz-5.6.4          | NOK | https://autobuild.buildroot.org/results/522e14e8024842617071463e05a384f678dd3b1a | ORPH
 powerpc64   |         host-xz-5.6.4          | NOK | https://autobuild.buildroot.org/results/13f96d2958bb700c749fb6b4e4faaf26e72f9f42 | ORPH
   sparc     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/46a29f6eacd6bc77753bf65a27675aec92031860 |     
powerpc64le  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/563e46777d920c919662ea6e81bd499578424721 | ORPH
  riscv32    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/08ba012d63d4847b13d47220a13eecc12f2c64f6 |     
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/efd9342a2e60401ce6f729e6d284077edb0bc7c1 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ad1cc91437de44c68c705cc7993d60fc46897781 | ORPH
    or1k     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/bdaf81afffabbd4704a5e5f9ce6eb657f5fbb8a7 | ORPH
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/3cb1fcc589be47a24788f055033db1089a985907 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/45f5ff5a3964d9adf09ac65b8384dbcc306fa33f |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/5e70e125f83b653f14b6b9e788237a164fca3394 |     
   mipsel    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/50018430ea800a0468fcb088bdaa2a6b03724ab4 |     
  powerpc    |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/c586667147979a89500168bdcb505c5b8d78a802 |     
    m68k     |         samba4-4.21.3          | NOK | https://autobuild.buildroot.org/results/c047e8672538335dd64d88f873b7a8d6ef154294 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/0c6703f62e8fd764112a95a0b86eb3eab5de1022 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/e31753c3c56e3fc4157917571130aa49d4076638 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7206a2c498abaf77d0e7b8d27bde94fcb38d7f97 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6d59a01a9c0a6a4473618cdeccd6a06db7db0614 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/b885dd7971c46dc206a48d439baf8bd3dbec1192 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/edd2a0922514ddb777c0b7111724dbfcf5065d76 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/8d7ace45841b3a335cf199a982bc2d1c3a269d9d |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/21173bd57424428ecad939d74ec9dd479a3b8539 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/5742a411d72e9138584669e1032402194619829d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cb25cb6575bb879b3c0e67cc3c0834e0d4812cb1 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/bafa0cbde6956183a6c542c352ed272bd5871dc8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c6d74ca3e9868e7a7e97c184d043ab66206cf1fb |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/892d2750b151f42cc3fadb704a829d755eb23b11 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/73e6d0aad660468c5bb7820f9307a1e870e026e4 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/bdae46b2b4c5ec8fa9957ff232d272e92fc4b440 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f75f4b628ce7aea02f4ed3696723c518c03ba77f |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/83b46a8b5db5a076bbfc9c572bfa953a78b53b12 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    brltty-6.6 | 1 
                  delve-1.20.2 | 1 
       freeradius-server-3.2.3 | 1 
                  procs-0.14.3 | 1 
                tinifier-3.4.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/12de38cdaff5a290cf2889a36a0b23c111ebc763 |     
   x86_64    |          delve-1.20.2          | NOK | https://autobuild.buildroot.org/results/a162782513cfa6759e3eaec7c9442096dff9f624 |     
  aarch64    |    freeradius-server-3.2.3     | NOK | https://autobuild.buildroot.org/results/6d17c7e603e411fd2248d0d5c55203ea4bc4e152 |     
  aarch64    |          procs-0.14.3          | NOK | https://autobuild.buildroot.org/results/d3561d6c133577b44ab4a9bae9b1c0d2e26fd6a9 |     
  mips64el   |         tinifier-3.4.0         | NOK | https://autobuild.buildroot.org/results/8a37b46ff6252255a1ac999b86420ed5c0d98622 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 c-ares-1.34.2 | 1 
                elfutils-0.189 | 1 
              fluent-bit-3.1.3 | 1 
                   mimic-1.1.0 | 1 
                s6-dns-2.3.7.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/63a2cc37acf32977d1befb1d966e0ed22b766f06 | ORPH
microblazeel |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/828ef4f9d8a7895da21221f7778c4d171290bf55 | ORPH
  mips64el   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/29233a09cb7af0296adaa78f9818f505ff482add |     
   nios2     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/bdd8c4f0343f78516174c6d66a656adb16f612f0 |     
   mipsel    |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/aa354c2dc469cf1e9e69a4d6959c2cd8da43e309 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
