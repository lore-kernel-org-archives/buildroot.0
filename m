Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823DFC87FCF
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 03:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4885C40938;
	Fri,  8 Aug 2025 03:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lk5xk2qk1djl; Fri,  8 Aug 2025 03:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47F240941
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47F240941;
	Fri,  8 Aug 2025 03:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D76F31
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 03:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F81180A83
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 03:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwxCJe8pnwJM for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 03:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7F7E80A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F7E80A54
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7F7E80A54
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 03:14:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af98841b4abso291555366b.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 20:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754622865; x=1755227665;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UpnT6UYlpde9jUOUqzdKTXd6L0H4xBZPY3BM/Xuw+b4=;
 b=pgXpjL+NlAg9vsRTlPFMdSqiAQfq6rSHxIK5zbYqILFLAanD7xHOSSR17fKBLM9up3
 hiL4X6I+5/KmqfsfDowEW4Sxq0S01ZV76NApF4BTxAVytJPkKk5CfTa0e8X2vHO7KSpm
 DBMsOb4D6ybj9aH1B//TNvh3oSeTaTS1aiV6Sjrh+Zd9RTMgIK8+k3i1odsD/RKvoLyH
 wX3ahBhSlevsSYZDiZDlQatCM0OHtejNnhvJjkjuY1LOBHS8HylglWtxAABmmPcEdQly
 rLXKsz7nDZh11P63qO6p6SybPAgkcNbJp8QtDnckquq0/6QthZzS4m+8wXJhGTkePFr5
 tNEA==
X-Gm-Message-State: AOJu0YwSmpPKxJi0xScHHC5YyqGh7MVvmeaTPUmmxdEPj1pzW7BwEw7Y
 a7eUBhk7EGzxDRWObO7KxyctHmNxQ8cJfniWCqndOtf8lbR+qTXt6Ccj/TefwA==
X-Gm-Gg: ASbGncugXHhuySd4XHprJ5Z2eu31P0IaViniD/wv7k5QJHXldM0wTVj7ecq1ktmZDPI
 fkiYl3L5G7L5a/y3AeQzTzo8AJ4Emc+jFUhpvvq1C7oqOnsgp6ja/rRLSddv44O/dNzzbWOAeEf
 LIJdH0zUOaA/eHRA2wTwbiHcMuQmwFjRjiRYDfU5Nx8KfMvkwggwx8VZYh8IJDLwhcU2f9zIS01
 C29Fh0ph+ZXiebqyrR//rQgV/gFcVX9ymJIdu9rcf1wO0QpOrtSwTtMc4YWYpPSqIJ4UGESl8iq
 D6LCfBC9F+L00paDhfcNjvUX8W+Ri7g/MCmiI+d5vOF1X64+084Rw9x3UkiTW0kKVYhKhbXHweM
 IvCWQunDyEeGxX/Darwuv6oJc2Q==
X-Google-Smtp-Source: AGHT+IEwXSPw6wP9C/b99PDSUDXPKpWlzmm8th9CUuAXD8AgBxzSIJkjANHhHoG/BN0NHY7UsXjK0Q==
X-Received: by 2002:a17:907:3fa3:b0:ae3:5887:4219 with SMTP id
 a640c23a62f3a-af9c64f6a35mr115697866b.45.1754622865203; 
 Thu, 07 Aug 2025 20:14:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766d1sm1422215066b.18.2025.08.07.20.14.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 20:14:24 -0700 (PDT)
Message-ID: <68956b90.170a0220.7c268.332d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 08 Aug 2025 03:14:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754622865; x=1755227665; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UpnT6UYlpde9jUOUqzdKTXd6L0H4xBZPY3BM/Xuw+b4=;
 b=ZnjwGaJZikNZ6fadQcC23GTqZgPNpkADAqvvBNtNwgt0xulYjbK7cHsNjga9peVpvW
 Ct3AjwwNt5dhv5e3REDI5Zdor1OGpiSrMHkyArmScRG5EhVkTB4R8uu36IGMKM8wHsyE
 tVgg/gXjttfueqavwOKvcG7BjpnJZMqtLHe8z1XJmE4wIvLEgWCym6z8/iPcO1nO2YNE
 yfg5L4/LQ3I/fzFWvK79bc8G0F9VtZEfL1r2izntW4SoezGagMHT6bNjltKLqgmnDRmo
 rI+15/SUqdd8Rfunm2hBNn9CEt3o3YpvTa8JKBOLkCWJsrDnq60pGqhOyHCOBUz+j1et
 +aTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZnjwGaJZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-07
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

