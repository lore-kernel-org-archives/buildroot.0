Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352E7FF8864
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 03:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB27413FC;
	Wed, 29 Apr 2026 03:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biV0JMyc-Wh7; Wed, 29 Apr 2026 03:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E069413FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777432939;
	bh=U6qsnF717uobegVMMsGSdw01+vO8Dl3BXA3u3g1SpFI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OZ+9ha34fnOTeC8XDJxQps5PbSZMMCzIly1jz+zl/TyyA+V2hOM9iuCof8126WXVb
	 SB5gytGrUiDsn0ulaIQBqPxZc1ChJORmo+OKFpVRDG58uYJXRwDLYk8h7yal3akhH5
	 mc03rcFjDlDOUl4Z4yNkClJiL66sfZo18+Pv/WVGJUUWZfZdbgl4TOJq+nPRxPwjO+
	 q31G9HezeIum0/m0hjQOY9IPlsSqkRJqMaK4ZGXOsPnEF1v8de0ZnZOtHiMfYpT8EE
	 h3yvBMekLoBHa2A3LlCdmBZXwxi+B+Rt9NnjzAcPXQv/bwhlc8bBp1tGTYzype+2f8
	 kjHfuoljTgs+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E069413FF;
	Wed, 29 Apr 2026 03:22:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1236C1B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 03:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036CE408B9
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 03:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFxGSXZxSBN1 for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 03:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B29C40599
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B29C40599
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B29C40599
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 03:22:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ad135063so109310435e9.0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777432934; x=1778037734;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9adUbPJM9ZGW0GWFyhXKaFc1nuRA+qn44Fn2G/YzKQ=;
 b=cqAKwdjRV/VfsR7pYbfadmTzkWVl2ajsJi6iATaXHGhalnMWBAV7iEewKdFQthYEeg
 p6iq7Il0tXEos6Dvw8YRVscltGJDhzj8NmpMaObo6xoGoWNIduYQJgG/tnRTnuBBfoFE
 SsIZ5HugzzIRxEHjYiX3Cu3UVytpm00eTO1pOB9MKupiH/tlfWv/zUUZOAO91i68h2Oy
 Sk3BbGZGTplJVxLF5IMKssEpsJIMSz9sTT2y5E8Kd0Z/mPbgTULXUHNhI2QxhL1soyLK
 wD2FN6/Y9fyOYKMzLaohfn1/MTz3BvFKlq1H1AMEDSDFpNS2aMgFN6ljw5DKZ/Zbja/c
 Cn8w==
X-Gm-Message-State: AOJu0Yxqgg+vF1wvbw8ilI8vE7PRbuZmGzsnqo+ebq3i4xjJ4gUQmO11
 sbCHzCg+pIOf/jaK2zTxNA4mufVs4bmmYjoZ/DKV0RRSHlPvT4O9BK4eV5JC8UHs
X-Gm-Gg: AeBDietAcziYwa1v+klHS9IKo3BdR44iIpETYXOJe4OQsWoUdQ81fYWDJJMFJz3dYcI
 nwd7i83tosatOa99O74tfTDj7OMhWlxbi8gO80LZ8RQcxNGsNlQu9RDpr4255jJqRD/5ME5b10a
 1ime3rob+ZGW+mCsppwzfDk/tpM25BKDFY8AxJbh2A5flwXoLn7Yg4184zWwuf6kkCEecliAAMb
 EL9et6HyjnHTcLQhhaZbpsH5gK+p+B/4X0L+yk3ui51Wy8XcfJBBmgghTZxBIw2oO1NI3lfOG7A
 19gsX86ljd8xJ1huyqs5coicSd1g05ITuGNBFZskuXidvjQA1nYJRLRe9TfaNR0Ivc/+d8q4Zlm
 kX1kiNE5oqZo3ismVytwJI01TbUmgAOOgOp65DWPMpfEeau19u4VEGgl9yTIaNW44a6KBXpF7dM
 /1gFcODopAwGIQVY79B9H3XFHr8tVMw59bGmCdcVmN
