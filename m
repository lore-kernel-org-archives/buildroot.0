Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF5DCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 150CD422B7;
	Thu, 11 Sep 2025 19:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMPwrq-2lbWf; Thu, 11 Sep 2025 19:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070F8422C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 070F8422C8;
	Thu, 11 Sep 2025 19:26:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F48234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73327846CC
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46poG5ZGGQ3e for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CC20846EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CC20846EF
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC20846EF
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b0787fa12e2so165724466b.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618791; x=1758223591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrarA7Gt1qc2VgYIBXY5npafB3u0Qu+Kdl0kOJGry8g=;
 b=PV6sqhNOo3JJOcfw8HI/ALhNpP0A5s2gH5pPan6GhaEFPJ9eStj1xcitDMOA7V0Yg6
 fmtNsxOnzjF5a9Vobsrg+31dH9TmatT0h/St5lOkMtZSQOMjNL4IL5uxUnevvkE8Z8sj
 h/okDyyKSYRknFnwAe0+Cmf2bhK0eEc58v4++9I99SijMi61m/HsaK0H/X30Wh+iiur2
 xzZluD42ViKP3vOSgte1w3MqwvkXsKq+pvFJeoqC1WPrh12DEVcYhKDkPT80NRxUbJPR
 iNWDj8jALUrgpVPemaPrdOjB7vAGcWOUf3qHo7Lej2xJYjQy/CrrMRdmPCPBliralrgl
 JlCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8hEGHFJQg8iXEumQkv7ZZKt9lak2UBYnxonubmV5vKRL8xlQ4y3O8S36eG4+jHfXvmD+a7asiZZI=@buildroot.org
X-Gm-Message-State: AOJu0YxPsIzor45oeTtGTlzQ9SF/eQHluy8W/eLalXcXCyXJPIRVGdLU
 FCW96ENoACGgp86goX8v/fIyw7WGk6S0Aw+tFJD2uw+4ElLbOlm6mdyTVgx2j4c4QZ0=
X-Gm-Gg: ASbGncv0DDooe3H0eOhLeeW198MLmZpmoyxbnuCQ8fQ0Nhs1UwT+9CzGTib4nN39w5M
 4301v3+3mpKr8ydBdbLLI8TJpSHfET92aFb5olKyz/P5NQ6Y9JbYGTtuSgs1MTEXWzB2Hbb+ULG
 1mtZPS3nJAxHGZI8mKwp72b96ljxIelc0o/wEgn3EbGKsi0rATmWafKI9pHNEzC7HOiSy4xqRpb
 vWzhJOWHHMt7LEPUpyKnDjehSUZuPHTRTGeX8eZNmBvB/IfjVViBXj5FIBbemuJi2X1W+k4RzbG
 ksFxROm4SySoFUBp8kIpZAOri58L4E6buAAM/ql0xmuYuI2toWRgjs5mIRaNjUqDkbhZ6yYSmnD
 3f0HqmLJ69yEdJ8GQENzHGvpbd8nCnddUh6eW8Cw/Krf8WcU=
X-Google-Smtp-Source: AGHT+IGytTF497EoS/axF2Z7FBDeXyn7G3K9Dg6Jj3hvRMqrfOqxkYN7zus/aZgYZ0t1CVeDotOPXQ==
X-Received: by 2002:a17:907:980a:b0:b04:2a50:3c1b with SMTP id
 a640c23a62f3a-b07c396d3b7mr26790466b.53.1757618791208; 
 Thu, 11 Sep 2025 12:26:31 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd57csm187739966b.52.2025.09.11.12.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:26:31 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:26:08 +0200
