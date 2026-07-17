Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD1AC4450F
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 03:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D7C80E0B;
	Fri, 17 Jul 2026 03:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wY0kbOUfPh1Q; Fri, 17 Jul 2026 03:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBB3810E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784259238;
	bh=qAB5yX3aiNkuCD4ahdylyz4vYI7HLfeMHjbwOLK3npc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bDVVyiBgqHLo0+rZ+cWuwqmcVGlNNOkFVvISuKBGYIa2NHvAu+OEC6Yg1G79x8EX3
	 6Fwe3U6jw1oqIKvD5xBATt4c/ihhjjB0hvC34fwDI4cSsrEU2auh2uP72vYOpnmN4k
	 v1h2S2ZUlTB/0MLJOAHvUGi7uV+TWuE/qfccgVh/lwcHx8W1QSo8Kg4NWCVjut8NEy
	 eE3znbkV3i7Aei1+Pmc3aCia7QVNKH/hsce9ZFGnd37EIsLBqQCsApQ6mYR1WOs0JH
	 An+3JTxA+1ki3dhpqmwS2dJIFB1dWt5xkZttd6vr2pi+WxUfVzQXtyuZmfiEiIbY2C
	 6XiTsF7Gew5gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBB3810E5;
	Fri, 17 Jul 2026 03:33:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA70E1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 03:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D01F34094A
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 03:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRYk0J-fwKwh for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 03:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4105940854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4105940854
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4105940854
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 03:33:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-470174001a0so2062119f8f.0
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 20:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784259233; x=1784864033;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5cAdNxHjOvMSt1H3Jmj0BhJ3yVKIjh9eh9yf/A1l1E4=;
 b=bk/cFJSLM+QVpyUaJs3vg14tNglr06p/8owV518bGWCLKGOTkHgP3nFxCJLsc4tEVD
 3Z+pbQFn9LvUL+MHPUkOa6K/Wsf5od27oidvQbavzxAIaatAGrAD7jE1R373deSq4fYU
 YCyZ+TJ46IsM0fKaAnKY5YNO89bCFAhZtSb3bn+DAdmoZK4ARlXSqaMkH23aRJjO4R8t
 fdXLzUzHv1H2x5wKdGgBGzyJKVH+eqrLAb2SsaAvCboyPgaITyJeiXVyOKpVlr5wbYpS
 7AYO8TaOdhHWVq4q7/9W7Hn7ELCosK5Sb8rr3XU3+CNQ0cxG6YOh5A+D4CnNYhiNJaqg
 0ZFQ==
X-Gm-Message-State: AOJu0YwsXtqkPebAzxLAcyhF0kvDnHnLte8D7fY0KspuJ/Vya9LCx5nA
 qYgg0Quuj9GugOSdoO4tLFpmZoJqUg5SSZOGnf8+gND+bd03/DxTudau5pwnBeTv
X-Gm-Gg: AfdE7cmRN/twWMAcXdjPbllRuNTV5OUF5LIV8Hq6AouWSk8Jyw3lccxoDE0wvGE4IP8
 uvtD96HXEogR0AggJ3UVmn9SP2+yc0nVs3cr0oMciNE5X3psWXdvzxvhduUuUB8j1Ytv7JfEepL
 QXz7Ma3LVk+duLeZLk8qRwlUW0FkPEIn6y7IHGc1yE58QUeTsLi+Br3odszLoeqLq4LHaFHbf62
 DBkHqh4khBNCmJMD35Y+CnbimdllUpQyCqRzA7M4+f/YoYH7urJIZK+rSbWEBgz35DFuwKEER4g
 ioYHjjnWGlAia3aXuOsqFjoVBtY+Z4kwUfdd2kZiqYHq3qk+paiY0ybZB6PvpUwzuR19aoqZjC3
 zicSf0lSwQLmpE38tSAzT5QYe3y535u2AbUrhFwvpMG5RQ3RRnBhNg+MGoTeMLXTLm/kkQ0M26O
 dVNoH3
