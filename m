Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B9C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 03:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305584031C;
	Tue,  8 Sep 2026 03:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FacFasl2fPkV; Tue,  8 Sep 2026 03:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2A2F14031F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788837875;
	b=Yx0EVZ0ylp+1GKyYa/U+Q00FciUm7aySmo3IEdJxv12yKtMm0UZcS5qyS/wE/XdP3y4p
	 /7lnMYiHfWuxWy6TmxS2YK7+Sbd/UkYHg0ZtctOGe0twrqjVmS2+f5oduaZx0ghbA+7LJ
	 GBAq0GFV4X7YJbtheDO0ZRr/+7VtxG4oFh9DizsMUAEiGNU1AEkTm8kBBsT5UphIuFg7Q
	 wSqqpPN04U+bMjSLf4DlWM4SE5CscppxjgydHQcSlwYEnswEPKIdyy+4R3m6xvPQLeQJ4
	 f6mYpQh52/EQ8kXYPzTiBQpiMA0fzKGtQqDxoXnxrYFiMaATrWkoZR2gagJZsY9CabA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788837875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9I3ybkfY+2fDgonVt/3EPbllC9hiE0xkg9/Tlmv5IMw=;
	b=oR2IyR7hBQBYuhSCLErMk79VTVuLfca2nqQNdFT2a+0IGGgoahSThpn9XCgEXP/FPQkv
	 yC79djnk7i1DF0SlezKYEqKs8kOfhTqB+lm++LHjgVInNR5vBkZ/GoaGEiD8jUxjLHZR3
	 qlJ/+Xgswjra0ECjmW9Q59aUtECxcAr8gVKZlWzASl/dTX+8PZF2jZhuifS/lbm/eK7Ra
	 ZQ+KoDppF4fBLtTgMTnJfwWsRgXKh+TbHi5fLKqqRYiaqnz7jBvUw9eHwyXTKSSGlrLVI
	 tN1ihEKGny0Zsb/66JUNWDo2ODpe1imbdm+IERhhG210pBDr9YthbxeW3AWdaWVrSIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788837875;
	bh=9I3ybkfY+2fDgonVt/3EPbllC9hiE0xkg9/Tlmv5IMw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZAGtt/wDsLDrFKk5bPqN2CWJ3sQq/6Zyd+KjBlGq1bD8tuS8HSxKV7rYaXThNcp2H
	 ixbKF/fC5mPpXj2tUlituuMIoQFCdWqxAv0C9W2yaeWi+TFo8e8D3Bl1FS8KQkzQhI
	 yeptIMoiD8TTVRaxJXcUEiKddbjbAQGSKh9/ezP6VRgjle8QuyXkPSyFZlfyurPKJ4
	 4bMIu0KQGsH2Ct+z1rKVc8dU2ShBwT1axl+dRChVDXXEiAYjwYNlT4NZyr0UADeLmB
	 C/7C3EkpnKA6FDyRs/PE0NVMD8mwDAv7gtPKnC/kaH/J2PyaakejIf7Ty4CIImvZbC
	 waDbeHGuvTKjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2F14031F;
	Tue,  8 Sep 2026 03:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB0BC49D
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 03:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A060380897
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 03:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aHrsG9qe87w for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 03:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9DA6380886
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788837872;
 b=lPf0tOlZ5RD3T8EFWymGlt8krLhRxBcBcWOm7Jpi+1pMvSyMvZM35IsbSY5M4gPS3lub
 EHd7K2ZSpgU7JT7iG7r32szi13u4+EXi009l9Yy/QvxmIfKo6Ka6OM/aS4RXadOqkWry9
 Vbc7IcYYciao0guNXV9K38PUso23c0VoxxR5cr249zwBiyTuiCUvyIweJ0s4ykHaM6To0
 FR/NNoCCPBMY1Dcm4XdKFGSAVzymlbWMznAJkWTiAy6+uCnQ20p6qOIdAXgdYNk4+nC2z
 1wgWxU0CqP0tKMw2I3TK5lO7m3tJL2ntqRqPHe7+tduAvyrHp70iZ9qrgU9OZq6gLHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788837872;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=iTSPdUT9VaX3g5iut2Wm43QlKOkPqjoTBp3SVIWRY1k=;
 b=ge4TsqLShLHnrUFcVKidDk1gLhPkHm8hZwHA5aZgEpFir4U+zOoOF2KhwVkF9Kzbtlq5
 blYMFLWgZUC9WZoFHZV51UWrhIHCwyppeGYZPKwlXwuDvTts30jXAk6qvGjsT3bMhPTj4
 e3Oe2TZ8ObaDvQdxaHqyt4C9fHl2eOe1TgB/F9pIXSakhxFDKp1NqXykDSc47XON9QJ68
 iovhpY3iXaWLUnymJSqYX7CNwMwODlsPLrZy/pDAGgMCRJLBZiCc7TMfbkJMz+zw6AEX5
 KU8//DresUyTsryvJ+oShLDuhgu9PkDydIVDC7n6iZe1L1dHbH1H43oMlbqCG9j/yBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PsnPsXBO; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PsnPsXBO
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DA6380886
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 03:24:31 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd6185db7so3947155e9.1
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 20:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788837869; x=1789442669; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iTSPdUT9VaX3g5iut2Wm43QlKOkPqjoTBp3SVIWRY1k=;
 b=PsnPsXBOihlffJfT8pFDKL2tpEiRRAP4Sk2uIRQeDp4cKzN74tnP6OrHLmC6c9tfgg
 XMXz+R3Zbb2iZy0w7nMSP9350c4LBalq/nbzXtfn01i8fNmD3ymOQEnX3/8jaJdwNE6+
 Nrti2VjeSaZmot7JdEkrnYWA0ndL3RRvvZxBCiKkZCKCoMQ96YsIww56EOQPjddV5hW0
 Z2FT/oDZMuEZeVki4aUYIZnCOvSPnjzgRaq8LpikHtO576V/hWhxZ3eJls2spW3olpU7
 PbqrsJyDUlBewDj+27dd1jlN3HQ2umyDvHXYIrIULdr0DRsCR0D5IyN1IdQtEAS84zoU
 T4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788837869; x=1789442669;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iTSPdUT9VaX3g5iut2Wm43QlKOkPqjoTBp3SVIWRY1k=;
 b=KKw+rPXNMiq5YEfH5deVe2h9fqKURTE75FptTb6Yto9X1sKNmH0MMrB7wiIONG4Bup
 ajOQ7Wwgw3EkNn/KB+gS2JPXyZubFZATjdb38cInm9bvHTfzAwL1CkeX4kxtoD4oxzTY
 Imk+cOLSaET9vp2weHph71/hQF0UM0t7tgQCERUdC52pMLZJbT5Xmp8zV0ygWL038B7T
 er7zjDCIOeAu11cOP2Ii00ppa9yE53lWZqzUhFeWdOrypd87STbna0+VmEMHLLqgI4Y5
 TploQIFaPUH9LbeVw9dHhcSSmjWhHXAoHEU1+T44OYA52YY+YxwTufUKJkWjbYcpp61X
 tAKg==
