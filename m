Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED5CFC9EC0
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 04:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B55F660B89;
	Sat,  7 Mar 2026 04:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWwo3DssbtgQ; Sat,  7 Mar 2026 04:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DBE060BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772857542;
	bh=h6XDccNEItIOI7SENjbDjn2msjb7tUphr2BgZznO1aA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WZ01TBB6RlJaEfHTRHy0eJxYXXaooRyPybp6NCsAPe17XjlSMZ7wOcOnELjqdy9Y1
	 P90R6+B8ymoh0NhECz8cnScBeIK1CGohbR6pOtfY410spgeIVCW/1SQulX9R6KHQAB
	 fvKTKJ+G6zOsIsZvBdcODJofx2Mhgovajv31vIAlvumhrBiJJP0VsZRirOtBhjHyHW
	 ouo24TNbperPzMQ40hOiFbb0uet6b9JFFWAEba7OfI6GW61RqDJviFsufBicHckp2h
	 30rKWxTYCFl711lbaX97jyL9IFs7QJI+aeV0EqPqee5YX9TfN/shGemtq2hJ8fKTWk
	 6gRsLwPLASQJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBE060BA9;
	Sat,  7 Mar 2026 04:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E646169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 04:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7332841F65
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 04:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDrTWUryiGT5 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 04:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0C3D41F64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C3D41F64
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C3D41F64
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 04:25:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso100921345e9.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 20:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772857537; x=1773462337;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4gbkd2PQyZyYJRZEWlaxa4QPjsXY16h56q8bv74GY0=;
 b=rCrd4KPNUot3auiiKS9MLyOoP4xhwFRuvpcWIQ5KNzLSIC34syHblr1f9WkCAGCuHB
 YcqDhLPOBgvo3HHUFZ8D2TpZDJvp3IEB3AjpPKX2l4z8rqS9BiuOeayimPFHUraj5/+S
 GpSp2FDM+/XPoe/ibWFwZb43p4il0aVcUYzgiB8n9SyYVVO8CJC0QefWuOWRWOizURy1
 gH7q/LrNsE5rHFjJXTzbxJLQSI9e/RkgxYiQ736T/5EcHNCkPtIh8Ye6Nlwl7xVhDxIE
 F/cAr8P+NKFnGS+QfoNBaJDmpVW5BRoZhDqfvcRELbQ11CH9U8NfC7gh17z00nlolag7
 jyNA==
X-Gm-Message-State: AOJu0Yzd2jP4h3Yxgtq6twgoB0m5VOqvxqnmt5tcjVKxBXa1owsd2TYM
 qRz8LdiBP3QB7LVcfcxXMyuLZudRvh1v3nEzcyJ+IAdxdCX+nKh4BUR/MX7iagFi
X-Gm-Gg: ATEYQzz+Ad/KK2EbfZvZHJvHE7yn7wx7U7iqZqZp+i23he7kpQaTQJOKI1vb2P0TVYe
 lQlU8OGobQY7S6Kp6PvudLc18cnaZRTiSk1mZQojOUsE2vW1IvF1qXu1S09sSChv8/elCgy2R3t
 j9wLXV+ZzsXSe0lUv1fDV5seCCRBeud5Xzm+qaLMmmoHmN1wSoGH5lgE6LxwlKolz+X1O4qSLhL
 YzguraH4MKmvx6frZC5I5ZYSVQw+DP1OzRJxU2zi1tZ3f6ijVyUR7drecw0GIiURR1OO2bIIF86
 P4tWLVntiSVkPU8KAF0qmaRzupY86QgiHQPTid7Iq2Zv1mXBAAHMIBVGhzhSfzMd8P5yoLS9u6t
 l4WbTVpnhw7SgfD3oW7pBsglirwQryiAgE1qimeJWHkjOvvsO6uxh57JHKXuw2Dl8MYuKgvl4Ta
 MmBnVsVQXfBygAOGLkOrbP1iGryNPiAQ==
X-Received: by 2002:a05:600c:4e88:b0:483:7ea3:3de3 with SMTP id
 5b1f17b1804b1-48526715266mr65878405e9.2.1772857537220; 
 Fri, 06 Mar 2026 20:25:37 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852e38c013sm47887025e9.8.2026.03.06.20.25.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 20:25:37 -0800 (PST)
