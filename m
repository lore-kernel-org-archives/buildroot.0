Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F5CD4F3C
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 03:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4175A6F6F1;
	Sun, 17 May 2026 03:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-MA8lI5029P; Sun, 17 May 2026 03:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D886F6F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778988102;
	bh=ETJvRc3iX2KbCUxbu/NMgYfZnxYTz/vDP9So1aUFNYI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S+NPuiojh5Gq5zME0EwPM0BZXIEq1UUyV3qN2XDYKYuu54q5iKzM1WRUlYUtgjAdp
	 fDfBvrIR2wmJmlTMhdRw7FMaJJOTWwSXa2TxyLpdRr0G37NIXWeZPu3mPTUCEHtYdr
	 3NCGr2G6fVt2WjoXn5MZg3LirsVWp3H8N2gnmPZJCJj1H9EJIQJ1Bq4i8Gq5XtnAbH
	 Q4gvv4MDeF3YMm139nD9EiXDw34Jo56h/3waPiBM3Sj2PkVqzRVbpJRojqYdz21css
	 Fc08F/a9h2Bt6c9FcxhICcThQ31dMx3849BBoVWQYOOfgJ6doFS193hpp2HgSymntY
	 CS8zEfje1pQUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D886F6F3;
	Sun, 17 May 2026 03:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E13D786
 for <buildroot@buildroot.org>; Sun, 17 May 2026 03:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53F426F6F0
 for <buildroot@buildroot.org>; Sun, 17 May 2026 03:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LndJEd8KJBNt for <buildroot@buildroot.org>;
 Sun, 17 May 2026 03:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08482607D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08482607D3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08482607D3
 for <buildroot@buildroot.org>; Sun, 17 May 2026 03:21:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so5740645e9.1
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778988097; x=1779592897;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4+FP7UOIL8tMkNFPgGav8/sbjp8xrlyQITRv4OgLkw=;
 b=TBZrKRTF2+6oAwilxL2hTmHYs+fIcmkkZXK4w0haXtBQa0Dv4/jXbp7DkbxAJ6mvg5
 XWGLOsi4Rt+oo4t7Ws61DPJR0LxXyPui0jI8524QmfmGtB7x49Xl63Fqg9sP3qOc2K57
 KcM+7ogJD5wTUgF0W8sS/lAkS75YbvxvTtRArA8iSPmai3rG7Sd6KFHpWHcGaYkWys6D
 hn1hcGOMoTyh6q0ZDAfCH9AOnZ1W71d+xUBT5zjz5quvdFMc5JzgpyHquz75J2roi2Ab
 WaN85RDZprNXcvtjbJvjfz2hIDXci3Q8oPqqsQPcCo0I2eAKLO05erp4rO7Rk5CuYaxy
 bTCQ==
X-Gm-Message-State: AOJu0YwOidp6F/UmdNBMyxvRknBetY7MPN2TJYWfYWmrZ4w2OzjmuUC8
 IJoTwf7cP13OHrUb9B1bvm/VtJasqtSO6eSdgAL8W9eYhko38RZdlEYdgBuMwd0o
X-Gm-Gg: Acq92OFZDeAdWfKYW0KgFfBnTkdSUaDyrPjfrrHpGsdsIHR0GAcIS6mfenAChlzj1z7
 ayyMirIlLA/oSe0sAsu9/NpOcIcFfD91JpIRYxwXCELF+5aJLYDe7nTCtFHhFNf+DlpEoerlx69
 VDokzI7CtFf+KKeDRvriUyvWuA/9loR3MaLbKJKp1uLWIPjBlVpi9rcMR+OMkBIOKJubJegLB6K
 ss1TnYeth0Nm2HcTAeu55oh4bfvPIr/6+unBlnAw78GRhR2JVubA7m97Dixg+bfAOQUEChDohbi
 JNULF7LF3kuiIeu1E4AaUQ1P7mfg1pla8baje/8cjL4Io7CwDS4EoaxveWhFie4hxxkqeVx3WP0
 Ggb+1uI6uu/SzSMOd0ztJUvB6cnJQm6pXLEL7fgW92lKECHq/cBDYuIMbIC4x528CH8YjitweMa
 r/t9VhUc4JST99EEXzv8erHS4ivWdsUA==