Autobuild statistics for 2025-08-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  4  |  0  |  9  |
  2025.05.x  |  0  |  3  |  0  |  3  |
    master   | 30  | 141 |  1  | 172 |

Classification of failures by reason for master
-----------------------------------------------

        liblog4c-localtime-1.0 | 7 
         linux-headers-6.1.147 | 6 
       host-gcc-initial-14.3.0 | 5 
libdbi-drivers-0bfae6c43134... | 5 
                liboauth-1.0.3 | 5 
               bctoolbox-4.4.8 | 4 
brcm-patchram-plus-15bd6638... | 4 
host-binutils-arc-2023.09-r... | 4 
                    linux-6.16 | 4 
                   avrdude-8.0 | 3 
                   bash-5.2.37 | 3 
                   cvs-1.12.13 | 3 
         host-gcc-final-14.3.0 | 3 
            netstat-nat-1.4.10 | 3 
                       unknown | 3 
        vulkan-headers-1.4.317 | 3 
                   atop-2.11.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
    host-llvm-libunwind-20.1.8 | 2 
                  iozone-3.506 | 2 
libftdi1-v1.5-48-g22b4667a8... | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
          linux-5.10.162-cip24 | 2 
                   nanocom-1.0 | 2 
      passt-2025_06_11.0293c6f | 2 
            python-yarl-1.18.3 | 2 
                 rtptools-1.22 | 2 
                    sslh-2.0.1 | 2 
                    bat-0.25.0 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                bpftool-v7.5.0 | 1 
                 c-icap-0.5.10 | 1 
             dahdi-linux-3.3.0 | 1 
                    dust-1.1.2 | 1 
               ebtables-2.0.11 | 1 
                enscript-1.6.6 | 1 
             erofs-utils-1.8.5 | 1 
                   eza-0.20.19 | 1 
              fluent-bit-4.0.3 | 1 
       freeradius-server-3.2.6 | 1 
                 hidapi-0.15.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
        host-sentry-cli-2.20.3 | 1 
                  ledmon-1.0.0 | 1 
                  libjwt-3.2.0 | 1 
                  libnss-3.114 | 1 
              libopenssl-3.5.1 | 1 
              libselinux-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
                 linux-headers | 1 
                 logsurfer-1.8 | 1 
              mosquitto-2.0.22 | 1 
                    mpir-3.0.0 | 1 
                  mupdf-1.23.9 | 1 
                    ngrep-1.47 | 1 
                     nvme-1.12 | 1 
               openblas-0.3.30 | 1 
                openocd-0.12.0 | 1 
                openvpn-2.6.14 | 1 
                  prboom-2.5.0 | 1 
             python-webpy-0.62 | 1 
                   s6-2.13.1.0 | 1 
         s6-networking-2.7.0.4 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                 siproxd-0.8.3 | 1 
              tinyssh-20240101 | 1 