X-Received: by 2002:a05:600c:4790:b0:48a:5970:1fe1 with SMTP id
 5b1f17b1804b1-48a7b83f121mr17682035e9.4.1777432933948; 
 Tue, 28 Apr 2026 20:22:13 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7bc810e1sm25845015e9.14.2026.04.28.20.22.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 20:22:13 -0700 (PDT)
Message-ID: <69f17965.050a0220.2e9edc.c1ad@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 29 Apr 2026 03:22:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777432934; x=1778037734; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=c9adUbPJM9ZGW0GWFyhXKaFc1nuRA+qn44Fn2G/YzKQ=;
 b=jwP6UiFuYcNCmAl1DMNEIe8IYtSlmdzbfMq7Ao1YvDY2jh7OXiuFnALmngHwFe4bvl
 zJRkd+C2ZMGMy5dxK40taKkfXJi/eaNSwPg2it1sJcHggsUj1tEioCUpu0wAYn183Z4+
 WxCoKc4sx92PKtMDzf1y7+JkMkRwrVDY9HkG2ZRUldIMJLGy87Lt5C2pDL+2T1H8mDco
 I7Lbo+hBfnhOp+Uzda4lGexfaRBFdq6NbLAgZP4xiSO68+DCZQiVJtzG731zpqruq8dn
 3IC5U117kt6QHUAV5TX3X8pSBxX2iEusSlFNl8iqPFmGA9wsl2eWA8GZyZdNxAyvjIA3
 amsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jwP6UiFu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-28
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

Autobuild statistics for 2026-04-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 12  |  0  | 18  |
  2026.02.x  |  4  |  6  |  0  | 10  |
    master   | 40  | 77  |  2  | 119 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
glibc-2.43-17-gdd9945c0ba40... | 3 
  gobject-introspection-1.84.0 | 3 
libdill-32d0e8b733416208e04... | 3 
phidgetwebservice-2.1.9.201... | 3 
ustream-ssl-5a81c108d20e247... | 3 
                   gvfs-1.57.2 | 2 
            igd2-for-linux-2.2 | 2 
                  libnfs-6.0.2 | 2 
                 linux-headers | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
             parsec-tool-0.7.0 | 2 
      passt-2025_06_11.0293c6f | 2 
      shadowsocks-libev-v3.3.6 | 2 
             util-linux-2.41.4 | 2 
            18xx-ti-utils-R8.8 | 1 
                 apache-2.4.66 | 1 
             babeltrace2-2.1.2 | 1 
             dahdi-linux-3.3.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
                      fio-3.41 | 1 
           flatbuffers-25.2.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
                  iozone-3.508 | 1 
            jpeg-turbo-3.1.4.1 | 1 
                  libdex-1.0.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
             libucontext-1.3.3 | 1 
               lighttpd-1.4.82 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260130 | 1 
           lttng-libust-2.14.0 | 1 
                    lua-ev-1.5 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
            minizip-zlib-1.3.1 | 1 
        network-manager-1.56.0 | 1 
               nushell-0.108.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
              python-xlib-0.33 | 1 
                 rtl_433-25.02 | 1 
                 s6-rc-0.5.5.0 | 1 
                 sqlite-3.53.0 | 1 
              strongswan-6.0.5 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/f6f8384825db8a3bf1eea0bdfa148334098f4966 |     
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/b27904eec64d990058416828c36e3b78ac796f06 |     
   sparc     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/1548c289590fdb4909f8bbd362dc1f6688afac00 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/462c0ee42fdeb6376f4e2098dd1b97e3df9e137c | ORPH
    arm      |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/5b65619df29be3e6606592de43b9ec15b770b83c | ORPH
 aarch64_be  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/ab085a12e9ed3822a4dc7346e8b8f77437e51693 |     
    hppa     |      flatbuffers-25.2.10       | NOK | https://autobuild.buildroot.org/results/4af24379915edd1c2546abf5281e4edcaf08c513 |     
