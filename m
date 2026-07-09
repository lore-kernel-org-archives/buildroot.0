Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B89C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 03:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192DC405EF;
	Thu,  9 Jul 2026 03:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG9v50dNiSIu; Thu,  9 Jul 2026 03:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C4A5405F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783567543;
	bh=jTB401je18LbjyP6KD4pZHQ1+OZIbyu6qHlWU8nvqtE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NNuOblS9KF6+74/UOWTYrKqzyDdTm8+PZO4rfpxzByv8rVDYRBJplQALq1NKpm9wX
	 602jj4eWLMpiq5pKvdbxXf7/2mLuqjdYo4ondi7VF6bfrId1SqOhXFbCBbva/RlmYV
	 3fwACcXEr5hnoWqVRFG5RCvOFEE+7YAncibCjCXeibGy60l6slxIMKqjidXK4md1TF
	 Adx49FDYt8VjvWJ9iY4bb3QWB9bZe0E6gt8keQqnrEi2DDHpibvtlyKvUKBTpiLhBa
	 KTn/GVcmH27DBKT2vTq2+TJdKwPgEktmPMB7xU8fRum6sLvBED5AlXSOIq0Tdy9Ubx
	 vvnmYEPcu6+ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C4A5405F6;
	Thu,  9 Jul 2026 03:25:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF96C315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 03:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11DB81468
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 03:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmLlC5HIRg14 for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 03:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4F6081467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F6081467
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F6081467
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 03:25:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso6464225e9.0
 for <buildroot@buildroot.org>; Wed, 08 Jul 2026 20:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783567536; x=1784172336;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HdjJcTAwE1hPtNqA92O0Fi3dmrynzhSzF6cyY9j7PJg=;
 b=tS7QDeFbH5SnP70SIX0kd9yN+0PWOQG4io+Om7DTTn5t1T+WMoEFSiFMSX8Up3FnVT
 g90kZPQAzy9mGEbntGGivVe0BTtTRGv77M3RDEXvmu9c2uV+Zkh3GDmjnkut9hMTNl6i
 jIJC56YkL85B8JGU45FElvY0HlGN5w9318CYHsNTV/hkQDQIHD73E0MBPdxdRxBQbziV
 IxoeP38JFSxWBN1MopgLs+s0wIzwvpM/Zk0cjfOCGXGpRSqmBScSQmkaQy1POJ4ghHXQ
 /kL6dNDO00226W9zWLjO1gMbzBAWNED76h7WnJ8DGPSkyMPrRcApLJXQj3o9E3nmEJYA
 o7cg==
X-Gm-Message-State: AOJu0Yyg0Z5byWaYP457PME5g3ztAcBLaga7NYfKVoTztKhh6OE6F/zL
 lEvEkDlXoPDCmgLpEuSPHS0VdcKpqS+D2Q7RMKqwbz01fA+j9yBIVCtXnSDG6dyV
X-Gm-Gg: AfdE7cnxP7KxzivlVqVIKUTTynZZGWuaSv4XzjymiUY/k1hNiupwQVL2jT7sGv+Lgou
 LT61LNu7/JHRy/Z6QB6Xai/9R3SAkWTUMVRQ1lLLzVhYHWNHwhLQc9F2pE8RGSV1KpdOwBz9CRe
 vTIRMyDmLXVXR52AzMkFXisaAFZ/FRUnZSU1o8kjg2wRDWOWL8OogpWKhcoPLwDFcuksFvJt4ku
 dGmZXIxghArlqcPP/hc3EkB3KPUAS5fv3MGGKD6LLUJxmiWBJYYo0h4NvOgxdxHNBZZLN4GFTRr
 v+zboKQbZSm+RSP6Lk1zKubc2ic0+1yV2+r/RkiKxS0F66v3UfvP9RHe3rgjWNhFgqxF5ufkZ3m
 yNmPSj8/078173D+dJWVA03Yit/e9ijPI43FUVGSn/hM3RvOoH3pkZ+iFwpPFSuR95Z7lZ3QILI
 Jb3RNXKmUS7SunypQ=
