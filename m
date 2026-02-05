Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C186E91260
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 06:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351F582438;
	Thu,  5 Feb 2026 06:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffAWot_hlWTa; Thu,  5 Feb 2026 06:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC9683BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770272479;
	bh=hQu6G2lynzdUZdpgLeuqNj6efyb/dEIi+TrQD1HHIYU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OwlbiaSTSFxZQSSbk/8KHunxMA1SFYpJ3c4fVLwIt7sZ3whb8UsXldZWZ0+8VC4bI
	 2MMGGBKnwydXUoFpF7uwx7xV66WRIZTE+otnRXqiBzMRyTsK4YdmsKoVWsdcgAx8Vn
	 mWX/X/Nvhptj2waWKTNAtO6yaIanViSnaWW85ZCQUD2fZwsGVpE/VGZ6f6bORyU2XX
	 6VhsOiuKEQ9GQWGUfAxNvs88Nk0ARecSITqOHMWGDVMjOhD4BX3OGwa/WqWAIoaL2i
	 5al0TpZYMtdLZxIuIhUvMdxENGhU3smr6E8WkhMg9+/GsMFEeF50VW21E0Yy/aGFCP
	 lUcmNcY0wCzjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC9683BC4;
	Thu,  5 Feb 2026 06:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04273F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 06:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E21C282438
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 06:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZmwEMFM4WjR for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 06:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C806883BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C806883BC4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C806883BC4
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 06:21:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so3816255e9.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 22:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770272473; x=1770877273;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OC8OHN4QKYSoNHoWNDZBH0KSFbDN/fLa0tp4VqfiK0w=;
 b=CXHM9/j/BSVjvvsZUzp9g0N8NsaKlGFfhjKAOsmRwJ0WSfnhG1NlHrFc/U1qIUJe0b
 3cXQ+JknCnT07stIZL6Gm/4upyzJlOBYZMXvjmHGwtVozHu0dhfmEgOPmK+fp/fOmxH1
 lZOsNhZfFLq5cuUlkw2LMFsvV6Sllvpw/+4ChX3WLDPthg+EyubUCz7JXqL33xeVfIeO
 YlUZRRmz8/niTkqvCvufdbdfiwtF9JNV8KbQ/j0RvFIvjoPAaC0IqdpKXO/bupcdRp9E
 dSciZ9uXXIE6FYyf5m/5dyMBw2JDFil6LqERli8WetoZD1dD6B7ltJ+yfPQMd7k3o+l7
 VZaA==
X-Gm-Message-State: AOJu0YzeNLuvSWszY54GmODTJhLv2DQYkJcLguW8eFwCQkOu/apgXvv2
 87FTXHujXsiCR3k2MbSss1OYQwTJvJIE8WpWlv4QzMQgjUMa405C5OBegEsVwA==
X-Gm-Gg: AZuq6aLQVMvBrg3NcOJn4gW9yUIN/uAqcIEhcc5uCSnrtXFfp8b0JeJFNQBOB0mnF2O
 UypNkPMg5bPDuoahceCDvOYpMsIQlv22K/T/wsN8b9visVw6RPB4BWG9Ci9mcz2miyNitKpFxkr
 hkh4cfB4bDpbumiLHBFCgEvhuoXDl52BN/f2V2jf1fvA2d+FZQWg8Mkfj63NqOSgvi2CbFMzRrA
 UAUfkmZz84ONgl/zIPntcZkT6+knInArX9FsL9zkwsMl18hmj793hFfU/gEB2XTvfHEPoFZRgV5
 iAi7h5/rdOs+G/jPVpTRGKQT9g9auWhL7+9yJTdN8yvTIot3nfJUxobfc9PzAEnKvbT8mJ0VF7K
 3q41arFihdO8383M8METoBOVmXb2+q/CeylduioYWaO8XEfHbUluedFWUGZSCR/og7pilSX12py
 GXvlF1XIlCf8s4wQ73Hg==
X-Received: by 2002:a05:600c:5304:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-4830e8d1f1cmr66692225e9.0.1770265092108; 
 Wed, 04 Feb 2026 20:18:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm37712985e9.6.2026.02.04.20.18.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 20:18:11 -0800 (PST)
