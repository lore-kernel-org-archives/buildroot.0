Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE552D2ECF9
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 05:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8CB454B4;
	Tue, 20 Jan 2026 05:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPsl1DCunX8c; Tue, 20 Jan 2026 05:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB17451C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768888673;
	bh=EJGpPqgyOeiHSsb0m6HCgjPm8AE0x+moLvqjUJYeS/s=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ImHpIBSFu270zQhJqiqf6abNyZiQaxfNVXEASZG6g8zN9/MTXOkYm94TENEhIQVVO
	 q4+oJNDGLWd56Bv3+YGL96K8tUiNVsdCZcz1qe0c7olC3eNj4UVEFBgoH9Oh69dTiQ
	 yd4tSgdvzfl9KtaEktZcW/NXUZyQoc5V2CTiiyJkdCK5Vi9X3nl6iEiXR4GHXOCYWC
	 DCZ+qj2dxNrT3Wlf9u2QH/gU5+8hfgHRCeW6MmRDm61iSpNyQqUup1Q1wzd3FED5Gm
	 XzZgSi6nO5X5F/ASHcGKRhaCbjqJ18yLNnmPCjrHxjElbzSuPLn569EF0e1BvdpnvH
	 lTs0ZUjXyyBIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB17451C5;
	Tue, 20 Jan 2026 05:57:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD5F6160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 05:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DDD4008D
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 05:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FS4Fv5etA9Bm for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 05:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DF6A4265C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DF6A4265C
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DF6A4265C
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 05:57:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b876bf5277dso910739566b.0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768888668; x=1769493468;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AuYXY4tXU5x88NaiL996KsuoXB52LRSpXCqjHvU8rgs=;
 b=Ul+FyvKFereoYlnXEwe00L7FpyqXopLGnA9C0ionaqLIdG5IPUObWKfYL2lGtsuSMI
 5z6yKR1YrSJsW0eYgTdtK4cRyCQvjTgQ96pr6v7UOvF9zRy7DotSdbqHc/SfjoixkR3b
 hvvPlrfoOOBKuAxkOCGCMqna6UFEYzw0w5xNZyVy1ZtUBEc4mFJzEbqzVqc2oGAYULow
 p8ueXgZrsagA/M2UNNMYm/jRSmz5VxyDQcfI7nEvfPPsBDkllsyQsRuLb7FvFPNVjhCt
 gIT5lcv6kbBxvc3sX0hLcBiStBOQkRnPKg7g+0A+ofCbOWiKA/964FJitztiSJy8+GP0
 PqTA==
X-Gm-Message-State: AOJu0YwYryo9xA8dIOCtHi0jY87uJMXj/VS60e0qEBhHiHbquB2AoJe7
 X0hnFQoNCKW70jaqA31cqAvnOfgVHFgr9lXq7A1jQz8KSU0yNUBR6gIKG11EOA==
X-Gm-Gg: AZuq6aKR0toHpOrK3ScO5PQLR1JxYXxjOMqdOsefleuNDw61MJ6lNoW3h8nU7Io9Abq
 mqStqMOvmD1UIEwH6CGtzk1RGgy5zNBajUGfAnrwa0dIE/2CtD86BYd/bZV4AgAdteh7Seue3MP
 EntV4HuMJq6W/3v5JmlY1Ewso+G4pjOL2OMMcOSGfHJ3UM96jHxtFdbp9eG/7T7EACIp8aMC3U5
 TAG2A4imOzZF821yhsgo1lRD3EfnBsVrnJSb3A9oJWpqfylPZ9jhSjonXWTK4vyVCrtKKfIipMs
 oLZBsCRnvX1pnBV55xddXeoOeu+HYypPuj7CcMj+22r0/ymFAnoBk1ixo58M3igvFrVhrY8NrkY
 zn3C1jc4Kz25UD/kpZNNdXkjkKEQGu1y9NDRpq550tWYl3RTeiD2gcPgEh09sFa+1p6h0bg6f9B
 toIbSLz+vUWt9Z7eVe7RMOyu8EytlM