X-Received: by 2002:a05:600c:1d08:b0:493:be0e:377c with SMTP id
 5b1f17b1804b1-493e6891facmr45782415e9.24.1783567536176; 
 Wed, 08 Jul 2026 20:25:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a572c3sm117605475e9.1.2026.07.08.20.25.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 20:25:35 -0700 (PDT)
Message-ID: <6a4f14af.da15fda7.219928.df5f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 09 Jul 2026 03:25:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783567536; x=1784172336; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HdjJcTAwE1hPtNqA92O0Fi3dmrynzhSzF6cyY9j7PJg=;
 b=VwFGPUTrZ4B5UyME6HLZVT9sb951T3XFlZA8Xkml3JQayBHvFrf0WPHVBw3NPDlAUN
 CID7Z9FyYg4Wol9oZfxshaza/Dr0Hm5fXwPv5TFdwDEY31f84qoEbgwpkxhsG4qozXwP
 r5HunV9AUaZjNK2DthpfPQ7r24rDgIV8nN5ZG7DYjQedfae1jpy5QE5yFw4PZK+vX8LO
 9R62OsB4WnOP00tShLsgQFynqmCoxJgstU76V8kfDYdSLKl4rJNCv2ZT+KangQ87Wpmb
 aGZzepCPI/XkVDGRNxdoEFWw9Pvrx4hg2BPTFRCYmJlHJcfwgyiMhrA8MygbwiD1ZIh6
 yvXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VwFGPUTr
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-08
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

Autobuild statistics for 2026-07-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  2  |  0  |  5  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  0  |  3  |  0  |  3  |
    master   | 36  | 172 |  0  | 208 |

Classification of failures by reason for master
-----------------------------------------------

                 host-tar-1.35 | 14
host-gobject-introspection-... | 13
              host-pahole-1.28 | 7 
                    fmt-12.2.0 | 6 
               host-dracut-110 | 5 
            host-go-src-1.26.3 | 4 
host-vboot-utils-7dfa482d6a... | 4 
                       unknown | 4 
            18xx-ti-utils-R8.8 | 3 
        edk2-edk2-stable202602 | 3 
            host-binutils-2.44 | 3 
          host-binutils-2.45.1 | 3 
               linux-pam-1.7.2 | 3 
                   perl-5.42.2 | 3 
amazon-ecr-credential-helpe... | 2 
                   bird-2.15.1 | 2 
                   dante-1.4.4 | 2 
                  ffmpeg-6.1.5 | 2 
                    frr-10.5.4 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
host-google-breakpad-f49c2f... | 2 
      libabseil-cpp-20260107.1 | 2 
                   linux-7.1.3 | 2 
        ltp-testsuite-20260529 | 2 
                  luvi-v2.15.0 | 2 
   openvmtools-11.3.5-18557794 | 2 
                   pcre2-10.47 | 2 
                  readline-8.3 | 2 
       sp-oops-extract-0.0.7-1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
               acpica-20251212 | 1 
             alsa-lib-1.2.16.1 | 1 
                  bcusdk-0.0.5 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2025.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
                   duma-2.5.21 | 1 
              erlang-26.2.5.15 | 1 
              execline-2.9.6.1 | 1 
              fftw-quad-3.3.10 | 1 
fs/cpio/cpio.mk:128: /home/... | 1 
                     gzip-1.14 | 1 
                haproxy-2.6.27 | 1 