Message-ID: <69841a03.050a0220.316c0e.82a9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 05 Feb 2026 04:18:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770272473; x=1770877273; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OC8OHN4QKYSoNHoWNDZBH0KSFbDN/fLa0tp4VqfiK0w=;
 b=j10kFKo3LTDPSJ4mF87dWmezWeDF2hIueugX3e1r1ptG0jiUh30zdzMK3UnFOW005U
 UKCEIZY6LuDp1ZzyynPSzu6Lb89eF/TNHpXwt3T1L5L024IMf5tL2Q3YALXzTmWLoB0m
 b/FEQE1IdJO8ybrcqzWPL8FLTvIK5YeM4EPPK74N6m4G8aT54ouo84DVWuIUfK7FjvKF
 EQMXwS629Wlnb+2UJx/mxpWLpyD5fL0TPFyJcMQwlnZ3bkuhb5UQzPv0szCUUXZjWU+t
 TruqIfipqn0QDb4OAUo+0pg+EIXSgIuwBHAnbfujFA8hwgGG67m7d2apFz+poUMWrKH6
 UxgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j10kFKo3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-04
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

Autobuild statistics for 2026-02-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 39  |  0  | 53  |
  2025.11.x  |  6  | 11  |  0  | 17  |
    master   | 57  | 95  |  0  | 152 |

Classification of failures by reason for master
-----------------------------------------------

                 dash-0.5.13.1 | 6 
              libopenssl-3.6.1 | 4 
                   perl-5.42.0 | 4 
ustream-ssl-5a81c108d20e247... | 4 
     linux-5.10.246-cip66-rt29 | 3 
                openobex-1.7.2 | 3 
              e2fsprogs-1.47.3 | 2 
glibc-2.42-51-gcbf39c26b258... | 2 
                     kbd-2.9.0 | 2 
             libgphoto2-2.5.33 | 2 
                  linux-6.18.8 | 2 
                       mrp-1.2 | 2 
      passt-2025_06_11.0293c6f | 2 
           uboot-tools-2025.10 | 2 
uclibc-ng-test-132c6134d691... | 2 
                       unknown | 2 
                apr-util-1.6.3 | 1 
                  assimp-6.0.2 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                    docker-1.5 | 1 
                    dpdk-25.11 | 1 
                easydbus-0.1.0 | 1 
                   exim-4.99.1 | 1 
                    ficl-4.1.0 | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
              host-guile-3.0.9 | 1 
                  hwloc-2.12.2 | 1 
            igd2-for-linux-2.2 | 1 
                   k3conf-v0.4 | 1 
                  libbpf-1.6.2 | 1 
               libcgroup-2.0.3 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libnss-3.120 | 1 
     libphidget-2.1.9.20190409 | 1 
libuci-f3fc0b76040685829191... | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
                memtest86-7.20 | 1 
                    mpd-0.24.7 | 1 
                    mpir-3.0.0 | 1 
                     mtd-2.2.1 | 1 
                    musl-1.2.5 | 1 
                   mutt-2.2.13 | 1 
                    ne10-1.2.1 | 1 
              netavark-v1.17.0 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
               pcsc-lite-2.1.0 | 1 
                     php-8.5.2 | 1 
          python-pillow-12.0.0 | 1 
          python-protobuf-33.5 | 1 
