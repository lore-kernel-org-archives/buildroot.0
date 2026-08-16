Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF48C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 03:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30AA980E88;
	Sun, 16 Aug 2026 03:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfisvIF9pKIE; Sun, 16 Aug 2026 03:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4348D80E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786850587;
	bh=pcTLpn20KZl+kS955bY1YFpLJc7RxNp6I4pVWl3uAVU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qdTaDtyUwHUHDZ/KPeMW7wd+yDzVwNFGPQpDwn8BUZIjWCE2Gri4TK2qcf1pa+B4y
	 xsTA5N2zSYH1v6RejyhJnogla4MWNQB/Az4M3wMhILhlwS+rJKuHO7bGbg/jOix1GH
	 3JKmpP2YNGSL8HSCOhC8/wTFADLtW1mp+f+KIrcOEBt9C8exfDCCHYbo3UEv1ZTr+O
	 p2fAePTT89qChtFrFK3NI9Fh21v4Rp2g3bh0KlVmLByl2lhDrVSSEK/c1UC52xpPsx
	 XMZxb5TORAOX4UTfah8jlxSOukKVtnO0FM16OyengETBeoM9fvK9HVjXZsf45oRPxT
	 8x6naY9syjgwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4348D80E97;
	Sun, 16 Aug 2026 03:23:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6ADA338
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 03:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D91AC80E9C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 03:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoCVS8HwbzoN for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 03:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18D5180E97
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D5180E97
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CE2N1Hp9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18D5180E97
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 03:23:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47fecbb7000so1146069f8f.2
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 20:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786850583; x=1787455383; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RK70p6VBe5EAKnoT8U0x4jwLDPiM8u32RkXluSKJGgw=;
 b=CE2N1Hp9+zTHHOv4JdY7iOZ+9xZs9SkcnbCXrYFvNInKBZxxwVV7E3xGI0yJFFNTNl
 f7EtlwZ4c0EPp22rMpr5ORHeIROaNf6zrlpirPFRC6siGf0n0wR2KgheKEYY/61l6Ba/
 AsggbuDkq2H0Fc463wGXCVov5+1DkFtWLjxTuoUvRwjQJ8VxU6m1uESPU8bMR/x54MSi
 1kcfz7E6YVTvTINh8ti9GSSAcIUtgWiHRZwNOlxh5ICbzKWKuavDZwa+j2Tr+4RmRoWa
 t+lBfHTF4p6Q/+xAKIzn0GT3J/xALUtR7CzP1u87V6AMI7WIGDOeE9uWHhAuUzUYGzK4
 eAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786850583; x=1787455383;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RK70p6VBe5EAKnoT8U0x4jwLDPiM8u32RkXluSKJGgw=;
 b=aV29sqOzBcreLTA39uexU+0ZHOu7eamsKaYifxbOEQHZV/2p1d2JC27pCmDFHgJm9y
 oJW3t0HcByvxgW5w9cPSnZGYm84X5Bvni+UBgShJ571DEvgOgCiY1+04RC8rZde4+wB5
 eWX5WEKEFMkdrQDJSsOsEFdq1E+T7ft/4UXfkH2uyHGFo/3vJb/cjAku7wC6ETmX8ESK
 9bZ1p+gpO5TN6LySuJ5YWLUtf8My0sOfI+xEjhbz6urIAHTp1F2UqipVBcwL7idMVQi9
 Fuv4CXYsA5joB5ASmkYTeoJhxnPiYCg8V3Y1EhAFuoOlhsYWcLyrODFY5q68pdLVZ5GZ
 YN1g==
X-Gm-Message-State: AOJu0YyMIpHEcLytdnUuVNChSkclGCyuhfGYlJytcnHJvXb4TJfUFhRU
 SLetXJwJTy18RV5xx6MzvYYqE01hZ91gqiurAH7cPeWMneVmwVFFJlyK0MXUib+K