Message-ID: <69aba8c1.050a0220.24143c.953e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 07 Mar 2026 04:25:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772857537; x=1773462337; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S4gbkd2PQyZyYJRZEWlaxa4QPjsXY16h56q8bv74GY0=;
 b=QtFgiaYzLK3/E+8f1bODMtaEqy1rTzSQjKuu7Qv28CH32SNDhL47yIVPuxT96VYput
 RvN1woZe8APB9bktkMcylpguYsAQtF/0NvHvh7jLXGSzmqDYcxKs8YEQHLnDTFjsGHKG
 iutGfEZ6LTZ2wHYkYUX3K5XcTO8qVl/KF9EFBv8bIO+oFvKDVj01goe2IjX/wiJxSdIW
 bNsDLY6ubJ1ic2Gvjmf+oW3nLxAgJbnG01cgJByurTTd+Ai28CTnqBpejMS76zJ82jgx
 5VKQqEQ3rYz8espN23vhYoADVUEVx3sW35HT0jn3Twu3azcJUKMObrdF4PY7j7FnJf1D
 5ylg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QtFgiaYz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-06
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

Autobuild statistics for 2026-03-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 18  |  0  | 21  |
  2025.11.x  |  3  | 10  |  0  | 13  |
    master   | 33  | 85  |  5  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-headers | 4 
                   perl-5.42.0 | 4 
                    ficl-4.1.0 | 3 
  gobject-introspection-1.84.0 | 3 
host-gobject-introspection-... | 3 
leafnode2-9543ffaf82406f943... | 3 
                  libnfs-6.0.2 | 3 
              libopenssl-3.6.1 | 3 
                 libzlib-1.3.2 | 3 
                  brotli-1.2.0 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
                    fcft-3.3.2 | 2 
firmware-utils-c42a3bc53da8... | 2 
    host-mender-artifact-4.2.0 | 2 
                  iozone-3.508 | 2 
libdill-32d0e8b733416208e04... | 2 
     libphidget-2.1.9.20190409 | 2 
                openntpd-6.8p1 | 2 
                openssh-10.2p1 | 2 
                     shim-16.1 | 2 
                 aichat-0.30.0 | 1 
                bpftool-v7.5.0 | 1 
          cloudflared-2025.8.1 | 1 
edk2-platforms-1e64c1109ae2... | 1 
              fftw-quad-3.3.10 | 1 
               freeipmi-1.6.16 | 1 
                 fwupd-efi-1.7 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                 highway-1.3.0 | 1 
          host-faketime-0.9.12 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
           host-libtpms-0.10.1 | 1 
              host-pahole-1.28 | 1 
               host-runc-1.3.0 | 1 
                 host-rust-bin | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                libcurl-8.18.0 | 1 
              libid3tag-0.16.4 | 1 
                 libmbus-0.9.0 | 1 
             libucontext-1.3.3 | 1 
                    lua-ev-1.5 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                  mupdf-1.23.9 | 1 
           oath-toolkit-2.6.14 | 1 
                openswan-3.0.0 | 1 
             pptp-linux-1.10.0 | 1 
           python-brotli-1.2.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
           python-zlmdb-23.1.1 | 1 
                python3-3.14.3 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                 rtptools-1.22 | 1 
         s6-linux-init-1.1.2.1 | 1 
                       unknown | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/b56ce02b180785a284b867af8247658bb3a7d156 |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/079180a296a24e475fed58535c982bf2d2d9c8d4 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/1c5243d6d012545680972807a4596da6e16a2058 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/3c41ca40f732845f10193dbb5fda5a70408d4a3d |     
  aarch64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/85154b0cef4b00b88a35ffda35121d0cbc2907af |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c984988e16417b48c84ed7a7d6945f5ed36e85b2 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ce7e0b67def847cf432d3d750463ac09d057d51c | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0ce6f47108e58e466e74a8a443810908a00cab1e | ORPH
    sh4a     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/47ac8030626a02cf2254060e7ccba7b743360504 | ORPH
    i686     | edk2-platforms-1e64c1109ae2... | NOK | https://autobuild.buildroot.org/results/f9091cd8103b8ad9c6b1a4f39df293421797fa3e |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/0f86021dd07a02235e03e58a162031504601535a | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/801bad80dc9fb10519d31acd1e2c2866e56cac1c | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c773b924d01ed80056d6c92bd01b0cef9d375575 | ORPH
    or1k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/33d677a2b8b85c1affd7963136418c0f54ef6d44 |     
   mipsel    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/64f67475cb0857a191e05232dadceeb354e1c9ff |     
   sparc     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/82bc3d50cddde2c5d3caf63ef499320e95d0da75 |     
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b98d67cd34fb55082c9e7230c5159d698df3e510 |     
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/5f19c442d1c66dfa6859da53eebdeddc439c8829 |     
  powerpc    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/a898811da49814c9fb5faa95b5a63be2a2b6de0d |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/e67cf47a90a8c082116a684654e78f99b97cf5ad |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/c1ebf43b46f91351cf5fc928dda71b285e3ca159 |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5c422846b3b12c00a269834f0ad6899fba25e150 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4de13c1942ed438d5b824df4ec2a6195f174ae8e | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/49d26d48bfdfc9b0c4f708c1b763805537dc6e34 | ORPH
    arm      |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/6f5b3cd23139cd39aa1aac07d567fe0569d412e0 |     
   sparc     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/9112933e2560b155a9c61f321874ec245b62b2a5 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/82c4ce4ca9094c203225697787ba7581f4724d34 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/b5651d2295f7dfaaa80feee36ce53ce835af31db | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/03f58f9ba2a2d545d8977ea7d2d3ea752b0f29df | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2815612b1031724d453a6fe6b65a6b75a75de70f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57287aa44cc74b41c151c7c1dc3f14f646155b07 | ORPH
   sparc     |      host-libtpms-0.10.1       | NOK | https://autobuild.buildroot.org/results/7a6ea7c513e8f1dcc32d868108bfb2a907d6fe85 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/0d1d9bf18e590d5a13958760787c3619a8a9d696 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/3cbb3dff582af9ce487204d2b45c70e2b848c66f |     
    arc      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2204388f720115e00b2d6f2765457ee2c1df4d6f |     
    arm      |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/051b9e0ca4fe1e36c654aa6f06aa4c0e3625ba8e |     
   s390x     |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/a4e02659ea3e5e5faec2f459a40aff1cf3e41852 |     
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/dd5142d2609eed01b110e22b687760646f054f10 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/91f3013ad8eba2d5c975300b86bac1b798ee899e |     
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/814579c4f7f69e0c0ae9272ce0b5f10aa614850b | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/5978b650066012dcd14603035f4491594039b527 |     
    i686     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/8f9de93a81ebb18b8dab7b577959831ac030188f |     
   mips64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e1d324f8d24c2dae2bd2297fcdb5505adfe290b6 |     
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/9996e81429f90f4615755827ac182094d416c467 |     
    arc      |         libcurl-8.18.0         | NOK | https://autobuild.buildroot.org/results/821e9c177e459503be3ef717ea4a80d2e31aadf5 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a8412f2a1fccc7d19466b6f1b8a36ad3bd90d61a |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/18f93e0a77115f8338492880ee3c98b27772bb1b |     