toolchain-external-bootlin-... | 1 
                   trinity-1.9 | 1 
             util-linux-2.41.1 | 1 
               valgrind-3.25.1 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/303f29f840b3f19ce6fdb58cd77d73fa8abeafd4 |     
  sparc64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/549086c3e07daba124b6b9329c7562114485f905 |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3907c33200b3d731282e1f2f51708557e418d2e5 |     
    mips     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/8fd42eba3bc232f4e91fd28241c858a8c6863e95 |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ef97fd38f9e68d193a501f1977392fcdfce54195 |     
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/92315153776fd0e49e1652fb2208d1fea5aa780a | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6b7dcadf89f7c546139dfa65ae11ffe6541b82ab | ORPH
    or1k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/882f9a094e4166e9a7b3c44471c5ad5f4beee35a | ORPH
 powerpc64   |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/de45ca232b27760b8dd0790503c4a86f5899a75e |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8fad97a6f0344081c4a13040e22ab71219cc0b3d |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/263229c74c3bcf7e43b7a424a4a7054c2f2059ad | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1dc3a986e6670a39f5e3b0ed9cfaaa9579a3156c | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/61920d970012f95cb263fcb97b544fe4d18370f5 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1124fa8676eadd6bcadac6f8de0d40eb632b15c2 | ORPH
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/54ac983026d4b062045f634ffec212e83a0140e0 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8a6774d7fd44c452c599afe6511759a894ba84d4 | ORPH
    arc      |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/ba460ecb3e6924db802349c957fd3a1cd0331713 |     
 powerpc64   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/c38f46b0c3ce98b524439e7550312939eb3c31f6 |     
 powerpc64   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/04347aea7e72df8f759160b8d71a131760b05a1f |     
   s390x     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/dab09b6ab41f2013600d6377fe9e1f6fe6205663 |     
   s390x     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/2b3f1c8788e99c61f668bf00e9eccc0e97dbc181 |     
  powerpc    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5aaa569dfc3aa43a057f39af64b7b82a4a59aaf8 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/150b1b9b61a04cf252dfa193cee14b9d3840fef9 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1b77df8532cc41e4ca1c6754124a91eeff655177 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/545b3764b238c4bdde89738033322e42d93f80a1 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/126c4ca17c7853100a18d9ac665a5e2619109aed | ORPH
 powerpc64   |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/fe442071b29922348baa66584e7edc359f13bb8b | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/dac1c56fe50cdb06771ee57a767958ef045101d0 |     
 powerpc64   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/05bd9cb33223dddf3e3f09987bb5606ee2f21579 | ORPH
    arc      |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/aa802634f9989ed2e3d548b40394cf6c4abde1e7 |     
   x86_64    |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/cada08c5813015c33a0f1258ac628ca8f4f18c3d |     
    or1k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/42fdc9cf3ed94da6cb8351328c2c38e874623960 |     
 powerpc64   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/bbaa8fc7c272e81a3011ca0c4132d3e4c1511ea8 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2689c9433ec273b9cc61bda4b9b84de401e2f39b |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/7b0c8bccaf8079a80e260df0232d1b734f4b5985 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/549a879dda3182d5594eae47c55b84869da2d9ad | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5a3749e853f7aed0e253467e575390584aa1db68 | ORPH
    arc      |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/a1fec3d24aeae21bf910a0bba916bffad13c44d7 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cd3b6a6dfdfe687be62a7cb184857e3f42644e88 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c67350d401e2eaee3dfea24ecd6697783189c72c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/def80a2f80ff4322fd9a0f9adfe62126b750097f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/27ed6e82e9adf0a417249d82c5ccec320a6b72ad |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6eb9087d2439ef8d6d1975ea630b84a95b5b6516 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/e560eb94bc23858ada5482fd5aaa96bd20487355 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/ea0937c2b185a42656b0c41b000e24fd4d22ff93 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/e5a2062aacb9fe256bbe94d31dd70367af534883 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/52cc672b7171f7b0c63259c05798519e823cfcc0 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/5d09bf9d048bb91ccfe5fb76753416063fb69bae |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/981fb809fc43e417f7af56ee651a293f91aeb967 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/1893782b7c64033a0deb14329e93361a8da03c87 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/92e8d3fee4dd55ccf33ab158e13959b30326843f |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/09095023885a7abfba52f00ac0c2700afb5299c5 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/686f27dfa76bf2623f712e1be00d6a553b1f322c | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/fb55b4b8ba0ea179df50cc8f4cea0113cc8244d1 | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8600e7d246bddf047f1918901ca814b6d88b7de1 |     
    i586     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/6d16ce02e4a11bfb23382cad964372b5269539d6 |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/5228eb61bd9266abacc6d854cf2ab7a128a4fb90 |     
    m68k     |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/5f9e5fa66cce96dfa29ce3d180ffe098497a0999 |     
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/04d1fea9fa622e9244776a713757b83b752f149e |     
   mipsel    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/409c2f966704107e002e7d106516d28d583a6502 |     
    or1k     |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/b3a1ddb6ab140cad561fa7b9505d1f21e6db8ba7 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4b2c787d0a5a3ffa155b0625569a8dcf2ec36eee |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1b716ff956ecd5fe2d2ae33dc4bdc79540940fd3 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/48918247224c8343366897fe0b9255c2c583f57a |     
    i586     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0214212fae7bec89e36450af7cddf1faead0f238 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9624ce0201aad77cfc14ce7c9545ab76ce268d88 |     
    mips     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/62a0d80ee24a6714b1a9f33d1f5076fd516eb61f |     
   armeb     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/8bd4bbd868b45076a601a29b7ec136dc0927a7e1 |     
   mips64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/7327ec33816e3b326cbb8e8adeb2801ad021f570 |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/24cf63b80b5b171131bce230c623f15ed61d3a67 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/bf721c8da51eab8162a971143aafe3d713b8191c |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/a8df1089fdc9c1255f68ca2ddf70fbc2fe1295dc |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/47dacb70296f17513a91fb7b8a097c6ae9f23e5f |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/39bb77c0f3c723635fc12b8cfde548387810efa5 |     
  aarch64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f44a57b4df048fbf343342d119caa590962ff983 |     
   sh4eb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/89505bdacfa559c66e7cee54da66b1d13fb3a352 |     
  mips64el   |          libnss-3.114          | NOK | https://autobuild.buildroot.org/results/4dc431109da9c73fefbc50a5348ec6276b64bc47 |     
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/6cc8243db70eda6e7d22b622d800a67fb1da57b4 | ORPH
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/c25500f420e346c9394d7bf0cef8ce0602edd446 | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/4d44f6b211f437983d19dfe94c02c89e5862c0fe | ORPH
    i686     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d6e42c4c78ac7738957fdcb6ac2bd81269b78b3b | ORPH
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/254c8c0592cae2e63f36286fd10b26958b357899 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/bb77ad10927a0b04f2b80460380749d1aa1e4b31 | ORPH
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9a5d2453682300bf1338ea029906aec9a4facea6 |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4f3489b99c1efe07cdb81219336bd228e8f9c2e7 |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8c94eecbd076578a2762e66a914902336d8363a0 | ORPH
    sh4a     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/1104b1446a44e5083eaf25bfb9d53d730b2ccb3b | ORPH
    or1k     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/5b496cf590b3d4d1420942b14e616b746081af1f |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/d38529ba3206ab7c106322884b738c0b58ce7313 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/13cedb79d8f3528391d60eb0d5e1edaf15d19462 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/168dcd97ace5a3d831d82a174af8b38ed3db1266 | ORPH
    m68k     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/11b996d9b83c1172031de167e0a4afeeabd993e7 | ORPH