X-Gm-Gg: AR+sD13S0jpLvLQp7nKVs0VtEQV7dQ7bcjoVxdTsyEYFpHKj8Haq0YAE25P1TD9+2uy
 aeFoGG1by/qC2vAsla0zNVt0MxYT2kjYZUi5rzkvxL2ULDaah7A3xKaXo6jaE6vo3wjj2ttDAPi
 p6HX+YmWaBvNxcCD0lJYurHpajlJJpWsYBTjwiyq63ZtF1+XsQD8T7q1qqRcL7Rc5XC9PeRkQef
 4vB5xvsVZmot7j6uf4i/oVPUFc9oP8Y6TjxrdwDZKWdSKFRPiDmtZbqQJSXKW2Vp8aWlb0on4kD
 Mu/6Ilegz/5AF/44xshe0mflW2tn4ZTWoo232L4Do/HL6Wsfz+DAJ8YcU//0i/vP4DguUcTiaqJ
 V8ZLaLCMcxRAPpsZRVQPISYO5dEw/fPMMtl27yllepFRRgektNjyC/rCfqV+/XWdwTkOxBc6LQL
 jcn21humaLRro33PMPe4krB4gv5u+c9vVUSV8fibOJnF9bFRyMSR/WihGfBvg8Je0=
X-Received: by 2002:adf:e193:0:b0:47f:25db:8161 with SMTP id
 ffacd0b85a97d-48160763c02mr25227086f8f.28.1786850582582; 
 Sat, 15 Aug 2026 20:23:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c07d2sm21086208f8f.30.2026.08.15.20.23.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 20:23:02 -0700 (PDT)
Message-ID: <6a812d16.d5b2c389.3982f4.1217@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 16 Aug 2026 03:23:01 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-15
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

Autobuild statistics for 2026-08-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 23  |  0  | 33  |
  2026.02.x  |  3  |  7  |  0  | 10  |
  2026.05.x  |  2  |  9  |  0  | 11  |
    master   | 37  | 93  |  0  | 130 |

Classification of failures by reason for master
-----------------------------------------------

               host-dracut-112 | 4 
             alsa-lib-1.2.16.1 | 3 
host-gobject-introspection-... | 3 
   openvmtools-11.3.5-18557794 | 3 
                   perl-5.42.3 | 3 
uhttpd-15346de8d3ba42200249... | 3 
                   atop-2.13.0 | 2 
                    attr-2.6.0 | 2 
             dahdi-linux-3.3.0 | 2 
              erlang-26.2.5.15 | 2 
host-autoconf-archive-2024.... | 2 
            host-binutils-2.44 | 2 
       host-gcc-initial-16.2.0 | 2 
              jpeg-turbo-3.2.0 | 2 
                     kbd-2.9.0 | 2 
               libepoxy-1.5.10 | 2 
libfutils-c326ce0cc2a735438... | 2 
               linux-pam-1.7.2 | 2 
      passt-2025_06_11.0293c6f | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
                    szip-2.1.1 | 2 
                tpm2-tss-4.1.3 | 2 
           uboot-tools-2026.07 | 2 
               acpica-20251212 | 1 
                    basu-0.2.1 | 1 
          cloudflared-2026.6.1 | 1 
                     cpio-2.15 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.5 | 1 
                           gdb | 1 
                  grout-0.16.2 | 1 
           gumbo-parser-0.13.2 | 1 
    host-gcc-bare-metal-16.2.0 | 1 
            host-go-src-1.26.5 | 1 
               host-grub2-2.14 | 1 
                host-odb-2.4.0 | 1 
      libabseil-cpp-20260107.1 | 1 
               libecoli-0.11.3 | 1 
          libmicrohttpd-1.0.10 | 1 
libuci-f3fc0b76040685829191... | 1 
               libunwind-1.8.3 | 1 
         linux-headers-6.1.182 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
          lua-lunix-20220331-1 | 1 
                netdata-1.37.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
                 opensc-0.27.1 | 1 