python-remi-2022.7.27-37-g1... | 1 
                s6-dns-2.4.0.0 | 1 
              skalibs-2.14.3.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.3 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/371836d100d8c3acf9579031bbc9107615f541be |     
    or1k     |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/3c55c4ee54df3afcd25f397222d894d9a1c4a3e4 | ORPH
   mips64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/2e7fe61cc349b843604091190fa7346f95dd0d56 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/c993381d1f76f14147dcfa69e082378f0dc38269 |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5526c9b0db6e4c3af7b32f3dc4d44ffd9b8a6d73 | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9c9d02812c0ddb5202381dea6f608311f1d5d14e | ORPH
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f32af5cb50075444ffc750feff79e8369c142a16 | ORPH
   xtensa    |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/9f6f1118447ebd3b05453dfe6faca0fc1785ac13 |     
    i686     |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/b5e33c440de80bdbe7d745ede859d46313b1092a |     
   sparc     |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/15881ed3143260fe1a81379c1e515fd663b5729a |     
    i686     |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/4889933b51e8cbde2c43bba96aebe8a2f2a2aa10 |     
   sparc     |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/ae4ec4e00c6ca3aeed0900e87e06afda5fa3ac1a |     
  aarch64    |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/465e3af7014e0b86b0a0b67dcce1462f51ac32e8 |     
  powerpc    |           docker-1.5           | NOK | https://autobuild.buildroot.org/results/4956555fd033d43c1877e66141789bcd06aff5be | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/a54eca4319039a109a90beda1ef88fb128bcf14c |     
   s390x     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/e0592419f20d5858fe142b452a8621cce3bc0901 | ORPH
   sparc     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/d89ac0a736b3cf2e53fe5445f6f13bb43061afaf | ORPH
   mipsel    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/86ed2c1c43a8bb738dfe0db6710b4a4b80e59296 |     
    arm      |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/bcecc34e9f08d67077b0b50c9a9b65bec798ddef |     
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/98dc82359de77fd4315ade6c1e182eea9e1570fb |     
    or1k     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4cd5b6c14704e4cc9bae73b87d9771a18f990311 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a37e8f4607e97c59e6324ce3dde01b900969e688 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/4fdb03162d6339bd3fba2ac933c427c360aff6d3 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/c56cc894a82a7f8922e451f24395cfd2c96a2089 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/32f04d5c120e456a655d6de2af7f4902a79cffac |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/efea2320fd712a6b18b6b0808b1ba0b6b1247e4f | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8fb15775e812a8256ee473e6d13afb8e8ce7f9fe |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7194bef4b59ec40823b2c3fd37b82fe20e02d4b8 |     
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/4a934850c71c6d1facfe13c7afa199bf2af17f15 |     
   sh4eb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3d3659614c829aa901b15eecb424203762c354ef |     
  aarch64    |          k3conf-v0.4           | NOK | https://autobuild.buildroot.org/results/3879aff5cfd30485517a58591226cf716daef71c |     
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/53cb4fbae35babeb5dc0fc455b2bc9a2888c2020 | ORPH
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/20316038e73fcc107712cbb48d9d430bc91d3f1a | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/440e7180d7eec8ac71ef8a8dfe93fa0e12626e8a |     
   s390x     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/85bcaf4c2ffea11f1498ce179714e21a8c033642 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/57142bc0c33589ef647848e891cdfaacca515df4 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/9b429f9166e4616b570473cf7039e7f3a97a854f |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/ffe6bb508170ed1d3724dc9e1fd95c4f3fda2ec9 |     
