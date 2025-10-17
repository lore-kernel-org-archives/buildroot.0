Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65042CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 03:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC76B810ED;
	Fri, 17 Oct 2025 03:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cjvIT_Jplxv; Fri, 17 Oct 2025 03:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D9081115
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D9081115;
	Fri, 17 Oct 2025 03:28:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E673EC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 03:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84842408C8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 03:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgQbZQfIjRg1 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 03:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19BD14071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19BD14071A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19BD14071A
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 03:28:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso3718815e9.2
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760671701; x=1761276501;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5fPBlyzxczbGutg1V9FKujyWVJ95CI6H68DAXtYvsE=;
 b=BqF/Bs3/p3wnc867RjUmQhjBNc5CIti+wQF+GY2Qo3+Bs2+uIoiVqkIvTWAoiMQpNc
 /LlsCjOhGgTOogvkGyUMu4wa1tnq5usofxx0ugiWP3KrWkxWf8u8GlbVYXoypxxpviT9
 5BYuN1IXhih7venfkrUKm4aRDyGv0SC0eUKQzJUYgIHMzolVZL6X72ZSsIwFZx4o/7bV
 uU49DGJxVI6jsVO2wRDQsFuXFYYDCEFghtKudKCuHQ8iQ2ftwcZ7dIXqduV95BUb37en
 62avg3qraJPPga+YkjqDY2y0arn0pAScD+YhgLGWD1/zgFqOiJmqNZqJxQs62vjlz2y4
 C6rA==
X-Gm-Message-State: AOJu0YyzdYC0qyqBCXOlHreg6jjrqpHqAlSjdjwY26x63RTQj8ZJx/yk
 Ii63666F1A7aycYTIH9E5BGvCCz3+4xtHV4Wjn0JPuX4hZ0xOk9rTLyszTkFdQ==
X-Gm-Gg: ASbGncsLN+G3n1l74PLVknydyE7H19zZZfW7TJj4slEmLiJ0SjUyPB5+fQdK7pONH2E
 Zm/FXwgQpd/tPoq+uwxXC8d2a3+V4+yIH+cwfgAfynt8uzIT/GuxfH7fmWl7jA0p/RRQN+6TaIO
 ICDvfeblQtUww53rfaImJHEToOelANLykUWsBrUXUY4U4Q1ruS7U+Ax+cAkbb59lz0y4A3ekhTa
 QHqN7gsXU/KZpgMVWKp7TLPR6RpOlLysTPTp1SuJjKbfOmywYdrS34MNZmxLgzhBok/zt2SFKKu
 7IHmFqMTZA5DGj0hYYiRW3PXwyCH37U7TrPfDnRN1CI+/xJMmLLldK4C8Zkc7ufPncPKcVdJxIi
 WiYUPvjyiE23ogo0v7v796n/5vQlPFmk03PCLnewYN0lfkEBjQS1hB+p6rXRgGUUQne9R/kf7l3
 QpQGqPI2g=
X-Google-Smtp-Source: AGHT+IEmJTQi16YpN1E2v4XLGFhX1K/wg8EZmOrd9fkAdi0mN9a96oVqdO9VLc4GQg9yOgC8RNlthA==
X-Received: by 2002:a05:600c:871a:b0:46e:4882:94c7 with SMTP id
 5b1f17b1804b1-471179177camr17761015e9.28.1760671700856; 
 Thu, 16 Oct 2025 20:28:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb49051sm35493925e9.1.2025.10.16.20.28.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 20:28:20 -0700 (PDT)
Message-ID: <68f1b7d4.050a0220.3bb0e.97fe@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 17 Oct 2025 03:28:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760671701; x=1761276501; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=y5fPBlyzxczbGutg1V9FKujyWVJ95CI6H68DAXtYvsE=;
 b=i81k6JnKNYTPb0mMYOzRrL0pemo4OsxDR5IOpE7XfB8lTYr10bDQxalGEO1lqUpVMO
 zlC8voxbd8M5CxqelKUGLwBNLjPIPW2SoWqB5C0DeIKv/Ub4/gmpUCYzsTFJngaLYH/C
 4p6CXwqryvL4GEm2atfpLTXjTablDVOhAj+iOgesPN+9FWg3hRqrdYpKasmMSn/tYKLd
 IjRd1sIV/sFKsRWLatGGfhvOquHAoaBIJh4AxvfWICUV4o5MQKtLALjR5lOZ7xLMyZAp
 +W2UESbVhtMq1udH0QZ18MUAJdZr37/KTcZral3usPHaWBTlJsFzi796qFeiNo4PSzT3
 gRDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i81k6JnK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-16
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