X-Received: by 2002:a05:600c:1914:b0:48f:d620:c27f with SMTP id
 5b1f17b1804b1-48fe4dac5efmr140453605e9.4.1778988096338; 
 Sat, 16 May 2026 20:21:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8d39esm164704585e9.7.2026.05.16.20.21.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 20:21:36 -0700 (PDT)
Message-ID: <6a093440.a485311c.25f07.3084@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 17 May 2026 03:21:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778988097; x=1779592897; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=l4+FP7UOIL8tMkNFPgGav8/sbjp8xrlyQITRv4OgLkw=;
 b=SjcnmxvZG9qo4Bff6ZLKhCaJvkGgLunFjiT5+CYcZbw0oCAZq9StSsGUlqiJYHPtgU
 6HIOmv06JxVEuIXnB+UcmgA1KC+YV/C2DawwckvSWbRACjWFBH+2VPoh7E9gKaywzdQ0
 /gPsovfSfQtDRBMxnncotxRPsmqBkZYBkHoouRTP2wNuDSPjP7+/ZO5rd7gbaKGUrOD2
 2au9Le3ENr58OaOXv5E4hFpzjv1dKN1fje6R7a9lJ3isghfybLlVEjxPxxmbwwDKJYI0
 DQlN+jiGmL/SSPefw3+LQ4KNJ/K/vTznT5fBEhhZNtZSBbMg7pVHOkTfVkCLNfyMyUTc
 9liw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SjcnmxvZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-16
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

Autobuild statistics for 2026-05-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 25  | 49  |  0  | 74  |
  2026.02.x  |  4  | 22  |  0  | 26  |
    master   | 63  | 147 |  0  | 210 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
glibc-2.43-27-g4070d808bea1... | 6 
    host-gcc-bare-metal-15.2.0 | 6 
                   perl-5.42.2 | 6 
libdill-32d0e8b733416208e04... | 5 
               linux-pam-1.7.2 | 5 
host-gobject-introspection-... | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
             pptp-linux-1.10.0 | 4 
                libnss-3.123.1 | 3 
                openssh-10.3p1 | 3 
      passt-2025_06_11.0293c6f | 3 
uhttpd-15346de8d3ba42200249... | 3 
                haveged-1.9.19 | 2 
                host-odb-2.4.0 | 2 
            igd2-for-linux-2.2 | 2 
            jpeg-turbo-3.1.4.1 | 2 
                 libavif-1.4.1 | 2 
libfutils-c326ce0cc2a735438... | 2 
           libmicrohttpd-1.0.5 | 2 
                 libzlib-1.3.2 | 2 
phidgetwebservice-2.1.9.201... | 2 
python-remi-2022.7.27-37-g1... | 2 
               tcf-agent-1.8.0 | 2 
             util-linux-2.41.4 | 2 
                apr-util-1.6.3 | 1 
                   bash-5.2.37 | 1 
                  bcusdk-0.0.5 | 1 
               binutils-2.46.0 | 1 
                  bitcoin-31.0 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2025.8.1 | 1 
                   cups-2.4.19 | 1 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.4 | 1 
                    ficl-3.065 | 1 
                      fio-3.41 | 1 
              fluent-bit-4.2.0 | 1 
fs/cpio/cpio.mk:128: /home/... | 1 
                    gawk-5.4.0 | 1 
                      gdb-15.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gnupg2-2.5.19 | 1 
host-gcc-initial-arc-2024.1... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
host-google-breakpad-f49c2f... | 1 
              host-pahole-1.28 | 1 
              host-rust-1.95.0 | 1 
host-vboot-utils-7dfa482d6a... | 1 
          host-xfsprogs-6.19.0 | 1 
                  iozone-3.508 | 1 
                  janet-1.41.2 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
                  libbpf-1.6.2 | 1 
                 libmbus-0.9.0 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.2 | 1 
               libunwind-1.8.1 | 1 
            libxkbcommon-1.9.2 | 1 
          linux-5.10.254-cip72 | 1 
                   linux-tools | 1 
                       mrp-1.2 | 1 
                 nettle-3.10.2 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.32 | 1 
                openntpd-6.8p1 | 1 
               pcsc-lite-2.1.0 | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                    sbctl-0.18 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 sqlite-3.53.1 | 1 
                suricata-8.0.4 | 1 
                 systemd-258.7 | 1 
