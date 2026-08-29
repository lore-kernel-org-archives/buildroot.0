Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A0EC61DB9
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 03:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5BE40845;
	Sat, 29 Aug 2026 03:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWsZZwbTCSBq; Sat, 29 Aug 2026 03:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787974045;
	bh=vQhDF99lF0a7sod+epvJERccazh9p+rsFb0LrU+70Vw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X/548E5QwL9irACYIU3ET6v0iKl7zqSvJ3wWUBRYXWgT7rIauriUWRJxzKUZbYTpq
	 vO3eVsElYVYGQ90ZmurfhJbiScGhIAe1mvhMqQIKDlriDd7l+DzLrYlSL0G1bnyHtS
	 G7fwb6tD/FF0UePsB8auu5VkxCUI1lx/tcwDYlxjJthHxrKgbKKj9WwXLhD1QWne5B
	 hVExJJe0v8FrVmKMVy32sNn6V2T0rRiGbVGalK8s03rZLPI078r/JgEVMz63H4mXnb
	 ryz8dgfbKYB0iv0THoRHQa5JqZYrFFl5QwxMYjR+KBSjqCvJgBeWjwVJgQbreZXDkf
	 eHvRKqYHLRUYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EACE4074C;
	Sat, 29 Aug 2026 03:27:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8DFE355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 03:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D68D140087
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 03:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4sRWG_scR27x for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 03:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Y4DksZ2Y
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EEE640068
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 03:27:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so9047165e9.3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 20:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787974036; x=1788578836; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5b0isA8owAu98Lk+GOl9msLsjRGE4ZrU7EFC2QzD5zM=;
 b=Y4DksZ2YRuVfZa5M/1niR1r4l0Y8oyEwzlH4ORaKuOAr70z1K19lIfuXIUJoGLVOSS
 yrh39yQvtZmJx2/WjcvlBjzz4bJiiYl64yNPznTveZI7qC0pfvd/5rmk9g3fqkrlk01L
 SFCBllGMg+MRP6LYNlHywq8+xR9Knr5cAFCf/fIhNjaUkdQe/EC/tkpFUQP6Jmsjq0Xs
 JBrzc7JzagvZ7J53f7eYKJL/JE63W/2zRHhptDEZne8i6mB24X81ACoJr4qDdt7VkwLX
 7xlzVPyuZHf072VLA0/URDlVI1QOgRf7H6jsMMvFiiiA6O6rrJJDifkneu/ywyO3qHlD
 Fcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787974036; x=1788578836;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5b0isA8owAu98Lk+GOl9msLsjRGE4ZrU7EFC2QzD5zM=;
 b=n6fWasExY/QkdPm1I6Aq2Eof1mIqI/5CNCyE1pN28dXrPt6g626ujK1j9ZCpVY0iUd
 A/l6Zg79YN1dpXzOVh5W5jPYOf8C2eMmt3F5VW8JNFLFyWi0Q3FEdtOEDc5uPL5QThGP
 SkLMqXWzGY12BLpeq3zzxAtf6S1zakE17CsymfhE2MESEVPe5lo+wKuLdA0ZYDyYB6p9
 gewynKoXn4SHGcXha+O8MU1++F/pEvh3j4jZLoleIODDrfWBBzb44JDmKaIBPXj6/Ky3
 2S57uBzKkpTVRYHCcfzWT5eHfzUyarCt+BRiWV6USpa3rnoaMChYufcqV6f4ONloLszp
 lUew==
X-Gm-Message-State: AFuF++niua9dQckTEj0lku5SONlNjuyeBR75H98AYLTThwc+O1LlE0Id
 bVoqzr2OEUtOMkwX5kO+8czb+03JOIgPLFJGmk/DORR91uz2co4jnErkAS3frrTDhaU=
