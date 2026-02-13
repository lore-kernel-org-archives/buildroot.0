Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30654EF48CC
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 04:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A66AC41A64;
	Fri, 13 Feb 2026 04:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuZt85rg3TrF; Fri, 13 Feb 2026 04:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A24641A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770956258;
	bh=0VVaK00rnIxdE8pu/63P2Eg409m+AEgXSnE6WIdpuiE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DXQ/wMhFpNX75qYXK8Yd8y+2DtlOF6trrUuz9s4rvgBzyMApZ9YRxUjzVN2fgJCms
	 AMKWW+bmd+VrZugQ7AU7rE4fOi9xoy9WLV4+9veALWfJPq/NcjckJjPpkewrhCtsNW
	 yT/wuVUIFX2mkdOd7yQxDR+6qXA6TnJ0nGk99C7vk94EF3X0zfRwzBlesrzVoTiwrm
	 w5F0J6xnrh5i9f1Hj7I10egHJcPlIcVXeEwsUF1PsIUINz9qk+Xbe9acA9OalBvoL8
	 XOzGDRWYwxSr465jP0xC+sbeF0zRjnv/ZOnuUuQhX7Kxgr1AFwUN4nnD/xxO7u9Poj
	 3JQVmG+Yez2VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A24641A4A;
	Fri, 13 Feb 2026 04:17:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04EC269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 04:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9FDB401BB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 04:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrHQQdrKL2ML for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 04:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73124400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73124400B1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73124400B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 04:17:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483487335c2so3865255e9.2
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770956253; x=1771561053;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhKjq7REc2P1DZ6AAlz0giy3dTMt054Ik+rcQARIAlc=;
 b=cYdeUR2cLYEY++IcvQyB+Hvlu1BT/CEsjxk3UDPqbgs5t3A1q+QSwXhUe83IcMt5uY
 BnkxNIRyeBLJan2YzumuVOLkM59VaDbzgglba9l9yqXiT+RUDmdjkWU8fZuZa+rSjKHs
 srFfBrqhdmaWe27Ua5t6GAd1FzUv0nqGHZo+ZzKmSO7qLvAWmTXPRnnjmsVq/pJ7R+sa
 3zGRZowQH3qBduGTmxKSTYwJr9KSO7WJbeYuq0lmzv1qND83QBEt7TsKcTJHVJ8t8K8b
 pfBzMB3VqmvAyEWSNs2HNNjHFnhstsxDHDA91oNZafb2gEFI57vVI9YMvEQl+Y77Dlx9
 sL9g==
X-Gm-Message-State: AOJu0YyXzxuQUTfPFn+M4fxHgBAqIliJJJbJAKNGrVm0432AFpADtacz
 a6u2S0yKXpbHTi4TAeoyiWjdX8Dtq/YRoJ3qE7towmPUSpdXNDt7IOloOV8cpg==
X-Gm-Gg: AZuq6aK2mF3NWuNyA+OUfqHUBJUbdOAPgFsiTcGRiQEbuhtWZGr0NjLpi2nUUACXMV5
 cxdcEkXDmDXx0mFs3r37qI6utpzr0PAaBsjawytXgn8n8/BxXOLa6ovytVIjFEhPilQ4YFB5z44
 Y1gG0Evze8FOE/Q++wcCoOA1tZ4GiEtE1KXbgz5uJrdf6DNiYzxuh9eBsXGvDNFS1DgWkdJ/uFu
 u0olb7JNjbDpjVxVKJNe50Y7KzzhRzH8Gw/cYGl7p2IDdbmCcVEejTSjgs03OjlMAlkdqPM0Ozs
 WVRsweegj3ZGCb9aUyfbB2ophgBcaoPnuIL6bcdG6RiK4e1ThVT+PGqL4qjz0FrO69apIqUckRd
 jvyZ1/noiLhJMqXk9th99NCwNLRKcr77bQ3MJva9eqKGogay8AYt/TIxAjW8sBLl1EYWja0EidZ
 X2wZ3iea+nlb/8SW/XHnTQBSxC7s+IkRmWterApL2n
X-Received: by 2002:a05:600c:6489:b0:480:3230:6c89 with SMTP id
 5b1f17b1804b1-48373a030e4mr6048075e9.12.1770956252957; 
 Thu, 12 Feb 2026 20:17:32 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370ac3564sm25486225e9.5.2026.02.12.20.17.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 20:17:32 -0800 (PST)