powerpc64le  |          libnss-3.120          | NOK | https://autobuild.buildroot.org/results/9b31212dbbbbb9aee74f3df063c32a6c5ec3e18e |     
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/b286ad40f2240a85b9cd0dc44e089d1d6babd3ea | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/232a3840e0e745f01aa93cca9efe206d4ce3cc93 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/e7111cfb2a6247cff38e32e0c0edf0c80a05b6f4 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/47a269f5519326f1e570d98e2d45f298662882af | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5ff1d0323176d6a31adc14ce3615b37982e0add9 |     
  powerpc    | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/ca6856d6cb53e0466532e8e229dcee10853a76d8 |     
   armeb     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/b04c6534e30f3224f8a2244c784b2058c151a771 | ORPH
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/4c624a986811fc4a59c9f2f9366408f18481a32f | ORPH
   s390x     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/63a54031a410c3faf60a56642adffa90974065c4 | ORPH
 powerpc64   |          linux-6.18.8          | NOK | https://autobuild.buildroot.org/results/74a27be776be7c2491f57c2727a0c9c1e958b2c0 | ORPH
    sh4a     |          linux-6.18.8          | NOK | https://autobuild.buildroot.org/results/0638237b64bf37024c93e73d13265c32824640b4 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/06cda176d6697fe81617dc7e80f2e8a9ce6260f3 | ORPH
   x86_64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/262ac82dd4265d3dcb499f543cfb4f9cb545f119 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/4e10a9a48b4717e503d12c0c1d8f3d9dfeaf9fbc |     
    i686     |           mpd-0.24.7           | NOK | https://autobuild.buildroot.org/results/aaba3d6a9d55c3e8030d3e3487bf93074a4deac1 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/35b5817b481fb412aeed57bd3a26bd1fadf89507 |     
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/a52c91f12b54928515d9fb1a3c8adba3883ce7e1 |     
  mips64el   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/4cafe78ed27cb1d517670dee9dff313170fee076 |     
   xtensa    |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/37f3366f8a827694623187b2a6f9c5b080664f35 |     
   mips64    |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/fae76940ed20ad931281fdd3e8b3323ecdd70a82 |     
    or1k     |          mutt-2.2.13           | NOK | https://autobuild.buildroot.org/results/a725acbdb1fe74a5f101cf7623db0472b22ec63e |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/ec735e666c11972a766422d592e044afe8829a57 |     
  aarch64    |        netavark-v1.17.0        | NOK | https://autobuild.buildroot.org/results/a45a77d07f3a9a74e35b0dea6cccdf28067bd3e0 | ORPH
   xtensa    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/f25f3439398707ea86bf16866fb9e31d5db9fb06 | ORPH
   armeb     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/6fd5585cdea32c5930c66c8772db87d1bb1ea295 | ORPH
  mips64el   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/18caff658cc2f47c0eb4b48576de909da735ca60 | ORPH
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/174081c90fe20f0897a2489f10508e622aea4b75 | ORPH
  powerpc    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/967779890e97c3df9ddff58caade36f5169de72c | ORPH
   armeb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/500e42e24b7698a68a2caaa863b445d6789847f4 | ORPH
   sh4eb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/87557ccf38ed051d2ac7a02add42cccc0bd95d08 | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/0d0d6cb97fde5b7843c8c141d6caddea8fe0448f | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/c2dd9fc491aed7d169cbd8dcf2d619797541d6c5 | ORPH
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/a1256257fadbe8654b57d5a7971607c0586d040a |     
loongarch64  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/7ae9772fed1eafc4d9a8263e79a0c0c2534c1853 |     
 aarch64_be  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/ef5abccb63b58640c9a8d951d12bb83724901b7c |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/4a5d3769c61815ac57287dae644415187bac5f93 |     
 microblaze  |           php-8.5.2            | NOK | https://autobuild.buildroot.org/results/d06d379e0c1e7e92c78bb3a1a04d9c75c7078eea |     
    sh4      |      python-pillow-12.0.0      | NOK | https://autobuild.buildroot.org/results/a0afbe7976e4bccb20c8541270549e0483dbbc9b |     
    m68k     |      python-protobuf-33.5      | NOK | https://autobuild.buildroot.org/results/64d56368f409ae46e8b1e3603f38535078d3bd80 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/7412bb55b1db10b70b12b09f9576890b585ffd0d |     
powerpc64le  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/2fc53ee141a32e3fecb0adeaedbf379b67fd4b71 |     
    arm      |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b52d054b469d4e3a3e298c6bd28dbeb7867ca67f |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/8f0a97f10952195ec60dc8d297e2b9b49e413f7d |     
  sparc64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/c9502d800be8bd0564bec7c7c381c399ce9bfc69 | ORPH
  sparc64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/dcc71cfd874325afc1c70e2f8fddb5a36f834d81 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/0aa7476e52537a3fc44f7b889913cf67dd89d5dc |     
   x86_64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/6e2e7c4b41f09d76bbbde79d5a362f24d013d42c |     
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6ab2f32eef375ef0175d8bafe3102934563b1ca9 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/580c2216757e2b5a81a0cd52f8f8dd659953e983 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/646dcd3e265b15b51e5207b9bc411bc4f4d68b3e |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/c4edfa829b7cbde403c2b8c6320911142d6bfcdf | ORPH
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/2252a04c1134d8cddf82ec27dfef051377211460 | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/138d69dfc70866d4fb89be9680d984333020233c | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/43e52282e7a1f51e816a8b53f765277564d677b3 | ORPH
    arm      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/9011b1d004130d7524ea3e074ab212df173bb6bc |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/6f6207e9b5951dafd9019bcfc87dcc148f7882fb |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             batman-adv-2025.4 | 1 
               graphene-1.10.8 | 1 
               iproute2-6.17.0 | 1 
                 lcdproc-0.5.9 | 1 
              libopenssl-3.6.1 | 1 
        ltp-testsuite-20250530 | 1 
                      lzo-2.10 | 1 
                nushell-0.96.1 | 1 
          sane-airscan-0.99.33 | 1 
                       unknown | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/262a5cf1d287c9fe899d40d413947e27f67786ce |     
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8a785ce80fbdf42a51ee098471296d086d215e38 | ORPH
   arceb     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/3fcbb82fb8ca05fc498bbf29799d84da2f0ef243 |     
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/9cefe0a3783164ff7ac793d6ac8f5d39a73ce2ac | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/25566c7210e64cfc9866c45a424db89dade53d61 | ORPH
   mipsel    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/bea02d9dcae1bbb932d88283354f8c9c8d2e50fb |     
