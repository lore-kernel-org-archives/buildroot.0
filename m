Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A54AD3CCAF
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 06:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736B560C01;
	Thu, 15 Jan 2026 06:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrjNZZBmg2jS; Thu, 15 Jan 2026 06:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9243360BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768457789;
	bh=zazFvoSSMgR0P/X9Ws3eiUDu6ypop+z60V090f1HbL4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eBxaFdZBxnkyMbg3LxFWWIyJPcaRd9De99dHrSa0SBwmEFDHfD85uDCZz+ldE077E
	 V5JBv1S4N0hDZl7CHaPp2HXFfqDPwVxoaX75UUIqmILQZQm/kbrN0b0ehPOHOdkmK2
	 EaT/ksIn81Uv7DTSxd3xQ3J2Ty/f09hAdvJ2sU1c5baUMujGCkff+ThjOIL6ql6nvm
	 AOt1B6AUw7utCw7cKNDYeXkfxbbDSaqvwDhNK+K0ig2UKYf6ZKRP90+ib6KxwHmndz
	 1ftNRwfuDbWX40z7qcgZmPLWLNb4Rx0s2Q05vOE4X5zP9sZRBtjXlT0fULcRi4lObN
	 5vBlfLAvGJ+RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9243360BF2;
	Thu, 15 Jan 2026 06:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 788A11CC
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 06:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D6A403BE
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 06:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClWHown72Grc for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 06:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B664403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B664403B4
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B664403B4
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 06:16:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b8715a4d9fdso78376166b.0
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768457783; x=1769062583;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5W+5M3Q3/aZsQDswTCAqQ1sXfiEMoaP9lgpRUkHzL4I=;
 b=f0JejftFZHDpUfqWHi7fGoOSDQa7MnxdoYvVoZ/sUy4LW28Ct5Sx8lOGEqBhA0Ugae
 JgWn9TyKykNAHxAYvBQ/q8E2nT8TmR5/XlPdu8vUnS69OS2Cxt9CxgosJA/f7SH4nvL7
 O5yW28to+CXhjgLWRY5UK6fSGLZ4ncdRt/G0eHcFZWkFJ27NCQS1ZW0DiZ0ZDqX2RJdT
 Qa0MMY5W9cDqXQhX1Cx943QQlr0msmN+PZXzydK1+Ukb7KQWOaRrtV+7yGn8gB/PPZ7T
 BngjoUXmPtMap5+rlAAlt6RdEkoviXiphXQqQ3OqD27onzixLdOALRihskO6G7a9/i1B
 hcMw==
X-Gm-Message-State: AOJu0YxjMKTWPlpXeDzMU38Aw6QiFUyn3kwFw9ntW2m/kflzfDLQk71S
 QA3KeBc7oAyVmuJoDrjC4wsq335L8mmeufYG1QQbWdDhslARpJ/fcmIdXwbQFQ==
X-Gm-Gg: AY/fxX6n9fOcGBCrMY0Hh9zbip4yn8nP1S3gBDabfuvLMOTd86lu+IqIgsHX7jBDE0k
 G3V3z+sdglaUdsxOjTolCJlpqXNCVqvU+xkMfP6VB5VUwOz2oCW0vqP20tGz8A0ZSD40p6FpBEM
 tCoCfTekLJ/pCmA1q4FezHk4qnNoN9qt7M8eIAtxfFGwiG1wcfPPf/HA1ZXRNIJAGcU2dHoYf+U
 Ws+SgPXdelVLHeQ+38UaF7P83KVQb0/ofONfGyRZT3rabLFfN83Flm6R4DLutShYjWV8IIt9nj3
 004LEM+bPEs2VMsdNiOjrj7pMz7zvTVKFXlfGYG5WPiBsDZQ3mn0VqsQ4rVBEtuc/ff/6R0Esgc
 KXaPwZyiOeDoR3l1pdetKllHueXyGzPN8JlnZQ/N4LEq4p8q17Sijtw61lO29107p5VjZLU3Tjq
 VbhBXGdrrMZpAPz8wR+w==