loongarch64  | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/d9cd3e06f84cd8a58980a321f81910fbac55d3b7 |     
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/45436b95acf638df3bea6d8faaec3f029e8703d7 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/3dcd8f986ecbe04dc1beb501778d9a595eb72200 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/0293234e42f03d82b91d8863e701bb10218347d6 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/7b7e2d127d7bd224d58f6d34f1b9a4fdb43ff0e5 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/73587ac1096d3cb0d5c5c36424d4cd0eefd1dc22 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8ef9fdd906852647afe0fe38611bc3dbad9533ec | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ffe6122149ff9765ff00ffbac17eecf1d9563644 | ORPH
   armeb     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/2bfafd0a0837fd08d23536690174212eba8f9966 | ORPH
 aarch64_be  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b70f9fdbe402ef271dea956994f84fe357f96f91 | ORPH
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/acf2084095d3db58a01c26d8c8e941f57dab22f5 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2d35336219ae99603d816f86b3a012c6a22c8ba2 |     
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a3670dcd4153754dca1bd99076fb73a9c042d914 |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/e47d39a9f5c98e210b906c0f32384fac395a86aa |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e1a971da501f6d1d26205890dc01d7e97b25b16a |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/9a624cb261fed95ad4bed2ec42e4cd76068f2ba7 |     
   mips64    |          libdex-1.0.0          | NOK | https://autobuild.buildroot.org/results/b318caf27ef48a42b15b9bcf9fbe6f2bb71469d9 |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f3e18af3a400e06859a4928abf78d41a1375f1b3 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e347e6de2057cad22f0b47e91bb3a16a5d1bd409 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/69f88eba64988a884502c5ea0b796e3aef864b9a |     
   mipsel    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e3d3cfd97cd5ae591073763844f23a90d81fe617 |     
    sh4      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c25475aebc74a3a7977f6b65ba028988ec5aae88 | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/cfddd4d264dfe292d00f622e600b2778987d5fc7 | ORPH
   sh4eb     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/565484fd20492896cb76883cfb4234ee14bca99e |     
   sparc     |        lighttpd-1.4.82         | NOK | https://autobuild.buildroot.org/results/f42d8c91ce7f8a9da2e8075f448dc9d37dae0409 | ORPH
   x86_64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/8fe793ef7bd284674d4cf1358cc102d48ce75a6b | ORPH
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/dfd4b6166a4dba0d407250c8f56d46e62b4f6228 |     
    arc      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/dc889025f910e438b58c88e33889f78bc64b7540 |     
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/54a3b9d235feadd144f2a6316d27fa457f8f5aaf | ORPH
    or1k     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/5d03e5b0ca9dc7d22535196e0a67919d8d36763e |     
 aarch64_be  |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/8597e961e7a6e3c9043279cde511b05c48d904c4 |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/be73d8cbd19f0e34f069e0e637d9d27e1c6425c6 |     
    mips     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/33c64d74b998d44ac146cc5e5bd991cf834be3d4 |     
powerpc64le  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/cf3cac7ae5b9ec7e5540e071aecaee6e55b6cdd9 |     
 microblaze  |     network-manager-1.56.0     | NOK | https://autobuild.buildroot.org/results/2b16e7ff722821e8a948743f8fff4a0840cafd42 | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/15f210c55ffd7b465c3754f1c1df6091ff291a4b | ORPH
    mips     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4427a0992d30038bda2d20deefb25006eda4cb3e |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/44806a55c166394052ff559e653ca33b8726c857 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0b99d1021ca7caa45ce925efe3750b52e12308e8 |     
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7ff9bbf6411dda83ad5d0187dbe7199299df127b | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/4748429a6df1680f4f5a56c6f15ee05941852e3d |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/34e4197e5e9c9f92840bedd2177dd2fad86c188d |     
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3ec14684b47b3e3305b00e102c37f2902a1a1ca7 | ORPH
  riscv32    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/78148528286224064c1d489785b3239f71e86d86 | ORPH
loongarch64  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/2f75cc303a8f4bfdef55c3f4a4de9a9084a240bb |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/56131b99c4d7646356463c814b773332a7415f63 |     
microblazeel | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/fb04f94fdcde57553c2e96d5e185057cec905ca2 |     
 microblaze  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/c8618f0d1608f42c3e7c5638fdcb6cea0218e7c4 |     