X-Received: by 2002:a05:600c:19c8:b0:495:43ab:4f78 with SMTP id
 5b1f17b1804b1-4954a3d0ad9mr6835065e9.7.1784259232611; 
 Thu, 16 Jul 2026 20:33:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2a2504sm15491885e9.2.2026.07.16.20.33.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 20:33:52 -0700 (PDT)
Message-ID: <6a59a2a0.51d65a57.28695b.13b8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 17 Jul 2026 03:33:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784259233; x=1784864033; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5cAdNxHjOvMSt1H3Jmj0BhJ3yVKIjh9eh9yf/A1l1E4=;
 b=oT35g0zX9xs/Qd1fi96woM49U2twrzOZMOr5LaUtGAgdk0WbOW9E2YaxBJ1l3q/eea
 CRz8tDAVGesL/4NiOUAm+yoeRQrOjkp2spqDrqfuVOsMM1EtPpgQeT7z92TZlZ/+/q7q
 T6KrtysqXsihA+0m5GnnxjY+ozgw9RkvRA9FnrSjSD7y3RiuJkZFozoeFuBB/OULHgoV
 iio4AcvVo7LIvMiBBzq6PO2es+VqVCGPNjo+Y3WrvqUbI8HqGOJ7M3xbmcSlFOx7korG
 F3gvJes20VUa240IFDcjw/hmv4M7WsjwKlJETZ2gvtuhnztmHsLd6LOf/k8zJjufobBS
 r4zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oT35g0zX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-16
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

Autobuild statistics for 2026-07-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  2  |  3  |  0  |  5  |
    master   | 25  | 57  |  0  | 82  |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2026.1 | 5 
              host-pahole-1.31 | 5 
uhttpd-15346de8d3ba42200249... | 4 
                       unknown | 3 
                enscript-1.6.6 | 2 
glibc-2.43-45-gdae425b55420... | 2 
          host-binutils-2.45.1 | 2 
                 host-gdb-14.2 | 2 
                   linux-7.1.3 | 2 
               tcf-agent-1.8.0 | 2 
            vorbis-tools-1.4.3 | 2 
amazon-ecr-credential-helpe... | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
                    fcft-3.3.2 | 1 
google-breakpad-f49c2f1a202... | 1 
host-android-tools-4.2.2+gi... | 1 
           host-p11-kit-0.26.2 | 1 
            igd2-for-linux-2.2 | 1 
                jemalloc-5.3.1 | 1 
              jpeg-turbo-3.2.0 | 1 
              libsodium-1.0.22 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                    ncmpc-0.52 | 1 
                  ntp-4.2.8p18 | 1 
                    olsr-0.9.8 | 1 
             openjdk-25.0.2+10 | 1 
                openssh-10.4p1 | 1 
      passt-2025_06_11.0293c6f | 1 
            python-iwlib-1.7.0 | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 
                   s6-2.13.1.0 | 1 
              skalibs-2.14.3.0 | 1 
                  stunnel-5.78 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/dcd74163954c963da66478c30ee84bff653b6361 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/4dae62e28e25500815aed962a2feec26ee4290a9 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/26653739046a1b40f90678129f216be2e70547fd | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6aa1c8666d946585cf0e477c770d988c143f3835 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/94fb8909d6ec30cd0d3ad3c5ba10152be94455cc | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ae1efc2ef7635c5805fc6cc6cc804cad58b186d5 | ORPH
   armeb     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/4e2a0d187398b0d5e93155b96214a75884e54c24 | ORPH
powerpc64le  |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/d4917559374889062f378e6a121f1c2f11499a10 | ORPH
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/5d258c2e890988b81f90eaa654d2d1149bcbb73d |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/fc513ffaf81f995cb9df61bce691c5d9070a05f3 |     
    arm      | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/dee6cab14fb4f9af679304607d7ad7fac759c543 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/42ba45ad81c06cd5f4a8ca5218a76ea46fa7f7c3 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/18043185187c8327125b0da17db0598575b789e2 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/1cd0a696802fdc747bb5a68306725b47579613a9 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/969bf2a646af4d35a3977f767cb1910e756b3b19 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/9dd311164596ddf54b0c63e1d846880f0c60b853 |     
