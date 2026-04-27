Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE4FF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F4560754;
	Mon, 27 Apr 2026 20:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHx39bv3cVkK; Mon, 27 Apr 2026 20:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 573BC60745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777321377;
	bh=qD1b5zCVO4/FeWZ5V8YWaasqwCbrPYdixjjbYrUR6N8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W8AGR0wClPOfFm1pSHvg2cEEdR4zqEHh6LfD49Q4/KXNtQ3h5UdK/PNWi+Gveibh2
	 3FGglrO6pO+EYTB5b1scl9y721hlV7NmONa1nD5U7jMZ35z1WHzO/785XNxAavcO3F
	 nCRdXCXcw0w1vAoaJ4+Knx+viLKXeVNNtW27rGGgberttSmeHRt3LZGpYrHS3T+vtn
	 JXNYk9sru4HtQIDnBYrPtZLlnuqgmNplmvhnI5jklhSup9vxg6fNHX/JpPrp0OWbru
	 2S3RIU+8jWmOqGcahAEA/AhyHcHlOX3ORuXX6GsuHtikUnUiWOcwVgJ+TZ7BYcnEF5
	 lHymYjj1hfVuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 573BC60745;
	Mon, 27 Apr 2026 20:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 737542DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7127D40AA2
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ge9IajFMgUqv for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8380840AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8380840AB2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8380840AB2
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:22:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F084613F89C;
 Mon, 27 Apr 2026 22:22:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Apr 2026 22:22:50 +0200
MIME-Version: 1.0
Date: Mon, 27 Apr 2026 22:22:50 +0200
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260417085703.200145-1-dowan.gullient@smile.fr>
References: <20260417085703.200145-1-dowan.gullient@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <274c342f312f0005dc418c2bb5e64a9c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777321372;
 bh=U9KiqS0P8Z3RViOtQNZwI6DlFULYXzR9TO4U905zcds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NeJNLXzYcYn1VuWBbmEhBjKpANaoMKh6w1qXgzO2AvY0Nd7/HX2B9iEraxekaqF1w
 wLz++5P+LINg41059pX0+A3gmjwwgGicqFiON6NMlMDercDMXv9+CUvGDWWs8NmNiA
 rwjVeJlyVG6xyA1qndptS29mYl0oByRQsTs8PcL/y7kkZ0OSyEc74olqQeStzyzCZE
 BwD+C2mtbraBJHP15m7M++UcD1Tycz245wK5l/0+Iblk3oh+cmO/Mp6hzIBbRsqVYx
 Yzm7kgfm6Pcj9d9geACAgzmy2GpIs6Ys9dw2cauRzX3JlOCHk2g/Fh9XjCIykLLygy
 o+ki0DjlCWYjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NeJNLXzY
Subject: Re: [Buildroot] [RFC] support/testing: test_podman.py : Build
 failure due to bump of toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dowan,

On 17/04/2026 10:57, Dowan Gullient via buildroot wrote:
> The recent update to the AArch64 15.2.rel1 toolchain (including newer
> glibc and GCC 15) has introduced a regression in the build process of
> host-protobuf v34.0, which is a dependency for Podman tests.
> 
> The issue manifests as "incomplete type" errors and "missing 
> definitions"
> during the compilation of several generated files (such as type.pb.cc,
> timestamp.pb.cc, and any.cc) [1].
> 
> This is caused in particular by the stricter header inclusion and 
> inlining rules
> enforced by GCC 15, which expose missing explicit includes in the
> Protobuf 34.0 source code, so it appears to rely
> on legacy implicit inclusions that are no longer provided by the
> latest toolchains.
> 
> This failure prevents all test classes from the podman test from
> completing, as the host requirements cannot be built.
> 
> The DCMAKE_CXX_STANDARD=17 option was added to the protobuf Makefile 
> but the
> issue still persists. What would be needed to fix this issue ?

With the patch I proposed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20260427201606.896700-1-ju.o@free.fr/
I am able to run the podman tests.

Could you confirm it is fixing the test on your side (and reply with a 
Tested-by)?
If so, I believe this CMAKE_CXX_STANDARD=17 is not needed.
In that case, could you send a v2 removing it?

> Thanks for your help. Sincerely.
> 
> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215942
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
