Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3289EC61DD3
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 03:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0FF80DCA;
	Wed,  2 Sep 2026 03:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNHwQfMnoJdI; Wed,  2 Sep 2026 03:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788319580;
	bh=N82ixZmSkVPIxq2vhjEgY2tpWTltGMu5vHyXsDa6TT4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kKzA8cmIB6N2DK2JLiqN6MKnF04qg2n6cnU/gSYY0eIaB0EbPZ9yKsZBe2s+2pNUE
	 uVR7Neyxb1/LDyBxo7yVpEzZKdVKMXncdX+dQlO2knJxbDPZhF9qbZkrYNfWS60wSK
	 1K2PyyPUhuDn5DyXC5XLH1e76gMqGWm/7VyPSjKqMbiD55JvU0M8pwP95ww8kt4COW
	 Tbte92v8URBkAYcbf5KkRohgVUfJ8QYFoFOEXAGJsGCwHUtqZTyHVWX9INjbHEujbA
	 okQUqniEuIViZrpd/2x9YI18k8HAjzYH9KOtjS9hiiQh1+J1tysVfJSbpxOG5dbl2K
	 rK+n85SClsDbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B3E80E27;
	Wed,  2 Sep 2026 03:26:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 804C72FC
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 03:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71FF640076
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 03:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNsxOxgu948L for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 03:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=guN+SOZZ
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A49B84002B
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 03:26:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48431648f33so1319896f8f.0
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 20:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788319572; x=1788924372; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IB7jrMZXye/1A1kKKdbfSueq8AKX6hOvNRqPR8Ftutw=;
 b=guN+SOZZgDktIqryjMCNfTPSw7qSrSHFJapiF1Jl/n0k5bp4TxDMcKb7S7at/fVTQk
 NzCPd/Bc7/kLQ/+tI40Gc0/iBHowpnyU7igQsByOeyMp0j9PZ1ejpXllVruvF3xqdOu6
 ruJkZaxxwcBjwHzVoYVTHGuuRVhdP3l7SW8gkSjIvKcGaaDi/PP2uK+5Suff35HP5v2h
 +7Q6nT8BOkYpdulfW4fiFmnl0+AQtsQK3Kl8eKNVUctzAEhw7QWuas2q03YTrz3H7mAA
 YiFKyQZgGhK9tC1/Wg1x7PePgggbkLn3rhLTcPDsapGSuPxlc5bv1WW3QNbOdpPJFhua
 DnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788319572; x=1788924372;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IB7jrMZXye/1A1kKKdbfSueq8AKX6hOvNRqPR8Ftutw=;
 b=FUHqUIeYzFW66y37MBZuSih9enHv+30cYZGhwsc7zAz3EzOmbkq+py6NtMV8NmEld9
 AEewWyKXqlAu7QvjPGRpwM2/8diW8hyIGWxjDeGyJl3/0gIeHPwEkW3C8s2/zuAc2lTO
 Z12fW/pR2AkmHPDc2jVe7JZdG39Oz9UA5yLtJxMtPmKTEaT1lQwM7rrP6lUC7y2QLhqf
 D0NltqwewiQaJB21fzlGpNRGHY4DzHQeoZ5lvAcl60xoxkBZ1SjkCRirXlXLH0CXnqLc
 P+/eJE30w3fBjZUFG/LDdD5zZnL286pBFyO25h1xD2eVOgvDVLZq3sGsAxxAagpgOUoi
 441g==
X-Gm-Message-State: AFuF++lGLG5NvviHYAL8xsCvOAsqK2270zB3126Gdg4zfL3wqGiAdzNF
 gcT2JudRYmRfKLIl5eeNPMjHr3djye6xZdU07YNVOJAy1Yu5TAnQqMcp2EBR34wuPRw=