Message-ID: <698ea5dc.050a0220.3bd959.693e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 13 Feb 2026 04:17:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770956253; x=1771561053; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhKjq7REc2P1DZ6AAlz0giy3dTMt054Ik+rcQARIAlc=;
 b=iQlyGbObUDG5XCGUsY5JdspAYe6MV/2HNSmjTCvtCP+gxcwXSMtQBQpX24dhAv9mHK
 CzCtbq8JYSsYLSvzh983d3UeN/b3+db6AY26PWoDjYSVwg0WueMbk4IkgXPzJ/QCD9ME
 1uIZ6EFAXsPcSsDe5+/JEVd6VIe5iPBpAhi487wBac8HjRRnFPiMYhPy6Piw4Z9yxYZc
 gHDuCYsBe9Iqyf68UjLAj5Azal8AGPND8bse5NTdkBRsGRBN68jMjN2HZQ9RVZqZRohV
 E+qQ4yDoueb24aNzHCMWYx2BlhL8tsb5vM4+U6oexuX22LVmO7R77ybPVc2Mvbb25ery
 kaag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iQlyGbOb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-12
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

Autobuild statistics for 2026-02-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  7  |  0  |  9  |
  2025.11.x  |  2  |  2  |  0  |  4  |
    master   | 28  | 59  |  1  | 88  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                   perl-5.42.0 | 3 
             dahdi-linux-3.3.0 | 2 
              e2fsprogs-1.47.3 | 2 
           ghostscript-10.06.0 | 2 
glibc-2.42-51-gcbf39c26b258... | 2 
                  iozone-3.508 | 2 
     libphidget-2.1.9.20190409 | 2 
                tpm2-tss-4.1.3 | 2 
uhttpd-15346de8d3ba42200249... | 2 
             cni-plugins-1.7.1 | 1 
                   dante-1.4.4 | 1 
                    dpdk-25.11 | 1 
                      fio-3.41 | 1 
               graphene-1.10.8 | 1 
                     grep-3.12 | 1 
                haveged-1.9.19 | 1 
           heirloom-mailx-12.5 | 1 
       host-nodejs-src-22.22.0 | 1 
                 host-rust-bin | 1 
              hyperfine-1.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                  jasper-4.2.8 | 1 
              libcamera-v0.7.0 | 1 
libdill-32d0e8b733416208e04... | 1 
              libopenssl-3.6.1 | 1 
                 libssh-0.11.3 | 1 
               linux-pam-1.6.1 | 1 
                memtest86-7.20 | 1 
                moarvm-2024.12 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.28.1 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
            optee-client-4.9.0 | 1 
                pipewire-1.2.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
       sp-oops-extract-0.0.7-1 | 1 
                   swipl-9.2.9 | 1 
                      tar-1.35 | 1 
               tcf-agent-1.8.0 | 1 
            timescaledb-2.24.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/81ffb29c772133640ba077244b9c7348a37bc62a |     
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e5ad4f9c554aa6f6d307a38822e86e6841d0e02 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0c93ba977af249a3f317e07bff5662bf11523556 | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cb7e1309ee7a1715b9ceb5ec548c527c621be34c | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/119615323e098fcc019d236fd711177f1fb8bd2b |     
microblazeel |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/f986526b894e4c16a433568822f1fe5eae1c18ad | ORPH
    arc      |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/b0f1a264910d88c6bf4eca48dbf8a2202034b73f | ORPH
    i686     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e22a86eedbb424182702279b5995892a0bb578ab |     
   sparc     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/f82dd42ff5a458317de421593421f4a55791a242 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/c20a7c34314cf6114f84718448331f0d825557d0 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/7137c98e81e0693b3e8329a55f03032a94c2a033 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/446f0df92dd9ee1e892db9f0ecb00078c559966c |     
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/38aa10fc579018cdad8a4cccaac88dfb4dfa4b22 | ORPH
   mips64    |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/df404feb2a108f06777513a7972c31c77aaa5537 |     
  aarch64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/4bc4c19a98a86d5fab734cf5106538d547d433bd |     
   s390x     |      heirloom-mailx-12.5       | NOK | https://autobuild.buildroot.org/results/58b15df09a56a5f3616e81fc096374c90eeae529 |     
   mips64    |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/8b122baa8ef7fb1d879c9f530daeb5d4d40d8763 |     