powerpc64le  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/1d7336864f08d2189437f8bed78bcc809a10a629 | ORPH
   armeb     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/aa95da65a6115a3d1fb13b30f81f590bc8405184 | ORPH
    or1k     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/21c45970f39ea442929337a485b406a8a9a8279f | ORPH
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/a0659738dcc3d277857814b81ea20105eabcd3f5 |     
    arm      |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/9452b61c88cd47ebfd83ff1774a4b59c8dfa887e | ORPH
   armeb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/9af85fb091fb4fb63d441187292719ae6f70ab20 | ORPH
 powerpc64   |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/28ee9fd091e693a2441fa702582b4cf3931d1716 | ORPH
   armeb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/685a5eab3e4db1b59ca18f69626761d286f17c89 | ORPH
  mips64el   |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/7de45d97661799ebe0b2d5bfe3680838291b0208 | ORPH
   mipsel    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/90b2468d99317b2429c376eeed3171513cbe97a2 | ORPH
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e82096984d3b2b58720ba8acd65493224d7bd493 |     
loongarch64  |        mosquitto-2.0.22        | NOK | https://autobuild.buildroot.org/results/7b804166696068b3e757f34fcd6f07f0b3c11fcf |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c8e92f797a4011b594080cfb4b5756d38e76b5a1 |     
   mipsel    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/dbd7829af826435985adf732804a17f6979d45cf |     
 powerpc64   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/5592ab3db0df1976a0166f8099d77fb6b5432493 |     
    or1k     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/f3fc5f2b026ba1fbd10c791455f5d7c5ca234614 |     
    i686     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5f567a2493428ad17193667cd62e818fdfed2027 | ORPH
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/66f1781136e40c5183abffc90db24cad9bf1ae0e | ORPH
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/80e386574fde40d87ca9f61599678ab5dcd889e4 | ORPH
   sparc     |           ngrep-1.47           | NOK | https://autobuild.buildroot.org/results/4a951e0137631c602230fec53ebc55804e189d13 |     
   mipsel    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/dbdb3e76a187c70bb2f222c219779b3648422447 | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/f0e2bc9778b7cef9deb43b7cd236bce9d313ce97 |     
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/f4c691b59745d70d1110e66e6800289e8c0a113b | ORPH
   mipsel    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/120cf2c87117e5658e6ba15f1c2ee1a53774b7d2 |     
   xtensa    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/17c62871021e2c2ed897994694fd2bff21700776 | ORPH
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/c2722c260c6f4d4b72c134e0a5f73fc014a16dc1 | ORPH
    or1k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/0ee0c7600d6ec5703d5f691df90a0274e231b5ef | ORPH
 microblaze  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/ae4e516c406c3ef33ce34d891b00e40d280f4541 |     
   mipsel    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/ecc4fca04a9904b954a8a7290f850b84c475ac74 |     
 microblaze  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/74eaf861363df1ae99f144bd566d6c4b2c24cb6b |     
   sparc     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/f4c67a58c962eda9a564c33e93ab54f038cd6db7 | ORPH
