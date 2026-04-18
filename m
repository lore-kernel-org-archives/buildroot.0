Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F11F99C78
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 03:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45E040FFF;
	Sat, 18 Apr 2026 03:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bQdpvpIAdx2; Sat, 18 Apr 2026 03:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 161D940FFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776482820;
	bh=GZ9xdF0JFBcNE59aEkXP7usCOrClghWWjaWkr/gr1us=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RBD/vRoGZ/0Jpb+mRq5zXugBmG9C0P0P2mjLW7cWnRjOOiHOZ2SmiQx3tpkSlpxuf
	 ttn9CLzbVHG1SF7HnhpLHCcaAFokx0f5/YLLCDLtz1RfsrhUnGXd0Fhy9hovRv0LEn
	 YsX7jrgur7Z+8KXuQO+s8bifc8+4c6KdJQ7rwTGu6sVHZNLHIdKGn28h+wFOaqyZkl
	 Wni41iaD9oQ51ru4LaGnPnGSilqB2giV/BSO5o4o6p8vWZ2VNvz9K3g0aPJXLe0m9N
	 nwbFnkjsmxiUsrWYGrcITgoWwoZnGG5xy+FnHjw9D6Pa4MaGbBfRwiSt1fmWN150Ls
	 Qv/KxqchgtzQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 161D940FFE;
	Sat, 18 Apr 2026 03:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0603D369
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 03:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2E682234
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 03:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBqTd-ivwMoQ for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 03:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EA9581D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA9581D5F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EA9581D5F
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 03:26:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso14401355e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 20:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776482814; x=1777087614;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCV40zhQLklO927ALPJMDkydcv1gl04eS3OT/y9cuKo=;
 b=ctcMyMXdd5uVypiMbvMXJm57RJgRCWTcSrsMqUb5/bH7BplppWY0rTbsOSbVKVV5uP
 /kCPwYmrKHNvYUj1VNhQQIhwa32CjZIYSHVf/fxC90wqTC68t09nEJuoqXPrhadaT/TM
 wNDfWrV8cglXHobDvatwv7iSI393YjZ10BdKTPK3bJ/k9s5c6XgNHWSCKFE/1DQE1D7u
 Xy+P6iyP8pNnleRvBIJ6Hv/Fmb/+j4tD0MstHo60gU7KbelHxW3/WwZwF4RJCMYKh460
 S8JOstfUP6s/Cc4sFdTmyRO5TK3B9N+8po2kQ8pS5AgsWooctxQwlXboZV6cX9Aimzd6
 8BxA==
X-Gm-Message-State: AOJu0YwPYdfjENMReoJgZHbBg7wE+knTFKAwS1mgkxKDtFcs3L9wSdC6
 bboc8ZTFyIJvQfRGa+RdXU8ZYZRaqvzfHQ07eB3XBddOsgV8HEFUJxO7hr2+kvQc
X-Gm-Gg: AeBDievhGx5S92sJbiTJyj5tCLD3ZijCcsLPaJYu5VLtC9p1upyUs9u31JDX414NpPB
 9LV1QBHJaJmv5DpaARafvweEsNg5RkjYMyBppfqzoCyl5b7uQGdwbvw3YPaKF8hVBl3VGaq95kA
 ORxSjirXmJreVeUQ6fWobkaOi7QxBD6vAPTEtbimVY08kiUefBl1WI/J2ydKHghI6vBeFPlGzNI
 eXw2IeoHKDwFgvFFV/yXX772esonmLCYodydhDyA21oBKj+wFd6NuDqKzibMDZhQA6rJ8ZKCjB4
 wgO9xiURibRrxTC2KMQVCAgOFJ7cU4DszOacHFVzRkee02DQwKortiIVhAXt76XrLuBucZm8LAA
 gshClJOBXRFUB55mK6r3/cWyFGLhnchyPT9H1p5wtHw0JtaRdAa9sJ1kJsWObmFgZAMwzmxJ1cW
 +J2/wX6iwTXO+6nnzixH7wA4jkkQ/BNYAfEsIU2HJr
X-Received: by 2002:a05:600c:8b22:b0:488:a98b:b891 with SMTP id
 5b1f17b1804b1-488fb73d7f6mr76633295e9.3.1776482813713; 
 Fri, 17 Apr 2026 20:26:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4dc24cfsm9378113f8f.16.2026.04.17.20.26.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 20:26:53 -0700 (PDT)