toolchain-external-bootlin-... | 1 
             tpm-tools-1.3.9.1 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.04 | 1 
uclibc-ng-test-132c6134d691... | 1 
               usbredir-0.14.0 | 1 
        util-linux-libs-2.41.4 | 1 
                 wolfssl-5.9.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/7798467f0f1da75e859c5f32c9cf1d695764edd4 |     
   mipsel    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/c6aaf89c7fa1bb23addbf286d01f2c98b2378225 | ORPH
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b7f7c402c7e8afc449da8ae0688d8dbe3816663e |     
   mips64    |        binutils-2.46.0         | NOK | https://autobuild.buildroot.org/results/88c43c303b5538a3e75e7583984433ed2ebfa96c |     
   s390x     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/121c3a76ab347630a5af7b5bedd1ddf47139fc9a |     
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/98408b5fd8a72929fafaa7380de4b0ff41b1091b |     
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/3e07eccb2bbb65d58e4812d8762aa2a699188995 | ORPH
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/121b63399005ce9ee87d2e0301203f78af336667 |     
    m68k     |          cups-2.4.19           | NOK | https://autobuild.buildroot.org/results/6ea7bfaaae27d07db904d63ad46490472c2f85fd |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4d96ab51073c71f1b97c4b57fb14ce355e5adea6 | ORPH
 aarch64_be  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/450a134b49348b832e8773e31e1add89a7afd2ff | ORPH
    m68k     |           ficl-3.065           | NOK | https://autobuild.buildroot.org/results/c10a10aaeebfd70945693065afc653c9f9bb881b |     
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/2b323631d12b6e409ff59e1f91a4f39d000ab551 |     
   xtensa    |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/c09908e5ec26e70e2c32cf092afa5046c7adf63a |     
  riscv32    | fs/cpio/cpio.mk:128: /home/... | NOK | https://autobuild.buildroot.org/results/65098ee6000a0929d1a37cdf35e9e20ffabee72e |     
 aarch64_be  |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/683840b7aa52e5945d408037a956ea17415224d0 | ORPH
   mips64    |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/60ccf9d2f32ac562b2e2837dded6acc39db12899 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5d4326c54aeb8bb051fef81006ee7bae411b2989 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/210fcbf811da747539e60cf867491548ab7d45f3 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/b07fba818ca8f4c1656183ee12ed5b67e267a9de |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/cdf438bc9c10f5555e45f282a5fb6b016b3ae25f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/f44a73dfc186debf324c913abceee47d4abd9175 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/642c0399de8fe081149028cde6cf538923ec258e |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/62c7a4423a8042fc567e924fb6176e4aa21c8557 |     
   armeb     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/424f13a1b63e27fdb289d1f62c906c0eff022a0f |     
   armeb     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/533d53b86a98bcd12fd9a4b2652e4164cd7afd3e |     
   armeb     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/4b9e343e3e95929937d4640b652ccf3be3734991 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ed8ce1d8563e077f7ba5382d67fc7e33e7d6fbc9 |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/eaede59dc71e5668d664e0bdcf3348cb99e05d15 |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/cf5b890cfadd44a8a52af85b0b05a8e9cd176e0d |     
    arc      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6183670c6ebb65494832812418a4d6db9cc290ff |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/585f5af7273db3f3c543fbccefab7e85661da121 |     
 microblaze  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/d357f2959b82f8196139b292cc202b7de165e85d |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/b7488470b4d18821a2fac2064650467d5f2d326c |     
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b25eb68b8204188ecdece0e95e371d22a59216d2 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/303f2ee2541c788294d1d1f3121de798678bd641 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/056377896853338164849c42da71afad47350cca | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/17cf37571137a7b1cb65361158f1b24afe7ebd67 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/91286b6fc8307820b7b19d2a1603abedad4e5752 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/afbb64d092e075195b409e5f02804b78859f9d9f | ORPH
   mipsel    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/848a94812698ba8316ddaf9454506c44bfd07e77 |     
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/914336a488cd69ec31ced69bdb3db69d1ca2b914 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/31c8d3e99388c4d907879f078889e651b8305aa4 | ORPH
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/46384ee2cec0531fed874cdcb27e5f3585374b5a |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/f3a527b05a37743cc7f80ea7f7e01a7a2e2a6cf8 |     
  mips64el   | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/4d3ff2484981a3a3f65c33f53553b1fdf1ed023b |     
