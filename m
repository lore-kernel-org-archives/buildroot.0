Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8A3E6400F
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 03:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DDE60862;
	Sun,  5 Apr 2026 03:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXqKvq8o0qyH; Sun,  5 Apr 2026 03:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D44B60665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775359802;
	bh=Pxrau2s6MLkQZE8vY8V5+Pl+g3/N1BUvA0spHP0cIQA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=maHY7wk/qCo9ZEC7C9Yi8N+l7CkLza1UEZAjVyQc+Oky3WU+hwS2vXkIR3Q9O7Lmi
	 8w5ggHYuVfvZGOE7DissItbQJonHMZJNKid+Y9la+mKtcWLBnyIQLkW8FnrDVMK5iI
	 JiPXzteX5+D+nnSEQJ7Jmu8miyqWNsR5CDPeKf8xitwDa3kqI2/SFNgHemFmk1oO7m
	 r6AbDDjMRWcp24ehTX7bbAs6QDoTzElR9i/MEEw1m+pdbtIKNC7CMbgkGK6sy/W/zs
	 6smww5Ehm4TiQa4+qGY3gvkbFFarMOUVXkvJh9mnto8qDMg+GiY64oelfE9qgAQ5bY
	 sWSVdhkUY/ezA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D44B60665;
	Sun,  5 Apr 2026 03:30:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 642DA353
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 03:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49AE060665
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 03:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7elzPvAhB3jl for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 03:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D254D60652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D254D60652
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D254D60652
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 03:29:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so1570931f8f.3
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 20:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775359797; x=1775964597;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2g+dnYmBXW/BOFvfoDG7IDmzudbs8Rd5xdcRmGgac40=;
 b=mgo4+9yVQzoZd8FHGvzI/RRgAQZGJ5F8nCTtX2EWNOSLmcwTw3qQOYguh74b35ZuVo
 VtdCx4q3mcrtjP4EllpySodP3EUtAhAgIg4nObdqhrakFNrln31Ha6NZ4cX3/tSpI6n0
 TTt6CCidnAYj9Rmnx76otFzl72C8RqWJZE8Ar06OR+O8WHUJ1i3u38pbiTf29/UyjlxG
 wJYBhRsep0UfufdjKnaRGWkTSnFANF3yT5FFfcbugkYhjoqYWpEMbPem1zU3NInE4MOu
 vjHsqaRxIJmocGWRmYdjRe0jXicspPolgYZ/x2RiDAns89IZIEDENpnDemGn5J9EWVlL
 n06Q==
X-Gm-Message-State: AOJu0Yw4nvJTD7uriF60sIMt7EEU+8n7rrpIOp4EjGshN1/QkP22KHTo
 37uXlVFV36eZT5PbvuycM2d3Nb8SffMNsIugshmga3d6eYmLFaKCtQUTUb90z/AS
X-Gm-Gg: AeBDietLAVhuHwBvuxYc0jZFly3oqD2EFl7IV8dHXgvP7Nz5tusRai0mkwFSYk9Du9d
 FD1MMwW/l1KB5IRJ7pucl6a4RBN+qjPw0ajnLd8svW9BLJR6+YNsQ7duGdMHmBmMtN3Lp88/QLV
 UO0x/IinzNOY63YN8bDHqziNBL7hyElQZys7GlPjbr8srx/pUr6Z+gQmM0nDkPevmrOvIGmcxqA
 23FTbkDY2gK/Vg8Cn5f7yN5WSkVwWyWu2xaGy7xOEtgyAJO/mns6Hc8uk3Rm+O5UbwBdeYVq5i+
 JVDGym7+ItZoijC/+tpaaauwws75XvFuQekGbEOqJfKcOBiQR6gG1lo2bLmOJqnLvYLANF/2CV/
 Rd0Yp+0tdCchyOnBAUW3flAIgD72esAKySMkr0ksONN6B+0L2CTi+5tAV0zrFd7ZXxO/IzoToYr
 QO7TjOon/CQPz4b6O1pNhuT5JTt7+5Dw==