Autobuild statistics for 2025-10-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  6  |  0  | 13  |
  2025.05.x  |  1  |  5  |  0  |  6  |
  2025.08.x  |  4  |  4  |  0  |  8  |
    master   | 48  | 67  |  2  | 117 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 6 
                   cvs-1.12.13 | 4 
                  linux-6.17.2 | 3 
                   perl-5.40.2 | 3 
                       unknown | 3 
                      fio-3.41 | 2 
                  iozone-3.508 | 2 
               iproute2-6.17.0 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
            vorbis-tools-1.4.3 | 2 
               arp-scan-1.10.0 | 1 
               asterisk-22.3.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
             dahdi-linux-3.3.0 | 1 
                    dust-1.2.3 | 1 
              e2fsprogs-1.47.2 | 1 
                enscript-1.6.6 | 1 
                   exim-4.98.2 | 1 
                     fd-10.3.0 | 1 
                  ffmpeg-6.1.3 | 1 
       freeradius-server-3.2.8 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
                 lcdproc-0.5.9 | 1 
                  ledmon-1.0.0 | 1 
             libgphoto2-2.5.27 | 1 
                  libjwt-3.2.0 | 1 
              libopenssl-3.6.0 | 1 
               libtheora-1.2.0 | 1 
                  libva-2.22.0 | 1 
                 libzlib-1.3.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                     mdadm-4.3 | 1 
                  ntpsec-1.2.3 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                python3-3.13.8 | 1 
          sane-airscan-0.99.33 | 1 
           sane-backends-1.1.1 | 1 
                 siproxd-0.8.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
          sphinxbase-5prealpha | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/94a66d7c42aac5c68df5103145c8e71aeba7be54 |     
   mipsel    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c2a61aeebe6220e195e1cf0cd5e44e6c405c6861 |     
  sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/51bc8bab23f0e3f290d90d34ba55be6983ecb475 |     
   sh4aeb    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2bc10429231bfeb5b3eeca5cd8f0aae19bc227d3 | ORPH
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/790e016f7484b62127a55c49068c2c80d3531c94 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/7819f5eb3c0f30085ab425c6e2173f7396dcbf6a |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c0329898c07621cf02fa09b53fb3d7fb9060f10f | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d615db48eb68bc063de169ff2b7a71fa52cdb712 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bdc122efb79df305803cdd9cbf96cb55ffd54587 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/55a877bedd565d9f43ac0a2f3bfb13833bf5ae08 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d3193021f4073eba51119fdfcf0e6a59f25cb52e | ORPH
  aarch64    |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/65789f960d01ee16548f67624c780295bc6c24af | ORPH
    mips     |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/128bc7cc5bce463fbbaf6815078f2b48ee60e401 | ORPH
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/26f2ff23625fa64b8b49ffb62c81e446421900a1 | ORPH
    arm      |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/c4326bd6439a2b8b070b451c43c6f0b25092ba7b |     
 powerpc64   |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/71856789c8df71f16d7754bd51f4c8176e49e334 |     
    i686     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/eb45dd4757b892604705c1dfed26b791d3d1000c |     
    m68k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/90ff00213b3c39661bd7a946790ddc6c837f57d5 |     
    arm      |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/24d4d0d97157756cc8935bc133130ff88ba47444 |     
  aarch64    |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/0f517cf828ca43aaed91e92f9e861c3be45ae104 |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/d72da5549184766cdd7c75968fea9ac525f3a5f3 |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5eca1e363af06ef0655b1f652082068625bc3a0f |     
    i586     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/dc794bbaf1ef1858ee4c700923e49afab835e226 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3c1774dd530bedea7b4ad423b8a3676525db86d7 |     
   xtensa    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f0c200d90ff2f98641052abb73685fa22d5b0642 |     
    arm      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/998ded40e31874078574571d9d2d091b17465bcd |     
   s390x     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/8e89fd6a2f0742a5afe4d13eca1143e8ef5e9f05 |     
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/4781b519ac91e6b7a91f49bbac556c39643f100f | ORPH
    mips     |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/51af1d7bf71061f22d49213951a5f6a9565710c3 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e78c8817f41b5693225dda22c8a4f2c14b7a459e |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/31ff087a759f4f7cb80d725078c433279c91c120 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/43f5a2729a63b955777fff90734abf5b5612a425 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fde80224022c93d9e0d77cfc971b185ea118c4a0 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c53cc22adb6e07e379d4292ea59889a19efc959d |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/594d506c9ddb6578f3063d677497425714aadacf |     
    arm      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/68bdf1d03c2af36c3b74e477a40a120d05ddbb15 | ORPH
   armeb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/3b7d76f983bff10e41ded56bd94a519c0f7c724b |     
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/6e063b2b58272270ff7139597f0a649656bc4db4 | ORPH
   armeb     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/ac814038d4a20c671ee3507125644af472ade929 | ORPH
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/7909e2a8f4aa9b4720f25875aa3a26fc4d5975bf |     
  aarch64    |         libzlib-1.3.1          | NOK | https://autobuild.buildroot.org/results/1cd2eb070798575de86abfd456efb8d8265b23f9 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/850eeb1900e74ce046f1d5ebddb25dbda9ad8618 | ORPH
   s390x     |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/228b83c72d87fc6f0357f0b77db4230c56dd45f9 | ORPH
    i586     |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/599099a5a5bd1c1a652f6158a84cfd26b6295dbe | ORPH
    m68k     |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/d8bd446efa50f54542462b8935c6bb345b275efd | ORPH
   mips64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/56aac32ef0dd73bed24b28cc04c5883e50357b30 |     
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/95552e1330778251af4762ba8bfe55b248f87f57 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/324460a3a0bebfd3fd465300c55d712eb8b562b0 | ORPH
   s390x     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/500f63ea88b089b39da34c1476bc9290e0e99c77 | ORPH
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/664cea2c62254cd2e32b87163af535188f2d386e |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8a55bc54d390124da7042267e912925300e834f8 |     
 microblaze  |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/c2083a934e443d853fcea8d4c83baf244193601a | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5959d99096fbfc43b57d2b1c9d167bc1727fa57e | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/71a7a9393cf4b94d771e9f764bf315ef7c55d807 | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a3e2b20ba8a1753e3e8e0de416db3a562e7c14e0 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cf380b545dd3f41bb84fa1066a3b2c2b48c12bed |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/247de34b9c147583120feb63826b6ef91e91440a |     
  sparc64    |         python3-3.13.8         | NOK | https://autobuild.buildroot.org/results/493a82637711a6712cafd0d81abc7aec21efa5fe |     
   mips64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/5cb32dfa6fed555ffe1dfd5032f1f37defebf0dd |     