Message-ID: <69e2f9fd.df0a0220.cb374.a4d4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 18 Apr 2026 03:26:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776482814; x=1777087614; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WCV40zhQLklO927ALPJMDkydcv1gl04eS3OT/y9cuKo=;
 b=fC+K2IfMSbaDEjRxiJWlVcHTHFQT8WWIW6JsvocfzQbRh9nZL5QFIScad5jwRHqbV5
 0FleuWMhbYWkRywntBwgVnvWHGmnn4wUoELDAW+JbK0xjx1v66Pg2PG1hX79CRa03esQ
 QMh5gMmZOK+G+PmQbhWjeBr21XTsMMs2ZUfQj0/64VcT83LaDLTez/A3qYFgeJ7i0Z5L
 6Zz4gHxYzgd9O9eSUpWmXGNZWxDPR82oyRk0K68UAMb6xWKtuqjNk/WiVfnDZrCFFtDf
 8sDBdnN5gf73JvhQ6x89HGY/DqHNJP6J2QpIOWs4O9iyXZpNGjmj6P6hP2s77QclMAgQ
 lMng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fC+K2IfM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-17
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

Autobuild statistics for 2026-04-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  5  |  0  |  6  |
  2025.11.x  |  0  |  6  |  0  |  6  |
    master   | 34  | 64  |  2  | 100 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-17-gdd9945c0ba40... | 5 
  gobject-introspection-1.84.0 | 4 
ustream-ssl-5a81c108d20e247... | 3 
             dahdi-linux-3.3.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
    host-mender-artifact-4.2.0 | 2 
            host-protobuf-34.1 | 2 
                  libnfs-6.0.2 | 2 
                 linux-headers | 2 
                openssh-10.3p1 | 2 
             parsec-tool-0.7.0 | 2 
                 sqlite-3.53.0 | 2 
             alsa-lib-1.2.15.3 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
          cloudflared-2025.8.1 | 1 
               collectd-5.12.0 | 1 
                coreutils-9.10 | 1 
                diffutils-3.12 | 1 
                     fd-10.3.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
                flashrom-1.7.0 | 1 
                   guile-3.0.9 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
        host-sentry-cli-2.20.3 | 1 
               host-zeek-4.1.1 | 1 
                  hostapd-2.11 | 1 
                   i2pd-2.59.0 | 1 
               iproute2-6.17.0 | 1 
                libcurl-8.19.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                      lzo-2.10 | 1 
            minizip-zlib-1.3.1 | 1 
                     mtd-2.3.1 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                openocd-0.12.0 | 1 
                openscap-1.4.3 | 1 
      passt-2025_06_11.0293c6f | 1 
phidgetwebservice-2.1.9.201... | 1 
           sane-backends-1.1.1 | 1 
                 systemd-258.4 | 1 
                       unknown | 1 
             util-linux-2.41.3 | 1 
               valgrind-3.26.0 | 1 
              wsapi-fcgi-1.7-1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       alsa-lib-1.2.15.3        | NOK | https://autobuild.buildroot.org/results/dd062736f694ac2b378d4fb5ead68643589ccab8 |     
    or1k     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/95a444459db89f9e8bf15ce3405d7b1aea4770e6 |     
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/47e44e0631fc02300e91b55beabfaa6afabd1668 |     
   x86_64    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/e10af34a22268d04a4d680c6e7ee211d042ab930 | ORPH
loongarch64  |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/63c4147eec3bbf9ae04d118868333d3630f52925 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9ebcfb8c8b197f763f2770a70fd3f13cac487518 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f852b60c07e8651334ad4299da2dcc5bf99a1332 | ORPH
loongarch64  |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/f30b8118e34c2f96a21d1c14755f4e7df9330719 | ORPH
   x86_64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/0d9a323777064da0686d9b12a7bd990070e94a64 |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/f9d5765dfb4096bdd41cc9aee576a8894a67b0f1 |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/8925442756ee89811871e4e516c6a5a4421d43c4 |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/21a597e7c91d69d289e0f4aec8803c8be6b55ce5 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ad52518bc094ee34847515c1b2ac10b2848c0641 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/7534f7bf2a7ceda15b9c572c3c22dfc779bc571b |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/dc1519e4c7978b694ea0dde58d78eebc239e93a2 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/6cd621645aad26f8f5ece0cb7b5728a48d29f0f9 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e5790788fd7ca875f0ea7ecf5f0b89322f09a319 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/001559e14fe3cbadee903209979cabf7bbd3cd2e |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/58b22e2845eb60a1ca499dd15d0dbfb79b63abe8 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e2c5fa9ea16fc828445d6a64ef993d92140c77c2 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e911e2e66d9568f58f14a4bcfdbd728f2bff3d76 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5797d778a2fff372003fa42f6301a7c12449f574 | ORPH
 powerpc64   |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/8c618758b20c55f9069d8e2b12c29c549516c360 |     
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/d3ab9ef86840b1ed511530d39adf8a1857e5050f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9951369a5ae59987ada4111bb20382955eabc4b6 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ed630ad83920a867c21bca066d4d5d28cd519def | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c69ae4257f879dbf50a09ddb76b375a88156308a | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5923e28bb118020f53dd5e421f78b81df91292b2 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/227f183ee70fc01423c521bcdef23150b1b3059d |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a955bb410fa8df3aef2eb9a91d84d1e2689d294e |     
    sh4      |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/f7bc980262e5521231174addab50887a8ec33e26 |     
 powerpc64   |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/363b65e4e15cabac7f0486ce2725d0ec39109ae8 |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/dd441db076c9ad887d0d76b7b0d632ce3b276592 |     
  aarch64    |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/33f44035f24c8cfe07183090f16fc2dab26393a2 |     
