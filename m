Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23792CD98E6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 03:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D5B61CC2;
	Fri, 19 Jun 2026 03:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sF8zSKb6gWP; Fri, 19 Jun 2026 03:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2532C61CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781839522;
	bh=PdcwTZFkFH5bQDay7ySRJ5zWQwgaizypwPgOPHKQKjY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PEb1ALV/PPtQK5S1hGoUjDxVbnrcgzbE1maqWAdJfCywZ2kVyQAxS/u64rBLHk/By
	 4p6GhLuMZtOzk9auSzUtvgs+b14xozuqKJEXD85rcB+TVQC2N5t9x2RDy7dOX0mFpq
	 UYm/OV/30Ol01o3HAfGWCaqEsQ4StnGU467kjQsIxoefsT1EODJenRFRJ7JYl2qUa+
	 Pgel3zh/Q52O2BKSO0GYV9qVROTuctN6IgiDQscFdtHPGjjPsoHmTX9lwIlnTEXIS5
	 bDIS013F8Mo3o08LSx9hSNMK6eqCTXOcp3u5hHmPRU23aJuNgED84fHWtHhfp24DY3
	 PqtQP/U0sesdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2532C61CC3;
	Fri, 19 Jun 2026 03:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A085367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 03:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BD4661CC3
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 03:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljrTmfoS_zQS for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 03:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD13561CC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD13561CC2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD13561CC2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 03:25:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so1281236f8f.0
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781839517; x=1782444317;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYJSGKYKjEtE8yunrEWm9d7c9lIi/FzeIowRlxGonqo=;
 b=sqJ+iHP5ROd/QahSFZrfgHyhdUiHGZ/Ii5jy1pBSJ/22v8i3yBWJLtNcjzSYfsfv1b
 Z0pX9qwuG5tKhQe5QiTHG1e/a6e/Niz0TWqJLWM0niXHVrsNu7rVGm/Ps9UTBlJ95BCI
 9RgvUolLgh0udXINIVVIlFqChNq30DDAOcIQzFejar90oNfhosWmdjfnLQUO7STjuI4y
 FQU8ltuyX11wbvZm2crVO6y1uRQb9ikORPg0H83E0/lfwdtcvZjhITfehbEpRtfogTHj
 ZJY3sut4l1v6j2SV1mkItoTNn+V8fXgFaP1eZrq+8MumRw+k5dOsRuReGNTmd8bRbHZC
 uN8A==
X-Gm-Message-State: AOJu0YzuQIh2dRyxEOAdgxVmVfwC5gPnMKanC2rgjmC8wC2kL2gREGQ5
 ycOgSx1pd2nRAqru2altIBo97T0NZMxMt3nhlENuBAPONAdfShR1II/nigP89tsT
X-Gm-Gg: AfdE7cnrB6vSmtjyPW+0svduClwPR1kSaOXf1Fnb9IeskFiGDUvowe4rL9COWng4xeh
 lJObr2yH1HFJtYXjc0irNJXI9esVDPXAYhFrhqPIcxfocWt5t2Tj0m67wOmcrxqrQZK/vMVYTMt
 qUtOsLvwGJmHvsxEJXz6It4sbBgcRM8pEk5INGEAHJVZsdQKBmRQjJ219JuTTFrXJoqepyV6rlu
 rN8k6jJlHhgQQxK5uEZRsdORRCrdZ5nZ0WYIXwOKNh87vPvf5AV/woV/Xlcj3gurVJyKNiykbvu
 vrv/PQ+oSRi9nxBDBcoUbpr09J/w5WXg17kXCFqDDWnzoNKVlwG0rEyTCGwBrYaq7EwmnPwVyun
 +n6kRpSbK+3Ptasewe8upbneMnKxg2FsUJxariUaGo15Pe1aoNXq0o0tVno8Vf/MEK7IucZAn38
 TTYNsbsgehryh3vKo=
X-Received: by 2002:a05:6000:1447:b0:45e:ec18:f20a with SMTP id
 ffacd0b85a97d-4656e5c4b14mr881694f8f.32.1781839517339; 
 Thu, 18 Jun 2026 20:25:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-465090c4ffesm4305718f8f.9.2026.06.18.20.25.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 20:25:16 -0700 (PDT)
Message-ID: <6a34b69c.53cb9477.3ca1bb.4c4b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 19 Jun 2026 03:25:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781839517; x=1782444317; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EYJSGKYKjEtE8yunrEWm9d7c9lIi/FzeIowRlxGonqo=;
 b=Zv/b8i+6QCL8fk3yaiwS4F6LvfvGHsLTrctpWBhQVg6AgL7IErthHkrqm9h+p2pC1L
 nokS0uvp8SGtHSaOVwMbEMfTo69Af3otOYf0lg/KrHlz5zN+HfyJ3wmjzvD4FFur+0Sl
 cqp6msod8kuV3i/wbR5E0yiTz7FiaVWRURniRvILvdL3QPWXGq1Z6qP0DkPpPfjvxoLD
 Q8tSrYxJUkTX9AUjM2eWT6f4AZW+gGmutYKuEsalJwF4wMB/AtY00a/PTvwEB8RcXfCE
 bCvmjbD8lS/Yf1NyPIYC6Rbt7c2iNlsmudB8xz3iK6P6s6hWq2INNC6/nXf3XdAjg5bN
 YvGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Zv/b8i+6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-18
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