loongarch64  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/7d761c986af07135bc47f69b8504eacdbfeb13af | ORPH
   armeb     |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/1a6eb1f94ab21372dfd29c72c1ee0bb223f1a870 | ORPH
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6c654dce462eefb0215b6ee58a3123bee557d463 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2965d5f03d6b86124084af131fbcf71c6fc57ee0 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ca4c6a02ffa62cd823bcf66a5011a2e5be1f6ad2 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 10
                libselinux-3.7 | 6 
                       unknown | 4 
                   perl-5.40.3 | 3 
              xmlstarlet-1.6.1 | 2 
                     bc-1.07.1 | 1 
                haveged-1.9.19 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
             libgphoto2-2.5.27 | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
                 linux-6.12.65 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                setserial-2.17 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/eb78e51da1745b6364d3b48641f7ea94b53e622c |     
    arc      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/75111dd3621b16fbb7eb5240889f2d0ae5001e4e |     
powerpc64le  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/4870fddc15027154609e2d16531420cf242330be |     
    arc      |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f56b5afcfbdfbc8178e738297ae53a54f96eb91a |     
   armeb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c9aeec521bcb82c4936e5b87a0130b4e1f5aeb7e |     
   sparc     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c703075d77dba5f97903a5f7b6a42ade660cf8c7 |     
    arm      |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/7286eb94928ecb7d6dd4f0b365805f1670d3996b |     
   xtensa    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/cc4db707b9f85afec21161badca288cae1c9ef09 |     
   mipsel    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/8e0c03f7d864dd062569d53089eb82ab691363a4 |     
  powerpc    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/9cf888cedde16357cd2cbda2645e284d75f0a6cd |     
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a136bdbbdeb3abbe532a0b7168b6278698c217f2 |     
    mips     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c365f1f6379e9c8ad48e6e15fe003d86e2d095d4 |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/2d927ccfbb388817a4a711f158d96a4ef91417bc |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/3a279ed396a4e07cdf718cf46b37569f289c2fa8 |     
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ae0f84c5fc0753364afdb4c84b9962e43d21b543 |     
    or1k     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/c48a92f6a5e025c64172851e2d1fd7c514606f70 |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/79b67c93170aaebed2c6685f18a375ea56f40c22 |     
  riscv64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/27d7ca5f389fe65f9a9da511535c5ad24b27a1af |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/848ec00f152312934b240a31a9804cc184aec361 |     
  aarch64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/bcde87e5844f676cbea5cd0224357235af9d5bd8 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/733c0530d8a2a18539dad252a8b45ab1d55c2e70 |     
   mipsel    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9a4afd2b7fd254a8089adeeb8a5f3cfbfa31146f |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/330ce9fc24413f21fdcd7093011215ed26f6ae56 |     
powerpc64le  |         linux-6.12.65          | NOK | https://autobuild.buildroot.org/results/42b42731d3511491213b7005733a56ec7d825ee5 | ORPH
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/26a540dfeed341b55c04b420c57b820c2a1f65df |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/6ce56a804654678168b251161c5088bb9485da12 | ORPH
    mips     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/deafe9475915d0d247d9591d8e95af09d63e6d10 |     
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ec4f571148de7d603844727dceec98d4688669df |     
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/eb2c4aace3cf05b5fdb80e4303050fc1ae97ae30 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e7337f20aa21e2d430bd5cedbd627b19f1f7a016 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/986dd9e5c76ba571abdc6d211c76ca16be0ee582 | ORPH
 microblaze  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/5a5fe0b9b88d8385076dd2b8fc0014d0babc75a4 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/61f44b6db6050e3f90558f405e337901d4330618 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/71f95b3d2527b1f0dd58d240f6316742babe76f0 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/db9db6cfcea20e6ec6b6aedb7d765f3204d324a9 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5441dd640546cfa2986cb87a8d7c7fe436bad957 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/174254b210ab113322dd78942a29efbfbae870d0 |     
   xtensa    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/2787947cb2badc233edd8c41a7d341296cc7a74b | ORPH
    arm      |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/71bf393c405b6ac13f27264214fcdb6f275d7fae | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