loongarch64  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/ee29e6375fbe40297352699ac19158bdd42909ce | ORPH
powerpc64le  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4fe48fbacbe17e8cce37cfa751a6f17907a46d87 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ab7f27ac096bdaf29af606339d17cb76c93d56bd |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/eed22a3eede5ada3a2152d136b7198a7ca08f26c |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/18164b5897d4e05475942aa2ff2ad3d167dc10f3 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/23066044e9cd8716a422a4cf4fb81a9cb89bb6b3 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/81ab71da9f654e338ddc581740a737fefb2fbf54 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3255cbdcb01fe4d790cb17e71068099eb7c8be50 | ORPH
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/0cf023369887e05282c55c47c20496ffa238a9e2 |     
   sparc     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/201e6325be0596ebccc955b7ca1f829d8c97e578 |     
   armeb     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/c3224575616c3a419c8321b1f1d1773f77d42c1a |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/75022da03bd3e269989967fd8fcc485e11db21bd |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9d53c05e42e42884b4f1982dd07c87a8ac77ba0c |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/65def187d3984fd3a55f7293069ea80c5a754c2a |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/6bd6a63dcc4c2ea12cf9616a61599a5836d500e4 |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8de0524a1a146af2f7a3a93b48cfa5b352acf321 |     
   sparc     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/abb16573b798cd08c24e0a49263fd085dc7491c2 |     
    m68k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/25b248105cfede5a09f82a8d83b3a39a4179ea68 |     
 aarch64_be  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/11a9982958d232fda4e6053d05cc102ea96fce9e |     
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/083a20c14433d4b193d1820e70ef86c134dfd7e6 | ORPH
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/441f389ff7a0ff76ea69c57417fdf13f9d229115 |     
   mips64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/b722e641aa4f97b8bea5365c5be17756fd5a097f |     
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b90c39509bb5771fd66b97ac8d6c94b8edf0c4a6 | ORPH
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/b5ce85d6e5182d569c62055003db80161ad2c3a0 |     
    m68k     |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/3ec160eadf538a2158103b0028479a68860c31ba |     
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/db618065ba4d175551ae57feb85ac00f7aad4937 |     
 powerpc64   |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/2f6d2c794434497d6bef5438dc4f19520a28404f | ORPH
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/55677389170a6fcbf162e3be8477c01bc5b09c86 | ORPH
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/a9f61549b89ab1ec7a4654b9fca5c645ca41a726 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f944ba30065daa552d201e08fec4547b841fa0c7 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/37d5ec0c342764c63d840abd4658f18bc9993b1e | ORPH
   sparc     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/499e756c438c66c7503451f9169ba5a194572636 | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/60bbed545de02f1257b44fbcde58201b324f23ac | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4b50c5a5423601b5885b0eb02730872a78bca1c9 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/bba21d0675e79d9b5f800f66e3e13377f8f46f07 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8b69811f772ea198e1ed715aaedac4e303f7ca2a | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4c9dcc37e4ce9f1dcf1827de42ae74fbced8d7b1 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3df3fadd3148e263e38b26284f000216a8f71e33 | ORPH
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/754959204ff5591798513e25814d6db7b5627dcf |     
loongarch64  |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/2d99da357c2471c62e6ccb8c7a2b0dec8457df3a | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fb8810299e58165b65fa9d6bc3d823be96791a00 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9f8af04c7050eecb3f5cce9e8a58128703d6b9a2 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/692c703ec1e8a084d207e348341e3af9413e5ab9 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ebe3a0014cc80aa4306c64e501ea30db2b049c90 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b57a3658f0932383ae807d7d2b5139bae9658a62 |     
   mips64    |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/7709ce3042a3a362f6add5b3d9edd1b01cabb8d8 |     