X-Received: by 2002:a05:6000:2c0a:b0:43d:1c39:26fd with SMTP id
 ffacd0b85a97d-43d29305b12mr11899047f8f.43.1775359796119; 
 Sat, 04 Apr 2026 20:29:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f7d4esm25072264f8f.34.2026.04.04.20.29.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 20:29:55 -0700 (PDT)
Message-ID: <69d1d733.5d0a0220.15cca4.42c2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 05 Apr 2026 03:29:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775359797; x=1775964597; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2g+dnYmBXW/BOFvfoDG7IDmzudbs8Rd5xdcRmGgac40=;
 b=LLOpvI69GyX44DpoamSM83YKG9YuhxgkKUfp6T+HZtHQDkKZO6YxGCMbPsWATn2341
 haX/7eXRBEw+cyARe5q6v+mnAnrxX4xl1PTg9pIg3nFQ5F0F9WAhsCZCwznP/eO83Esm
 wtkfeJfVUs0HhPa3FnYwn7AaEgRNqFP49tYrYpSPh7aNYnbnFh9SU1FzMd+GtBkPpigz
 VAG34yz9FgNSquJpUBHKRNLRBKcq8luMV0y7SdNeXKS7p/zm4pEsrfSEPAzcYs1ujb9j
 dMeoGUYYV6FGyS0/prMiZ0HMRFzDzUDgWwB7q44KmDSWQCBhZsCXkAmY+c76d/0rKe/8
 IadQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LLOpvI69
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-04
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

Autobuild statistics for 2026-04-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 36  |  0  | 47  |
  2025.11.x  |  5  | 14  |  0  | 19  |
    master   | 47  | 149 |  3  | 199 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
host-gobject-introspection-... | 7 
                  libnfs-6.0.2 | 7 
glibc-2.43-17-gdd9945c0ba40... | 5 
             util-linux-2.41.3 | 5 
                flashrom-1.7.0 | 4 
leafnode2-9543ffaf82406f943... | 4 
                 mdevd-0.1.6.5 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
             dahdi-linux-3.3.0 | 3 
                libcurl-8.19.0 | 3 
                 libzlib-1.3.2 | 3 
                   perl-5.42.2 | 3 
        s6-linux-utils-2.6.2.1 | 3 
          cloudflared-2025.8.1 | 2 
                   dante-1.4.4 | 2 
  gobject-introspection-1.84.0 | 2 
libfutils-c326ce0cc2a735438... | 2 
                  libnss-3.122 | 2 
     libphidget-2.1.9.20190409 | 2 
                 linux-headers | 2 
                       mrp-1.2 | 2 
                openswan-3.0.0 | 2 
           sane-backends-1.1.1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ustream-ssl-5a81c108d20e247... | 2 
           alsa-utils-1.2.15.2 | 1 
                apr-util-1.6.3 | 1 
               asterisk-22.8.2 | 1 
                   atop-2.12.1 | 1 
                bpftool-v7.5.0 | 1 
                  broot-1.56.2 | 1 
                  brotli-1.2.0 | 1 
                coreutils-9.10 | 1 
docker-credential-acr-env-0... | 1 
                 dump1090-10.2 | 1 
                easydbus-0.1.0 | 1 
                      fio-3.41 | 1 
firmware-utils-c42a3bc53da8... | 1 
                    flac-1.5.0 | 1 
               freeipmi-1.6.16 | 1 
                      gdb-15.2 | 1 
               gocryptfs-2.3.2 | 1 
                   guile-3.0.9 | 1 
                   host-gnutls | 1 
              host-guile-3.0.9 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
            host-protobuf-34.0 | 1 
               host-runc-1.3.0 | 1 
              host-rust-1.88.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
                   i2pd-2.59.0 | 1 
            igh-ethercat-1.6.8 | 1 
                  iozone-3.508 | 1 
     kvm-unit-tests-2025-06-05 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                   libcap-2.77 | 1 
                libdrm-2.4.131 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
           libmicrohttpd-1.0.3 | 1 
              libopenssl-3.6.1 | 1 
       libpagekite-0.91.251215 | 1 
                libressl-3.9.2 | 1 
                  libsepol-3.9 | 1 