X-Received: by 2002:a05:600c:3593:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-4801e547d1bmr183381935e9.8.1768882809525; 
 Mon, 19 Jan 2026 20:20:09 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921df9sm27587967f8f.3.2026.01.19.20.20.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 20:20:09 -0800 (PST)
Message-ID: <696f0279.5d0a0220.197bb0.3abd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 20 Jan 2026 04:20:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768888668; x=1769493468; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AuYXY4tXU5x88NaiL996KsuoXB52LRSpXCqjHvU8rgs=;
 b=cxpKNUjBw7+szDMG5CJuf+1j1+xVHBHDwBoZMQ2IeckeksJ9v0jDgCB/6fx9xqdNCE
 PKYl9KDtBCLE3EhkNgWb0bRVL7dAOBKA27DH02Nt5A6uWmPEDyzuZmB0qpgi441zCQQd
 QP/QBXy3Xg11ulWFFWRXwab8G3YN1wox/tQ93+DzyPzYnvsXvqUhn7Pnw8cXrwZuo5cO
 dIYB6GNpKneJPiHQoHjCOOfXUAWP1jKB7HhE0QznRbrYAFydkYjZNaOmoYBjYxD4JnS7
 Z7SbKaGww7KhX1QD6KKOc0OzBYFGNPqCj97ZXQFjFTXgHDw4MNqJF1PZqpWskWFuTgRP
 SZ+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cxpKNUjB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-19
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

Autobuild statistics for 2026-01-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 31  |  0  | 38  |
  2025.11.x  |  1  |  7  |  0  |  8  |
    master   | 39  | 97  |  1  | 137 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 10
                 jasper-2.0.33 | 10
                       unknown | 6 
                    mpir-3.0.0 | 3 
                netdata-1.37.1 | 3 
                openobex-1.7.2 | 3 
                 c-icap-0.5.10 | 2 
  gobject-introspection-1.84.0 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                  linux-6.18.6 | 2 
                       mrp-1.2 | 2 
                   perl-5.42.0 | 2 
               valgrind-3.26.0 | 2 
                 aichat-0.30.0 | 1 
               asterisk-22.5.2 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
            erofs-utils-1.8.10 | 1 
              execline-2.9.6.1 | 1 
                     fd-10.3.0 | 1 
                        gnutls | 1 
            gstreamer1-1.24.13 | 1 
                     gzip-1.14 | 1 
host-am335x-pru-package-5f3... | 1 
         host-libopenssl-3.6.0 | 1 
    host-mender-artifact-4.2.0 | 1 
              hyperfine-1.19.0 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
      libabseil-cpp-20250127.0 | 1 
              libcanberra-0.30 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libite-2.6.1 | 1 
                  libsepol-3.9 | 1 
                libsoup3-3.6.5 | 1 
                  libva-2.23.0 | 1 
libyuv-4825d9b29eea4dac2460... | 1 
               linux-pam-1.6.1 | 1 
                    lua-ev-1.5 | 1 
                memtest86-7.20 | 1 
            nss-myhostname-0.3 | 1 
           oath-toolkit-2.6.13 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
                 procs-0.14.10 | 1 
python-remi-2022.7.27-37-g1... | 1 
                s6-dns-2.4.0.0 | 1 
              shellinabox-2.20 | 1 
              skalibs-2.14.3.0 | 1 
             strongswan-5.9.14 | 1 
               syslog-ng-4.8.3 | 1 
                    szip-2.1.1 | 1 
uclibc-ng-test-132c6134d691... | 1 
                    uftp-5.0.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/262be4a902c1be295100ed0394c68cf2370b5640 |     
 microblaze  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/7d3c58eb6df4459d305445fff3024a058b6aa909 |     
    sh4      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5124eafedac1f447a42bd71326399d0b166cbf84 | ORPH
 microblaze  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/16ebb3c9e5c63ab61e5514d3b91c762a37e34ad2 | ORPH
  mips64el   | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/0cc13eb9217e5e88c16529901e004eda1b7da683 | ORPH
   x86_64    |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/c3614ddfcc21c804c438f743c5f507b9c25906d1 |     
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/45a1534eee72f1025545ec33dbe2c1789971f718 | ORPH
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/1d0b209d9db65d855e51c63216aeeaeea98a50ea |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/c14e511fd41231831e64636be038273e866ca598 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/bc9fd0ea32915c1c722b7ec35795be8ada70221f |     
    m68k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a4cf9bd4dbdb4446c029bb426b44a1e4012c5722 |     
   armeb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/b609999ec7f01dfe9d778d80598bc5b00316a030 |     