X-Gm-Message-State: AFuF++lKWbpbqMIZA4esPEJWDtL8+HU9rEoR8MWZwRo7ZtzBtO52w1Ax
 x3vUzP2jH2dQxCBScPu0b20z7ZD7tvDtLpMMzU0Ai9V2q0ckQXHSZxvnpANSAZV9
X-Gm-Gg: AYBFou362r/8SFYdeATgKdz80PiZAEO8V/kMus7RwMr55sWKbGCz7YN/uXg13jQZJWn
 ZGBzIN7XQJIfrzxsTaC+YFgZTaHlKXhyrJC5prhyhhtM5Qvhe28xdKJLh8a+Sg8HnQd8y0jboqn
 B4gpgdgJ0+REA/NbWsha1yHiw5sD4lZkIxqYNZmP7nhiJcCSYZbBWR6FjDMK4vz3Hq0aNiAOy3P
 YYOaL8GZGqAe0+phst7tKlySMF+ycqjs0PAw2I5XGGM7OV7ut63hMdUWrE6iNww18mBHz3tDwx2
 usnz8rtgS/QQZTibNGUyG5RDCdUuGQH9+e0q1TPEgFl4034oBEb27bxKs37Kf3y46AI06D4Dh8c
 euSBCIKo5EuVtGeX3hFKY9emJ0YycIviczI/Oi7YG60if9+h5VTHUzGoYsxTOR3IH+La/A5ZWwX
 h5FGRr3DbZCL0xPXKU3IRVWJUUtHebeZFea/e1joFvEeQqTtSqA9BITVFPXbXhu6M=
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id
 5b1f17b1804b1-49d17543be5mr44058575e9.3.1788837869052; 
 Mon, 07 Sep 2026 20:24:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff8195ffsm303599955e9.14.2026.09.07.20.24.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 20:24:28 -0700 (PDT)
