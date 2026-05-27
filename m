Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A3CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E2E7847CF;
	Wed, 27 May 2026 22:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i7OUfEgpuwC; Wed, 27 May 2026 22:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 877F0847CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922748;
	bh=r1Mg/DNvrkm5XBiQpYk54IYwoM1/WWt8bXDJR6Byhxc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsxB/vkqfljqcIZKTqxeyRottOvX7dZnku6msql+HHP6NoFUgHdXM4HCQh9AvvFym
	 LgGwC3GnlTfRgy1rVegU/b0vyCciaM8nkzTZYbDr7K9brWJ5Wmzc9v019lSdtbXYSx
	 yrpp4DOOkzfZYZWph1ObaMlKJS4TixGTRtn3qFfNiu4gT9R+HQeMq9C7Reu/gWkRlg
	 xVa62xUGpk+rO8cRe2PZKTxh7Dl+oSEyvzvFZpq0a+0IkvhrWh4mWtZaa3H8cLEeei
	 XvpwDqCUgiF6u000jWEzgrwNK2ymuLlWJiY4EauU47YYgb+HPAj0xa32v+06VJAKVY
	 WvFmsJfiElDSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 877F0847CA;
	Wed, 27 May 2026 22:59:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 796742E9
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FAD7847CA
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iWCkhrm3erX for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46377847C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46377847C7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46377847C7
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 318084068; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 22:58:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSNDD-000000014ql-3tLY;
 Thu, 28 May 2026 00:58:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260526200641.939539-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 26 May 2026 22:06:39 +0200")
References: <20260526200641.939539-1-bernd@kuhls.net>
 <20260526200641.939539-2-bernd@kuhls.net>
Date: Thu, 28 May 2026 00:58:55 +0200
Message-ID: <87pl2glas0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KwMDf0X1B55N5si4z9TNITQhhdQ4BYGnv85u5OQHtBcARkZXetlQ1AXxqddjHQ3xZ96G/Nxx9T578eXMW4MZWk7vcp6Ic52bO1S/U8i1CVwkfB41C8V43dGLCWj7wEu0ZjZiOWq8l9kPeKREs/SVoXUxoIZ46jgpdCaEvzz8OYFGOFIPfgqHsbBFz7nPC0W4bXBcAdwwzrI8VfxaWUTJdesTcWXwWfCWNRAEMqZXvQWHbtSzAwncfBggZT8f9dn7t1qppnPcQmBdOs9DxPpD4fVigveLgzqr8hwcVqcHJwgQKVYJm6OGZrS/+WEC6FvyCxj517D5cAY8UqNrxnTQJg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=NEp5SJxIQvhh66mnIHOA6rciGlSuy6PV5H+r0mp4PHw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KwMDf0X1
Subject: Re: [Buildroot] [PATCH 2/4] package/libde265: disable neon support
 for armv7m
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
 > package from 1.0.16 to 1.0.18.
 > Upstream added optional neon support in version 1.0.17:
 > https://github.com/strukturag/libde265/commit/f22cf00a86f4a47f9423deb3b1daa35d981b2ec9

 > The configure check detects neon support:

 > -- Performing Test HAVE_NEON
 > -- Performing Test HAVE_NEON - Success

 > but causes a build error at linking stage:

 > [100%] Linking CXX executable dec265
 > /builds/bkuhls/buildroot/br-test-pkg/bootlin-armv7m-uclibc/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
 >  error: ../libde265/libde265.a(hevcdsp_qpel_neon.S.o):
 >  conflicting architecture profiles A/M

 > so we add a configure option to disable neon support.

 > The build error was not yet detected by the autobuilders but can be
 > reproduced using this defconfig:

 > BR2_arm=y
 > BR2_cortex_m4=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
 > BR2_PACKAGE_LIBDE265=y

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Series passed Gitlab pipeline:
 > https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