microblazeel |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/589cefd263e2734c399ac3178adf5df01aedaf75 |     
  mips64el   |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/679fe86eea2001aed2baf066abf3ae43b38567b5 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/72c9edd459087438e8244346c49e2dcd76885e1a |     
    sh4a     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/243e79a43619bb48a3e8bb04abeb40a32e9a99c0 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a2ff048a769b37ecdd94fd468052d1ab4b65d124 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b6209aa6fb85dba21e886a2e6e0e206be505aa2b |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/c94670cf255a1a6975e99d7b22a159f7fdc6f850 |     
   xtensa    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/1fba63468ab6eb28fd5b2fd397cfd156ecc79755 | ORPH
   mips64    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/d8cdc9d7402149b9dbd71d113c04ab533c2e0d64 | ORPH
   sparc     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/60422c7602f9a58a4e9182ab9c5727c8efecb4d5 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
                   cvs-1.12.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
               libunwind-1.8.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/7f5d8ad3bcb57e11ecf78427297a2fc0baf4a5c2 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3d6a8d87bd90450f0edc77ad27719ebae49994f1 | ORPH
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/eb3df74c1fb4fa33fa07d11ad7d43a6fd42d808b |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/28f2a363e291fa8c0f70a0f7897a37afb74a94dd | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

python-remi-2022.7.27-37-g1... | 2 
                  cpulimit-0.2 | 1 
              host-rust-1.82.0 | 1 
                nushell-0.96.1 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          cpulimit-0.2          | NOK | https://autobuild.buildroot.org/results/cf12d080ddd7a2398a79be430d935071ca3250a3 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/164398a41b71489dde6baabcd27cdac39161abca |     
   armeb     |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/5faa9d5e908e6622ef48bb4961f5eca8d90c19b1 | ORPH
    or1k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/23cf79257a2fbfe34bec62b99b5419a3fb331d90 |     
  sparc64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/461a4d644dba65023324e76b79554c04d9d5eb29 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/44eb06c5fca4e85a0f14cb5ea8333cab417658c0 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

amazon-ecr-credential-helpe... | 1 
                    dust-1.1.2 | 1 
                libcurl-8.16.0 | 1 
                libsepol-3.8.1 | 1 
          perl-net-ssleay-1.94 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/1735648d50729665848866caabed50e8d8f45352 | ORPH
    i686     |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/7e0d86c50635e20f13253c53eb89eaf0a41fa260 | ORPH
   sparc     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/42003299b09652cc39858e8dbb24be35dbde7cc7 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/710661b2b6813ebe7088a7f8052db0bd9fd2e3be |     
 powerpc64   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/9b33cb8bcb2d46f14bb84dab80346a4a4d1a3851 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
