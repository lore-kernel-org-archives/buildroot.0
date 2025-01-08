Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB465E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E4B80A91;
	Wed,  8 Jan 2025 21:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peYeihLkF_lW; Wed,  8 Jan 2025 21:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9689B80A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9689B80A95;
	Wed,  8 Jan 2025 21:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B079E1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BDB4408F1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vigq1P_GjdqW for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FFE5408F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FFE5408F0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FFE5408F0
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:08:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -644014939; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:08:08 +0000 (UTC)
Message-ID: <c6739bf6-2d79-48f3-a63c-c78f695c8330@korsgaard.com>
Date: Wed, 8 Jan 2025 22:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Alex Michel <alex.michel@wiedemann-group.com>
References: <20241231150509.1763416-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241231150509.1763416-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=IZzWZwI+fZnmSVuL0B05qkaBe//0GaHIu2PSPUyYO9+bOQilBtwV1G9nNECZ7zY/o3UCfjW7LTYc3aZIc++gatsrv8rtWK34Sj6z5NyFoU5FHGi5WkAOgzT5VQ8cI6jAP4n9UIfUw2g6ySyoMlyiR3E0lQFp8StbgArydE2tJQDNT29zg4c4ef0HKQDWdXXj6JZ1ng/6wlSGFSHpBscENQD/vAnSCuNRrgd+QQ2AgHvTBqYnU8M3iFZlvA9DRjifanEmbHexOuivKRw05Tw1Npwz5OsRn8PpdmsCk/GZtSiB2Rs41Ri0qKGjRtLNzp5Ntsnpy26wWs5F82P1IqDrCQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=l5r8jqBEhXBEg/cIWf0UjYRl7PpOaIOPJr3556sBA98=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IZzWZwI+
Subject: Re: [Buildroot] [PATCH] package/libzenoh-pico: fix debug+fortify
 glibc builds
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

On 12/31/24 16:05, Thomas Petazzoni via buildroot wrote:
> The configurations that have:
> - BR2_ENABLE_RUNTIME_DEBUG=y
> - One of BR2_FORTIFY_SOURCE_xyz=y
> 
> Currently fail to build, as libzenoh-pico's build system forces -O0
> when BR2_ENABLE_RUNTIME_DEBUG=y, but -O0 builds aren't compatible with
> _FORTIFY_SOURCE, causing:
> 
> ../../../per-package/libzenoh-pico/host/mips64-buildroot-linux-gnu/sysroot/usr/include/features.h:422:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
>    422 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
>        |    ^~~~~~~
> cc1: all warnings being treated as errors
> 
> We fix this by adding a patch that drops the forced -O3 (release
> builds) and -O0 (debug builds) from the project CMakeLists.txt.
> 
> This issue exists since libzenoh-pico was introduced in Buildroot in
> commit
> a96361901dcc7b962a0c43f163e97a2de65687f3 ("package/libzenoh-pico: new
> package"), but was hidden by other issues until a first occurence in
> November 2024 right after the bump to 1.0.1:
> 
>    http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---

Committed to 2024.11.x, thanks.

> The provided patch will not apply well on the version of libzenoh-pico
> that's in 2024.02.x. If that patch gets backported to 2024.02.x,
> contact me, and I'll provide a patch that applies on the version of
> libzenoh-pico that was in 2024.02.x.

Yes, that would be great - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