loongarch64  |          hostapd-2.11          | NOK | https://autobuild.buildroot.org/results/d2e5654e290f4aa3678790fadf36994910c3c02c |     
    sh4a     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c2fbe39b2280a6555709a9f279b044005da2650d |     
   mips64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/5ca11ee56c34c3c91ec1b4eba3c89fe11a7ff7f2 |     
loongarch64  |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/ba23ea2bff621fd5867213c82c21fa130b1734a3 |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/97dc72171615db69ee61d81739b41728d9556826 |     
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/4ea63a1e3d025aed7cab2d45eee908254975c26b | ORPH
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e79214395f35ad2ae3420f066dfc494e4133b3f8 | ORPH
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7166baea33f2d6a4c20bf918a23397b12af3032e |     
    i686     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/2e58639783f198a09fa7390663f2cbf69bea4869 |     
loongarch64  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a428f80448cde3753f15207b7fe7fa4b15cea0c0 | ORPH
microblazeel |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/c3a4cc8df7c1f91d2b48a603e81d9322e91a3c70 |     
    or1k     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/2d7323314f4bce8fbc61a41820b32fe85f3a45ab |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/58300b9f3e90c62f38b2907bf3fd0d6da7f22c00 |     
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/715dfc66362118b36576ade4e94d4ffaec1d2f11 | ORPH
   x86_64    |         openscap-1.4.3         | NOK | https://autobuild.buildroot.org/results/6d659bb036ff0eafffc05435bd60b3934a23bc43 |     
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/267bf90e5331ba899ffa05e10fff840cbb0bf63f | ORPH
 powerpc64   |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/6e1016a848f9a4483703cc4306611c3692947cab | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e054633e43447c5c9ee3c4154d4fdd315271a0e2 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1e9a7c5232acf58b3fa535e72fd46fd5bf16554b |     
   sh4eb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/5b5cdc878d72ea99697d36b0f3eb8fea502906cb | ORPH
    m68k     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/a2c2e3b78a0b3c203b4363ce9990b9e3bfc1299a |     
   mipsel    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/a995cfe36af66dc3fd1bba7727d9690164502107 |     
  riscv32    |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/1a7dd1c6fee5b273234533c0865d1906299d41aa |     
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/e447c1a7ba675c1434b204ff1be5aa5de001b068 |     
  aarch64    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/6e7980e2e159890dd5761596eb140a31d814b8f4 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/7433ff62fb6d4b1db3bab3ea15c4bac3d6eb8745 |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6ec05aa081431469b025f5f62766dac0983f28a4 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f6e6e2ed57f961a215636cea37184a39a88dfd48 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3ef31e7c907e0340b20e657fef12316d977d19ca | ORPH
    mips     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/789b5210f271affa43e9818bbbc7aae257630785 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/a8d85fba93f89cf6dddfc5d9b1ff4c453733649c | ORPH
 powerpc64   |        wsapi-fcgi-1.7-1        | NOK | https://autobuild.buildroot.org/results/5dd75a0e58eabdfe4950c361b8683f274195332b |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

package/linux-headers/linux... | 2 
          cryptodev-linux-1.14 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 libzlib-1.3.2 | 1 
               linux-pam-1.6.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      cryptodev-linux-1.14      | NOK | https://autobuild.buildroot.org/results/bb5c1830858c11e2f23b8e032799ebd4b9b4a0cf | ORPH
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/de15a8997fb954b109ebe2f9e027f96c0e1e7743 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/999f5bf22862b580890ab5744fa6c052a4ed8081 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8d62c9c664119d6618fc265f383b6fa6ef177838 | ORPH
    or1k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2a6f44cc5f1ab9790d9baad064818c94eeaf9fd2 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b991fc083a566621c34ab9f442db213681241387 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                freerdp-2.11.8 | 1 
           ghostscript-10.06.0 | 1 
                 libgee-0.20.6 | 1 
              libopenssl-3.4.4 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/2c1543b1817eacc917e87f7d3e2467d103a09c38 | ORPH
    arc      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/f57d7404e102aab481af80f5277a101c254a77f9 |     
   sh4aeb    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/42b38c691f37b7574c9936e498b0666f78a72155 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/2796ceb0b213133b8605eafe346b7bfa0c941b76 | ORPH
  riscv64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/83a11089a9489c629964ceb929120091f8c4f3e7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
