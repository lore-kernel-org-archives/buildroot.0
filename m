Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF7E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3D58116E;
	Wed,  8 Jan 2025 21:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KibShlYL4X8L; Wed,  8 Jan 2025 21:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAC2A81145
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC2A81145;
	Wed,  8 Jan 2025 21:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BAE61FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E085B60A48
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7CpVyk5hLbQ for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0524D60A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0524D60A63
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0524D60A63
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:19:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1001684244; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:19:30 +0000 (UTC)
Message-ID: <c26fb876-dec2-43cf-acfe-50f8f4a40811@korsgaard.com>
Date: Wed, 8 Jan 2025 22:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250102185000.60DF883467@busybox.osuosl.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250102185000.60DF883467@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DdeLhu8ojQeJVOjZ+9477nP8gXCMMLwSj+ZMUGa7MF20QAEYtP+uPFzPIRFK90IL1guKm7IL1KCLMlJUZgzAtvtTKm7wbwjCr0Z/Qp7Itgxz6sZqIuYSSMaKPcRRzy6ErZLqKr50scfofL6lYERfqO2QY4Zrd/eZ0f4lxSgrjSbvecftPdpsfirV1YP+OcsrE8AileAuR/O+ptrJAJKInUE3JECaDhDoxwXEY5Ximjmcsm5Uv2yTVzNNc4pichy3p2EZlGBOMYdaQXVZKkGCsujxxMDR1FM0FGTOpCHoxikDlf2UXq83lBMnBt/2Qzfm0APDP0qHacQlg/hKgejllQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1SGwPyfA3F/qJ2aHCSDgX+nx/VSWrAPC1b6GkAIRKZQ=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=DdeLhu8o
Subject: Re: [Buildroot] [git commit] package/c-icap: backport patch fixing
 missing <stdio.h> include
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

On 1/2/25 19:46, Julien Olivain wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=ff3861a344d0832e48bc0daee77f8bcd6518d099
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This commit backports an upstream patch that fixes a missing <stdio.h>
> include, causing build failures with toolchains based on GCC 14.x.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/a9999fd417aa5edcd6302e674a72a99d89675466/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [Julien: fix broken autobuild url in commit log]
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