Autobuild statistics for 2026-06-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 11  |  0  | 19  |
  2026.02.x  |  4  |  7  |  0  | 11  |
  2026.05.x  |  5  |  5  |  0  | 10  |
    master   | 25  | 68  |  0  | 93  |

Classification of failures by reason for master
-----------------------------------------------

                   dante-1.4.4 | 5 
                       unknown | 4 
am33x-cm3-fb484c5e54f2e31cf... | 3 
                   ccrypt-1.11 | 3 
   openvmtools-11.3.5-18557794 | 3 
                   perl-5.42.2 | 3 
host-vboot-utils-7dfa482d6a... | 2 
libfutils-c326ce0cc2a735438... | 2 
               madplay-0.15.2b | 2 
                net-tools-2.10 | 2 
      passt-2025_06_11.0293c6f | 2 
uhttpd-15346de8d3ba42200249... | 2 
                 aichat-0.30.0 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
firmware-utils-c42a3bc53da8... | 1 
                    flex-2.6.4 | 1 
                 gnupg2-2.5.20 | 1 
                   guile-3.0.9 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
          host-binutils-2.46.1 | 1 
       host-gcc-initial-15.2.0 | 1 
       host-gcc-initial-16.1.0 | 1 
            host-go-src-1.26.3 | 1 
              host-guile-3.0.9 | 1 
            host-mfgtools-0.02 | 1 
                     kbd-2.9.0 | 1 
                libmpeg2-0.5.1 | 1 
            libnetconf2-3.7.10 | 1 
              libopenssl-3.6.3 | 1 
                     linux-7.1 | 1 
               linux-pam-1.7.2 | 1 
                 mesa3d-26.1.2 | 1 
            minizip-zlib-1.3.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   qemu-11.0.0 | 1 
                  stunnel-5.78 | 1 
                 sudo-1.9.17p2 | 1 
                  sysprof-49.0 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.04 | 1 
                 uclibc-1.0.58 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/9cec2abb843a6217d6acf78f03e59071a2521f60 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/fd8286b897de94325df995100ab655679cd1349f | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/ccf944e57d7e351bcde4d58edae8c5131a9ae27d | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/98772d83aa7143f78cb2311d7b7a34be2b2be5fc | ORPH
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/2932c420916c9095c5c1faacf9c44f57b36c7b82 |     
    i586     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/b96900e0d9d412b4d4967f7be17ba83145a6983a |     
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d0442e80bd780cb3842983961e419caa70b6d5b7 | ORPH
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ce39ef9c6eb6f5169e5dc43789da5968c703ec93 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c62f28587007ae272123ee0bc0adc0a52dfbb345 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/37a9281548071a126c791f91236526bb3ae16a43 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3644bab7098f7a8cf625fea3b1860aa5001297b7 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5515760bf0d8cc3ef114ba85c22c39a31543ef89 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8b0269c2cd68ce0b0835fc01a320a3c047057c55 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1ec020de3a60e7ed628665c61e763effe7a4b699 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/dfd5ddbf1065bbe147c91d44f150cb34d7053280 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/67006b0c2be750a255aa328cabe6447c85a2f25e |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/fd2d0f6476eecbf16b7fc6a3a8c1b38623f77081 | ORPH
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/0da8a81e6d2108866908fa4c5c756bb9fa8918ab |     
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/704a51eed5a7b79bad8f176b138ba3fcc717730d | ORPH
  aarch64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/5dd1a7325c630671bef9e06fd94f34f3ed623d50 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/f8f3bbdd4da06e18ced3bb633434def2be206f02 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/85afa8f41a8905a2213bcf7151d955dd9b447194 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/fa0d00845cec01aabbd82d9d9b988a30dd5b5627 |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/4a5d3723e14c66051a1a9197edd1394aaaf644e9 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/ed4a8673afea803d1687c45951fd44c3d851d72d |     
  mips64el   |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/6967fc90d94afdc0e14ea758c92eeffc5e8c748c |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/7377bf0434fb3d2f446bb25697a0418d389e8f35 |     
  riscv64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ca776847ad6273ae1e8bd33e64cd47b40640e3cf |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/36651b6dae90bd64b63f715a4567de4ee704202a |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/0320d3dd32eb9f8f750244760fc3431b7449fc3d |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/46917778f404d8fccda91747ee0e738a45a47627 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e8b1026022b4b528ffdc2c2141357ba4a83e1843 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/572c87d07e34de4d470f14c242e065f13be89bc2 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/812bb5729eb025a5674691ea5c5dd52c43e5450d |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/59ff19b9df720483e165b7bdfff4c44ddf78f20b | ORPH