Message-ID: <6a9f7fec.e69481ff.3b7ded.5bc7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 08 Sep 2026 03:24:28 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-07
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

Autobuild statistics for 2026-09-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 37  |  0  | 44  |
  2026.05.x  |  2  | 17  |  0  | 19  |
  2026.08.x  |  7  |  9  |  0  | 16  |
    master   | 43  | 74  |  0  | 117 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.47 | 12
                 skopeo-1.23.0 | 4 
               tcf-agent-1.8.0 | 4 
            host-skopeo-1.23.0 | 3 
                   exim-4.99.5 | 2 
          host-binutils-2.46.1 | 2 
            igd2-for-linux-2.2 | 2 
                    lua-ev-1.5 | 2 
                       unknown | 2 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                     bc-1.08.2 | 1 
                    ccid-1.5.2 | 1 
                 ddrescue-1.30 | 1 
                 e2tools-0.1.2 | 1 
              erlang-26.2.5.21 | 1 
                  ffmpeg-6.1.5 | 1 
                   gvfs-1.57.2 | 1 
 host-binutils-bare-metal-2.47 | 1 
         host-gcc-final-16.2.0 | 1 
       host-gcc-initial-16.2.0 | 1 
                host-gmp-6.3.0 | 1 
             host-guile-3.0.11 | 1 
              host-rust-1.98.1 | 1 
          host-xfsprogs-6.19.0 | 1 
       host-xorriso-1.5.4.pl02 | 1 
                  iozone-3.508 | 1 
                 kvazaar-2.2.0 | 1 
      libabseil-cpp-20260107.1 | 1 
               libcgicc-3.2.20 | 1 
               libepoxy-1.5.10 | 1 
                libgsasl-2.2.4 | 1 
          libmicrohttpd-1.0.10 | 1 
                libmpeg2-0.5.1 | 1 
                librsvg-2.50.9 | 1 
                libsoup3-3.6.6 | 1 
                     mtd-2.3.1 | 1 
                 nettle-3.10.2 | 1 
                openocd-0.12.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.4 | 1 
              shellinabox-2.20 | 1 
                  swipl-10.0.2 | 1 
toolchain-external-bootlin-... | 1 
          usb_modeswitch-2.6.2 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/1d85f5f82e6f26d9a4ea827f8a3cf0b45ca09af2 |     
    i586     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4a0506d01e8b8191d4ac77e9c3e9e1770fbef1e5 |     
 aarch64_be  |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/fc457a5f38df13bb34b302f0434553776c7fdcbb |     
  mips64el   |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/712b063cc6599a3e0bfd93dab8e34ddc220bc53e | ORPH