powerpc64le  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/e4cd39ae7e203cbdcc9e4c45fae4007d59ca1efa | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/a69f5ab035a7ed9228c72ae118112cce3d84f5bf | ORPH
   armeb     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/1bcdb3e10ba98750e4b9f8538902c2ef4bfcf4cf | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/4a9313138c86a05f8d77f492b4c117bffbc505ba | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2cbde8d739c9abd579bc72cf15d001844abea588 | ORPH
    m68k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6f5a5fa64d379157c7610c641857230c596da393 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/eac3d2f43dc71c8ac0cbdb77f66fca3712f7a7fd | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/886255442671e8a9fe1d253473fc40cf4e677821 | ORPH
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/bc26657c92056995eb58de2b6e540cfede6ae40a |     
   s390x     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2b4071e8b9cb99e0511831a34ba2ecd679c1707e |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/29588a5b0328387485429743932426440c5d1291 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/050cef81da1b6615c86c120ef1c7615b96935531 |     
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9ee97db2690b95cf7081e6331b1f226471ec1538 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/45d32c36621e46f33b6f589fb42935feab3ea5c9 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/3beaac8950c13d1b229b310d358d18c7323002c1 |     
   s390x     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/9716f39c7fec46fe2c8f41bd8345cd516f460185 |     
 powerpc64   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/fc985e0c8742cf77e40e396698b32c3cca3846a3 | ORPH
 powerpc64   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/ba5b3224854759f5d43e493896e3e77cb06a1963 | ORPH
   sh4eb     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/bbfbc6c461e7466d71f89b3df1b994593f029fd2 | ORPH
  powerpc    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/3832b877a8d073a3f19af2a99f7f97278105d780 | ORPH
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4ed2614f39a67cb731d4ffdb37e062e83b60f944 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9dcfb4c1073fe734573942974bea5b66ffde18f0 |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/f5ce1c56d7e37ea8ad422f66aafa53bc8df9aba9 |     
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/17d36815986b2e508eaf18dd8711c1723f6dacb2 | ORPH
   s390x     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/dfd0fc20e9f4fca844fe84d18dbd1db53980bf51 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/7c9a525827952b9ceb4989397587a83ad0b065b2 | ORPH
   sh4aeb    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/75fd84c57ab214bed03e396973c5a1696e2e7ee7 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/229c16fc672d582a9b598350830a258674ba1266 |     
  powerpc    |         suricata-8.0.4         | NOK | https://autobuild.buildroot.org/results/99d49949c2836bca9191ee02d79326a215899eb1 |     
    arm      |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/e0efcc14e1724fefa4474bedf41b25cb956a3e45 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2d6fc66f92dbc8265a40db396d2afaf39aff0921 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5fff4fd2820577b9408a8a8a25c22c994e5666ac |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/8163d2965cf0c572039b713b133284a3f71db25f | ORPH
   armeb     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/1c8d2e666bbd70a4b1d9508c3336a4ada38c6499 |     
 powerpc64   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/59a2167a12a2d3f4ef2d190b19c49d2148dea931 | ORPH
   x86_64    |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/8931d7418533bf012e0cea708e1c0f4c07c76b38 | ORPH
   mips64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/f6781a4b14416cd31cc95d14085bb5b7d9260878 |     
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ac731ac3687bd51a7555d50d03a11a6a48a684f6 | ORPH
   mipsel    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c7a905109d80c8000208a52ef0bea5b01920cc5e | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d93198459616429c23d90d0e3eb8dc38ae57c971 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/11d9dd9c38d6b4d86a465b0889b39af75e6792f1 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/67cfa6f424915d9f56caaa6a66be0f7984fcfa1d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1ee6ef6260e85b1fe6cb24dadafd8c85985973f3 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7a364c9263a4a2a3bdfce9b6bfacac4d58748d0b |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7fdf710e44f57c1c70acba8c2f072cff47c4c39d |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/914ff1a3b53dc3f0d70d4a32de4e7a24a8d239b7 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/b9bd69ec922095003c739d5685bd44014be46624 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/ba37c6d4646f401611e3d8b968f362bbc4dd234b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/3c1a06036ce31ba5ccf4ec441b19c12b16c2562b |     