X-Gm-Gg: AR+sD11Vo8TNhoUlWnsa12Y+b4Ho628oXol1kmOIInSurGOhLxgLdtyRjpFJ9j7Ym/B
 Z2mYKRHrBzvNfJPmg5r3okQn+ixJ2Jv6kq7QJitdyDldUaox0CmUn6l9nBxRREPZGLdgNhd7hBa
 mlfclcow8FULv9E1WjC+6q7WybpQtsw1mmFbbO1m6Be+nqZN9WcfRiNu4HfHz7Qel2oCAGl/8Ik
 zXeazZbqGpKfM2HjUal1KQrsX8ztWM1bG/BVL3/1mo93UuemM68WaGs35bO6cP7bgt6ZH14Xce1
 qhYbpX+FAsnAwC+zVbuYR1e1f0NNau85bDEw204KjyDB+BrWwkzGGkaQYvJrBTKwp1smQMXvWj4
 JtWBX6BurFz+0xlG9Vn5pICp1rEK2fyTumVNzXGLNAZNV3BYa4f/P7tEAFzROOYNxzHfAYMFf3B
 dsWVUokTrHGYmgl5q3xi8trk7EN0n0lHQNjx/aOiuDH5dlFQyJ7/hOJ0su/IM8n6k=
X-Received: by 2002:a05:600c:609a:b0:49b:9032:9c94 with SMTP id
 5b1f17b1804b1-49b91bd41eemr177604105e9.0.1787974035984; 
 Fri, 28 Aug 2026 20:27:15 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb20793sm7325681f8f.17.2026.08.28.20.27.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 20:27:15 -0700 (PDT)
Message-ID: <6a925193.c9eda3e9.3054aa.bcd3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 29 Aug 2026 03:27:15 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-28
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

Autobuild statistics for 2026-08-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 26  |  0  | 40  |
  2026.05.x  |  5  |  8  |  0  | 13  |
    master   | 37  | 78  |  1  | 116 |
     next    |  1  |  6  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

              host-perl-5.42.3 | 8 
                       unknown | 5 
   openvmtools-11.3.5-18557794 | 4 
         linux-headers-6.1.185 | 3 
        edk2-edk2-stable202602 | 2 
              fluidsynth-2.5.7 | 2 
            gdk-pixbuf-2.42.12 | 2 
               libepoxy-1.5.10 | 2 
                  linux-7.1.11 | 2 
        linux-headers-5.15.218 | 2 
package/vim/vim.mk:88: host... | 2 
python-remi-2022.7.27-37-g1... | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
            18xx-ti-utils-R8.8 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    attr-2.6.0 | 1 
                       busybox | 1 
                   ccrypt-1.11 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
                drogon-v1.9.13 | 1 
                   duma-2.5.21 | 1 
                enscript-1.6.6 | 1 
                   exim-4.99.5 | 1 
                  ffmpeg-6.1.5 | 1 
               freeipmi-1.6.18 | 1 
  gobject-introspection-1.86.0 | 1 
           gumbo-parser-0.13.2 | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-17.1 | 1 
    host-mender-artifact-4.4.1 | 1 
                iproute2-7.1.0 | 1 
              libcamera-v0.7.1 | 1 
               libecoli-0.11.3 | 1 
                libglvnd-1.7.0 | 1 
                libmpeg2-0.5.1 | 1 
                  linux-7.1.10 | 1 
        linux-headers-5.10.267 | 1 
         linux-headers-6.6.154 | 1 
               linux-pam-1.7.2 | 1 
               llama-cpp-b8117 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
              luabitop-1.0.2-1 | 1 
                  newt-0.52.25 | 1 
               openblas-0.3.34 | 1 
      passt-2025_06_11.0293c6f | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 sudo-1.9.17p2 | 1 
                    szip-2.1.1 | 1 
toolchain-external-bootlin-... | 1 
           uboot-tools-2026.07 | 1 
                   wget-1.25.0 | 1 
