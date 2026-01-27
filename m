Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD003D25940
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 05:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EFDD40A00;
	Tue, 27 Jan 2026 05:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQS4gUuokWTj; Tue, 27 Jan 2026 05:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2318D40B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769493438;
	bh=S6uuLzcfOCs1cJG/ub+fBT7OAX9aLKPvqClGsyxJJmo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sRcKxa1xn0XY081L24Re2P4/W4sSnKltYG4Z0PBh2NQJQPJZIk6Lq7sodRQWdTHkp
	 dXeqqsWWPYTwfJSw7eEmHZgH/+cMfcXrw757hVWrLq1zOYa8hsop5nKylwKSQE4PZQ
	 sqwFj3OIPCXXF0bnybf1rkQepvOHMyzbtC5h3XNe5KEmQX7CsF1s+KaTvl8++URwt5
	 gyTSBCngEfQETh1vu6hNJmAgf5P5Ys0FIepihaY21mbg/JqpeRvTTdKQ7tMmSJTDlH
	 MARj7sRNEX+w7/gkg7Ty8alrEcxLU/RBdTTKKe6PIKVm8kKC6NWVXqCBMrAYg+vb3N
	 /DOBWiPotXeCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2318D40B3D;
	Tue, 27 Jan 2026 05:57:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD28333A
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 05:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A11E4822F9
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 05:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkbUTxHSURdr for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 05:57:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F22E81D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F22E81D5F
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F22E81D5F
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 05:57:14 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-382f9211cbfso47182301fa.0
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 21:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769493433; x=1770098233;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaG1OPAkGxG2dCkk5PpR5Ok14yNp++g00rFlEFfjiwQ=;
 b=FdUIxUiGlNyu0OdoJWeKorCY0zE6HlEyWhgI8UF4hhBJU0v6hsUktECJklT7uSup2s
 9lO67OXjqzMCmWhH5v07/AfyACNtOCyr8A4wmau6vWCxQO6EUZUrLUWXOZ/y7lQyPmp/
 daDRDSQU5YJw3KfdqYqn1YyH07Nnkxatm0mRLOQZWZa/PXekLqplqVvs3WJscbnfyZVb
 nLHqbFF6Np0UwPAY6r0zDnSvTA1PLHI/La0+54HuELO9oFIqSActWj5NR7NhsOB0azOL
 1wz5aZpzVfG9tTsNvgptlUAefQpX/mmM94K5VRTFrY3z1go+hC3h6X9MAvUcsxOPw6cw
 C/1Q==
X-Gm-Message-State: AOJu0YwWXO15OHGaDGGovc8GIHKLG/EInojwm0GD0Cu3giVRnQgQ7Tg/
 9lWW/767+TXccBmHm8nUsCKKsTMyKfbrns9r9IrMLJLqj6Iv12bem2eYvuP5Uw==
X-Gm-Gg: AZuq6aJW86QzfdS612diBljUSTmz8LUdOrfuqU0dCd80wxDhp9S7+rZIZztUgrQMfyH
 AGEBBhO7uOu2tD2dlBF4kK2QKNJVu1LycQ3dRdzCeARETrUGWohuQCy142R5JlCgpqdy2XJn3pU
 1dvPnDcRKbOYFE5TXAKmfLXU4Y504BuPLlPuBHQlv2xjeBn4wceMb3wCMY0fagHpE35DH22GFQg
 pvpN5sGv8goz/VH5E3CUuX8Gmq+XdTHrzM4etOTzWisoQjfULpiO+hu2nierd9kWysurk+LnElP
 w7nUaJ2OUuQ5/g8AJtLj0jU6Xm+V3wAmomKJcNWQ6/k+FGE0OU3g0baa7aBVssvIdGU0VO7a9YK
 uz58ZZ9/wmCNb/apNe/LqgwNc8qqGOBSXjqbyDtPjWc96iy5HXWYYJotP5+TzfyUnnxubSbLNPl
 43mKLoeNNu9VNRebf66g==
X-Received: by 2002:a05:600c:314a:b0:47e:e949:37e8 with SMTP id
 5b1f17b1804b1-48069ca1640mr3742535e9.30.1769487442461; 
 Mon, 26 Jan 2026 20:17:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c05edbsm33447595e9.12.2026.01.26.20.17.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 20:17:22 -0800 (PST)