libuci-f3fc0b76040685829191... | 1 
                libxslt-1.1.45 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
                     mdadm-4.3 | 1 
               nushell-0.108.0 | 1 
           oath-toolkit-2.6.14 | 1 
               openblas-0.3.31 | 1 
               pax-utils-1.3.7 | 1 
                     php-8.5.4 | 1 
             pptp-linux-1.10.0 | 1 
           python-html5lib-1.1 | 1 
                 rtl_433-25.02 | 1 
         s6-linux-init-1.1.2.1 | 1 
     s6-portable-utils-2.3.0.4 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 sqlite-3.51.3 | 1 
                   swipl-9.2.9 | 1 
                 systemd-258.4 | 1 
              tailscale-1.78.1 | 1 
           uboot-tools-2026.01 | 1 
        util-linux-libs-2.41.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/ae60753f07ea0f5bf830a4d21877cf9d04a872cc |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/81d75c6697f92940f68bfe1d5d915dac7822f391 |     
  aarch64    |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/538238e7d62327a24736c92cf2bcbd3aa86c80ba |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/b744b8b2c326888eddb5827cc16fb17351908ec7 |     
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/963fb814c1a434a7be59a1270cfee469670e4f36 |     
   armeb     |          broot-1.56.2          | NOK | https://autobuild.buildroot.org/results/c295fc2f519ada763c2fd4d6d100ddc01be8c271 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/42ac8f87966713e4202df277ece0826a1795a491 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/1f8408b52927551395283b6d7c408cfc0e3d6940 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/137564494c08226c34fbccae2e17fc58f9dc943b |     
   sh4aeb    |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/60acdd67131434e381beb30bdfd60a4a7404cf76 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a6b976416eefcf5dcd9251c9982c865ad64b9076 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4a474e068d749f2465440960f1d238061997a2fd | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bbe471b6fec19daa3ebf6aa2a18896e803ef1b67 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6e2144f03b0b7cba96b40d955b80914ee1e64120 | ORPH
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9009b8adb79eb1286119838c84e657a5efc154db | ORPH
   x86_64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/0ca1e87d9acd08b6878e3c35601bbe31180888fd | ORPH
    m68k     |         dump1090-10.2          | NOK | https://autobuild.buildroot.org/results/a5115e2c706e28dc1e28ee4a99e13f90a645971a |     
   mips64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/fb24a3fbfee7f480a8b6c25c7d81c5b0fe414b94 |     
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/45a27c427b0a1cd5dfde796cc6b0a6a467cc506a |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/8f2e785b735fced1b3375ac6760025dbc433613f |     
   sh4aeb    |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/380e035b1dc6af34527acb2ac2203ce8561a789d |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/93afba4408e0ea1c1cd0be94bc2ab48984cc3741 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1855d300b40774e8f25d197ed0f4d51029a0c54e |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/20cfa516208e91db57e6bad276c3405db4fc7082 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/9494aa2117966f47b72515f4dac08db130cfcd81 |     
    mips     |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/0555afb002adeb6a6b0ff4965c823bf9a724ae6d |     
    i686     |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/4e4c84e8fc7eaf47e426311833da68d108ed8728 | ORPH
  riscv64    | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/2e6f0533b280c67878c06f23ba05b7e77c5cff83 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/a4a99ff3d309503984e46e6c6f975b86fb39ab81 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/03ef5a1319c3a04b29699a857b748b3378a44cd5 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/2e1882f05e86a5ab0e115a21049ffcca72dc75c5 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/786452a9b4cd36e618aa328b4b56754534291940 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/56b1af76d545a7a9c2a2059deb5841a6d646924d | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/53db483053ae676cfc768ee182b7f3b61a2f06c0 | ORPH
  aarch64    |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/7bb6f6e268bbc4c65b7bac1153e304341bff5f3d |     
   x86_64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/3a1b7a188879a9daa58f329ed1f8037a14ce8bc1 |     