host-am335x-pru-package-5f3... | 1 
host-gcc-initial-arc-2024.1... | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
       host-nodejs-src-22.22.0 | 1 
                host-odb-2.4.0 | 1 
         host-opkg-utils-0.7.0 | 1 
               host-parted-3.6 | 1 
              host-qemu-11.0.0 | 1 
                host-waf-2.1.9 | 1 
                      icu-78.2 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
           libmicrohttpd-1.0.5 | 1 
      libnetfilter_queue-1.0.5 | 1 
           libzenoh-pico-1.2.1 | 1 
        linux-headers-5.10.260 | 1 
                   linux-tools | 1 
                  ltrace-0.8.1 | 1 
              luabitop-1.0.2-1 | 1 
            minizip-zlib-1.3.1 | 1 
                  multicat-2.3 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.46.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                rocksdb-11.0.4 | 1 
                 rtptools-1.22 | 1 
                  screen-5.0.1 | 1 
             sigsum-go-v0.14.1 | 1 
                  stunnel-5.78 | 1 
                 sudo-1.9.17p2 | 1 
              syslog-ng-4.11.0 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
               tcpreplay-4.5.2 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
        wireless_tools-30.pre9 | 1 
                wtfutil-0.47.1 | 1 
                 xenomai-3.2.5 | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/7efef1d81b1efde93b2be39215e6541fd734295b |     
    hppa     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/d6e83404f6323ea0c5db6ae49d37d8ab33612d07 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/c76a788dc031368bfeb0f7e8351b5919ae117172 |     
    mips     |        acpica-20251212         | NOK | https://autobuild.buildroot.org/results/0805abad65d32a0b73aa90475732f411da9bbef5 | ORPH
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/e2186a8e91a3083326ecc59b18c82585241eac17 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/eea6f5c1f6a3ddb2129c45207e07d67568b91d07 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d86f9cd8b10f5fb804986d512bdbd4df723cdb77 | ORPH
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/951f77adbfd53921395948dbcbd366b3788afa16 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6cda81e3716b4ea69201032a134561aed9479cd5 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a47890331d9c082a17391f3bf02f80120de1db46 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/5310b58d91fa7821dbddd6b76c769196c767a354 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/0fc2a2cf660623087913c2801dcae1b856d33ec3 | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/67fc969cb6592257ca1d437ae8628bcb8cd5ef92 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ec401b2e8e38d08818d57447c37c4d7f9cbbbfb5 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e2355a7e2c4364b1b2c6406cdcb961675fc20bb7 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6aab4fc5224f760c8f01078da975cad0fb973e60 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/01275e55f6e03ee20523a7742e820706fe790c37 | ORPH
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/9717766f94b1e5d782e0b6a54d64babff0370559 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/79020b282b052d449355dd09dc873a9947f2d4f7 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f263670d421c3ae31e0491739190d5119850c085 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a6321a20b4eb69116610dcd3e5737400040b4e98 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/0baf1827c8517db807c90a30dc8c30ec97658b11 |     
  mips64el   |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/842d7d30c1964e40257fffa91ada440791d0c0b0 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/fa831f52e1c09dc46451f6bb638a14703fbf5027 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/764ed13efab3304ed31cf553720063c0a7b72a3f |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/998e8ac649697988f6b9bb3cab386cfc412b36ae | ORPH
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/d3b376152b30e752c875b4e4d8fa1f6e07992ae2 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/af21ab3b860d6e26132e0c1c23f851e103b4485a |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/5dfd54dd4d41bf4b8e35527488672ea51ecdcb07 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/8939307c6b6d73a51679784379bbea11d89b1b1c |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/a2421b08a80550e4ba3ab9e37111c8e57aa5b5bb |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/289177675ed530fd51bfe2c8c4dad3e2d1fe1a34 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/1742e660c25e9ac3d0c6de459f969adb5f165bcb |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/14c45d7748e18e566edcd94e6ef0c7b0bf2370b9 |     
powerpc64le  | fs/cpio/cpio.mk:128: /home/... | NOK | https://autobuild.buildroot.org/results/467a12ba7a92ea1b049fef29a6a91753cb3f1ff8 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a2f4f6f50d70d06eaf95c432b21b1230786dc469 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f1b364229195ca5d2b1f98b82ef08574bebccb19 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d09f9b3251c15aef79b14d081279c2c3573ed791 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/44001ffe7168f7732ed173406d4cd78ac9d4ec0c | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/1ea7911ef265f662552ac71a2fb56624dd3132db | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/0f161943bfcfa021ffb80091a1ebfdd8cf4c8193 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ec77024ea3f8147cfa9658af113813b06f2c4404 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/564568ad566b085999818cfa6f144ad88ddee035 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/ba827c65d0b73f4fd3a8eb33be4ee6b491be21ea |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/a53c06dd61083451f9092ed1544619ca4a62211d |     
    i586     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b82d7767e25c72b0ea0b3772a4ea4772e52f654a |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/235c8a176dada9f9cb5541fcdd188e8f01f4cd22 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2a8b005d6ff53688e013a5af4895cfde0637016b |     
  powerpc    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/efdcd7c84d5bfa66fa484a50430035411d3c48aa |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/fb0832fbfa8b53602e0f3e9b62eca384fb923792 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b0f9bd16fb89acb4b2b6d8ea1720e2f1f686d1d7 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/02f813b04d0c7c382e2611131d42cfea17c187cc |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6bb61c4f26c23a74eb03aa3a4f14ca7aa51e18cf |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/27b81fe87612ee7e0ac8bf0f484f5efec1a78648 |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c64faadbb587523fdcc1b2b991758b05e43004e7 | ORPH
    i586     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/7b9617e69fe02d3591e6350366b4f8b3f181338b |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/3036428b776063f565ab02a0656c448c4258ce6c |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/5408fb9cbdbfe85c8b2044db1c9b290454710905 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/339dd08a0b2e561d65396159dfc7c1a185795d38 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/27ecbdb7bacd1cab902cd12e10100b0c903192de | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ae434be2ccbebb9b20df361e9773d08f31ab4b61 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2191d125fab680592802be37369952a67fe3b81 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/58964e476306cbc465a6305bf0bdb7f43f4e8ed3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/637b61ee65ce26dcd0f1d157e397f56420ea7350 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cf9f0eb0330443886153895cdb6f5b0bc75fe6c8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d66c81d689864bfbfdebd71c938775cc2d7a194f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4a1cd6c41924256dded6089894821532ad819a4e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a37fed7a4849277f4559df3f368d29a3455dc35f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d6cb4e473f5ea8feecd197d5bf255c110f17b3df | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1796793589e93908a0aec9c7943b927107780efd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/82feff1bada7bf625814bc7cb64fd978c78477d9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c59d3cd654fe4e466996e359e8b323b81432f72 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/67245fa710b21685cfa0a975f457ab62c51dd41f |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/b62a9070b44dc187e856d2a7bcaaeeaca1d68d25 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0a410bce13788b93dd0d9b74cdd719b91c085e79 |     