powerpc64le  |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/b088438f93623972bfe88dfbd9bf732ebba7c296 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/fb82f29bfad89fdcc2abb600258cdebace691547 |     
 aarch64_be  |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/45c1805940fc4bc4ee0578dba7a3ee97e3e1e5e5 |     
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/229df614519f37ddc9f43e5be4389d8f8e03ee1e | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/843e6a9699e04db61b7093485ec7e7197b27b318 | ORPH
    i686     |      host-p11-kit-0.26.2       | NOK | https://autobuild.buildroot.org/results/ed50ec747620f33ebdebd0e72be919f42038907d | ORPH
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/e1a6f71d08551a0abcb49998868249209afc2c3e |     
  mips64el   |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/f66119918d9a285c74342882acdca8000e3ae773 |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/8fdba5f92d168082ee9441ba019f7d031b334258 |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/2d45cac73b9b9516215feb490b8668c387253165 |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/99598049e756cd118ff06f26c174b7cf519f8556 |     
    i586     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d8b610442fefa5702b749760a1cbf13bbbfc592a |     
    i686     |         jemalloc-5.3.1         | NOK | https://autobuild.buildroot.org/results/8034ec7762a32aff4d49ac3bf2c85ea50b432ae1 |     
powerpc64le  |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/9461ec2fcf058d75443b92176cc4d96860cd2804 |     
    mips     |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/274fe9b1b9a0a312cac1e27f70e22a223337db6c |     
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/a4df7cfdc98940e0a1aa9da4bbbae158190d3707 | ORPH
    i586     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/4868e45496e0f330e2b6e6b0add2499dba6764af | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/7c353aaef935709bcb6f368b450c408d8a5245c0 |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/32fe7db73bfbe1d524835586c3a2f5e5a39e31f9 | ORPH
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/d71bc660000b285229657feaf611491f741e4b40 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b42f92dbd957c1248aa647cf8d35720f23b1d670 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e6a5022f340677e8101e4d070c3db91e74678997 | ORPH
    i686     |       openjdk-25.0.2+10        | NOK | https://autobuild.buildroot.org/results/fe4891c9fdae57de9bb7a30d9fcdc1c1f2dc4043 |     
    i686     |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/194e6209a5b3b0b4e78ed9a548ede7412a1dd3fc | ORPH
    i586     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a4dc3dcce312e38153fad8e7bbc38a1cbed36380 | ORPH
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/526bec984b36103006e3fc3625b3e3da77a76121 |     
    i686     | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/bfb1a7713ab8cd192f28b2efe191994f4408ea7a |     
    hppa     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/267364df4016672ad48fd68a969c02e056041fde |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ace916b7463531a4204f56c042d38faf295aeb23 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/23744a66dcb64f5f723187f6618c007d7d9c6017 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b8ecfc481a5aee7aaad46d47ae02a5f5ad5c87b8 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/65b0b87e4fade6b61c5b7d98f8f01305ca21e17f |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ba12465fc89989af94ebbf7092f6fd109d4ff7f8 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/15e3b6c5083013cae3dba55ccb59b69fca7700d9 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f07158eeea6f9b1f905fa417d6a298540ee458e4 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4c3b27789628fc48aa434097c3e2e8de8ac852a6 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/b2e17d2ec7c40d2ea4be52afd0e692a95e940740 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4b2a9f8621e4e0317cb2f2e2b37c5af532cea25e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f29d557445160181cd9542f9a367023522fbb97 |     
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/409a36df2a3151686f9de61e17678b7661808a8c | ORPH
    arm      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/68cbcbefabcae62ad6a7b09734e95b57e26ff603 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   linux-tools | 1 
                 rtptools-1.22 | 1 
           sane-backends-1.1.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8b800f4ca52c802ca043f6561f1356f46d07cd2f | ORPH
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/18fc1fcfea4dba647f3996a3d9f9296bc69986c4 | ORPH
    i686     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/38957382ef850a60078e03d47331ae89a4c76fd0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-go-src-1.26.3 | 1 
              host-rust-1.82.0 | 1 
                  liburing-2.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/8c9af506577e5beaf40b9385fdf53d4d9b57f710 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9dba2001e256571ae240dcac45466e9fcbd3141a |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/a099e348aa8eeb12214660c189b9627492e53306 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