Message-ID: <69783c52.7b0a0220.1f37a1.64ff@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 27 Jan 2026 04:17:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769493433; x=1770098233; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UaG1OPAkGxG2dCkk5PpR5Ok14yNp++g00rFlEFfjiwQ=;
 b=eidWi30jp/fCXXOUrW7/sTxk1jbPsIXPQ5AJipaDMI69445Ot8C4Z3iAMdGvHq1Hc0
 YxYOot7GMHGDOS+0irS828brwj2gur7z77I/7b/uC3yh3K1kE7RhDg2oLUxrOPbARmu5
 FP66jJdXw5AUxRIEaJz9fCIt8viAtMwWfO98qrSF7xiS/VjGyaRoZD47LYmkPwl3epzR
 lZNXQUKkeuXqeAl2ilZmcZRNvydq/i2Jbc6QFWqoBlNBzCo92sV6D+vVMXxzV79tly1h
 OmHo027NkcAnfKQ+h/xk0qFXHnOlkb2FxCEQBMkwgehG9hy2kfNgpAJf+Kf9/Tca984Z
 MVjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eidWi30j
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-26
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

Autobuild statistics for 2026-01-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  8  |  0  | 15  |
  2025.11.x  |  3  |  1  |  0  |  4  |
    master   | 31  | 60  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 6 
             dahdi-linux-3.3.0 | 3 
                 jasper-2.0.33 | 3 
               asterisk-22.5.2 | 2 
                 c-icap-0.5.10 | 2 
          linux-5.10.246-cip66 | 2 
               linux-pam-1.6.1 | 2 
                     mdadm-4.3 | 2 
                   perl-5.42.0 | 2 
          sane-airscan-0.99.33 | 2 
                       unknown | 2 
azmq-v1.0.3-54-g819b24035cf... | 1 
             batman-adv-2025.4 | 1 
                    brltty-6.8 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
        edk2-edk2-stable202508 | 1 
                   fwupd-2.0.4 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
       host-nodejs-src-22.15.1 | 1 
             igt-gpu-tools-2.3 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
                libcurl-8.18.0 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
     libphidget-2.1.9.20190409 | 1 