powerpc64le  |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/d1fda6872df0bb4faf1d8d6ae246641faba373b5 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/07446c1f4227603d3afdbc3f24b18e5fa8d15e4e | ORPH
   x86_64    |     host-opkg-utils-0.7.0      | NOK | https://autobuild.buildroot.org/results/5329784735220635e6b439072ee94c10d648e3dc | ORPH
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/64693be47869905108bd143be9e5ba6c08bf7958 |     
  sparc64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/b53816bca2742cbfe29ee4e205f7864ea9cd2602 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/8b0fb5043ccab03faef80acda3acce9318688aa3 |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/cae3fe7c10abdc2bd252a5737716a06e284dd256 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/f29fa88d1ed7fa1169c1ead99ac3426bcec22fe1 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c8d97c81588b0a686e4dcf22d7755ab55df75224 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3ddda7f42cd19b599001a86f96b0e60ce9ac8a7d |     
powerpc64le  |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/17697553a8b02dccf36fc2a66d3c1854ed563316 |     
    i686     |        host-qemu-11.0.0        | NOK | https://autobuild.buildroot.org/results/450fac6a02506b65a5fd91d72d13e49b7f5535cf |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e55890c4803fe26e0e3b657edba0874664eb2c07 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5a8a27c3ea7b43aff2b915e8f4cd793fc9ff2afd | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d8529b52ed2bd3eb3d057ea0669a4dd894990d98 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1ced52a301697a62d11fb955189e275792c71c28 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/619eb08ff2dc194258afa441197fa4e38b5e9349 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a95dd9fa93c9ba0c083629b5647773767cef1ef3 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/47fbde049ac19c1eeccd196a5a4b68b6286d501d | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a7ddeca262ce579a0ce1d1a158a5748c166684f9 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/14f36a191b969321560de006984853f516c76451 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0488765eb69760a497dd7f5ba405553d2749837a | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/061e6a6f1974f56d8e53d66cd963594f1e379220 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/478a9781f481df7cf2eecda80a4c13f900a0dc80 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d915f6ddcf608f72eb4859956620a4cf954932ab | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/53127220b5f0c37fc73ea4a9ed5cb666410edaf6 | ORPH
    i586     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/2d21a2e58136ebd08a2db4a702723c9fb21d0ec4 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/bc1f084abb69207cf46288e99fe73422bc707ff5 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/a1c4f3a863dd0bac532a6fd20f1be3e16b4a33d0 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c9bfff76dd1295442be467a02677a2418c2df3fb |     
  riscv64    |         host-waf-2.1.9         | NOK | https://autobuild.buildroot.org/results/908db9b135296e455395f8750417f60a9844cdf5 |     
   x86_64    |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/5b3cedaf4493f062c2d8570e9aba9859438b4678 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1384a77e8e4bf95ef247e8c8162276ec1e88bc62 | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/245f8f15666890881cd8188b48ef22d26b3f9a92 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/f314fbf81feb96710e5955ae5b8447370344958c |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/6494d0196e98249b15d1d05df4bb9401495652ec |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/ecf3d80c92ee21d958458534345d92416d7b3ed4 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/004da26f02086e22b01a3270486c5da43fc486e9 | ORPH
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/d8242d9e52546d9f5e0388a24a30d7a56bb4ce66 |     
    i686     |    libnetfilter_queue-1.0.5    | NOK | https://autobuild.buildroot.org/results/0db4651d85d87b93a09d90d8591bd2ab378611ff |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/582ffd4fb908f4251df5090bd422fd698182833d |     
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/0cdcbdba89f7423cfd67d418a4f086094d14a229 | ORPH
   x86_64    |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/ce8a57bd1fc71c948b228c8a55df7c587b59e8bb | ORPH
    i686     |     linux-headers-5.10.260     | NOK | https://autobuild.buildroot.org/results/279cd059339cb5669b523ef9cbbf66de6431dca3 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/32e4633dea84de6dc6d227ee1ac93fac35afd3d3 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/dbbc61f8978d39e620c61465c08a07f9f88e0e40 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5ed53ad7baf017eb4d888f09610db2e535c54197 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f2d5907f6b324938328e2b626d687e92c341120b | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/4e72591c5f641f9b8da5e8551d36beb2b35cb2a3 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/8ea3e8cc7645315cfe0998602df7b8fb567d6625 |     
    arm      |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/d2892830493598e33d459d1a1eef22894d99c0cc | ORPH
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/3d2ed941650de3153d5c023b6495e850f05eee06 |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/e05617dd89b3aff48b2b2778776d79cef0f3db4d | ORPH
    arm      |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/9ed67986bc672fa2477d241fa59b397cb12f6a43 | ORPH
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/c860e9b07e4e740a24c7e8f80e78e940294ada6d |     
    i686     |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/61faf3b94b8e1a2bd89dcc3f974690c0a51f09d1 | ORPH