powerpc64le  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/ab2203bd7f4e3775541999e7541884868bf9f6d0 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/5c79b77132f9a2b11c333f87b569371e8db77c43 |     
   mips64    |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/c934a110e462ed0aa916277abbac6939cf3084cc |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/45b9f00dc5fe2a67cb7439c21dfcd66100418424 |     
    arc      |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/5fa6811d69d3d6f59b8ed70b251618f9b8431a14 |     
microblazeel |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/1d55d9cddeaab5f2965bb98fd04a12121175b534 | ORPH
 aarch64_be  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/0e846141ca3dd6e7da014b6d26c62329345fcb2f | ORPH
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/fb4b04130b940350d4b6613964ad29e9c91dd51f |     
    arc      |        strongswan-6.0.5        | NOK | https://autobuild.buildroot.org/results/66f05123a5f592f878d3dd7fca8cd19359d1cdac |     
    mips     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7722f45bc2402d25d910f5460948ac053c107a75 |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/614f2b3018b32a22ddaea6944bedc48620a1de02 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/78cfc5f27a1f731550796c7dd2405913da1710bf | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/28fac8d27ff9cba03e9690789b4508a42c6b0243 |     
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2fe5db4a36c47d5400eeacaddf710694cab71878 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/351da0cca1d30d4f7bace7a060eb5c41e90f3ddc |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/586bb914ea3328fddb197d6c04a0f68a34e982f7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/55f4fb6be930c83cf10e1eede6eee38f93230ffe |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb04f8fad11a0a975a44dba0192d9863dadd8d2c |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a44e8506462154c65d244f2e2656d8d61c18c65c | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/2db8d3495f8541c4dc3c8041a8e6101bfe41979a | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0266f7e733926115fc6915e1df54a183ed9b6f25 | ORPH
   mipsel    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/acd5e8e0c2c46c4cdb25d97aa5cd98f0172be4a2 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/030aa6f2c026131ef1b51e445631393fc0b6fc40 |     
    m68k     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/b34903aa99a3fe313487d83e1bacdf1d77694029 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 linux-6.19.13 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                       mrp-1.2 | 1 
                openswan-3.0.0 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         linux-6.19.13          | NOK | https://autobuild.buildroot.org/results/5969f439ba9e8d434b8e85559c280191aaa51f37 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/11fb2712b1b5fb79eb30f9ba744fc81a0c26e39a | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1a2276d8f11d3dbf4934ec929451104c2dc78831 | ORPH
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/c3e6e0fc9b68667591b3c3c0040ef3fb2340d3d1 |     
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f1ff0f02b689b4202ec3e1caa0c8c4375897362e |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f3af537683b666d582d75de2e6484f857d4b5d3c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
                       unknown | 3 
                  ffmpeg-6.1.3 | 1 
  gobject-introspection-1.82.0 | 1 
            igd2-for-linux-2.2 | 1 
              json-glib-1.10.6 | 1 
        ltp-testsuite-20250130 | 1 
                   perl-5.40.4 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/3cf3496d365d4b976fe6bb57a082c8f7efbbddf2 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/cacb62120e39ed079ed628c4e8f8fcf81447215d | ORPH
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9b28fa895743e41163d5a26f6281d98729608f7b |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9da4ea66f7747852df703bd212090c84f2d25033 |     
  sparc64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/12ec8b6c1a940bca2583e6d8c857ad24294f6b30 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d7f091af83707528803a00bfebeb0a7003f4402b |     
    or1k     |        json-glib-1.10.6        | NOK | https://autobuild.buildroot.org/results/e59d9751a417adf41bbe707610f58e811cc84e76 | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/aa5062c41bee930cdb741957910ec62491a7a89b |     
 aarch64_be  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/befaf3ca4af9dc1c1314ee5270f8e77a1e051249 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b7414bfa4f7d2bc48b57261c672fabde70623159 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/41cbbabce6aa6a7b8c900facc0236ca767cf8786 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3c85d287bb877d0bfb0c5e41ee63852126dc8824 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