microblazeel |        usbredir-0.14.0         | NOK | https://autobuild.buildroot.org/results/6e02ace91fb3404d9670a68b72c27a5b9ff53d00 | ORPH
   x86_64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/eb400f494e35abf8ee9d4285d74261a218e9e7ac |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/3e108949b3c39fc391191f86cdee6a42448a316e |     
microblazeel |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/df4f18d07fc1870c182d4d779f4ab1d2ed4c8386 |     
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/39ffc658264ac22e7570ed2dd9a7cd7c44828d4e |     
 microblaze  |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/e0d3d7022df5ab477ece2bc49521e782a1dcf4b9 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

    host-gcc-bare-metal-15.2.0 | 3 
                  bitcoin-30.2 | 1 
             dahdi-linux-3.3.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
    host-mender-artifact-4.2.0 | 1 
              host-pahole-1.28 | 1 
               host-zeek-4.1.1 | 1 
                  libbpf-1.6.2 | 1 
              libopenssl-3.6.2 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libva-2.23.0 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20250930 | 1 
            minizip-zlib-1.3.1 | 1 
             parsec-tool-0.7.0 | 1 
                 rtptools-1.22 | 1 
              tailscale-1.78.1 | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.4 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bitcoin-30.2          | NOK | https://autobuild.buildroot.org/results/7a1d5ea4f573ced9b105e3ae98af2aae50e5dd40 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/459e9e66f061ee709ab62c7c09d3426f2c3f5033 | ORPH
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ab63927b3561fe5fede0d129a4990dc56fb9cd7b |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/5b88b5027c9d532263ae92550356dfa099125ea1 |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/4f79f38af209f5c9140ad3d5441db58e7be658d6 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/3b942331038c5061ca901c3f2bbf83d49100a82e |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/4fa669576bd7d8134feaac4bfbf0741c1d82e50a |     
   armeb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/220a4c8346a7374de4538a14af0f5362fcfc1e9c |     
  sparc64    |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/2b16b3f8929c292f118a2a4bbd93d297829d1c43 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/0c83143627588017b659d03570d8e2c7a6740aa7 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/4b6393d0637aa239dd053cf97029d7b216fedea3 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/03c8fa08a2671fc3cb39489b9cefffde9c02b115 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/e4dcf5a919390f5d3c8eb8f463536a46dfc40ddb |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/141ebe4e19da9aded4ebdbf3201076a0f9ec1a93 | ORPH
    arm      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/3e4ddef0d78707a0336386a64d9ec2ae77a8ced5 |     
microblazeel |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/43654c356eecbbbd5f2347ecc9f0c3710bb412c7 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/76a3943b40772fe6dbbfbcde84d6bf0d0e35eb92 |     
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/0d2e080be3df1fa0d0b5e351e2c69e2231e4a5f7 | ORPH
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/274b7cc0660bc96bda9a4839f6c3c73400942895 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/b8a87cbeeacc9b381da8c3d5ba19c9f55fb4f31d |     
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e30f7185711df635355cbc5df5839641c0594fa6 | ORPH
  powerpc    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/29b231fc69b64cdb4ff9d326958aabc9a82e23ef |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 5 
                   perl-5.40.4 | 4 
host-binutils-arc-2023.09-r... | 3 
                 host-gdb-14.2 | 2 
host-gobject-introspection-... | 2 
 host-softether-4.30-9700-beta | 2 
                 libmbus-0.9.0 | 2 
        ltp-testsuite-20250130 | 2 
                       unknown | 2 
                   crun-1.18.2 | 1 
                   dante-1.4.4 | 1 
          gitlab-runner-15.5.0 | 1 
               graphene-1.10.8 | 1 
              host-guile-3.0.9 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.82.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
                jemalloc-5.3.0 | 1 
             libgphoto2-2.5.27 | 1 
           libmicrohttpd-1.0.5 | 1 
              libopenssl-3.5.6 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                memtest86-7.20 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
                 pixman-0.44.2 | 1 