package/vim/vim.mk:88: host... | 1 
                  prboom-2.5.0 | 1 
        riemann-c-client-2.2.2 | 1 
                 sqlite-3.53.4 | 1 
                       unknown | 1 
               valgrind-3.26.0 | 1 
                    which-2.23 | 1 
                     wine-11.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                      x265-4.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20251212         | NOK | https://autobuild.buildroot.org/results/c3408585dbc083a45701ec34b19ab6690aee5ac2 | ORPH
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/55fb14c20480312dbcec7f06ac6ae17fbb7eb994 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/3fd93fd5d8a9636fb4dfc51f7ba9f6e9f8928ee7 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/876d65dcd82d04069ab5696694f26499b5bdf507 |     
    i586     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/822d29e28970eec9204f6511ed40fd99b12ef547 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/3c7c9f4d1abbd236df71c6710e14531202ea0f6b |     
    i586     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2c67dfe1e5919ca35e0e6f2a9aca97f27aca411e |     
    i686     |           basu-0.2.1           | NOK | https://autobuild.buildroot.org/results/360024b7188f37a84c0e5b0e3fff595771a8ff54 |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/823b4c2f996b7b7f3821f3c7a254814f8d15d839 |     
  riscv64    |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/03b4c878e53e507ee255dddf1912d09d0e90d0c5 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ee33c322e1f171759c31bc5870ff411c7eee11d0 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fe2624e62ebe3f1bd0d4ef3fc5a73ca3db0c0240 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5b774fb2b37638579f4761bbf3c2ed171bd2b26c | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/fefb64c266551f0712d04533db5b1ebd462cb1d8 | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ae0f8a92556b5e01d9fd4b53a3b22e767729552a |     
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/0f8f4ab182af09448f665adf718421579d627296 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/9576ed7247a8758b99ff282145a6560be0a73d48 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/6cfc8523034ad102df1e757c2ed67fc73293f59b |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/c029daef7af2a761c6f1351287478cc5f17e65ee |     
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/f8b778920441ca6b7d449e5abe35855a878247b5 |     
   x86_64    |          grout-0.16.2          | NOK | https://autobuild.buildroot.org/results/67c5c75f819a49262fa765420fd14cc534036b43 |     
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/d07c0fb5e360e2784de432a1938b1e90dc3fa821 |     
    i686     | host-autoconf-archive-2024.... | NOK | https://autobuild.buildroot.org/results/c8ccc3d45db5dc01b5e9388971d10a3d39d34a0a | ORPH