powerpc64le  |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/aab15ba4376089e1c5a15b9b44c2bd36aeaf6fa4 |     
   s390x     |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/581cedfd5235be6a5a3887157f78f1ec64dd438c | ORPH
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/411aa8251734fed1557015237edaf1e13fa89a68 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/823fce2b6376cc82877185dde18471ca8438e5b4 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1b367ecac5959d6a0eef7db0ad0bb0057696902a |     
   x86_64    |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/1332c2b8a17f3f8de88816ee5cd5b9d6e494651b |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/fe14db6cb9fce0019a5864e78c4a63a5824f5a7b |     
   sh4aeb    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/dc795c27036de800c29299c31fc5f142e394ee1b |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/9db6fe45515c7ec9ce21667dfd7790225a2d8c72 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/966b8140444fba86481c0caba9a4741ca34f2a88 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3e5c1cc5f304843c1a2769da0d0d7f7bdce52251 |     
 aarch64_be  |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/83a9257b25799e158e0842194bfbd8cc90256dc1 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7191ad8241224a386e1783a7709773957938f20e | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/1df3863361536674b49a70bcab7919b95a25c3be |     
  mips64el   |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/4265f628ca7d871a3766c612527091e47ea513ae |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8e87fc05c41eb420a026a7df86efcd9662b74353 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/46ed1d99a6a353dd6f254249b2e625cc212e4bad | ORPH
 microblaze  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/b21f8f17af8a71a22c40ac4d6352a807d16fdcf3 | ORPH
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/616b5b5316ebfbb83e70b6ed9a92d24f48930873 |     
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d210c5bcb775f24b7045c878601db2ea3fba1d15 | ORPH
  aarch64    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/60db3171134f732158cd0ceef4246788c972766e |     
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/837b70d875b739fa7c6c57dbdb033069810ad2b9 |     
microblazeel |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/946414ae6f982e290cdde07312ad5222fa55953e |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1572b47f087c160bfe739731f7f4690c916b27c2 |     
   x86_64    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e8ef642b8e779cb8885ab72822b95db1655ee04d |     
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2016fbd9a6b8308ec718dedb0ed8b0f446fbb87c |     
    hppa     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/96c39a9c0f33257218cbabb25de520314f7b8d54 |     
    i586     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/c42a1cf53f29b2982f7ba86a614802f7240ecb8a |     
loongarch64  |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/c024507d06af3346d7d221c4664c2f55e080f4b5 | ORPH
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/583777d415de8cd4e22ec46643502318d6066870 |     
    sh4a     |       timescaledb-2.24.0       | NOK | https://autobuild.buildroot.org/results/eaea81e9442853746f91efc640075d1adc5018a3 |     
    or1k     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/81fb4fb33d00905b65f61d218ce7315547cd6608 | ORPH
  powerpc    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/d41739f63b25c63abb819fa674ae9e781befc167 | ORPH
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d285d0185ddee08d7dc007f50461374cb8cdd92b | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e73d51d37e2ec7a1a64b335bb1c206a48f7886be | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/612befb51cb96bbd18e003f96890e9cfed6d8c8d |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/e4c44381d5e2c2ce07e8e6f83afaabb14d4a6bfc |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/f3d49cb065c7642f488a67078dbf3a57a3430733 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/ebbbe6e0fd878fd7e97a0e51906e406c40d03331 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f54ac278e5493a027bff7fa5acd24eb4acb3a8f3 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/2f8d3ad46d3ded5d394ef0ee62a00cd40f591d41 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7b162815790674c6a2ca10ea8a04b85ee2220fbd |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/7a5cb376ece693b7a4f9c1151498a63217aea9bc |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

glibc-2.42-51-gcbf39c26b258... | 1 
              host-rust-1.88.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/c00c54732c2027428f8a4a11e4408c0de332356b |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/7788c1d5a654738b9958ea4bd63d9907800d6ffa |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 2 
                libselinux-3.7 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
                lmbench-3.0-a9 | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/ee089c6fba2625cfaa5c3d780cadc2b847632abe |     
   s390x     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/7b904ad4a0e2ac94c6209fe3064c586bad318379 |     
    sh4      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/41461ef3d48b1498353f6799dd78e576a99cd6fc |     
   x86_64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/3d3f8d30c4925442aa8055f3bf868a2b45649237 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0c27078a317fe84a808ecb4d38a409900126e520 | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/27aeed58d924da3cee69676274a1f47c02fe2d92 | ORPH
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/473d04ada35d449abc23594872b01c97f17096b3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