loongarch64  |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/412f27487c182ae419c12d4a292b210ec62789c8 |     
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f63eb1aa1e6f042201c8db59fee1e63afcc38eb2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7813c699a32a6abc759baf78dbc534f9c5c36038 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4cd4dd269fa9f0ada98cfa82bfb6bac36e5b617a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef8b528c325de45a13778ede271740811814d51e | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0729fbd0548210503d68f70f122cd430ece0eb76 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d81d20061a4a3d62797c562986ba5fdf51d17ca | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfa7920cf444e5121169a54199162888c1ddbead | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a4023188ffb4f4ded75af8cfa9d8ca9240106bf0 |     
 powerpc64   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/932fe43635b64e0ae536c2250edfeef0f5b6a91e | ORPH
 aarch64_be  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3468781589531a26af4f123794138daef96f31fe |     
 microblaze  |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/229030fbde455eb07498e774043704c640a49980 |     
 aarch64_be  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/d45d5638146cb76fd49ab4d7546533f6096659e9 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0e6b9eceb84c2ed5b27ad4517e98c00b9d38e35e |     
 powerpc64   | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/f63b10058f1907ae34d528e7d172e2c155cfd375 |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/b472bd0d6d4ffed94bd7b5033f7e5cfb917077d1 |     
powerpc64le  |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/2849101226bad2f18c5237d7925fee2163aeadfa |     
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d1766b6b5ac1dba36fa91720d7fe00cd01793d8a |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/7374bc82d240e734934a14ef5f83e8230dd52b59 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/2caa070135f5ea33771a89b63f544aa9bce36010 | ORPH
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/02ae85df6a64516a630537379a76666133208d97 |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/26ef1d3dc206e2cad1f70376e6b873e2821c5266 |     
   sh4eb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/8accb1daa704a1f017f9cb6f6ab39456363222e1 |     
   x86_64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/4617bb1248361412c7f00eeff6a255f0f3c1fa06 |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/bf3c81f34f6821a15d262956877b178e497d3ed6 |     
    mips     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/c0c64b348b5fbaa77ecc117078cbad8ecb9c4941 |     
    or1k     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/cd6a4fe227f3b810587cb161ace745209670ca89 |     
    i686     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/07fa4932fe247e8e472f0f134db6ec36421303e4 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/b94a3e3ad2bbb35bd35336f40ccb533788b6d86b |     
  powerpc    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a641e6c2c3dabb32a494849f25213be6f25effd0 | ORPH
 aarch64_be  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/ff643130e943673012a32d21048622db37500b63 |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/bb10862e5daa1ef9cd23d1d50b73d683dcd8f586 |     
    mips     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/9232b29308787ac03e8c712d229b683cdd9d687d |     
    hppa     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/717fcf79077c04dc2120fa3ca476c4fe72e4d3e6 | ORPH
   mips64    |      libmicrohttpd-1.0.3       | NOK | https://autobuild.buildroot.org/results/8003ff96a965f8e512199790f53b1ab5588f9eb7 |     
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0443068f50d5c3cecab0ad6d515bcdb20ff9c5ed | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/2951a418205b0846f9d56750c3577bb81ce5e148 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d0259a2d406e2ab14c58fb6b52bab0851059fe3c | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/5d6b3900df5ce85a1ea0ee9877eab9f61bfcc25a | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/3a80faa685763ba399899d185e668f3c56cce48b | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/bf30e5a2532d344fff4b1110520488f918050a34 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/6afdc2c16915b497d5724e0d433f75b01d108ad1 | ORPH
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/b7683bd2950e43afb333313a596f13f3f7a2a5be |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/abcc09212d26b119f64f5c0ad08fd3aa900f7e57 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/5331876a02d140be0b43b18bd3896f21b0946312 | ORPH
    arc      |    libpagekite-0.91.251215     | NOK | https://autobuild.buildroot.org/results/c1d594370936c901abec8e3d8e28343ee588d39b |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8ae6cd2705b4386f6f0eedc8dc41a17574ad3d3f |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1e625f8c30de88a8d806ac5f1862671d715a51fe |     
    mips     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/3712edef8137c7c7ec9f7fc92d158d114539170a | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/8d464b4339e601ca8208cf9cd483d3d7eb6c0776 |     
   mipsel    | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/a7044dc861474d32a759574772944d2333a39303 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/fc035b4337f20d938f0b3fce578b9acd1883908c |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1f804e48166f76ff6331285fc1ec877414c324ad | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/ec0e408bb61eae947dce773c6a536bbb65658449 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/06bce9d09cf8e6a92917b217c07611054baeb721 | ORPH
    hppa     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/69d25542d6482f73158a0518fa1b232a1a2cca95 | ORPH
   armeb     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/0d956fd7f9b8e91d96e21a18c89c4f58ad5bd662 | ORPH
    hppa     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/20f952296c5bef9b1ff24caacdedcb505bb236f0 |     
   mips64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/e8661e09ca6e1a79b6bec834234637b62751ae96 |     
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/82bfb3e3a72361dd058230a0a1e20007886ed15d | ORPH
    mips     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/65525588b29f3ffa09eba02eeaaccea3b990958c | ORPH
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/3b800071073b7c0ce3b81ab57f5ea72065bcda67 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/53ba820d2f6fb7afec06b3c283576502ec8583e3 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/dfdccfb9ffbec2284406b483f888079c922c0229 |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b2fe37699e37faeeef0e0eb8ea078d0e21b3dd4f |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/dde853fd8a6d2d67c97eeedde6a6b7f7c3b1c225 |     
    mips     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/829b40dc8e0ced127a0470b2eee6ec757a4ffa6e |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/160dd6e4f98dee472030791762dd312187951244 | ORPH