procrank_linux-21c30ab4514a... | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
             tpm-tools-1.3.9.1 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/bd96782d2025f08d1037a20b07926bde6b58047b |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c6a4b23f06ad18edac2195985a6420dcb068b620 | ORPH
   x86_64    |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/e66e0406bd417b5349a1b56eb980569f13eac224 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/c3789f35a92057b849a9cfcf24744f0ea958b8f3 | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2f6060ca2c1f4aaee2fc03958a39d8ee03ce6ae3 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5f7d240c318681a6be372c9a6f06924116b91232 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1aaf3166c7ba00ec4648020c978fecfd215e1b1a |     
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1cca85327e02a4f53cc492844d125389a4189f74 | ORPH
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3b4d87a6d3486092624d20d2b65e309c16fa8764 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ccbb1ba1f0e3c6af76756052d5968751943b299d | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e344273700836d3b33756e7f44e49ea706f35e34 | ORPH
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3e81d5e229ec50f6302163807d37a6817ece0e9c |     
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b30221c2c4d00c59c97fce93f02a5da2282e5078 | ORPH
   sh4eb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/98d80b4ca4ab25221094d0ed5c91404d71ded2a1 |     
 powerpc64   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/952f437597f623adf15fb5849c8302bf39912d31 |     
   sparc     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8a6998226c5255f77be1d10fc2c1f4b2320f2a91 |     
   mips64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7dbf60bcd4e790e83d36fd6fb8fe19ca4b5b0fa1 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/2ede56c7c4f7b4e1176c216af7722a08f6118cda |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e15617c3b803a224f2c3804c8f16674dff61f5ba |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0dcafe7104642cb59d816d11017576b8811bdab5 |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8a137cef1528bddd13d0218fce7d0eb89d70c376 |     
    arm      | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/ee729c398edd45bb9a2d98dd12721563470be473 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/6906f20013d8ff8411a88aec0375c0d029c4098d |     
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ff81e288385f7b9b77fe38f3ad89c0b77e610526 |     
powerpc64le  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d4a1904f5679e71a759da06b9547fef4ec130244 | ORPH
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/29adb60395a1f937fa61c90f900d8baf1c0c73e1 | ORPH
 aarch64_be  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/4453975fb1f987d0432cfe747192ac9daa27c6d8 |     
  riscv64    |        libopenssl-3.5.6        | NOK | https://autobuild.buildroot.org/results/0c8c2974bac04163aa8b244d41391f5390dc6ceb | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/768d1486368ed33dc751bf817c420635bb61a9fa | ORPH
   x86_64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/89688a59fe68157f3909866ff7d182deab27f103 | ORPH
microblazeel |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/edae880ada0a1eaa749353962175e0b63866b356 | ORPH
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/5a650d5ab760d604e1c200b46fba7533b3e1f943 |     
powerpc64le  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/d0c6e8412ee56edb82a4d3a19ca9ccec5e68edff |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/49f684b2f710cc42a97d4db03da541a6b3333904 |     
   armeb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e53c1a182ded7dcab5190009bb339858eff82ec6 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/3beff165961463aa9ec53fb3516d4b9fa578d61a |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bdcfed3b55798a83805716c2fd85f82e0a4b2273 |     
   mipsel    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/a4d1100168e93e3e0c4df35128ced09b00b052f1 |     
 microblaze  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/97aa2cec0e86d1e4785d9e18f9f03fed3c2a39f6 |     
   xtensa    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/939f3906a67685202bc6b1feb8d61b9c378281bc |     
  aarch64    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/8558756375b8a3a922640101dbd449d01cf2301e |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/9912ec4b4135623cae846628908df2b8529ac626 | ORPH
    arc      | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/91ecd112ed328e40152e2f17727f2fa494349ad3 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7e96a22f747d6e0b8c42e4911ff57e33cd9917bc | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0731670c0ec1a0892a6bb50d44f7abcb2b348d88 |     
microblazeel |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/ee1f88a2b5d9a88ee1bee32dd39dd0c97979ea3d |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/83f1fcc643b9989343cb7e2c7a03f96aed963ec9 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f383f8da534583481927cd50d56ab037bea0ef8e |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/c947fab55f844595004a1a21f5651794b436df17 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