Message-Id: <20250911192608.2672637-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250906162551.3715975-2-romain.naour@smile.fr>
References: <20250906162551.3715975-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618791; x=1758223591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrarA7Gt1qc2VgYIBXY5npafB3u0Qu+Kdl0kOJGry8g=;
 b=cQkXfvk8EWBsSrt0l2avo8s+kYptVFJdzes79ZlHv97Q3MWLKrkiAarHl5g1sKOtHI
 Rdf+5XFvKtSbnWAKNBB4LCsdlNoZ1vWNUak/DPNuZ2MwqWet7Stskr/kAwAGlJA+gfzA
 etHjs13dEtxnyFTna1IijPzmlXMWgiFe0h01E2oCDhlQQIVVClDCtYlesFJCes/ud8Gm
 vBuVW4uJo9UbvAWgyw7ZkN8ZQfZnUaQ3G4zgVGjFPNDDdXZpIqGzGvprjwvhAON0ng8a
 QzenE4VhhK1do1gKBwVUTXeXCHW2j9iEGzsHG9flXZAvVtpCBpD/xIX04fmx6Jzp4Il7
 4MLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cQkXfvk8
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Apply a patch from meta-openembedded fixing a cross-build issue [1].
> 
> [1] https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405 (TestIozone)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...ve-libasync.o-and-libbif.o-from-deps.patch | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
> 
> diff --git a/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
> new file mode 100644
> index 0000000000..ea4c9c97b3
> --- /dev/null
> +++ b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
> @@ -0,0 +1,114 @@
> +From 34c25d67c33050f42f0f243c0fb6674c28ff44b5 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Sat, 6 Sep 2025 00:31:48 +0200
> +Subject: [PATCH] remove libasync.o and libbif.o from deps
> +
> +there are no implicit rules to build them and they get wrong CFLAGS
> +when compiled with implicit rule.
> +
> +They are built as part of iozone_linux.o target anyway
> +
> +Only fixed linux targets for now
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream: Pending
> +[Romain:
> +  rebase on 3.508
> +  convert to git format
> +]
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> +Patch from Yocto:
> +https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
> +---
> + src/current/makefile | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/current/makefile b/src/current/makefile
> +index bd66a4e..ba5759f 100755
> +--- a/src/current/makefile
> ++++ b/src/current/makefile
> +@@ -171,7 +171,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
> + #
> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
> + #
> +-linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
> ++linux:	iozone_linux.o fileop_linux.o pit_server.o
> + 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
> + 		-lpthread -lrt -o iozone
> + 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
> +@@ -198,7 +198,7 @@ linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
> + #
> + # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
> + #
> +-linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pit_server.o
> ++linux-powerpc: iozone_linux-powerpc.o fileop_linux-ppc.o pit_server.o
> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
> + 		libbif.o -lpthread  -lrt -o iozone
> + 	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
> +@@ -206,7 +206,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
> + #
> + # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O 
> + #
> +-linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server.o
> ++linux-sparc: iozone_linux-sparc.o fileop_linux.o pit_server.o
> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
> + 		-lpthread -lrt -o iozone
> + 	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
> +@@ -215,7 +215,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
> + #
> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
> + #
> +-linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_server.o
> ++linux-ia64:	iozone_linux-ia64.o fileop_linux-ia64.o pit_server.o
> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
> + 		-lrt -lpthread -o iozone
> + 	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
> +@@ -224,7 +224,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
> + #
> + # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
> + #
> +-linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
> ++linux-powerpc64: iozone_linux-powerpc64.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
> + 	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
> + 		-D_LARGEFILE64_SOURCE -Dlinux \
> + 		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
> +@@ -235,7 +235,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
> + #
> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O
> + #
> +-linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o pit_server.o
> ++linux-arm:	iozone_linux-arm.o fileop_linux-arm.o pit_server.o
> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
> + 		-lrt -lpthread -o iozone
> + 	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
> +@@ -267,7 +267,7 @@ endif
> + #
> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
> + #
> +-linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_server.o
> ++linux-AMD64:	iozone_linux-AMD64.o fileop_linux-AMD64.o pit_server.o
> + 	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
> + 		-lrt -lpthread -o iozone
> + 	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
> +@@ -276,7 +276,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
> + #
> + # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
> + #
> +-linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_server.o
> ++linux-S390:	iozone_linux-s390.o fileop_linux-s390.o pit_server.o
> + 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
> + 		libbif.o libasync.o -o iozone
> + 	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
> +@@ -285,7 +285,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
> + #
> + # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
> + #
> +-linux-S390X:	iozone_linux-s390x.o libbif.o libasync.o fileop_linux-s390x.o pit_server.o
> ++linux-S390X:	iozone_linux-s390x.o fileop_linux-s390x.o pit_server.o
> + 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
> + 		libbif.o libasync.o -o iozone
> + 	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
> +-- 
> +2.51.0
> +
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