wilink-bt-firmware-43fca73c... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/d3136ee24b17da2739960f9b917317b014a3794a |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/0dc46a902fd5bb25471c6b4bbc8b9e5647e2e7fd | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/14ef0148a5fba987d55e173423dba76ee0d84d81 |     
  mips64el   |            busybox             | TIM | https://autobuild.buildroot.org/results/25ec9d119875d7eaa72f0525c3fd7b248ee09a2e |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/34a10d240dc334d87cd97255e9746e0bbae048b9 | ORPH
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/5b0c8bb66f11e0652636e755d27f7fabe641b78b |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d39947c1b1a87a3becb19befd7933b0c76b59bdf | ORPH
    mips     |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/e48e0fc1b95a8ad5de964b1e6d12bc45ac39f0b4 |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2b9c45ae6f56ee9cb732336de622f1de2d6cee7e | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/8113745f05e06da24f14861c2c701014f29b98f4 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/51907dcec33f8fefc285ee407e35f7dd9fb5f8f9 |     
 aarch64_be  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/7d00cd2cc126a06702b4b1b31c8fd43fa9508a60 | ORPH
    arm      |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/154aeeb4f57bf57b34700a4cd4bafa6b75d45fc4 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/4b6a60b37f83ae3b27b3a55295b7976ad845e61f |     
powerpc64le  |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/5895c029d48dcb6af4641c64fb69c650207af200 |     
    i686     |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/2129794d1963323530829ca1cdb61f701df0e514 |     
    i686     |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/f562a42bc9e5042923514638d66668b376238c2e |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f9630bb13dbdd37088cedc467a6dd11f9631abac | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b4424bec4d09bbca1e17b8c4684a2ae539b10b0e | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/bd30425c64ba051b59daac4c3480d0f2f516623c | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/4c2f8b2074c5223052067be923814bc85b41a094 |     
  riscv64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/101d53d701b7121b45a9cb360f253be7209c83e2 | ORPH
    i686     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/f4fa60395f2bf1fa219a0d46b832402cd1b1091d | ORPH
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/52ccf872b3f55831e5c681d68e02233021771383 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/0990a4827d54ee05fd19ea1392cb7e2a76b870fc |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/f7932f11db8e101cad68cdb9f5396d9302983e6b |     
  riscv64    |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/a3afa7f5f2bb1ee989ddbc0652ae6e76a7458a5a |     
 powerpc64   |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/ad9bd6aab7eb5b83bf4ddbe49989ccb1555c3373 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/0bdf83be7d5dfd69f897d035b7c2d31f7114f024 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/caef8932285cd2629c68705eb9e506342af81fb2 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/b3416e601787b115730be8ad813fc249de2a13c1 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/b600b9d673301e6a1f9c7fcd16da04b1bf259850 |     
    i686     |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/47618bfea82e932ce9d1f57303fe4d704f716f90 |     
    sh4      |        libcamera-v0.7.1        | NOK | https://autobuild.buildroot.org/results/3071ab22872a977b3171d9698b3e4ad94ba990b7 |     
    arm      |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/f945dcf37ab0e29cbda5b801bfa8b4ddd25e73fc |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/b8011bbbd4a3435609c066d320d8eafe839eee82 |     
  aarch64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/6cb6be90b20692b7ccce0aadd5aead7222039530 |     
  riscv32    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/178a026c897939453526f390681f3929c3d1515a | ORPH
    arm      |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/4471a25d8837e9515e4a9c10ae38e0fd5d058210 | ORPH
    i686     |          linux-7.1.10          | NOK | https://autobuild.buildroot.org/results/9f59a0be64abf83e38198ea708e12cfca23063c9 | ORPH
    i686     |          linux-7.1.11          | NOK | https://autobuild.buildroot.org/results/71185e7226fe07e3c52817cfc3225577aadad7d5 | ORPH
    i686     |          linux-7.1.11          | NOK | https://autobuild.buildroot.org/results/1550b0b1ed7d89a4dde02ee6408f49fc4780b5cc | ORPH
    arm      |     linux-headers-5.10.267     | NOK | https://autobuild.buildroot.org/results/f6940f1e348c6a70e2b8f03104db0caaeac8af9b | ORPH
    i686     |     linux-headers-5.15.218     | NOK | https://autobuild.buildroot.org/results/115ff45bda501ce16595385b988aaa839df5ee60 | ORPH
  aarch64    |     linux-headers-5.15.218     | NOK | https://autobuild.buildroot.org/results/8d9f9ecec43299406a7dc0ea735f2274ad2d49f6 | ORPH
    i686     |     linux-headers-6.1.185      | NOK | https://autobuild.buildroot.org/results/d50161d0edfaa892a06c8b6824cc2eee67428c44 | ORPH
    i686     |     linux-headers-6.1.185      | NOK | https://autobuild.buildroot.org/results/3921cf2615ac2efd107b92f1385e6150de945c57 | ORPH