microblazeel |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/241af02135e9895ef75f83f62e1c2ad256964c91 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/15690a3b8c6bf8d6df5e0a3005230d6f4030145b |     
    sh4a     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/02d29c05d280904bb662a12ccfac64e63d7c1c2d |     
  aarch64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1f009e9edce560a9eb6e0260dac9f766eab791fc |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/718f3171c9a7bc4d2bc307f44a0e460bb5e57859 |     
  riscv64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/d6c336437d0e8f003af5cf6fc6aecda8ba7b8098 |     
  sparc64    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/c3f086020c001e602889ffebbabfa80da70787e3 | ORPH
  sparc64    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/67cb4ab64bc1bcece6273c30812fd618f3b4f863 | ORPH
    m68k     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/b06455b35bc161baa0bd9ac18d29fcba101467d7 | ORPH
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8be0030e81ce6bbb6d072cc73bfe26097d0d1057 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d2e585dc721fc2b7c01e86155135a2f4eebbe17d |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/542c4368f2365d0100d81351e05f8b8242a0175e |     
 microblaze  |           php-8.5.4            | NOK | https://autobuild.buildroot.org/results/3fc7de510f239e64ff030af77074c8659ae692c2 |     
  powerpc    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/63f28e183370a985109485cf6fc7ecf3f71afc45 | ORPH
    mips     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/2d91b7af4a5448f79acc1949d99153ed6c3ab366 |     
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/86ac117791258ff00991bab905da67fdaa6028d7 |     
 powerpc64   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/7c67697e79cffa7c804ee3d572b66841e381b363 |     
   armeb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/0f541997487980d03a498331c321d356626011ab |     
    mips     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/451f19d4b39a4cbd6fc8ff13c509bf773bc9a163 |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/88fca496daeb9869245a5d72d7917e2b6236c49a |     
   s390x     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/e36f820703bca012df2cf03524319de9b0aacab8 |     
   sh4eb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/d889daf3b9f4a9deb06c74c02f36ef62db3e297d |     
  mips64el   |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/75aa24aa56cef3f5f7b175ecaf325c7513ccc176 |     
 powerpc64   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/954f9acc4424ca91c03558be96b109e950aa4b28 | ORPH
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/da1753b1c0a0798e73acbb53ed8a4dee02f88ddf |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/baff570182a9c1f7da1d6824e1486e97d7c903d9 |     
 powerpc64   |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/ca16c359c7d72e0d7c13f3249d213625f275b1a9 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/adefe8271ef4fba6b45db7d825f46860a1b48b3d |     
 aarch64_be  |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/557f7a92f06e595b86bf38b0bc35f93e878f2e8b | ORPH
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4c2f12aa5dbaadfb116c6149984a823abfa4393e | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b64c10dfdd02733e3354e8f2edfb581338e61cbb | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6738d5c450c0906c15bfa513c8657e7492b0b227 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7d068da7f558ee875cb02b37a92d3c4fb1873f51 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/aabf1b1598973e444b1051420cd657c53aa284d3 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b3321150806a5d6e6509f26723cfcc5bfa0f405f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ede1168ea317732e86f9b0b718f40f556a1e8d6d |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e03dc419e19a87d09054972c0b1d1db0cccc2330 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4cfa2f4381b401a35df42fb124144568f2132827 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/fcf3b519b67643c1e6d33624f38c4f06809062d4 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/dd13474bad892cf32e3853923ace7357a49d51f2 |     
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e56318acceb9bfec788a87fbfed129d1c4ecd356 | ORPH
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3b8426466ccaf1be7d1a556c16674bed41298d7a | ORPH
    arm      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/d17b9d5c6c042962c03af10f029c4f48218a6da7 |     
    m68k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/c5331113b1afc67db2f153ea59d51cc12990218e |     
  mips64el   |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/653f07b5b77e6c7703c411da92ab35747d4054d9 |     
 microblaze  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/8b89f659a5bbf231836287955827feeaa8d0bd7e |     
   x86_64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/ba409694efddf7ac4fffa5905ff315efcf06dca4 |     
   s390x     |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/b381677ce564cc90031e113fa0211a71351828dd |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