powerpc64le  |        libid3tag-0.16.4        | NOK | https://autobuild.buildroot.org/results/133adafe89bc2b7df28dcb10eb30c19272100670 |     
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/07d6df044574abe2f201efd4e58c53744eedd07a | ORPH
   s390x     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/166fb283ef8830930ce191b4418d01e6c82176f5 | ORPH
    i686     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/09658c07d3ff4c5509d238a24542ca1816b1e4e2 | ORPH
  powerpc    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f0377b91b43b58ae712c6fda233576dc52e81377 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/9ddfe040e3905d2e42d012e9bb8877f52dd84eff | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/34638248f65bd74bfe156c213ea830ba9a86f246 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/699b4f7be68a1acde574ec8dd9fb1a827e3f67ba | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7529187aea1088145ea351dbfd79c05f651d29b6 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2913050ae8a2afae6dfc4fce1b16c6f8aca8bfc6 |     
    sh4a     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/ddad09f74dd849da1f69862a5774e3a7a9aad464 |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/2424f6802cf3530d4984ce2469911cb928471466 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/3e4cea1961436f8bee8620fd4167d427eb96ac88 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/8dbfe8206412bb9511439b1388c57d51846b7102 | ORPH
    or1k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/9ff2a8c3378c8355c2aee8f2c5c5d8160ba82f55 |     
    or1k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/a9ba44bd65670a8966764b2525b8c8ed0c746d51 |     
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/5482563ec737457c769d60f2dbcc6d07c966a6ef |     
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/391759222b950ef1535615b7d9b12952cf6ff81d |     
   s390x     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d71adee16abbfbb8630f1bad57c3a6879e767de6 |     
    i686     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/bc70ba87289a499c5bd4b38e9f07336f984ef55b |     
    i686     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/d9c971d8aa8bf276b8cc7299a0b36f232e3bee3b |     
  sparc64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/0b4303c0e55dcb817ff2065581cf9dd693e3e8bb |     