X-Received: by 2002:a05:6000:2502:b0:430:f622:8cd4 with SMTP id
 ffacd0b85a97d-4342c5576a2mr5926178f8f.49.1768451112778; 
 Wed, 14 Jan 2026 20:25:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6e1b7bsm3184871f8f.34.2026.01.14.20.25.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 20:25:12 -0800 (PST)
Message-ID: <69686c28.df0a0220.286c0f.d202@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 15 Jan 2026 04:25:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768457783; x=1769062583; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5W+5M3Q3/aZsQDswTCAqQ1sXfiEMoaP9lgpRUkHzL4I=;
 b=gvqBe7NGj32QiSk+EHrlSBOcX+Vq1ICxMne6CK/B94LPJo7hjz323zfm7dZn374mCM
 72XajHw3iQ1N2aDS/92+0wU5XbpscEz9fr6EQb4a2fFYOgeVf+rFvoQWASYggpIkaX7B
 4ckR/QnAG0FoGjQ0fKMJP8Fr82mro9S2ZHomWXfI1bxsCdkn2uDykq8SFloK3suKdYDL
 lTL6F4mRI29vq8qU08ooeJtI/c5BJpjoqz0asmxsb3MAP3WygegQmggWdU6SjSjjukay
 OTRNf1XLug8iYAdWkUsuV0byDsRS0fpI9LldTDbq7YyexCRrJPBf0yQ4ubqTr8mJoPrq
 Xsug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gvqBe7NG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-14
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

Autobuild statistics for 2026-01-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 28  |  0  | 39  |
  2025.11.x  |  5  | 14  |  0  | 19  |
    master   | 50  | 103 |  0  | 153 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 15
                       unknown | 9 
                   cvs-1.12.13 | 3 
                 jasper-2.0.33 | 3 