X-Gm-Gg: AR+sD10ZGlxGCUPU6rsZGdA6dkjxKW2oa5NAF0z8IK42EX16gUCWY/PhPPDCgGb2BsA
 JXaHiY8LGockAUs6om76k1kpGnPgXSINXKoQKqMYXH0T2h1vTkM1ueGQH5CbzxVYqBXaRy41H/F
 IzCQRE2l6IPKfCjXj2RYKywxXy2L+Fh3UzLy6U9oYDRBHmtxEvVotjIEmBOhh4hhoA/VhJHWZoW
 9oXafMcUdRFAVSI8rDTGTp1TQr1Z38dzjtJJMTb2K+7xQVe8OgEDR3aVquAt59p0yiws3TejA+i
 Z91WMT6bqeqdWurBsMirKomFwNQG23VK6jpqHGDOsj6F+ObFGNIy5Rm4efhXGzQqAOB5C8zIuKf
 brhRC0CGv8Z5rapI99qwKmgaBKq8l2Ar+azMtv1DVuESulTjx93+k62YnaQ69lPhE+Ts20/wjEP
 uT4vdluzlbXXWzm+LteaiPmCeY7dJs0QfG9RYi557HpvtHP+pfBGgRQE3B273ddQs=
X-Received: by 2002:a05:600c:1553:b0:493:f783:c46a with SMTP id
 5b1f17b1804b1-49ce7c27099mr1681965e9.6.1788319572309; 
 Tue, 01 Sep 2026 20:26:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm31145095e9.1.2026.09.01.20.26.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 20:26:11 -0700 (PDT)
Message-ID: <6a979753.85d9e9d2.d6cb3.3be2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 02 Sep 2026 03:26:11 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-01
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

Autobuild statistics for 2026-09-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 24  |  0  | 31  |
  2026.05.x  |  7  |  7  |  0  | 14  |
    master   | 50  | 72  |  0  | 122 |
     next    |  1  | 12  |  0  | 13  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.86.0 | 5 
                       unknown | 4 
          host-automake-1.16.5 | 2 
            host-go-src-1.26.6 | 2 
                  linux-7.1.12 | 2 
               linux-pam-1.7.2 | 2 
                openscap-1.4.4 | 2 
                   perl-5.42.3 | 2 
               tcf-agent-1.8.0 | 2 
                tpm2-tss-4.1.3 | 2 
             alsa-lib-1.2.16.1 | 1 
                   atop-2.13.0 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  botan-3.11.1 | 1 
                bpftool-v7.5.0 | 1 
                   ccrypt-1.11 | 1 
                   dante-1.4.4 | 1 
                diffutils-3.12 | 1 
      docker-cli-buildx-0.25.0 | 1 
         docker-compose-2.40.3 | 1 
                    emlog-0.70 | 1 
                enscript-1.6.6 | 1 
                   exim-4.99.5 | 1 
firmware-utils-c42a3bc53da8... | 1 
              fluent-bit-4.2.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                gnuchess-6.3.0 | 1 
                       gsl-2.8 | 1 
            host-binutils-2.44 | 1 
                 host-gdb-15.2 | 1 
                host-gzip-1.14 | 1 
            host-mfgtools-0.02 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
                iproute2-7.1.0 | 1 
                     kbd-2.9.0 | 1 
libdill-32d0e8b733416208e04... | 1 
               libecoli-0.11.3 | 1 
                  libks-2.0.11 | 1 
                libsoup3-3.6.6 | 1 
            libxkbcommon-1.9.2 | 1 
        linux-headers-5.15.219 | 1 
        ltp-testsuite-20260529 | 1 
            lttng-tools-2.14.0 | 1 
                  mupdf-1.23.9 | 1 
                    ncmpc-0.52 | 1 
                  newt-0.52.25 | 1 
           oath-toolkit-2.6.14 | 1 
                openocd-0.12.0 | 1 
                 opensc-0.27.1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 rtptools-1.22 | 1 
                    sbctl-0.18 | 1 
                    szip-2.1.1 | 1 
               trousers-0.3.15 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/26020d2433a5a1042b02f7c618ab8c7ab64070e8 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/614be5fa677199a02f6eaa74ffe43ee893a2031a |     
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/eaa721a23d8c557e353d90213d787002af96e453 |     
    i686     |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/aa19ed8e7b6694e241b3cb6ea57bb9e94d6af40d | ORPH
   x86_64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/6f37124f768163baea1a218e4d16b9508ab4ef20 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/466a052cc625df4d5ce99817ee32ea9115185d60 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/818276673ab4145aa43055928c440eab5a7d4575 | ORPH
    i686     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/b4b4c2dd98fcd30236bb3044384edb4b644c76f0 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/f562c7ddbd24b06df3760562706c8fa357c6ce96 | ORPH