powerpc64le  |     linux-headers-6.1.185      | NOK | https://autobuild.buildroot.org/results/e02c845481dda53d97cbba0b6f2cc4d10c91ea68 | ORPH
    i686     |     linux-headers-6.6.154      | NOK | https://autobuild.buildroot.org/results/03725c94cac0be87d111a43a04c3118e31a99ede | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/22a27c7676fda2fd142198112ac813b78ad66ba3 | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/5c01f33d6966c47b6fa37713bcc1e096f743d95b |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/5b571041e0799987844b778445490d6e53261c91 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/b9c011e76d865172ca1acdab6b469509d2d9aad9 |     
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/9f8778c75fcf91066c10924a4c4ac57617c46b93 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/cc8f9dfe382e6219ad33f5c2915b8323d6829c63 | ORPH
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/c28cf810ae2331bbd298661337e048a6420a0f67 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/b913d3007b1d39138a0fb7546244248304ef83b5 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/5beff7fb071505ed00a167ade0e711afed76d6c7 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ac6024192d969c00d97eaca42d1fae7bb00f2975 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a89819e1f3d437e67cd4799239e88abd8fd5e6bd |     
  riscv64    | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/0ad63e7fe195bea2deba4eb0f4827a63f14cc4d0 |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/ffff65cf6423b7f7ceb6bdeb868785857db17ac8 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a8de240d9fa3131ae033700cb8e0c54ed910bbc5 | ORPH
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/8d3ec2e78616d57f10515fca37b3c546a5fb03c8 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cecd9a001808d2c53d212a1c6665eb8d533710d2 |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/4cbb9b937c75c90dd2c5d930b9721498ff1b7373 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/cbcda579f683f91c1ed4b32e3cf26f636226a6bf |     
    i586     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/63d8d7900a486be52620efc400c2b2cf8b073b2e |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/7a0c64d3909ee101ba508cfa00c3125f5ef9ad6c | ORPH
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/5f6bb595a35d150259e80dda8b035fe11dc706b7 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/e6afcae54b7bae6cab20b4b173c1ac4cbb6d3596 | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/2f3ca7db4921e458c3cd23c91b1eb34df3680a1b | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9c1e4620b625859d2cfca4f959d16b116b363cf9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b34ab783607658374ded44d6b5823c29a291e0cf |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/04c7d8e364d4b8f5069a84642ba0bb58885466cb |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/06873eb5d140c769a5d8626101a9021a53d19fa8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/565d27d12ec9071531089f3c99bff83779aa8dae |     
    i686     |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/328542628cae465224034eff3bba704061eefd13 |     
  mips64el   | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/6591680643391e3c1dd3cc1ec4cf4d7274e7d48e | ORPH