powerpc64le  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/522466aa3988a67a148de05a5f4f3a658ddc9dd1 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/6a3fcbd210bc9a751b14cf57affb39af1218d8e5 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bcf6c42dac90924120c6d816b5582ecf40d91931 | ORPH
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/97ae2530edc2ee1e5c42ea377a8299d9f86fa8b1 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/399e4771b9ba73a69b40387809d788c063029a18 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/40a28cbb6bf89c25dc701859ec5ec47923105b31 |     
    i686     |          pcre2-10.47           | NOK | https://autobuild.buildroot.org/results/cf7239c125b8c483d5ab11527b4a3f2455c2386c | ORPH
    i686     |          pcre2-10.47           | NOK | https://autobuild.buildroot.org/results/e7d39a1496e53f38577d8d33e3656545ecaf1ba6 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/a74962ed371287c8441ea8845fc0f33662e3575c | ORPH
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4b3e12efcbdd69ec481d5e86647358ae42837df5 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/73a6a912118322c5933706b4d26cfdb1bcdd30e8 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5c9ea99a9729b01be1228f4eb834c01db54c7eac |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/b5e17f7b792866fbd393bf123df98b5d24301784 | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/33bc856e365f332b4c6697a011076ac9cccde995 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/13ca10ba0367924ca1236d71f12af237a5647a1e |     
microblazeel |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/4568891d2f6eb5d52c32e251f72d0cb991fddd8d | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/1afb982f07b053309185548ab6c268ac0d3a78ec | ORPH
    i686     |         rocksdb-11.0.4         | NOK | https://autobuild.buildroot.org/results/18c7ae5954d9ea153aa933a74a969da38327c18a |     
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/fa40bae8ba816c3d108e95863f937caf38e6b975 | ORPH
    i686     |          screen-5.0.1          | NOK | https://autobuild.buildroot.org/results/1ed77aeed2c7b1977b26d9024b00c961884ab33f | ORPH
    i586     |       sigsum-go-v0.14.1        | NOK | https://autobuild.buildroot.org/results/06417505c0197a25d7df445043736cef55ec69f2 |     