powerpc64le  |         ddrescue-1.30          | NOK | https://autobuild.buildroot.org/results/4b42cbc5b9eddc75d41ba0c4d9cbaa1764c0d4fe | ORPH
  mips64el   |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/49754464e5daf87f69de8a79d7e6d607c00c78e2 | ORPH
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/8980ebe3c5409b8ea98fd46fa427a34d6b3e5f80 |     
  riscv64    |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/bf38f26effa7ab4ed4e37764a231f81b65359f27 |     
    i586     |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/45f84e4d2c8646b61b9f51b7f5e3a9581992ac32 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a43c3658a8871d8395f9749484bde531edf5a3ed |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/e571d1feaea5b1018b7dcbf1b1942eba8a0a4ca7 | ORPH
  riscv64    |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/80c8a9815cdd8f3716298ab226113bc6e860dcad |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/f556593fb6c11f224b8ee1b7be7b27b79d42c451 |     
   x86_64    |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/fe7b89e14f57f344bd762512e7ed9fb0e26560f9 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/7eed83d4475897498a82ec69e261a0522bca3ed3 |     
    or1k     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/f57dfb075a45cbf74143b115c07fc46741693c05 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/51a8f5cb9e88a77d42e9a7a79c43f5a0d3807ed0 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/3810e97b1f99f656de1f11a4f378448f30e6a5d5 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/ae689148f9d76710318b247ba33ea4639061ef5b |     
  mips64el   |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/e3c3f23f0dfc4988b7ea9a5f1ffde0a9279c7d29 |     
    arm      |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/e99e83c9cf6059875a28102972ea6a53f1719e6e |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/75c4149f34131c7865a7576d64455c02af3007b5 |     
   sparc     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/ef8487bebe9081aef69b56bf40c121ce2b6c3fa9 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/fe519010b8855660dd81593146dcf8b9ba7ef6bb |     
    m68k     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/3ddea4724309f2dbfe95e2a5bd041238349431f7 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/da2879fbb75ec851626657f1845c7b20c47eca1f |     
powerpc64le  |     host-gcc-final-16.2.0      | NOK | https://autobuild.buildroot.org/results/91465eda107b63b662ffbecbe47a9f43e0e8c892 |     
  mips64el   |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/e88a14e443bf8d8f44aedacefd7fbc371f80217d |     
  riscv64    |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/38b495d63554c703e795673ca3903d5ab4d5c059 | ORPH
    i686     |       host-guile-3.0.11        | NOK | https://autobuild.buildroot.org/results/7a299699845d2954df1a6adc0879f58c26038064 |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/8168f7cc535f2b8b867738e1e2653b6c329844f1 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/438047d40eabd0734fc83e2c333115772661327f |     
   s390x     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/4b2c2eb7246efacccb7d2eab1848b7fc72d54a13 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/3f15c1a098165a5181e1e42b25f0432d92da8cda |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/0a76808db7a509de1db0810a2cbf8d3d5ab94744 | ORPH
    i686     |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/2b3d9bc784cd1ceab040e3fccba6529715ab929d |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c81034cb319d62c1e9dc402a71618e07f5240117 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1ad8c231e8b3462a376131d0a09e97def8c9dec6 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2cef22b01fb36715baf44b26b7d806c159ffca11 |     
    i686     |         kvazaar-2.2.0          | NOK | https://autobuild.buildroot.org/results/44f75c1467cdb42f6c5dbfede754b20b8dd2973f |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3260ada4216daf6a082bac83be09a825c198ad53 |     
    i686     |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/2980d08baf04408577055c43ce3d34ed4131e4c1 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/91f58a248cdbf7a2639fa8eb53dd41452da81cd3 |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/e366cc6aedd0189ae7ef89a523fdbecb20fe2fc2 | ORPH
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/6796367e7e809cce6738ea9435e1c8ac07cbd925 |     
  aarch64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/d794252df43adb4373771b3c76dab0b58e58dd8c | ORPH
    i686     |         librsvg-2.50.9         | NOK | https://autobuild.buildroot.org/results/6595cff89f8d595f1268ab9263881472a2de9c03 |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/2704dd5d71078937cc71d9a2258a8dfd9cc422cf |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/7bf524630a181551ceef58e0827631c4d23a3a5b |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/13f209c316ae4170553ace667a5edece92f18082 |     
    i686     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/bc15188e22f74d5e487764380732847f10521785 |     
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/33b6a9d7c3d3c40970bf1ce2d8e0984ca045d21a | ORPH
powerpc64le  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/748914d8021a111f7a7eb18abb03686131c549c9 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a0bb71928a77bd629eb025eb1cbebdca936037d0 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/db2268205bf11c64fbde09d99205c9949618a0b1 | ORPH
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/853e989b997fee7a8aa213a5f7bbbdc42443f6cd |     
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/aadf56a337daee726ebf9d25222d5b0bde73fdad | ORPH
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/34b135d372aa0684abd534b14abe8e32b7b6a824 |     
  riscv64    |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/c4b6768d587e23921bc4493a7e2b0452a9df8ebe |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/3325fcf0c2843a350ca96b60579803b5398db488 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/17f56fae384385996ee787928bacb31dbadc5dc2 |     