dht-0.27-2-g38c9f261d9b58b7... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
       host-libunistring-1.4.1 | 1 
host-vboot-utils-4b12d392e5... | 1 
leafnode2-9543ffaf82406f943... | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
     libphidget-2.1.9.20190409 | 1 
               linux-pam-1.6.1 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/d5ad1785b9fc99b76df077ccfd712e79ff583f7c |     
   s390x     | dht-0.27-2-g38c9f261d9b58b7... | NOK | https://autobuild.buildroot.org/results/77993bddd0f5f715198ba8bc93cf78c317d49b1b |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | https://autobuild.buildroot.org/results/f223ca23ddfe5ba10c128c42ab0154b4d20649ec |     
   mipsel    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/00e058df3858c86d5d5a1bc8c01b8e40a7ebd98e |     
  powerpc    | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/afb15721146a33a7d2de9a061aa73514092c1a9b |     
    arc      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/d649ea638a415ac37ba37ec0938570d3e6c55ba8 |     
    or1k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e136d98b3125468bb38d3e2051b83894fd90e225 |     
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/fc87194af5bffa56fc03c1cf7b971cee98608692 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/774ca72e8747a4e6a6ed19788dcae51ac963040b |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/1ee63e5213713b8550bd3d604cf81301f87dfca1 | ORPH
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/8187a9a87fb691149710c505baf646d4a0c076bd |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/224181984cbd849463da7d937ab5b413309ac70c |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/22a2c29016169cf072f034165f2d4297043dfbae |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/11c1f307ff7660031183467bf22f350b67d4023d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 7 
        host-python-lxml-5.3.0 | 4 
              host-pahole-1.27 | 2 
              libopenssl-3.4.4 | 2 
                bpftool-v7.1.0 | 1 
                 c-icap-0.5.10 | 1 
                   duma-2.5.21 | 1 
                  giflib-5.2.2 | 1 
  gobject-introspection-1.82.0 | 1 
host-binutils-arc-2023.09-r... | 1 
                 host-gdb-14.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                host-odb-2.4.0 | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libmbus-0.9.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libsodium-1.0.18 | 1 
            libxkbcommon-1.9.2 | 1 
               linux-pam-1.6.1 | 1 
           oath-toolkit-2.6.12 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.3 | 1 