Classification of failures by reason for next
---------------------------------------------

                    flex-2.6.4 | 1 
               libgpiod2-2.3.1 | 1 
                  pdmenu-1.3.6 | 1 
               tcf-agent-1.8.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/41b8164f765f9f88ddf2b78cbb64056bf95fec6b | ORPH
   x86_64    |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/bedeb4e08711b49428b665cb1d0865f12b46fdb8 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/6d2947e1f6617175e9acdf59af13d09d462179b9 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a1c9ff7971c236ada5173ed857b3289aeb838def |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/25e29e809b44d158832228521e9d898076946de0 |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/7f527205c061a82397321ceb416eb3f7b4d85264 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   bash-5.2.37 | 1 
                  gnupg-1.4.23 | 1 
                   gvfs-1.57.2 | 1 
            host-mfgtools-0.02 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
              openjdk-21.0.4+7 | 1 
                   perl-5.42.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/428ec1bccb80bf20d95692e8bd795721713c46fe | ORPH
    hppa     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/b7e0d13e5151a89a14a0537f2302153e16c25e80 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/559f0b5bed2e1b90d7210035689f768e1f4ffa46 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/4ccb735723a0a8818e4a951f78edff37b543be4b |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/cfbcdc372a171d79b078685973e527f9aba9076f | ORPH
    i686     |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/67d5d3e4745cb6ab092ea9566af5f1c2c935dcf1 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/ef7bea974cb5c47b47c92b5140b543e9a923badf |     
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3da13a03d6559f9f5f2590e56541762bf9af211c | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 4 
                 avro-c-1.12.0 | 2 
                  iozone-3.508 | 2 
        ltp-testsuite-20250130 | 2 
edid-decode-6f117a8f8c0e76e... | 1 
                espflash-3.2.0 | 1 
                 highway-1.2.0 | 1 
            host-mtools-4.0.48 | 1 
               libepoxy-1.5.10 | 1 
                 libgee-0.20.6 | 1 
                 libpng-1.6.58 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
                 openmpi-4.1.5 | 1 
package/vim/vim.mk:87: vim-... | 1 
             python-lxml-5.3.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         avro-c-1.12.0          | NOK | https://autobuild.buildroot.org/results/d4ab096cdde91b1df16b3af5fd0e18b33802be01 |     
    i586     |         avro-c-1.12.0          | NOK | https://autobuild.buildroot.org/results/d568b0e5036afce01feaeebd6c13077c083dfc5b |     
powerpc64le  | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/f9fe43bea00f26fb62be109f75fe571eb2f0e53d | ORPH
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/8c731cb88ea32d203ba90ca9a3a21192b0ce956b |     
  aarch64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/fac1be702bbe86f2ac2d767f121d30e338ccd8b1 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0fa9a26645085ced14a2e55b12dbd1c567ba2010 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/adc9423d4f557661f1362e919c4624a1bdcadc3f |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/206e82a7698f68d7f489107328508c828c21b650 |     
   mips64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/be380b7ee0ff04b914a051b30375ecc9cee91856 |     
    i686     |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/e2acf5ae1832ae6a53ceebce7f1b480e7f8367ab | ORPH
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d886d1a407e7a25183f61572ab2c5e3ce9a114d5 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5338b8d7d57bfa62e06a6703e612e18ebf382b9a |     
   arceb     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/c554f853505204ad02757fcd0f4f9767e66549db |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/509cdad907c19beab16cb514c512d3ea6c17f14d |     
  riscv64    |         libpng-1.6.58          | NOK | https://autobuild.buildroot.org/results/cfa1cd4f672aab91cb6794da79cb43477c509eb7 |     
    i586     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/692fe8ba4a7ba79095fcd05cfe395d3cbaa3ff12 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f679f7696fb3556314dbd658f2f8f1d45eb0fd9e |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2a473333db404fafda78f542d95a5e378322ee2e |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/63f1b9252e330a63312eaee20ce7f89015a728a7 |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ba1364b5b73a4b3c79eeb588d558c6c41a71c58f |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/7264fe1ac63d82c3bc43773d569aab139bc5493c |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/042d821bff5112412be5b38108128c8c98a16b39 |     
powerpc64le  |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/e6632faca6c895111de1d055b66f98245b4669c1 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/1ed68b40c203127057cc72a2404d56808b981f8f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8478669c1c0995d2b19181645adbd179118c9b0d |     
    arm      |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/e16e4e339eaf49ed0a231fd40ae8ad1c972e2bf6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