powerpc64le  |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/f4534c2e5182de176a872f38c077e1f4afea9a8f |     
   s390x     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/fe865cc55e8488cd6d3735b895954ad2bb15516a |     
    arm      |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/a4eb2775875ef7a1c5e5d4a2be1f1bfcd6cc5a16 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8b589bbb143c592805e888669b98211d6d0971f4 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/838a63456fec80f1aade4b95ce84acc017080a6a |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/98fdb67f689ed20953c4ce7765cf1c6c06ee33ea |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e73684a6db450799a977bc775d737f65daf9573e |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/1542bbbe5d3772f5153a1a73fd4a9b2d4f1d0406 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/09579bc6a6373e745964f18d6c54e896f948979b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f7f32b2a0c9b2709f32efcad4f382eff147028d3 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/65ae2a07c90eca15abdf4ddd2666823f4ababf68 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/7aa709de53374d7cf29028c1214fa7f197c04f15 |     
  mips64el   |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/ff09a367cd86e7e83656679b317dc6cf42309f57 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             alsa-lib-1.2.16.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
              e2fsprogs-1.47.4 | 1 
                    emlog-0.70 | 1 
  gobject-introspection-1.86.0 | 1 
       host-gcc-initial-16.2.0 | 1 
      libabseil-cpp-20260107.1 | 1 
        ltp-testsuite-20260529 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/b5f1c7e267ac31d89ceef1ae0bbd57211f04f3b3 |     
  riscv64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/b0965178731de02b785b4934cb8bfc26467f0bf6 | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/7540028a2a09e2f66029b41572031900f33b5ae7 | ORPH
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/9b3e2808bc93c175ce9387ba2199e3daaed433f1 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/1c511bba35ecb5a19db0c30c673206fc5bd5263b | ORPH
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/4ed8b100e0952756f6ce1258f22f378658c6f283 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/94faab178e144372899dc4b9a94134c641267201 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/33abc39fb2ced7706970dea9e4ce908f3b46b3ee |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/1fc88088ab95daf0fdd1b1b1efdf5c3cda2ee0ef |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 5 
                       unknown | 2 
          cloudflared-2025.8.1 | 1 
                easydbus-0.1.0 | 1 
              erlang-26.2.5.15 | 1 
  gobject-introspection-1.84.0 | 1 
               host-attr-2.5.2 | 1 
                 host-gdb-14.2 | 1 
              host-perl-5.42.3 | 1 
                      time-1.9 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                      x265-4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/ff67de74769bb30467e0a0fe9f06888b8edd77e5 |     
  aarch64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/a0e2f6cd025edaa467e482dfa790435f47e83270 |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/94d8fa23c21bb6a78c1e1b735a27df3e10cb7645 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d05964ea7dc6e2b8db5e68020e36f8c5ab165d4c | ORPH
  riscv64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/6038f54a7648b68f90db787362a56e263e94bc1c |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/218c693e4f1e4cf1df965e37b596036647c9b95e | ORPH
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/32fa82de8840289ad64eba8e56618ba13f9caed0 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/ebabec59c37b524f062c4ad9aa655ba01155e8cb |     
   sparc     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/5b04cc409d7419c60d7828c2d3b4c46505efde2a |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/6eb7d789087d5b83f4223ca540cb98c29115e312 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e3b5ae9b61de3ead496dadb05b07d78eed8efb32 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/48316b5a7e72c7aba340cc91ff5152306f6230c2 |     
    i586     |            time-1.9            | NOK | https://autobuild.buildroot.org/results/b0c7ceec2de6c63491161074a33409f110153f70 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d3651c4e954e1b5aff78a3a8a8e2dde8ff09935d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8c5abfd8d60305832727baab77b06016bf7ab370 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/43119613784846c4e65b51776e13b807394b9e0e |     
    i686     |            x265-4.1            | NOK | https://autobuild.buildroot.org/results/dc67a28e77c80e24b764425236bea63a6b042d2c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-perl-5.40.5 | 6 
  gobject-introspection-1.82.0 | 3 
                host-acl-2.3.2 | 3 
       host-gcc-initial-13.4.0 | 3 
               host-attr-2.5.2 | 2 
            host-binutils-2.44 | 2 
                  iozone-3.508 | 2 
             dahdi-linux-3.3.0 | 1 
                diffutils-3.10 | 1 
                  ffmpeg-6.1.5 | 1 
             fluent-bit-3.2.10 | 1 
            host-go-src-1.26.6 | 1 
               libepoxy-1.5.10 | 1 
                 libgee-0.20.6 | 1 
                libgsasl-2.2.4 | 1 
              libopenssl-3.5.8 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
       sp-oops-extract-0.0.7-1 | 1 
               valgrind-3.24.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c774e7b2ad9a82950619c7ace51682b5168d5b5d | ORPH
    i686     |         diffutils-3.10         | NOK | https://autobuild.buildroot.org/results/dff4414fa818b7d96fbbfe2a6a6d6cbf30f76045 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/1a830ce0de460630406705f98c7393149ec44a97 |     
    i686     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/4f009419594620a91cdf59802df4b561aca7808f |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9496fbe4e4513bbe0064c3a8b9b88e66fd96e2c9 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/77ede9069cff582e45d209c4e8ebd242262ac7e5 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6705bfa6fa488ba539a651ff45ba9fceb9737018 | ORPH
   x86_64    |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/fd5c6d138bb12d18312b0aea4828bc764c04046d |     
