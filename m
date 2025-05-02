Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714B7C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13CB24160D;
	Fri,  2 May 2025 11:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsBjbbTTCPse; Fri,  2 May 2025 11:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4079440906
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4079440906;
	Fri,  2 May 2025 11:06:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE30EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85ADA83D36
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ila7JmqDNvM for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DBAB815C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DBAB815C1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DBAB815C1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:06:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56B171C0D8C; Fri,  2 May 2025 13:06:29 +0200 (CEST)
Message-ID: <93051350-5e59-46ae-b95c-e1e86a1e592f@rnout.be>
Date: Fri, 2 May 2025 13:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>
References: <20250422085337.901025-1-elmehdi.younes@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422085337.901025-1-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DGEHVpxl4qRj2rF0DSrGzvGt4nS2bmnK+FETspx254w=;
 b=hq9+0HWme3Xwtdf24cSO34G5lJoFnB0fyrO1wV3evyV4ZMmlMMW8AoivWJTGKBaQaiRLx/
 kNTFElTYqexN2FtCGj+lnGIAECHx3a32Uz+vJglcladd506FGKteU322vojY1bNon/nLOZ
 2Ef+bzq8E/pin+1gfUjjVct9PgQRj4vH0jWpr9W33CZr+dJmiwql5btZ48LeXuCEZH3ada
 cMUIzQNlGCB1qQBOO9+xFxsiBaIGc5qB/AyVUXkH7sFs1fcUbOXOPBp534bWGgu/ZlJPC1
 9WJhCNIa0yYoMmTfEvfYNBz7P0LHjN3Mt/CPOIzak1CHGD00AjUGzTNBkVzdjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hq9+0HWm
Subject: Re: [Buildroot] [PATCH 1/2] package/bat:bump to version 0.25.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2025 10:53, El Mehdi YOUNES via buildroot wrote:
> Changelog:
> https://github.com/sharkdp/bat/blob/master/CHANGELOG.md
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/bat/bat.hash | 2 +-
>   package/bat/bat.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bat/bat.hash b/package/bat/bat.hash
> index e80301ff49..f3050f6354 100644
> --- a/package/bat/bat.hash
> +++ b/package/bat/bat.hash
> @@ -1,4 +1,4 @@
>   # Locally generated
> -sha256  45fcdd6076dc1b45698a7b6c0f4d1f5d9ae676f3ca3b155402ad24680d5b4df6  bat-0.24.0-cargo2.tar.gz
> +sha256  d793a8f3a6e47b96ee81d624d2b4b470f005b6823ef6b0f38c0cc10726d35fdc  bat-0.25.0-cargo2.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
>   sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
> diff --git a/package/bat/bat.mk b/package/bat/bat.mk
> index b95cdb25ac..7e89d361af 100644
> --- a/package/bat/bat.mk
> +++ b/package/bat/bat.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BAT_VERSION = 0.24.0
> +BAT_VERSION = 0.25.0
>   BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
>   BAT_LICENSE = Apache-2.0 or MIT
>   BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
