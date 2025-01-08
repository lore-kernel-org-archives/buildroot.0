Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7668CE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9F481137;
	Wed,  8 Jan 2025 21:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8jytR5KihSy; Wed,  8 Jan 2025 21:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5217F81111
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5217F81111;
	Wed,  8 Jan 2025 21:28:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBAD17AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA8E9406ED
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySk8_5xhjCCN for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0CFD406CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0CFD406CF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0CFD406CF
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:28:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1868066223; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:27:52 +0000 (UTC)
Message-ID: <153d5c2c-56b8-4265-9abf-1395f3ab89da@korsgaard.com>
Date: Wed, 8 Jan 2025 22:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aQEPXohwvJ5ZP+58nV1zrgbEQTbMFiJA/ZpO5fmuYlXuXsfr46rDG1ZzM9yCjoX2kw+sLU5Xu6rDrc6stUBe4hGTfRDDvhy4nupWjutFmaS/xmDc6lvDAEBON5KyqvG/ETOoLNXOPi0tO5su5e39/MRoGKjPRXN/Mb86Dgt8vK0Y7lkZY4EJyYJ9NtFknZ7GIJ+fi7IWs/AAQC55qM+q+QGado1VmPNm38X7ux2q1jkD4ScwDxdZnD2M7AxyzPwfnOxMy8A19g/RcxCQ1X34v+VSSnPAAi5YpF23PTLTwzxWOjHzsBGLkImw4Fi8jPqnXhnOoGIHPqllmFqCahwZDQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=D7NLx+8pRdTd6X7QTEVfQNkjDspe/fSzm1A/yCyNqGY=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aQEPXohw
Subject: Re: [Buildroot] [PATCH] package/perl: properly pass CFLAGS/LDFLAGS
 when building host-perl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/1/25 21:21, Thomas Petazzoni via buildroot wrote:
> HOST_CFLAGS and HOST_LDFLAGS are currently not accounted for when
> building host-perl. In particular, it means that executables
> built/installed by host-perl do not have a RPATH pointing to
> HOST_DIR/lib, which can cause issues as libcrypt.so can now be
> provided by host-libxcrypt.
> 
> This was causing check-host-rpath to complain in the situation where:
> 
> 1. host-perl was built, with no RPATH, linked against the system
>     libcrypt.so
> 
> 2. host-libxcrypt was built afterwards, installed as
>     HOST_DIR/lib/libcrypt.so, which made check-host-rpath complain as
>     HOST_DIR/bin/perl is linked against a library present in
>     HOST_DIR/lib but doesn't have a RPATH to HOST_DIR/lib
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/d4348d7f872ccd734795a1d071960a696148ed6a/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