powerpc64le  |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/ce0dc6b3b596f654cb8a19b05ec88d167b770ebc |     
    i686     |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/fe5b1c1f403584644e692a2e0134838f0ee4d816 |     
    i686     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/92129f7a2934a32b881d5eb5fa8a6086415e06b2 |     
    arm      |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/6d41dc0ab1f426eb80f15d5673c776f972f76ca1 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/29af77bc567fff5b95ba17e6e5de55da16c83e94 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/cd1f4813636e266f56da476818d19f15865926bd |     
 powerpc64   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/73a00a4aa82add0df1be0711479f132b759abbf5 |     
  sparc64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/ef2f3b2e4a1fd38fa99678c17e143cfebfcd561b |     
    i686     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/894bb0a6ff8ef2209db7e9d69af891134c740cde |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/6d57f04bad27d563431c7555eb71cc430ca33f16 |     
   arceb     |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/6a36300680ad66d53d0a9312fc339a20b21778dc |     
   sparc     |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/74877885da2f85b80b27490920ac73af249c687b |     
powerpc64le  |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/18b62cc048180f48fc73f69c983307650b8e150c |     
powerpc64le  |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/5a98ac7ded61edfec7a166df5ee47cd93765e85b |     
    i686     |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/1d96fb3dd574e2c4c123dd000a5b18c5ee84ad2c |     
    i686     |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/09c85067118d28b51b6f89b7391977cfc9ad6703 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1905a2601a4fc5f2e7c095b6fba2cb87fb3ceaa5 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/15be0dc7b15191b74c9b2b4628cc808448de068b |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/de688c926b5d710d760488669dc131275ad2bde8 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/f44cba1aa2b8d4d06f842d98e8a0a7e1b257b56c |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/a717ebfaebcce87e59e4d976f6a0c74790390aa1 | ORPH
  riscv64    |        libopenssl-3.5.8        | NOK | https://autobuild.buildroot.org/results/f8392cc8f8bd8d720725a5cc436ded8a8d47395a | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6e3c38ec80bba0e0e0c2984b6b9f1d269784383e | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/045e3552780a170a721d175c7e72c2515304197e |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/da61d4e4f24599090cbd6bc249cd548c3e505483 |     
powerpc64le  | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/1ab1ab9cc006113d346b2138cde5ed375519759e |     
   armeb     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/fa9192c2aae511e6980e0d1dfade71b1bb24dd55 |     
    i586     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/14d5e79454b945663bacaf421f79ca1065384673 | ORPH
    i686     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/ebd92e2aae47d80c4c5c2ec19a9b4113188fddfa |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