microblazeel |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/70a19fb0a077824bc5ed172e8e3620c19d94f7c6 |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/101149076e211c071810dbcb301796762b5ec64c |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/9e4214b27f267c3026f54dd0944aad1c13cf92bf |     
 microblaze  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/9ba042463dc1f35620a58293527518e6158e8056 |     
   x86_64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8f1636dd960a9ed4c337bcda65f38ac0bc583ab8 |     
  mips64el   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/cf8912271bb3a077a18fb49823569bd21df8a43b | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/c267f9fa2d7dce140a70e29e34f32649f46e0360 |     
   x86_64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/34d55586bae82acbb991eadd7abc4a5e8c6c4aff |     
   x86_64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/dc042b90c329dd054aca688dbd02f3214036d9f9 |     
    sh4      |             gnutls             | TIM | https://autobuild.buildroot.org/results/3dd7e557702032bb3f0daa4b42ce9ade091259b8 |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2b300fbee70eb886ec59f7c319d49c467becb4cd | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/249a3b937089738449143833639d75c1552c22d2 | ORPH
loongarch64  |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/c773519b84c61562b77213d9d4243502683c6dd6 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/b8f3d7174d82128f8df46fafcffccf7b9f06b3e8 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f5d0feec6b1d297f9567add2b28ebdfe637d00f3 |     
microblazeel |     host-libopenssl-3.6.0      | NOK | https://autobuild.buildroot.org/results/663d9b8774059e394c2291b79083849ae53d1b23 | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/10d6c5dd1f0703029393e1b9c10d74aa0745e888 |     
powerpc64le  |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/b5bf3f20f7368b5a7f9dfd376aea7f22b1d78bed | ORPH
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/0fdb77dbe4f40c8a6a8b69a00e7795e86936d715 |     
  aarch64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/f98c28c0721dc9bbc6147b06a8ad38fd58015fe1 |     
  riscv64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/ae5d6fc48a51bdc41404504c8346e85d4bf843ba |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/0234224c9fa5d18746a67c91853b1f26d5b797f5 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3c6da18fdbab9c3f2caa8c69ba2a8c96ff0473b7 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5a5f3a87d3ce9070a4a2c4a9398f647c6727cd7e |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/2ce9c0b268cd6555d3de189ecad6484e774f3a8a |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/b972c632c78ba171e737541d964741f348ec66f7 |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/17d14e6618c44e950c4791f39b8e5250ad46c3e3 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5ac45a941492dcab02335d621d311aa4a1ce019b |     
  powerpc    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1b11617ed44a37e429ddab46cae81dc7e30798a2 |     
   mips64    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/60b0420ee03d1f58585c812d41008b19380209e4 |     
 microblaze  |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/f8cdf4eba96c2fc4a77f14661f5e32bd712a31ec |     
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/1f6ad20856d49392faf6d11fc8fdb80fe8f6df37 |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/f67a16f6528c7ecc8e308d5b972e2dc59b472e8a |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9589da307f454ab46ab3f65c4eec55ca6a8c760d | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/0a6e388632fcba29ca56424fe4717e13070d9a46 | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/32cbac4218c6c898da533f66326513b56e94ddec |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/62478e0f0a79d488a6884c3a5148923191c3e458 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/752e1deae750b0689857e28f44b1283566a84a98 |     
    or1k     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/21a05431bfc39b31956c8aeb83f491a6285ca0eb |     
    or1k     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/54fe5302adb517b8807bc1d9a1152da02d7df4bb |     
 aarch64_be  | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/d8c9383ce6c1a786430e44506b744d661c9e47b5 |     
   sh4aeb    |          linux-6.18.6          | NOK | https://autobuild.buildroot.org/results/3c677e00cfb212dfcf3d8a74e4272d3c5c4599e0 | ORPH
