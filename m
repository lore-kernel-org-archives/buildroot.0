Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB6C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 806BC4053C;
	Tue,  9 Aug 2022 07:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 806BC4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDqaT3xKRahN; Tue,  9 Aug 2022 07:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A5E74052C;
	Tue,  9 Aug 2022 07:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A5E74052C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE4611BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C754C408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C754C408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd1mFnyOuFwN for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A74E4085F
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A74E4085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:21 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id w19so20806581ejc.7
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=G9hoUwt3ZrLMn3aO7yS96/rS5xGBua2CChRC3O8XTcw=;
 b=rWNABNe/uEAhsYqayp47BJTh6PsYllNqfUKTXAIPvnTbaa8bRWDiV4pnf3HyJNW4Ea
 ko/HcsBzRyddcGx4gKNyq7tkkwa8tBSjaQIcCPZA/4M+qq0SfQd4YOhkV0p8npjkNkaU
 sxDedp9ujWAO/NIjIHwIY1705MIGqNUtkdgCsthEAd5zy9aaWwl8r+boA1MmZA9nfUWJ
 0JACm65syiqiwfD2COycXo5vnaotQDfidf/oxJogS+rZnDMNlb18V2sqlM4VBIIon0ug
 +PBXuybVhZly7teBrwF77Fp6mgo6vtj4WQYjVVpKj+nnmQnshpZICeBz4qNZHNkKX7Mx
 daCw==
X-Gm-Message-State: ACgBeo30In9aJ+Xoa02sMkhwWZ+SSZ/Vv1qbYRsO2EeQZpWp/d570KwZ
 SqErupo6SpXhvpN0LyrG2IBKsGv1hy0=
X-Google-Smtp-Source: AA6agR4drzy1D/7NWfCnyGYod8WdgGr1usr+VeOvoI+qL4qxggnEpKpM54HhS/nrwqIo46S9+OaSBA==
X-Received: by 2002:a17:907:1629:b0:730:7d10:639c with SMTP id
 hb41-20020a170907162900b007307d10639cmr15422316ejc.256.1660031839130; 
 Tue, 09 Aug 2022 00:57:19 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:18 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:51 +0300
Message-Id: <20220809075704.86472-1-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=G9hoUwt3ZrLMn3aO7yS96/rS5xGBua2CChRC3O8XTcw=;
 b=bGIOapUY1KcEL3LPzd3KGgnwVJwdl7Eeo7t8rkkfaPqQYp+rBwrESBBLdc4jgqKJL/
 bTrmqvK25fdktGqp7REnlfLmgJcH2NcpSigxcAOsC7urQfbhZsNiipBAWuynqnz12uJ3
 kNdKuza38u5MEOqSYGVMOfoQUxMgpeV32ASgmz3zjpiwv+lsCki7RjGElPdQP1/HV8t2
 S1Q2IkEhMJH/Nv2ENkwkMC32TDxFJtHsgJKV6J5v3pF5Nxd1zJqC2GL0lacQczz8I/0S
 et+0OWk7nA85hZO1Y86bdPpUeYzNNjtHmVZLpz7O8P5t8AiREEJ/p2LWRQxnV48skPB8
 8v9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bGIOapUY
Subject: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A bit of introduction here.

I tried to build nodejs from Buildroot master, but I couldn't.
It could be that I did not setup something properly with regards to the
'v8-qemu-wrapper' stuff. I kept getting execution errors, when trying to
run the nodejs build-tools scripts (see details in the patches).
Either the host-qemu stuff isn't working correctly, or it needs some extra
setup.

That eventually sent me down the rabbit-hole of trying to get nodejs to
build for ARM64 (where I wanted it). It seems that nodejs cross-building
can be done via their own infra-structure, which isn't perfect, but it
seems usable; and it also looks like a good idea.

Using their cross-building stuff, has some issues/considerations:
* it's easiest when building a 32/64-bit target on a (same bit-width) 
  32/64-bit host; the host-{c-ares,icu,libuv,zlib} tools can be used
  for nodejs' host tools (in their cross-build infrastructure/tools)
* when building a 32-bit target on a 64-bit host, the nodejs cross-building
  logic will add the -m32 CFLAG, which will mean that the
  host-{c-ares,icu,libuv,zlib} tools will be unusable (they got compiled
  for 64-bit and are un-linkable to 32-bit binaries)
  This requires that the user install on their system the
  host-{c-ares,icu,libuv,zlib} 32 bit versions. I suspect that the
  BR2_HOSTARCH_NEEDS_IA32_{LIBS,COMPILER} symbols are intented for this
* I haven't tried to build 64-bit targets on 32-bit hosts, though I'd
  guess this is a rare corner case.

I eventually got nodejs to build & run on an RPi4 32 & 64 bit.

I'm not sure if this patchset is fully correct.

But some things can be useful from it:
* the host-libuv and host-nghttp2 packages (for other potential users)
* the 'fix ARM build with VFP3 instruction' patch (maybe)
* the 'build host-nodejs only if we're installing modules with NPM' patch
  looks to me that even without this rework, if we don't install any node
  modules on the target, we don't really need the host-nodejs build

Alexandru Ardelean (13):
  package/libuv: add host-build
  package/nghttp2: add host-build
  nodejs: remove v8-qemu-wrapper stuff
  nodejs: fix 'Duplicate v8 target errors when cross-compiling' error
  package/nodejs: add host-{c-ares,libuv,nghttp2} to deps
  package/nodejs: provide {CC,CXX,CFLAGS,CXXFLAGS,LDFLAGS}_host env vars
    to target-build
  package/nodejs: don't install nodejs host-tools
  package/nodejs: rename LDFLAGS.host -> LDFLAGS opt
  package/nodejs: impose dep on ia32 libs/compiler if target arch not 64
    bits
  package/nodejs: add host-zlib depedency to target package
  package/nodejs: fix ARM build with VFP3 instruction
  package/nodejs: add a hack to cross-compile 32-bit targets on x64
    hosts
  package/nodejs: build host-nodejs only if we're installing modules
    with NPM

 package/libuv/libuv.mk                        |  3 +
 package/nghttp2/nghttp2.mk                    |  1 +
 .../0001-add-qemu-wrapper-support.patch       | 88 -------------------
 ...lude-obj-name-in-shared-intermediate.patch | 24 +++++
 ...-x64-cross-compile-for-32-bit-target.patch | 71 +++++++++++++++
 package/nodejs/Config.in                      |  7 +-
 package/nodejs/Config.in.host                 |  5 +-
 package/nodejs/nodejs.mk                      | 67 +++++---------
 package/nodejs/v8-qemu-wrapper.in             |  9 --
 9 files changed, 129 insertions(+), 146 deletions(-)
 delete mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 create mode 100644 package/nodejs/0002-include-obj-name-in-shared-intermediate.patch
 create mode 100644 package/nodejs/0003-fix-host-x64-cross-compile-for-32-bit-target.patch
 delete mode 100644 package/nodejs/v8-qemu-wrapper.in

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