powerpc64le  |     docker-compose-2.40.3      | NOK | https://autobuild.buildroot.org/results/03bfdb3cc7b87a12bfc0a02348b6c832f0bca7f1 |     
    i586     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/4dab1935c53c5d6a38ad0ac22105bd62002e6843 |     
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/a76887a86205b39c5580d535720f30196c8e1ebd | ORPH
    i686     |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/0751d9d7d34b155dfbb0faa4915e56024fa80d37 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/8d37e498f4627ac22cf5a40de848fdda7bbd77de |     
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/74f0d1c31e113521f53fa18919a5bdfec6fb8022 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fcbee846b70bc32470e3d1d61571f79e92ea98af | ORPH
    i686     |         gnuchess-6.3.0         | NOK | https://autobuild.buildroot.org/results/ee26f6fc0c3d42b75e1f4ffd9666a01296a218f2 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/4bb2718b3604252f7c9148f19781cd05eef41789 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/912fc78a2ee96f3386fb7d2027f58b3019385ce7 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/3f29184c3b0afca6a7553a8314299fef5189c025 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/a894cd8e525cc11365c66cef7b06d903cfe8a060 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/e391615af3ff71121873f5a97d449d0c14bc5279 | ORPH
    i686     |            gsl-2.8             | NOK | https://autobuild.buildroot.org/results/20c2437d93a5e58371b7c8d8c425cc9f5467bd53 | ORPH
   armeb     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/1ede7bf249d6d74aa05f0c0e24777b20707d153c | ORPH
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/a7aea92aebccd2f8d2f6cdb574b1f7fcf2f15d59 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/727135c34d9ca60f7832ccdaa89c09c6c6b33c54 |     
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3229287696301b5aaebe2a76ee5bc257bf649cca | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/23cf8ddb5fa90db04a87d0901cbfbbb5f66c1352 |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/d78b5f7da832bdd22cd06b9626710db8dc632087 |     
    i686     |         host-gzip-1.14         | NOK | https://autobuild.buildroot.org/results/94d43f5060fd1ac7b5d623a9824ec89e400ff608 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/0341f331588900defb7427da62afe17f97545ae5 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3a1a8c17294604bf0d2ee64f4883f41f61f04ffe |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c0dd3a6c573e18740669a81575263919729b422c |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/b1164d1d8688766d1658f433f57a5bf6fa78d1e0 |     
  aarch64    |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/3e0ba9709c5fbd0ac5d0bf00535b58d866580313 |     
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1e8fcb0e360b7dadfd0679eeb46c44416a731b2e | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8420ed2ff78ab38b37db6e50d6fae610f41020d5 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/73d9e29e7b899b2b66b487fb286df8f03c9e15d5 |     
    i686     |          libks-2.0.11          | NOK | https://autobuild.buildroot.org/results/a8eb7aeb0a3766f1ea2cdd67c4331352d67ca39f | ORPH
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/27c751024d2d2dcb50b331c5ccf29abf0f6d40dd |     
    arm      |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/02c0696ef790f724a34c28c33486c1301a236648 |     
    i686     |          linux-7.1.12          | NOK | https://autobuild.buildroot.org/results/de7c195b2aecd170d81c3372e22dd119760947eb | ORPH
    i686     |          linux-7.1.12          | NOK | https://autobuild.buildroot.org/results/b940016d36d2a662916d631bef21d9e7dbca932b | ORPH
    i586     |     linux-headers-5.15.219     | NOK | https://autobuild.buildroot.org/results/b07019e04beecbf09ab4030b357232ec8f9a131b | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/cce932a7f01b5401aba1dcc5bce430f82bc46912 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5e0db5d74d2ef2473b77beba152eeb9c8bbb836c | ORPH
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/cd4dc3236dee7ea5fd6ad481b847615974f7d98d |     
    i686     |       lttng-tools-2.14.0       | NOK | https://autobuild.buildroot.org/results/65a287de38a344ba8854dd9f37b8c159ad205802 |     
    i686     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/266efd2eceb3ce05d76c0b50581c49026ea5042d |     
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/b97146ba1b4996b644c564898f5633dd8c0d4b83 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/d5d1a20d6a665bbf18686f72c5adb2c337cb8cf3 | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/6c555aae5f108d35a023bf39bc1fd66f784bca71 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a736656eb5bf35fa37b045747acf326a57f042af | ORPH
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/ed8f3c2332e3b333785539bee7211ccd89351810 | ORPH
    i686     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/d11d0b82dcdb4bf10f6c37db8bdbc42a78bdf28b |     
    i686     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/4397a4ef94ccf482f1ab9d24b6334adb0222a580 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/403a8a9e9c58a0a022500e477dd7b092f712f488 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/573b48eaad4330534dd27f6b0dead257e421b1c7 |     
   x86_64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/540aad99e03b52cdb727ad7083ecceeff979b079 |     
    arm      |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/28be549071f17d8bb0ebb30e31a75759e5cf7e9a | ORPH
    arm      |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/061bc430aa2a124b5eb8ea359797f4e9d3234809 | ORPH
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/69c2a3d35a2e31e543b6efb368ac6bce79524334 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e27e8ba73af085da2d0b5d6838454ac59c6671d8 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2cc41352a66ca9ddf2afcba8567741f8553b2b3e |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7c6659067ec476c93024ed2561325da891159e9a | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/6c35dccd441b8ca247e8269cf4ca09089d4d9b65 | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/1fc8947c97b8da5cbf0898ef50f2019b352e07f8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f43e283c3c1a6240e79136394bc9fb62867c35c5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0478486a13818600974509b85c152b4cc9c3a53b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d761963a2a7a26e80b4d2f8cbc68c5f490a734e9 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fdbfcb09c25dc43ccf99328ea86ce0584b434cd1 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/69eb45715888e297024040acc5e33d15ae39ef29 | ORPH


