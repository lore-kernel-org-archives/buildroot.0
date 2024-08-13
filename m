Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C136C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 20:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A6440112;
	Tue, 13 Aug 2024 20:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3I1KRMiakx6; Tue, 13 Aug 2024 20:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9170140AFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9170140AFD;
	Tue, 13 Aug 2024 20:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B814D1BF4DA
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 20:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5BD260814
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3RDjkW9Rjol for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 20:03:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64D8660879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D8660879
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64D8660879
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 20:03:00 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2cb6b247db0so1082759a91.2
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 13:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723579378; x=1724184178;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TKy8SOBpNpKzgXyS3vkA+WgZCqjILjFhuDjvihA2J1k=;
 b=gvKFuHmq3IkckCzhpszcPNRCHxfcwAV1YMVsL0JnixT9TVXiWQY5asvPlHBEYd0KVx
 nHu/FTjMY7zwJf63t4jjJCs0IPOviC19BbKKiUFKAjJ9JgT7KaOFSfjOdFOO+z0b13qM
 3AIzIDmuTfzNUukQidj7AMqCMnqiYZWHenmJPIMjsiPIwqJQrGIvxVmHC1y12r0kGwDG
 O2PND+HsBKeiSC4MiSJq/ZnAd6vtglTW3zMD3Y9ZwqK76t+f4V9GBN9+pA2RnEeos5QD
 0ax4vQzdb5eIy4aqmA1PfiwBDsLqB8GIp1eq9tItf7Y3RYWbjYXSOEIM6mZt96OxTvs1
 da+A==
X-Gm-Message-State: AOJu0YxzpP2YaLzVe1jqJR8zFq/B5BYTUr3VtppwbStiJApCKH+uPZLX
 4P6BPNu1QYv/olS02EYbfNQmEGAo9uW9ZhXM2K4fdBjNbkhqzU71tS0wBNDtjg+LPNcymMug+z9
 tiH+J3RldPy9+YlOnOmDRRLYRizAbdlcg0y4bsvKpcMGvTv2Rb5R1
X-Google-Smtp-Source: AGHT+IHgtl4lPqCFNzwo4txQgYZ4cw4PuNrd72rEiV5FbQobSAVs/BGy1osgHXPo8wGDn8ti0E4JoHSfeV+ZxMCZ5Z0=
X-Received: by 2002:a05:6a21:7894:b0:1c4:d312:64d8 with SMTP id
 adf61e73a8af0-1c8eaeaf921mr589560637.3.1723579377581; Tue, 13 Aug 2024
 13:02:57 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 13 Aug 2024 13:02:45 -0700
Message-ID: <CAGt4E5tNuugDABr-goDwU2csVNOAaKp=GqS9B-3KZcMjmaxKYA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723579378; x=1724184178; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TKy8SOBpNpKzgXyS3vkA+WgZCqjILjFhuDjvihA2J1k=;
 b=JVldVDoTK1c76wLsBmrOoILUU6xaZzNKurH3eFJxs+8IeXHIQZxQOZfXMmRuzcIAUK
 CWKLSU73A7h7Bjrj5F4Yy7W0Hu42fiYNSMoY/E+hyLqBUd3zNaAlO1OVhQqpUmjX0ZdZ
 DOIJ/FcXw4Q6YX7E94MCvv75EFhtVdANhngxQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=JVldVDoT
Subject: [Buildroot] LLVM builds broken by "-z text" (3a39e706a91a)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

It looks like I am always the one finding corner case build problems.
Here is another one.

This commit

3a39e706a91a package/Makefile.in: work around buggy buildsystems wrt LDFLAGS

is causing this build a error when using LLVM for ARM64:

>>> argp-standalone 1.4.1 Patching libtool
[...]
configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-gtk-doc-html, --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
--disable-nls, --disable-static, --enable-shared
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for aarch64-buildroot-linux-musl-strip...
/storage/Extra/buildroot/output/stbllvm-13.0-0.6/arm64/host/bin/aarch64-linux-strip
checking for a race-free mkdir -p... /usr/bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether make supports the include directive... yes (GNU style)
checking for aarch64-buildroot-linux-musl-gcc...
/storage/Extra/buildroot/output/stbllvm-13.0-0.6/arm64/host/bin/aarch64-linux-gcc
checking whether the C compiler works... no
configure: error: in
'/storage/Extra/buildroot/output/stbllvm-13.0-0.6/arm64/build/argp-standalone-1.4.1':
configure: error: C compiler cannot create executables
See 'config.log' for more details
make[1]: *** [package/pkg-generic.mk:289:
/storage/Extra/buildroot/output/stbllvm-13.0-0.6/arm64/build/argp-standalone-1.4.1/.stamp_configured]
Error 77
make: *** [Makefile:29: _all] Error 2

Checking build/argp-standalone-1.4.1/config.log, we see the following:

configure:3801: checking whether the C compiler works
configure:3823:
/storage/Extra/buildroot/output/stbllvm-13.0-0.6/arm64/host/bin/aarch64-linux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2
-g0  -fPIC -fgnu89-inline -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -ztext conftest.c  >&5
clang-13: error: unknown argument '-ztext'; did you mean '-Ttext'?

So, it looks like argp-standalone is passing the value from
TARGET_LDFLAGS to the C compiler, and clang objects to "-ztext"
whereas gcc doesn't complain. I don't yet know if argp-standalone is
doing something it shouldn't. For now, it all seems to be in order. I
also don't know at this time if other packages would fail with a
similar error or if it is limited to argp-standalone. I will try to
find out.

The problem stems from an incompatibility between clang and GCC in how
they treat "-ztext" vs. "-z text". GCC doesn't care, but clang only
works if there is a space.

$ clang -ztext
clang: error: unknown argument: '-ztext'
clang: error: no input files
$ clang -z text
ld: unknown options: -z
clang: error: linker command failed with exit code 1 (use -v to see invocation)

In other words, when the space is present, the argument is passed to
the linker. When it's one word, the compiler tries to parse it itself
and fails.

On the other hand, gcc doesn't care if there's a space or not.

$ gcc -z text
gcc: fatal error: no input files
compilation terminated.
$ gcc -ztext
gcc: fatal error: no input files
compilation terminated.

What is the best way to address this without breaking other things as
this seems to be quite finicky?

Thanks,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