libubox-ecddb31dc34d89be5c9... | 1 
                   linux-tools | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.13 | 1 
                openntpd-6.8p1 | 1 
                   openrc-0.56 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
               read-edid-3.0.2 | 1 
                 rtl_433-25.02 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/3bd379aded5aea6396e215d6843b1b814e9630bb |     
 microblaze  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/fb00edca02a537c2b38031c7cba31ecc2d1fec4d |     
    sh4      | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/31b0ad9cc491f36410e2b485734ae3c3b4e5ef19 |     
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/4f1e726959e8ab34ff837a6cd9a6eb990c187cf4 |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/c818e8b11c7a81f2f8165e7239b4f86b2b64dcbb |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4c5bf9e7793e70e80f638c5d24f322b51fec4e3f | ORPH
    m68k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d8e555a71e7b5361330041ed3ca6760360353bb4 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/fd101d4689fb1e1d40a0e558dde5d74d35bf14cf |     
    arm      |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5e76e40cf4581e494d8d9fa0f3e2d4bef7bf44d7 | ORPH
  aarch64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/f8e0dba58db3c7f4cfafd2f279aaee1ba8da97d1 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/c08184ff47608e55d6323efc1c34ded1019f8d60 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3e6f0b7f2284e2060bcb08e614c692913a716d9b | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7ddcc1c80ad2db00aa7c87317b29a3a6ece2759f | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/50e1d6a613663be0b92998dd6a316e9240d7b423 | ORPH
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/52454b4db65993224d38f5138217c77439227cbb |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/15085765206570675e8ce6d8959eb836b7100d7b |     
 microblaze  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/63a4bdc1f7dcf09ca1f6fc70549760400f9c8ddd |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/9132c4b3a8d2f9b3965c41551a369de5d1ff7bf8 |     
    mips     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e5bed49d681b486f048ead3691d3625144ce0c1d |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e7f3069b0e41c2d8611290a117e26386945a6039 |     
    i586     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/f5cf2efdda15e8b40b62c76ab143c3372abb4ace |     
    or1k     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/ec32643d777dd76de01139647146db4e8e3cab4e |     
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d3dc5333dd73abe517dec138bc7ff8378be68e2e | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/bdc4f6a692dcb98895f411ac6f9fd4006b5e8a60 |     
   armeb     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/89d4ccc2f17c99692862e2170ec666a4c9e175d0 |     
   mips64    |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/53e5092a9b6f192350f69348f8897815264a31d9 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/507b74c66642abde64129ab9571ca0a39f2f2762 |     
 microblaze  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/e11d1d4f1c0ff6050517ce7602d754bd67887ea6 |     
  riscv64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/4f49676f800d331bffcb7bb820127e229b427d89 |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6a7c1e1662a7a5f9a2aba1c8dc09e3e4e19c8552 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6ba42f5e69dd72da1e11ad5aa72a6132ec5d4a0a |     
    arc      |         libcurl-8.18.0         | NOK | https://autobuild.buildroot.org/results/9de5a0954ca4fd6758214054c40be3450b17325c |     
   mips64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f74864b073a4eb8aba927cb2229ad75b62b39463 |     
  powerpc    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/6d428ad087f17369b171145daf1af3c8ee4b0a03 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/53ba7f3b314a5aa7e8a01dd7b810ec2cdbf7bd11 |     
  aarch64    | libubox-ecddb31dc34d89be5c9... | NOK | https://autobuild.buildroot.org/results/8217e1049ca45e68ff798a5966a45aab88068fdf |     
   mipsel    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/dfbaa20b8c930254eb3b766b14e01485236ddc18 | ORPH
  powerpc    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/9225065f9ec6e31d802eca600c95627d2a0b90e5 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b5b8f1a1e66e5de37b7284f59729c47d61792ea6 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/958d50256576e2359f741b26357b94523e93c745 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1228038871f188d292e0aaf2002f118ae508b9bd | ORPH
    mips     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/b3fab211e278214cca0bfeb55e888c92d18c0686 | ORPH
  aarch64    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/0d61a704874d52926420996733af7086055acc8e | ORPH
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a6ddeb1d05766b0a56b6738a46962c046ff3ca84 |     
 aarch64_be  |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/f000a6e2d05a3c51b1b49eb091ecbffa33d64e2f |     
   mips64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/613616e31ef242e52b71f6fae72f637a9a330a74 | ORPH
 microblaze  |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/72b56ab96846109659c69bb0fd319f4d41eaf888 |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/5f6527d85fb9ccdf110f00554965920113b87624 | ORPH
    m68k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/3d53f0e5eb942b197fd7e0729d90ad74fb32dce1 |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/18392a1c53331028f7fedeec40d63216e382327f |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e5af46be11378d08959d4bcee609ebc2c9eb7ab2 |     
   armeb     |        read-edid-3.0.2         | NOK | https://autobuild.buildroot.org/results/51b839f82e09625dd5ad8a1700999d749cbccce4 | ORPH
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/c132063de254dcafc2b604bfaa8bda8b59df11a7 |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/232570482f762c4f3fa7c001ba2d0ea3ade43cb0 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/13994e285edc0ab5750b08bdbf03f2382fffc9ac |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/33b442976929fa710c4133bda1c30cdfcee6e58f |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a2c8440b0b2d2b059c7fe40bda1529ee09b7bdc3 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/074fa9d51892f158b8d80f32e7fb9d14533f7c9b |     
    or1k     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/6ae6fda9afaab0dd19308bdd3cc95c1fee3402f1 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/fd8c99e22832ee9277e86393fb9266a63e5d8f79 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

libesmtp-v1.1.0-14-g335ee8d... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/da8e7b563e968ff5c53f5ec6abfe60b3d90f94ca | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 4 
              libsodium-1.0.18 | 2 
                libselinux-3.7 | 1 
                netdata-1.37.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/94badf9f6a3d73668ef4b91903feb2b9707f7a7b |     
    m68k     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/9dc52d8e20e489ad0b585c739e45c9e7ab7d1cff |     
  powerpc    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/1d89cf843019e39c12f6044828b6a401eaf58fc2 |     
   sh4eb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/eaa5e93432420f9a9f84c06f4f68636f61d7da15 |     
    or1k     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/0eb044b56800124c519f7730dabbf5572804bb82 |     
microblazeel |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/587efa5634e4e0a76e110155631f8b48fce439c2 |     
  riscv64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/f52d051ff3f34a7013103c0eb2a04d5cde0d6b90 |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/86f21952c533caabb50210552e1176793f993f62 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