loongarch64  |          linux-6.18.6          | NOK | https://autobuild.buildroot.org/results/e909678100d6b2247fdb5c7a5747d6f567fea1c6 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/62032c650683a03168cea4b229e94dfe1a3fdc2f | ORPH
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d116b650f5dc45faba9e2dfdee629042e8c1aae3 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/fd2fbe1046317702955d3d9573e1e15259d1317e |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8c6c3c70696376237997d1c70fcdb76d980359a0 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/963937bdeb25ce43911060e0027c4b1dbd1ea3c9 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/475c56272ff10b8293da645f31ce9505d79552ac |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/361692d15e2f3e2618bed714f74e2d258dcdb5a1 |     
   sh4aeb    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/04e81e39db2c25619e46031af197704a6a8b105d |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/682f3c422ef43318573eef49ce6040494b503dc1 |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/8bf87000482fe8b9dd7b90136a3258ea04856037 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3b2bf8a97febe23439f36e8a8b79a237cfbdec17 |     
microblazeel |       nss-myhostname-0.3       | NOK | https://autobuild.buildroot.org/results/ec704e59b5107c3c95f9e12bff29bf89b152ce46 |     
 microblaze  |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/0566ec48912f8914edc01795fa4b1fcd6c4a137d |     
   s390x     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/237a7082d5917259a5de0c9ae6acac447d16c9fd | ORPH
    or1k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/2a2040d8c6a40bbabff60cc2a258ebb3da0bb723 | ORPH
    mips     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/8b1cbc33af446b4c0c38ec42f424f5ff1ba63783 | ORPH
   s390x     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/1e4e84914ed3f1b2b404f3a664f02dd362c2688d | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/1966bf65f5f067078490fc49645b23a393530677 | ORPH
   mips64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e2d5450e256cb932ae97235499876b6ed97efec2 |     
    or1k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/d85dffded2a3dc71e9a97b82fa03a3963d78713c |     
microblazeel |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/15f87b13b18665267d872860b16aafe949b446ab |     
   x86_64    |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/1de8de1e2bf6883b2b5afa17d74efb72e55663e5 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b8f091f83ef92d2223d2c7af440b067837add3f5 |     
   mipsel    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/a82a0aee0227454381c27f665641520390f5883c |     