ustream-ssl-5a81c108d20e247... | 3 
flashbench-2e30b1968a661474... | 2 
                 host-gdb-15.2 | 2 
    host-mender-artifact-4.2.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                  linux-6.18.5 | 2 
               linux-pam-1.6.1 | 2 
        ltp-testsuite-20250930 | 2 
                    lua-ev-1.5 | 2 
                openobex-1.7.2 | 2 
                openssh-10.2p1 | 2 
                   perl-5.42.0 | 2 
                 aichat-0.30.0 | 1 
                apr-util-1.6.3 | 1 
               asterisk-22.5.2 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                    dpdk-25.11 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.3 | 1 
                    fcft-3.3.2 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.41 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
               host-mpfr-4.1.1 | 1 
              host-rust-1.88.0 | 1 
             igt-gpu-tools-2.3 | 1 
                libressl-3.9.2 | 1 
                  libsvg-0.1.4 | 1 
               libtasn1-4.20.0 | 1 
                  linuxptp-4.4 | 1 
                     mdadm-4.3 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
             ntfs-3g-2022.10.3 | 1 
               nushell-0.108.0 | 1 
           oath-toolkit-2.6.13 | 1 
                    olsr-0.9.8 | 1 
      passt-2025_06_11.0293c6f | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtptools-1.22 | 1 
          sane-airscan-0.99.33 | 1 
       sp-oops-extract-0.0.7-1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.14 | 1 
                systemd-257.10 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.2 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/fb3b4ebaa496670f0ca6fcef27bb98e07372e786 |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/86c0ca7c22c670e74fdf75c64f9565751da43a51 |     
   sparc     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/14ee73a58d176e98f3c9c7d1112f0f0514ca2e75 |     
   mipsel    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/d835ee5994de6b9d2bc912fd1f0fa29ae7abd095 |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/792ed942d17bb8d00cd321536a102f6dd63b6a8a | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/4860bfdb3e489fae5e73ded804617a99abef34b6 |     
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/fde8152505886849663c5809826e1b542a3501ed | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f43ef34880fa4ab7af1c934ef0b52966a1940722 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f482ef6e0dd54f80386d5f76a28e630c2d7c64a5 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/52c6d8b2eca393b830d35eaa2080d6fb2ded4d7e | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8bd1e05fc32b9b25389f7090ea0a9c9d50d06c15 | ORPH
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/5e1284a9cb3f6480c524a4a7232b19df931eeb23 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/32dc2aeb16fb34975f6880376ed5ab0b988d7bcf |     
    i686     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a6c0a30eda5f948cbfbc8f606045dcb75355d37a |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/fe5e96505b0f861d4c6ec512a50272eef84aabf0 |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f8e2f4b42f866b13016e8623511ce4330c577842 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/05dce3f3247d0b4650afeb65d420b73cae7f1318 |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/99205386fcae00ff0ded7b4e4112f30da1cf8bc8 |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/95c8801559a116cd0c573c69bcb770ead670817d |     
   armeb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/541e3187db6dfbeeebd1128b61935030999520f4 |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/6507d397c7079da9f5ca7aebc6da0c128af90496 |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/1b5fdc5319a3b59bd4018d9a47355313c287f485 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/28ca9670cc69f2fa4ce58ea1b796065afb9d5235 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/73549c73370e1250110f83927bb616b1265105ee |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3c97c166545b3e0feb178d94305e20e055439076 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e4a82d7c9dba01793bb79e48f9179aa721cc89a0 |     
   x86_64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/1ffa56091ac6ea1f2f167476dd0a1e545bdfa306 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/72b380f5606a670b00c7b0154b4f83568359b9be | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/e0db5c75ecefb40e9516b6fee2f0fc80bc1b42ff |     
    arm      |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/5450e692ca6c9c7e504d2bc30de0512829415443 | ORPH
  powerpc    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/b5dfc32fbc6982e842052b703b40656c72e2ba10 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/51436e2c6743fdfe395e298c7659495bfe04ca0b | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/25a8823f344f3c8f656b3cb5d797240862e401f8 | ORPH
   sh4aeb    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/fdcf3c42fd791ddc8b50a23fdd05afa74cf9d526 |     
    i686     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/8b43a434ff9615e856bb88391bc2b00e9b0b9ab3 | ORPH
  powerpc    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/46c491102388bbf8fa74981f5df24f9d5766ddfe | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/86790a9c20fc4c6c1aa919b94a55f50c70475b73 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/279edceacccc7783e4e3a8344ad3381737e2f02b |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/895891b8647244f73e87fbb851f1b8185083390b | ORPH
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/6b49349f05fde6abafea00ff3daf533824fc30c4 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/620a4b828da5eebe9579e40daec984d0b05fe202 |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/712d3439654db253af8cd7b6b1d828fecf2c8e97 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/36a5b77a19d3d12c5654732fba6267ac85d64558 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/494fab2bb366e48f5b8da89a610150a791dab36c |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/defad8558bb34a0cc7a24f060b9a8c75c34a8c74 |     
  mips64el   |        host-mpfr-4.1.1         | NOK | https://autobuild.buildroot.org/results/f3bb4228e0adc0affa00f7c830d59bc090cacc21 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/e98d0a3926af48c8c4d8375e9a2c524567b77d8d |     
   s390x     |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/100afa1edbb1a7b1f62bb2e39f1b4381e89a13c8 |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/769519ded008d3c4e1d5feec857f7b88d927bd99 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3567d5fac9b228ae8a2c11adb6b27ce30d55ea76 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/426aa3c4ac9c4f2f0347e6872dd6514be6f6c67d |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b3c43c5f6bc10fed3ee6ade4fc4c960262897c4e |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d6e4bd3d5b7e324e40647ef169b540e950c80b5c |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/a5538e5704587825466990e370de6856566d2100 | ORPH
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/dd087c8fbdbab2063f3745b9d9d978d5a52f8b84 |     
   sh4eb     |        libtasn1-4.20.0         | NOK | https://autobuild.buildroot.org/results/a85ed53bba9d460ef1a916c8a60b98abadf4af9f | ORPH