Classification of failures by reason for next
---------------------------------------------

               linux-pam-1.7.2 | 2 
                    flex-2.6.4 | 1 
  gobject-introspection-1.86.0 | 1 
       host-gcc-initial-15.3.0 | 1 
            igd2-for-linux-2.2 | 1 
              jpeg-turbo-3.2.0 | 1 
                    lua-ev-1.5 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
              openconnect-9.21 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0a400bebf5b423269a4b208bd7f73aa6abf3e7da | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/44ef9026d3cae6234436c06999619923af5fff00 | ORPH
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/aaa4ac0818660510db79124157350bddc6156b17 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/62a9e8e744c59080f6a3f97f69b6668c023632a0 |     
powerpc64le  |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/47ea87c84b30ebba46a34c9f1a5483d72d48c21d |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1b4ea5373c8d7b9126f9b40eaa2a79e7091a770b | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a83f700e99edf839d5f45ca47935267b3525f353 | ORPH
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/738415b2a8542a5339a1ec3fdee36664a00ca24f |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/946834bc10d846b2cd901283f02a3180d506a71c |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/bb3d226731ecd2a0bb8a2772257f9cc6ef8b2176 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/46a5e199bfa4eee5675603dd5783e882e390b8a1 | ORPH
    arm      |        openconnect-9.21        | NOK | https://autobuild.buildroot.org/results/4288a485bf2fc5de5f81a889b44c0875db9b110a |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                 avro-c-1.12.1 | 1 
                  bcusdk-0.0.5 | 1 
          cloudflared-2025.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.84.0 | 1 
            host-libtool-2.4.6 | 1 
               linux-pam-1.7.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/ffb67cee6752ebf4f8e71c8d2661554effed4fc7 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7afaf4754382cb93d42b8f8dee9b622d8f2fc9b2 |     
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/83e592d69a135f90843907362c3373e3fa353280 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/335e6bf864abedce6fc17bc63dbd2b388b894bd4 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c404e30ee031eecf15f88e60ecc192c00378fb01 | ORPH
    i686     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/80ea63ad9fa376401db1deddd6166e9d7dda5e23 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/889c3f7aef4a0105ea790bb78ecfa84561fbe9d2 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.4.0 | 2 
            host-libtool-2.4.6 | 2 
        host-python-lxml-5.3.0 | 2 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
                   dillo-3.0.5 | 1 
  gobject-introspection-1.82.0 | 1 
                haproxy-2.6.32 | 1 
          host-binutils-2.43.1 | 1 
       host-gcc-initial-13.4.0 | 1 
            host-go-src-1.26.6 | 1 
               host-ola-0.10.9 | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
                memtest86-7.20 | 1 
            nodejs-src-22.22.0 | 1 