loongarch64  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/48563c6dc1ca52bd924881bc02a1b7075f1151a4 | ORPH
 aarch64_be  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/828385a3a9aad74e5bf85949b299fb95b52a0073 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5b2dec611bd0b2e344520c5ec35a34510d306d4d | ORPH
 powerpc64   |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b9adb14f8c7a7b24172e3e2f5915656893334bc8 | ORPH
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/3dd547075faed31cf6ef258f958f0e66044466d8 | ORPH
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b5acaab165800e178ac3e3b31e6118d8df8ad388 |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/112e2cdfc3cadf190eb51c2a27412e836157301d |     
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/7a9d29d729913d67bb4b6dda937c708bd7816ea0 |     
  aarch64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b096efd1042360b0f44094506527438f87d66c38 |     
    m68k     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/07ada70d9c140571e2ce00d9f2a15c128d0271d4 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/3ec4237a01711c3b70f7260e8e88773a1e4fd28b |     
    hppa     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b8ff8de228be6c5636f6505ab467f80d65d4be6d |     
  aarch64    |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/b9fc54cbd36c7ff67b8ecc03d619ceef7dd7d8f5 |     
    hppa     |         python3-3.14.3         | NOK | https://autobuild.buildroot.org/results/596edd0682b4a7996a0b1563e40d87247cf4e109 |     
 aarch64_be  | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/a28c1c67ee888c7215967484da4da9b935bece33 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/936a2110b56bbd7c8b24f415298f12d95e9880c0 | ORPH
  mips64el   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/28bf4da7c8c1534a88352a4faa9e7e5cac826a43 |     
  aarch64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/9644d117cb46dc8bed3b8e3105f36c631d6fed6f |     
   x86_64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/5ab71698e6840096e16f1f2ac747dab81d4673b6 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9ba3ba8c283d9257bd974180892c37e93ebd4eea |     
    mips     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/1fa58beb51d2e43ae8ccbceeb9de68206167241c |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

package/linux-headers/linux... | 2 
flashbench-2e30b1968a661474... | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
          host-faketime-0.9.12 | 1 
host-gobject-introspection-... | 1 
leafnode2-9543ffaf82406f943... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                   perl-5.40.3 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/be42bf79284255b834caf021a2a6295a112adc15 | ORPH
    sh4      | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/bf28c9fb868b1fc01a15a5bbb4e0b5c17beffac0 | ORPH
   mips64    |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/d4c0ff9d8e799b3c008b915bb9f71bc2499c578c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fd4ef04ad191d24a19f70c52ae8cdfb1ffb8bd7 | ORPH
   x86_64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/cc9f87ef4b9630fd5b0c5295c4c56f49d5901c0a |     
    arc      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b8b486eab2937bcc434fdf36dcbf3ac03d3be110 |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8f2b7bf0dd11b1883af397290bb3afc8237f52b0 |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5ed48bcdb1358f9fa34019835b84bacb55e93b93 |     
  riscv32    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/a6938e8f71fe9111292996f6aaad6afa36b46e8d |     
loongarch64  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a5b490fcd9cbfa2868fd272c19e79759b5c31b6d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

leafnode2-9543ffaf82406f943... | 2 
                host-odb-2.4.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
                  libbpf-1.5.0 | 1 
                 libmbus-0.9.0 | 1 
              libopenssl-3.4.4 | 1 
     libphidget-2.1.9.20190409 | 1 
                  liburing-2.6 | 1 
                 libzlib-1.3.2 | 1 
        ltp-testsuite-20250130 | 1 
                  lvm2-2.03.27 | 1 
                    polkit-125 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
          python-tinyrpc-1.1.7 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f4f87d22015c4559189649b5f9d3d164ad42b34c | ORPH
microblazeel | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/8bc10be2f371b7b3f87833d7b06b903238980835 |     
   sparc     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f6a5045fc5690ff820690f51800c03784b88449b |     
  mips64el   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/9f88343c5b5bc1c2a34c25cbb2c50aec8c6bd0de |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/aac01b5c3bc54809d13d2370cc25a0df318bdb4f |     
   sparc     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/c4011e5dc084e5d451e2ad4c73b25cb7f5d25ad9 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/f330451a913b39e41b1d87cf93362326e9ce9964 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b16bce988cf9ac726773236110d5c3a22438d4b9 |     
  sparc64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/6c3bd845ee03b8ea28e04831bbb317362e69f7f8 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/a0ec85050edb1ba822d638af98049b85c359c154 | ORPH
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f11f7b340b47f02fd09437aea58980abb74e4636 |     
 powerpc64   |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/28f883f753886c7e4574ce69df12a34aa5c12323 | ORPH
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/783763b859f13eaa872f185bd050c2976c989147 |     
powerpc64le  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/db8b1ce3796507925534f1b19ab7ab6ca53b88aa | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e9e1540f50b55ee5d8a7d42a5fd822b3bfe11ce4 | ORPH
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/6e6f1882e1ec4f49e8067f3b3b79bdcfec1d741a |     
powerpc64le  |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/ff98bce4d482b1365e0f6110637498785ac07b28 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7dc96ae1a4227700eb591406ab48be96fffb3b37 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