powerpc64le  |       libnetconf2-3.7.10       | NOK | https://autobuild.buildroot.org/results/89cabc4d68ce15a24f27a770fdffd6ae6d56e288 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/7278c1f0955ca58ba089a0f7cbe0e5457678ff85 | ORPH
    i686     |           linux-7.1            | NOK | https://autobuild.buildroot.org/results/18ff405bc02a103b393c38d5afb8c6f48f27147d | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a9856e259caba0ff9fc3ccf8bfef41e3416a037d | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/4d0badab4b147736afcf9caa6db77e93f364adea | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/6bdb69548e709e080b97e699d809fd07ed546a8e | ORPH
    i686     |         mesa3d-26.1.2          | NOK | https://autobuild.buildroot.org/results/16b2a63b444d7f84ceab5134ce9ff63e910537a7 |     
  aarch64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/160a7beb3cf9d23cc6194349bb8783b785a10656 |     
    sh4a     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/46bbb87cc395531758020d0d85513b846e8e0995 | ORPH
    mips     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/33c140f6317f2d0841fd6d69361b8bd59342ed1f | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d0fed0041f1b816c9ec84c634993d08fce6a4788 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/95038fba2ad4c14efa059fa47b4593d16a08554b |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/919997cb764698041908fe9a2425c8951df8e455 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e67e77358c4b633f06e839edda6425b73c4ca8bc | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/989505003bdc2e00974fa1bbd8439327b797427b | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/42805c4dcfc31dacde99fcbdf8e5c3d77daf28a7 |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f30f8e23e2725f6784fbf8b11183fbbf5f319f4d |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/295352b06b6f793136afa6be1d6dce4b3e75d602 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/6d9c5101ec0b8649e4e65848e636b8ead2c11dd9 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/da09f485ba34f15a28b20606cb1a90a5b81e1204 |     
  aarch64    |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/cb9aa59f05d184252abf5ab9d3a3802488eebebc |     
microblazeel |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/b87040d5264befa18da213d460f28a214410386b |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/6cc625691d1a984b4178f95a749ab50b15894e7d | ORPH
  riscv64    |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/7f1cf203b0ec90856284949a17a6983e8f417688 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ea492d82e98623e621e222f214b7cfe860f0b59d |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/106dbe367645438e703332e62ba53d01826fdd28 | ORPH
    or1k     |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/8cfde3822a675f30a8d88de4a8ee09e0d9a7c33c |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/74f93d31991d1adb69d8e8e5ae0556e048dac170 | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7dd7a1ae32275df6cc2782db67336f1ac5700ca6 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/01bc1a0ee518c48493095866787bef884ed3929b |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/98cd686e44592b4c171a40adb1d4b3f510ef7cdf |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9a10881d832a68229818d3fb435b057982a6468a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/7325a8ccbd66a97ec6025410448d805e9459bb11 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
                  ffmpeg-6.1.5 | 1 
                 openmpi-4.1.8 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/42c50c712505dbbd7f5accbaeefecac99b3040da |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/77e29baf433bcd0bfc008e8a3bc350195b1e7486 |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/1c150754ab11f11305f919e8c5445d18f7f9b20e |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ddefad0b1b2925c2532fe6034c5944ea09047f92 | ORPH
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/eca8f298e4fe01ab357af58120509aba041aec23 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   dante-1.4.4 | 2 
            18xx-ti-utils-R8.8 | 1 
              host-rust-1.88.0 | 1 
                 linux-6.19.14 | 1 
                    olsr-0.9.8 | 1 
      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/42f314570a7ac375c9c1d9c85947ea7b3b9b6f21 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/86cbfcb7eb6bf562cb8612df76f3f1d9cfa8a077 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ce8d51d3aaf0ae6f9a3fe626c164392799224151 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/34faddff15421c16dda3d0c4449d3898f72de0f1 |     
powerpc64le  |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/adf882910fc02c29f1fb7493d4308622d8110144 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/30fa90fea780886143cb1e7182a60b067c37ca90 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d4e2e061da3b5f3e18d0bc89878d54a9164df182 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 1 
                  bcusdk-0.0.5 | 1 
               host-ola-0.10.9 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  liburing-2.6 | 1 
        ltp-testsuite-20250130 | 1 
          python-tinyrpc-1.1.7 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
toolchain-external-linaro-a... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/84766452c4a1fdd06938183677740fa0d53ad90d |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6d91a43d55e4cb8cb36fd77c77d41f6d170f0d4e |     
    i686     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/40fbc4f558f7777027ada2f8abb08d042c67285b |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7979330be290222e971da32cb21ad46c294d42cf |     
  riscv64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/3ff1db0a0f41afd34d08848f36a3b319a3f824e4 |     
    i586     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/2474865dad436b917416dac4576b2d44dfbee465 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/7c90bda8b138acc4b64e9166492a8e5e8358e8e8 |     
    i686     |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/b1234818f7ff5d8053ffdd4c8464eb4eb3c6704a |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/cc650da0354b70709a2246db0823b390c4a5b919 |     
 aarch64_be  | toolchain-external-linaro-a... | NOK | https://autobuild.buildroot.org/results/2f323793bc0a866aea3f6c21d899267b099e7e3c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/db6e848f2a4e4dff6cc2ad36369739e408d152e9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