package/linux-headers/linux... | 1 
             parsec-tool-0.7.0 | 1 
                    polkit-125 | 1 
                  sysprof-47.2 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/fd9464ad3e7191a7552c24ac2e78aa5d9838677e | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fbee849df2462533615530bf71e0cc52524fcf59 | ORPH
    i686     |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/2a59155eb1fd4715c1391d7a1b4991fbd60aaa82 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/35f5b5b24ecfcfc4aec846bd2b3d3db617c9ec7c | ORPH
    i686     |         haproxy-2.6.32         | NOK | https://autobuild.buildroot.org/results/fd253d62c58cc35089efbc10346d6d7097b32cf8 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2fea7321147f42cf902c0f90918a4b54aa73abb3 |     
    i586     |   host-gcc-bare-metal-14.4.0   | NOK | https://autobuild.buildroot.org/results/9681d77f148b83efae2f4a4fcb79219ced96f23a |     
    i686     |   host-gcc-bare-metal-14.4.0   | NOK | https://autobuild.buildroot.org/results/1ec8cae058c36b756cfbc369c8c422081f2a35ae |     
    i686     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/409d24f1950d8ddb7a49b79b92a73e4682535759 |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/94f5e4495051a509189d38b18b053260e54fb80a |     
   x86_64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/91ae8309add6188d526beb5ade4f30196c7590f7 | ORPH
    i586     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/734b5464914151d7dad28bc587f22b5c79b0adeb | ORPH
    i686     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/266d69e92cf8b432285d4dd378f7322a9d8c67b9 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e1c8e2c661b3ddaff2dd6cc505b769551a223bf9 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/82cbd742933195ad36c352ed6d35975da42f3d85 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d219ecbebb5e24490cd2e8aa363fcecb5762ee50 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5e99f3b653d2f267787f20cfcf04115b8e879c23 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/30c05be65881cf37d4c84c8646304aec3ba87bed |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/1aba26f1e1a46ee41fa40bb655d568b000a90d7e |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/f0e6de264adaeb39f7446edf9bde2db858aea13c |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d52d09b2eeef4460be758d31d5a4e95f6d998f04 |     
    i686     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/37a5df5bafd0a9645aebef20fe29fe25ea2b5f31 |     
    i686     |          sysprof-47.2          | NOK | https://autobuild.buildroot.org/results/878e9543473447bbf59196358d8f3df012a7974f |     
    i586     |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/988a92424f91d3547394ff37216cd36e3fe96ef1 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