toolchain-external-bootlin-... | 1 
             tpm-tools-1.3.9.1 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/bc182efa9880d4f0e629b56b30905e1d8ba43c03 |     
    sh4a     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c930e663a56accff599e1e05a32cd01734203eaf | ORPH
    or1k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/c64c10126fd6f7fe6b1a12d326d24fdb57a05ec0 | ORPH
   armeb     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/9e7bf9daa40ee325a0d1f897b4bda29546f45f24 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/53636f883ea80a47da6fbe73bc4a7c43e5895bda | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0d209a653a2e1940c5b0ab0e5003f5b0826a8a03 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0a825a6fabd01e0e79aae21f16b4e1b68e601a1a | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/f697b8afe9674387c41698e78600037623a3d853 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/dd45d7bc681da2d7cd177199af84000ab9f3495d | ORPH
   sparc     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/3a8deff869bd685ce5d353c4f1d4f99e98638e6d |     
   x86_64    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/9d6788bda8689954897859e842689f34d71eafb8 |     
 aarch64_be  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/529bfcace7ca8d747c37212ca15b3c68f9b16a44 |     
   mips64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/05fd4d7e10ce6fc872067a6cb3cf77418f5770ae |     
   mipsel    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/28a6ae62afe6cd8484b7a6141973874900921bc8 |     
    arc      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/dc841f1d0744c759d1d42fda2a734cb144189dfd |     
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/7a9828b14aec7cf553b485ed0ce3aa73afba976f |     
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/12c2e784868a4c58ba9c9040e7389fffc1ec273f | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/f5dee6bdc6f7fc16fe92375ed2e835c9fcd235cc | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/b19ea5733d82eb62d432271d3f9bbbfaad00412f | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d151e2f5589157e68926aed83536a2b5068ab4b7 |     
  sparc64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/3456d012fef2998b7591b4481fa450272317a1e0 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/70776936f6c84f6fc4242054d797d2b2f87aaad4 |     
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d18b746673ed9d08898c0772543244d30dec6361 | ORPH
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4c7dd935f8f6700bce71c14284af786c9e99b1e2 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/aa65f49a693fbd3aae0eda77254f20ecf2c8071a |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6455dce24f7dfb1f407cd660e75394f85e0de950 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/33147cef33194f5882840cb65b6be5304993aa85 | ORPH
    or1k     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/cac26f4cfb3999fae373855e75ce22fb32a90d25 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/345b7655163c9a054fb398aa1f226eac7d6abb61 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bc3c0df1b798a7eafcde3ade8dd8982827608a02 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1874a3d1ea6a014e8ca21c2818d1f4f36ea626de |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f946a6b3529913f34903bf4899a1579b766a1483 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/235ffff6753e96aea73a7371cd088d11c637b763 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/31877a8eba3a9b18e06c1dc73211a8d93ba2d544 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/13d94a4da9917372b56a40860514407b510e46ae |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/118da40491b166a1a081f402d17f12402c59b1c1 |     


Gitlab CI results for 2026-04-04
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13752442651 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13752442273 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150776 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13752442538 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150784 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150787 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150811 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150815 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150817 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150854 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150904 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751150989 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151010 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151053 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151141 | ORPH 
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151148 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151232 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151235 | ORPH 
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13751151240 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768757114 | ORPH 
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768757345 | ORPH 
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768757607 | ORPH 
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768757785 |      
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768757994 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768758865 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768758945 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768759874 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764136 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764611 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764638 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764687 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764734 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766252 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766333 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766432 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766715 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766604 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766853 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768766921 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767229 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767112 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767174 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767389 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767344 |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767576 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768767799 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13768768026 | ORPH 
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780488722 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780488881 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780488938 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780489103 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780489156 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780489237 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780489260 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780490864 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780490887 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780491014 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780491049 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780491059 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780491377 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780491785 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780492057 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780492176 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780492215 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780492239 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13780492275 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