powerpc64le  | host-autoconf-archive-2024.... | NOK | https://autobuild.buildroot.org/results/7b4cd44f533ffec1d1164d5e780572e5b7eb7466 | ORPH
   x86_64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/f3aaeef2e4e0f21ad99a5035ce56367812315c8b |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/81a1adb2914266b0dd7d4a4edc387f18ed8167e9 |     
    i686     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/62ef132997837e7cd6a5d4b0619be94527140574 |     
    i686     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/664ceeaef9e2b9d9f2c68119f3304676890ee25d |     
    i686     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/b85fb1cb68759db4f5ebfe1f258a3fa214df3b6a |     
    mips     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/248d66b8f69f84ee4d0e535f2805ef07287dc616 |     
    arm      |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/80837c49987f8e5d7d275b679604c9ead310de40 |     
    i586     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/3d3bf5fc06f94fa0ce67e63d9a83a4f06cd5e148 |     
    arm      |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/6ecd7e92551516892fd2d0ac15a633a03df2a718 |     
    arm      |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/d1804e740c7ec4b0a2242e8a4dc23f19deb6fb19 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a885ec3debdde080729b56431db655d3b0db2ed | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/445197b9507383b407bee5e44450857faff13498 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1e41d20856deeaf645ffa7b9b2142e8ec31cfa61 | ORPH
    i686     |        host-grub2-2.14         | NOK | https://autobuild.buildroot.org/results/f727527036d4a18e1dece5c1b1d6c7db1d6fc5ac |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/24b5c939f877c4ac4ae94ac7b508f4df812dffd1 | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/1656f539da0ccc138bbc40db3b5491190d995ddd |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/28c427c0ed1c0c3116dce88a8a01adfdd9865601 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/8e882019873197d2a7f26ecb48f90c44821fd6d7 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/aef69e131a12a0c5e31f069d010d29bf6111a64d | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/61ec6794e94cd24b28155b104115e25faa6f24e8 |     
    i586     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/165f9fabdb02caedfc498997d4f1884292423507 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/a2457f092f3f29ee8e0ddc78833676dcca89b59f |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/61907db0ad2b5f446c8bd576085145894be8a38c |     
   sparc     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/5d03cc07857961c5c575e4030cd7379a1beec122 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/454bf46a3de38618278d45672485dae33d5df301 |     
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/0d82810a97b0969a0b6c7999f7d70bceffc10950 |     
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/45225860567382fe176b722f6b9c034559044b4a |     
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/10c75c6c4e3be297ca83b14129173f95ce6805eb | ORPH
    arm      |     linux-headers-6.1.182      | NOK | https://autobuild.buildroot.org/results/1641e65110f97208dd95f8e1bdc784506631ca57 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8ab2dd319894947f3686259a1a7edc34164d6409 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3b10c2381446b8762bce7aff5f5d58cd420b802e | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/49ff4532a4ade3d8c777c16f1b986fbd9c7bbbcd | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/91875a23e0c0bce6d59750755ce12f0cd98837de |     
  mips64el   |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/b4639628f438517a3f9404b1c738ceb9b2c41f3b |     
    sh4      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/b285625ad005502c91ca9836ba04c111211e18db |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/12b013462fa6691da02d1966d914db7c6ce049bd |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f1d086ca670350dd405ae0a3e493050225a1b019 | ORPH
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/72e206dacf9ecb99bee4c3deacb812a4f239b5e8 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1a4ec384e27365c3cc291a6ef3e4c7e25045dfca |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/00b75691c5011149b1f5095fd5daefd0183bd887 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/513e8866650042219c0585366de71358785ecb38 |     
   s390x     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/db632cc39607ab79587f2321d71cd5384d862cee |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7e4434e01baece4d090e44b4b3713f2eeefc1e27 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2525a6e24472af913c3f7f6ea660fca085a12684 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0a25566f03ecc724b0f9ccabc5d9713bc3deadc1 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/8c54511e62726aec9bfbc4a86f6f1ba06ca70f51 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/67be6c6eed231a96c1b04888ebd5bc2a2c7d14fb |     
  riscv64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/cb1cd788ecd20ee08e6fbdc00e4839c6e7dfde87 | ORPH
  sparc64    |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/69345ffe80c801ab53a821a785b5859b62cb296d | ORPH
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/cad8c962cd0c175bdc06679dbd42767dada50d6b |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/5b24bcc81c3ddb8e60d26d2f3c6d164b6a08461a |     
    m68k     |         sqlite-3.53.4          | NOK | https://autobuild.buildroot.org/results/ec90eb2874acc9d8078646cba9d3cfdb12c44195 |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/c2aada0de95a5104080d5c0f66e844e1f541c551 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/e509938a9a24d656359039a034018be3e05c90f6 |     
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/9ad86f25efaa000b582dfc164b41b5527f3a5bc4 | ORPH
    i586     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/73b460811be67a2d6e265ada415ee3c2bd581700 | ORPH
  sparc64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/550a7befa89882c385a80d4d803137cd245cc216 | ORPH
 microblaze  |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/1b393e3eb7d5fa66456d5dc37bcedfb2c9b4cbb9 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f822ef3b360caffda0c1d684ddff6e0c49ff641f | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8c8942ef16390494024f8fa400f6df7799f37fb3 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f39bac2b1960c8156a4a94ea7d4da6f1106282e6 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/19fadf8affd3eadd338e4e722780f25f38ce16d2 |     
    i586     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/9c4cb6e95b80cce501cfd3bc080e9dd69c7bc144 | ORPH
  riscv64    |           which-2.23           | NOK | https://autobuild.buildroot.org/results/72141211efcbb417197280f90b20238106123a1a | ORPH
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/92ba7859b42567a9638f0fd2db6d43da1cd072ae |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/24b5f456f597e864c8c839f7cd2f9350813394da |     
    i686     |            x265-4.1            | NOK | https://autobuild.buildroot.org/results/7b1b9b977fed240da82e906ff624bb77cbb2990f |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/d3ce1b4af6adf5507634d3b246e824cedbea3269 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   dante-1.4.4 | 1 
          host-xfsprogs-6.19.0 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                   libidn-1.43 | 1 
            minizip-zlib-1.3.1 | 1 
                opencv4-4.13.0 | 1 
                openssh-10.4p1 | 1 
          qt6declarative-6.9.1 | 1 
                     yq-4.49.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/00745e5fea1fd66bc9b2f38e8ec8193a4da06629 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/8a91d4d7c05e2f1d8eb39d507cc695a247b9d561 | ORPH
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/01628751e9e6d6ce10d87f592497194fcef17d7b | ORPH
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/7f443989b7ef4111f60be3647d708bc6b72cb8cf |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/e6985b61574a8ab5530e53f76a496ee29680ff95 |     
   s390x     |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/919e601e84ccb29a47a2b1e3583aa921908d017d |     
  mips64el   |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/5fcac29a5fa7789678ab4089f944f7e5a6681aaa | ORPH
    i686     |      qt6declarative-6.9.1      | NOK | https://autobuild.buildroot.org/results/aee98e12c076ec82105bafdfe606e61b4f64e30d |     
    i686     |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/4a7705c35990a708544937833e354573eaac8bdd |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  davfs2-1.7.0 | 1 
                   duma-2.5.21 | 1 
       host-gcc-initial-14.3.0 | 1 
      libabseil-cpp-20260107.1 | 1 
            resiprocate-1.13.2 | 1 
                 systemd-258.7 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          davfs2-1.7.0          | NOK | https://autobuild.buildroot.org/results/836f139c067a0674deda16d43c894001bed15ab5 | ORPH
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/c56425e2723f3d9416d5d535a7f0426c7f25e6fa | ORPH
    i686     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/94dc2b6d5240ea3c4c340a50836e3c517cef588b |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/d2d9343d9f75bf9d97ff634e5cbe670c1832d998 |     
  mips64el   |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/773196f47c0cdcecc1d588e9c4e6d2ec9b1495c9 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ac55717a3dcdc73afd33982a791d70876906a859 |     
  mips64el   | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a3b0ca41d8697c0a7cb752ae9d0c8ce8a855a234 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 3 
                   bird-2.15.1 | 1 
                  botan-3.11.1 | 1 
          cloudflared-2025.1.0 | 1 