powerpc64le  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/c3d4eb065130dceee1a1d45d0904028664d47626 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/4733177e4eca2813afc43204bec8582ecfd386b6 |     
 microblaze  |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/338a6c2bcdc0e122743b22e307d73edf4362fb78 |     
   armeb     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/0021688aaa5de73522cac37bf2326160ab8a51c7 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/6aea5bb474f9bacc25703828c30ba44ec1c39579 |     
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/5db2f6dd9a805aa660ec40865b284bd9f270ad6f |     
   mipsel    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/a74526181dfc90aff7f56457c430c1aa1d006e54 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f944a75744471af2a83e6e911c9c7c6296951456 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/94f02c310ffcf7cf0c8612fdd8e9aa61ec0a37e8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d4d2e99ff3faffd52f9c85a34e36f5fc3b263bc0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5942bdce2d7222aae6bb71d60849b41a3c387fda |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/1ce367138fbe86c83bccf05eff40995856d897ef |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/dbe8afae2bb5cbde16fc3007ed63aad1f7573753 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/cf9b086e2abcab5b7b9c85519a7e71a86452fd0a |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9d9b990b935eda980e33ce88ebe277f197ff04e8 | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ad5ce2ad5574ffe83cec6ec94ac69e7c6fbb4538 | ORPH
 powerpc64   |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/f3598a1604b384e88ff1d4e0daa51cef793ebbf5 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/1b0fe191d86fc7c1d2cd91e8435939428aa2adc4 | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/aafd2503ee39274289609e1051376c24fa365e0e | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  ffmpeg-6.1.3 | 1 
                 inadyn-2.12.0 | 1 
          sane-airscan-0.99.33 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/143d8c9e3f016996510a836e3dae6c6196cd81d4 |     
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f0ceb53cf44d2a320dd7de28ef05615843e1c424 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/09e24f7afab1d8a4d1a83fafda8896be6c89f1f1 |     
 microblaze  |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/2b234ae8b437cc4a69d5b9dab1f0f6ca72ac0dbb |     
    sh4      |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/df6572be48255cb7e60d645924339fb5db8ad873 |     
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ccbdeceefa5278e31cdcca6a075eb4360bc6b4c5 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/c1180d381a8b02236e72dca009d8094542923736 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 6 
                       unknown | 4 
           host-libselinux-3.7 | 2 
           oath-toolkit-2.6.12 | 2 
              xmlstarlet-1.6.1 | 2 
                     criu-3.19 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
                 fdk-aac-2.0.3 | 1 
                  ffmpeg-6.1.3 | 1 
               graphene-1.10.8 | 1 
 host-softether-4.30-9700-beta | 1 
            host-thrift-0.14.1 | 1 
        ltp-testsuite-20250130 | 1 
                  mupdf-1.23.9 | 1 
                 nethogs-0.8.8 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/1b85869291824770c305a5c35b3581358f833f05 |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/72c793cb2b24934d6c4a91b09ac174e302ac698e |     
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c3e4e17332662dfca529c5bed27026bad5a37bd5 | ORPH
    arm      |         fdk-aac-2.0.3          | NOK | https://autobuild.buildroot.org/results/5338e2528331c7e2b2985b2dd32f80e783c786cd |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/210a6e617a71f3245b63f03ae8532bc853d23073 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e18e80f6f391bc3932f51b0ee95bd4f32e283c25 | ORPH
 microblaze  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c9aa45c18e57489b59501790f9cea113629e859c |     
  sparc64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/b500e2b50beeb2972f93bcf36915a85acb3ff8cd |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/2a31976b2f5fc772a9885f3899cfd08862072eaa |     
    sh4a     |       host-thrift-0.14.1       | NOK | https://autobuild.buildroot.org/results/db7f8c09d27fb5bb176035e3305be4e3e5fd5fe8 | ORPH
   armeb     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/74712ad21fd14226591c4a455ff0d25c90ef0160 |     
    mips     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d2bf674e49800b57af438c30519987819b11e665 |     
microblazeel |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/b48dc1386257dac25d7757d82407db68f373012a |     
    arc      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/47ac69760e75b67a1b77a3db6ac3ceada5531e42 |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/cdd1292f41dedbbf7f662358a596aa05ea2337be |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/9e3726ab00d75f93fefc6474220f74cf92dbc768 |     
   sh4eb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0f6d70a66338e57b37a9a9b25e0bd36d890a8410 |     
powerpc64le  |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/95ec39ffeb4845dbb249650e0e8d0758403e643b |     
    arc      |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/9f8e9214b8f1d62e1638c42d3dcca482c02c16c5 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/602dba8a6d4b2f8b3ee1650bb0c0c95f84b6ce94 |     
  aarch64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0e49ee100ed646aeddfdc43702a57d7e893b5b7b |     
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6a5a238635eae2c64340164f5a4c57d769c76358 |     
    m68k     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/f9c5d3034acf630b7050b83b72a24cbd6707af22 |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d7aea2f9468bdb74dee2768e5183e6faec7526c0 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/d27e90767d6f201d1d0c972df6b50799ef1d40de | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/5df3f29aaf9d3f9f2f34c9ec9bcb9b65f571c3e0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/7621e71091c3655cfa9e30a4eda9a97d9265300f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/72e2aa73422814e36c10f79c6bcd9b9dd98c9884 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/906d350145a2fae8183799b130aa687e6237d37e |     
   x86_64    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/012da0c7827d6816a67604380223b76d960de105 | ORPH
 powerpc64   |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/514c049ea4499132a649a4b137b523063883db58 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