microblazeel |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/86b9e4169759a3d1d84ebc018a665e8dbd91c456 | ORPH
   mipsel    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/8f8d9a8e334915c2ebb8121bcaa4ef657593b4b4 |     
  powerpc    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/e020eb2a73a5b798c62bfaaedbf800d7b8a55a06 |     
powerpc64le  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/3d3c05c235d3126df49594892d43b5cff4ffbb22 |     
  sparc64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/5a586536eb58cde960deed814cdf07db40e2b7d3 |     
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/80c62632b189922ae8335a2c602d6419cee21e31 | ORPH
    or1k     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/6bf27d0a3dacdefa3cb359845ffbfb8072bc34ae | ORPH
  powerpc    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/515673ec8ed0ca2e6cfc1ff3f5551f7c8d5d036d |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/2994df62ff3e553dc101a43d887a51a5c96c4a7e | ORPH
powerpc64le  |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/791bf5224b424085576c4457211cc0716a66c1c0 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/f451fb612a1ebfd6eef846f31a5dcc20ac1d5f30 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5a992211c2563e445530ea352cfbb50359c088ac |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/642f9ea64a6590b5a7b0662e2cd198ec84208e2b |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6241d2baa27543342f9ef251975938069a7fb1cd | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/1007b3b438f40930c2728f72deed0ce7b6c898a6 | ORPH
  mips64el   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/8d221f28848345cf1d6975a181dd5a806ff063cf | ORPH
    arm      |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/28941798a7902fc966e9c329de7aff91b139a0c4 | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/e61d8bec1a5b6ed5480ec325dedfe193e92d85d5 | ORPH
    m68k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/0963c68365f849535f9faf188258e02095daf4fe | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bmap-writer-1.0.2 | 1 
        ltp-testsuite-20250130 | 1 
                 openssh-9.9p2 | 1 
                   tini-0.19.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/5f140665d5b2c70e7e718a3c468bf9d01db84fe9 |     
   sh4aeb    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/cc418baf880def984c066040a34719eb3298dc78 |     
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/7964e07a588f86b6b7494d4506693600409a5515 | ORPH
    i686     |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/f0d10cd25f3b0e2a4af7266f7417b339ea5d242a |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

            ecryptfs-utils-111 | 1 
               host-vde2-2.3.3 | 1 
              libopenssl-3.5.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/81eaa22e63a0ae3567722919dfc5752735429485 |     
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d037f54e50d79675c434551ab58bb47c63c995dc | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/b107864ce161408763136ac4cc4074e0c20db6fc | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