dtv-scan-tables-7098bdd2754... | 1 
                 fwts-25.03.00 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                libdnet-1.18.0 | 1 
             libgphoto2-2.5.27 | 1 
                  liburing-2.6 | 1 
          linux-5.10.246-cip66 | 1 
                linux-6.12.103 | 1 
        ltp-testsuite-20250130 | 1 
           lttng-libust-2.13.1 | 1 
                memtest86-7.20 | 1 
package/linux-headers/linux... | 1 
                     pound-4.8 | 1 
       riemann-c-client-1.10.5 | 1 
                  sysprof-47.2 | 1 
                     wine-10.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e753386ac0c6e513912e725f3926ac5c05623653 |     
 aarch64_be  |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/294aaf4841e4df1909c84258e43166c3228969c1 | ORPH
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/7f4c2e305fd6539d4b4bf136dbd5d8f2a43328f8 |     
    i686     | dtv-scan-tables-7098bdd2754... | NOK | https://autobuild.buildroot.org/results/7f5d4ba49d70c8bdae571bfc564a6af4c5e7c75e |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/00ef2aedd207d33a82c3a1a5db6ecd38b102937f | ORPH
   sparc     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/e3e54d203a99a68135d9961c7bd08d457d3635fa |     
  aarch64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/d806649471a2eb7c84fe21f0d35b73de2674bb91 |     
    i586     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/87b0c93fbc4be996f692461fa0f380b96614d091 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e27eb400fb6aa41cae3b72e6489d0fc19f0489bf |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9390c41039b36d6baa432997b4c8721fb4dca467 |     
   armeb     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/353b3d27994f22916eceb92221ae929ab92fcdef | ORPH
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/50a5cd5df363e86cfabcb19e772ec0fa84133827 |     
    i686     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/de837621537c656e73af8b0316677027bb689cf7 |     
powerpc64le  |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/44b04edf95a535285f264bc7a6ec9e24549884e8 | ORPH
  powerpc    |         linux-6.12.103         | NOK | https://autobuild.buildroot.org/results/cbaa2a136ec7ee898e9b78a125866bc7b48891c4 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0f2afe98e4ddac82c501735c437de2365f17e352 |     
    i686     |      lttng-libust-2.13.1       | NOK | https://autobuild.buildroot.org/results/84904c2053f321f0f1fc7df3268b71269d860579 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/122e1c7a71301df2fa6ff32d88eb67e9614ff64a |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/25015054dd79432be82505a3f93eea966c90e4ce |     
  riscv64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/8a34011328081d47c95f2c1ef71436fca4028f05 | ORPH
    i686     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/2ae869f32b4a0525dc6426c6c3434b24b4f6d623 | ORPH
    i686     |          sysprof-47.2          | NOK | https://autobuild.buildroot.org/results/ff936851bf9cf8eca1ea34c302da8f1e26066116 |     
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/b54bff02ab477b75e29ca664a7abe4036d6457ae |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