powerpc64le  |          linux-6.18.5          | NOK | https://autobuild.buildroot.org/results/1381c0ca97d3870900975bc303e2bb3c556bfe9c | ORPH
 powerpc64   |          linux-6.18.5          | NOK | https://autobuild.buildroot.org/results/1365323b973307b652fd891f8649f034077232f9 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/59115aedd7bed43c4df1a86da990c33018b25fe9 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9ca081cd3190b1bff5165dd7f1d960ad3b040308 | ORPH
   xtensa    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/d963ff629eeb799f401fc0999f2b5f4842872395 |     
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/8acc7cccc7ccee765f6bff62c302d481e6b3d539 |     
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/8c920bf7a2562e7f14bf2843dfe41aaf2676409f |     
   mips64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/1dcd52959c3bac31ac997c5a70ac608bd413f281 |     
   s390x     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b920f70ace8c2631915075247cd5d34ef06cd460 |     
powerpc64le  |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/d409d5b49bf900af0939c009c86242cda1d8bdab | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5e2d9103e08459de615431ba7830fe26646563e9 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5fadc763b1f0b3436e7469b5e8ab3505e523d3a0 |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4b3e3cacb0bcdd7d96fe6c799985d4031bd5db6d |     
    arm      |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/ef45798c7d0ba9e5716828b88c1932e26d163678 | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/9134541af4812207f2ec290304aed9b8fe52f26d | ORPH
  aarch64    |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/941aadcad7dd57013be1ac325f2e5ea5e7a13df2 |     
microblazeel |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/db28ebfd8bfe20864f37858e8d5746d1062cd5ed | ORPH
microblazeel |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/b5cd0d3e0fd9ca92596fb3f684b61d6a6748d51c | ORPH
 powerpc64   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/c253bdcbb17236a9967c93f3df491d7da228e5c1 | ORPH
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/13815c62dd4e97fb7134d34b2e348a33c176fdee | ORPH
 powerpc64   |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/91115ad556a943c4642fb95eac0cebc56b6f5ed1 | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/db5c24281870c97dd3e45897f7abc8a6f00dd998 | ORPH
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/6a7d0d01631b7d011867c5c7ffa567bdd748bbba |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/efd726444208a455b953de2d56afaa1b4b8db94d |     
    or1k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/ec61d1ee071f5732658b523b6cf5fc4c1d1aeb59 |     
  riscv32    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/591c100869725f34680dcb15914589e83562e796 | ORPH
    or1k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/db49a99e75558d5c9e56cd9cf25433da53c8f978 |     
   sh4aeb    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/d1f233ac10ab14abd6dcb075f0fe804b6fadffa5 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/828123d9600e9b8de0302a14b025721bfc8e42da |     
powerpc64le  |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/baeb7208f5691ef1a9fd8431224a8449bd9f1bfe |     
  aarch64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/2ea73a9b581d994d8eef84d2cad741e87e049eb3 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d2be17909d8344af06fa04cd3afe8978e12fa6f4 |     
   mipsel    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f5c6c969c2c1d1d05191109f2bbc00aa43e1f641 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c093877ebdbf3191b87b83bc7d154e6c53d185dd |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/9c44b64c03fe81353c0393104767c5029bd96606 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/2913b1aa5d338c832c197d6824c213e66a44aa2a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/10482fbbdbf5e6315b42ffc00dcb6cda398a18f6 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/07664e2e86c645a3be917f302bc1d744cff0889d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/9cbf800bc8c51fb3b40f6a525929075739c6286a |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/acaf1e32c3c577624efdceb4a37ff022d0f07894 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/004f8a71b70738e9374b1d5922bc20962d718392 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/fd2b78b4ca8bee40e3c1fe93398de580fea83dc2 |     
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a52ccbec5e298bfc957cbd316ec4019aa2143310 | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/83bba4d6106ead7476a134f67543652997361304 | ORPH
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/92333479143c4f2ee51b9d831f7f0c7efeab7c78 | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/3c87fd64417d6f8e5a873a4512a921b11231fd41 |     
   xtensa    |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/9a7d8fd7afde09e08b8de420242d628a33e47e5c |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

        ltp-testsuite-20250530 | 2 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
      host-uboot-tools-2025.10 | 1 
            igd2-for-linux-2.2 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  libnids-1.26 | 1 
              libopenssl-3.6.0 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
            resiprocate-1.12.0 | 1 
              tailscale-1.78.1 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/accc98df13f4f1adf7abcf34f773f24cf6720e65 | ORPH
   s390x     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/ab0804790b227abedaef3f79b2b93695b3e4d79a |     