powerpc64le  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/bf9bc1730eb732dff8e8726fefc675a8340749ed |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/0472098dec5fda69ead79293d130bad6dd223f04 |     
  powerpc    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/313e57e5acfae732f8fb0aa6f67136813c871298 |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/75343bb6bdf0eeb52da13d5d4dbd1d980eafbda7 | ORPH
   x86_64    |        syslog-ng-4.11.0        | NOK | https://autobuild.buildroot.org/results/a39ecc88a9342005b75660ee0ac60a1025fa6fc2 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5d36257165a48e680b7b04d631a2bd82dd096b64 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8d09ff7edc73914362338ea0f74b4a41f3e50201 |     
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/206d25fa586830d486f821bb9b020be9c267599d | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/b6f3d8582ffcc6714bf51b52ef229165f71d9a18 | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/496a81699771d02a08063ac569b98093b217af7f | ORPH
   sh4aeb    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5d6771cec0b83a68811dfc9413134250c0794340 | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/64416baedce87104994fb496b58180fb4c071a06 | ORPH
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/af8423fb16bdb291d59cbf61102d811f03609aec |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4302b53c95735b732a206e1963c6948ac60d8409 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/63cf0a2db97f94d1fd458f4dfc34ed65f0c530ef |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8fd1bc1c83bd7651b28f1cebe5f7122462c744b8 |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/79974b92f99c56718e7ad709794d522495aea55c |     
  mips64el   |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/b9c1d3920ec7c0e3f9cdecee68fa9a71223d3493 | ORPH
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/ba2f2f73f6affb613e5bd89ab1c5d93c311cd70c |     
    i686     |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/bab5ce0c002214469af1bd9c1e52e2089fc59bbb |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                 gnupg2-2.5.20 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/2ab1194d57375284b0cf43c264d3f22c3f041980 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/90516c6af8ed8cc7862198658432ef13583f0a98 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ca9f2f5656f7b2b4009ac4c3b7055037c8db44e5 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

libfutils-c326ce0cc2a735438... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/04ddd8758880dbcab94587389244bc4bd504f76e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 1 
                 openmpi-4.1.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c2d07faca731e35cd57a4f9fda2d1955f1e6498e |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/12311c890d4aece9ed7685cc28300e96b65c1871 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
