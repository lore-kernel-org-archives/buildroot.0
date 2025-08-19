Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA1ECA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 14:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D855040BD0;
	Tue, 19 Aug 2025 14:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuSvxez-z6EA; Tue, 19 Aug 2025 14:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B03840BB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B03840BB5;
	Tue, 19 Aug 2025 14:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 949FEE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8661740BA8
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhZ9HS0RiCjl for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 14:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 246E340B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246E340B97
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 246E340B97
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:37:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AD9E5B0051B;
 Tue, 19 Aug 2025 16:37:07 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 16:37:07 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 16:37:07 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250819140331.1518506-1-angelo.compagnucci@gmail.com>
References: <20250819140331.1518506-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <280d7f1f3a718ebdfdc0dbb32bb60049@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755614228;
 bh=MORm3PVv0bvingAuTLLqwAEDzBGKaNRKmAdFkx1tnnk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CIbtVsK/+TdrrGwbYOVPrjAgi7IdisxkllcyzzbOk7MmpWc3r6vx0/hBDu1gJRPql
 vC6EoNSA+I/c2uSoapMcYSnzfMFDh2lonO6vaVFO9ELsAkCuYW0nh4TcZ7rMJw67Z9
 GqPZ6kYye9xMk5aakFquCP526ETLnapPCcLpkvY5zRMlJx5BPlJLCmSPTDmMXlIKK2
 5/Bsbb/ExLNQR2QdUPfE+/sn3NO7Q5HgvloeH6yA7yn2CpgVrq3uy98S1ItCTOu5RA
 33+k/8TL5ZF8lqQGnrjulSmXW1hD/fzQh33m5vq1S7fsMgd3BIJUBS5Q47KpBJ0obp
 Xo8zYPf2SP3ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CIbtVsK/
Subject: Re: [Buildroot] [PATCH v2] package/jq: security bump to version
 1.8.1
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

Hi Angelo,

Thanks for the patch!

I have few comments, see below.

On 19/08/2025 16:03, Angelo Compagnucci wrote:
> Changelog:
> https://github.com/jqlang/jq/releases/tag/jq-1.8.1
> 
> COPYING:
> Add LICENSE notice of NetBSD's strptime() to COPYING

When there is a change in the license text, it is preferable to
provide a link of the upstream commit of the change, if available.
This makes reviews easier. In that case, it is:

https://github.com/jqlang/jq/commit/78045d8aa9d155ec0f82ab102aa752300c2349f1

Looking at this change, I see it is introducing a new BSD-2-Clause
paragraph for strptime(). So the JQ_LICENSE variable would also need
to be updated accordingly. See below.

> Fixes the following security issues:
> 
> - CVE-2025-49014
>   Fix heap use after free in f_strftime, f_strflocaltime.

To make review faster, could you add a direct link to the CVE, please?

     https://www.cve.org/CVERecord?id=CVE-2025-49014

> 
> - GHSA-f946-j5j2-4w5m
>   Fix stack overflow in node_min_byte_len of oniguruma.

Same comment here:

     https://github.com/jqlang/jq/security/advisories/GHSA-f946-j5j2-4w5m

> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> 
> v1->v2:
> * Updated COPYING hash (Thomas P)
> 
>  package/jq/jq.hash | 4 ++--
>  package/jq/jq.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jq/jq.hash b/package/jq/jq.hash
> index 344f73d463..4596134620 100644
> --- a/package/jq/jq.hash
> +++ b/package/jq/jq.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  
> jq-1.8.0.tar.gz
> -sha256  
> ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  
> COPYING
> +sha256  
> 2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  
> jq-1.8.1.tar.gz
> +sha256  
> ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74  
> COPYING
> diff --git a/package/jq/jq.mk b/package/jq/jq.mk
> index f3f4704f37..3077a76b17 100644
> --- a/package/jq/jq.mk
> +++ b/package/jq/jq.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -JQ_VERSION = 1.8.0
> +JQ_VERSION = 1.8.1
>  JQ_SITE = 
> https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
>  JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)

Here, we should update _LICENSE to include the new BSD-2-Clause:

JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), 
BSD-2-Clause (strptime)

>  JQ_LICENSE_FILES = COPYING
> --
> 2.34.1

Could you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