loongarch64  |    host-uboot-tools-2025.10    | NOK | https://autobuild.buildroot.org/results/295bac24e8c399b9ffcba4f9222ae121aaccccfc | ORPH
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/48ebad73b407d5f1e63cc29a113de168e19ae064 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/ac8fa8855eb8c1e480b8c50146a86e526321705c | ORPH
   sparc     |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/2d3cd14c2633f89c5d7614dc996c1847545e38d3 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/054972e1fef39524235e75dae2c0adabab56e260 | ORPH
    sh4      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/92aa47e0100369861e8ce166a86edb07f2db2dcf |     
    arm      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/0055398d4fb12cd4717399f9424d6fc442241ba8 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/208d24236a18a02190f8ccfeb31f79cf1d99ebc2 |     
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/d012b57d63e2d0f40f5cd0febdbce08c4f0a412f |     
microblazeel |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/1833522166312ab4f2fbd50b43b7ad3b4734248a | ORPH
powerpc64le  |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/8d20cd88d3cdd47e467ba4cd0468fc3eb647d726 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/22e6c72751d4889055827f7be65c212e9fbcba4a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 7 
           host-libselinux-3.7 | 6 
                       unknown | 3 
                  libsvg-0.1.4 | 2 
               asterisk-22.5.2 | 1 
                  boinc-7.20.2 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
                libglvnd-1.4.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libsodium-1.0.18 | 1 
             ntfs-3g-2022.10.3 | 1 
             parsec-tool-0.7.0 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/422f4c26af2af9a9eaa1a736a1179e6cc3c530e9 |     
    sh4      |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/834a9f96d7089d879d788085034add8f7486f3cf |     
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c7d9ba04fb2bc27d080be356f4976bf041e17f02 |     
   xtensa    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/d08db0ab0dfd65067df89f854ef4b142a1b218a2 |     
    mips     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/e0fdb527047064d13695ff0eea2efc60e3242f5f |     
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/27711fe65f44b9aba985e0db4ae78830f8986096 |     
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/628a7eb56989ae8ae09b12654da45209e5deb387 |     
  powerpc    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a0efe0d2640f0997d1e0ed5a37f348397c59d2a1 |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1e8a83844ec43360e7221488e172dfb25348fdd1 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3f9921639eb48e24e8bd76efc6aaa6432e02b9fb |     
    sh4      |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/a243b51b131f5ba816cace294a38dbb1377210c5 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b20c9b385b00608fe8202b8bada5f8df635e9656 |     
  mips64el   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/3d1b03a0c300e95c771a549b3d84e43c3b99d3a4 |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/4302f084df629665c5149a78a22d8e08524fd18e |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/23603552510e0fe1c1bde772426259c69865a2c9 |     
   mipsel    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/fafed4cc14cd7b7f5fdf213b56743de8f1dacc6b |     
  aarch64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/e2ee0a8f97245bc2f54f08cd0d0e61d23296c9b0 |     
  aarch64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/9316baf195c12f2372ae17d837001ab298ccfca1 |     
   mipsel    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/0869bdbafdfdd3d77d1139ed25caf819b6d9c829 |     
 aarch64_be  |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/b143ea39c710186c27f5f7a653f375ec582f6f47 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/18b9a34f288896b1fc7bfb1b0fd88e7973640dda |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/caf4e03a69e6c6effbfe6e255a6566be3a05d16f |     
   s390x     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/a16bf4dd058619cb18c0f052a3fa82e4968144e2 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/11efc5573847b78694b54b0c4453b8b8caa85df0 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/65522850d228019b2e42d0ce54d9942d46de644e |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/09f9ca4db0cc4d23604c8bc6b8cf0e19d0dc6a3e |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1143b1ef61d89eb4e5d29e5429954f164cc90b3 |     
   mipsel    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/a3eb794a5d20f02f3e659f827182399d17714190 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
