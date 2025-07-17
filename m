Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1311FC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7FE83E93;
	Thu, 17 Jul 2025 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbVi3EvFe1K1; Thu, 17 Jul 2025 19:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C7D083E75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C7D083E75;
	Thu, 17 Jul 2025 19:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F81DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB09C40358
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oa5_jIDWI2e for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:57:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27E65400C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E65400C0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27E65400C0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:57:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D591B977AA4; Thu, 17 Jul 2025 21:56:57 +0200 (CEST)
Message-ID: <2e4fb917-3a54-4033-a041-424a1e61e5a4@rnout.be>
Date: Thu, 17 Jul 2025 21:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250707135941.3768551-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707135941.3768551-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3bciBztwXcVxVLwzc83FZdjpIoXyUoe6D39kCfQKjj0=;
 b=AXu/at1TGvY3x/3/jQ6YR5GVQlYaxtxP8j01PaFH/pzvsSGE3Un4LeTE49cmlfzgjpiwiL
 HvUtnDmtSC5UquvAm7bumKXvQUDbX3TyHENieV7ivoLOn/EYuDB0rtKBxigA1a4ifSQZxJ
 IPxkt9l2XbkxKRs7yW5GGHYPom+Qq52DRxrSze0VZuwp82Gpbfv/kmOnmTNU05rE9kj2tS
 IzTC4pyoprvL0MoGeYgkXp8An8ImzwMLLwHz7e/W6TyGcyKYvZhQzreXdnQp2VZNSctuVL
 Y8aN3j7B0afcaZ0L2lH6M2bLvUsO3ZVwoEmarh2uoY+9xWxPr39xFfe/nWcgGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AXu/at1T
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: correct
 CCACHE_BASEDIR comment
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



On 07/07/2025 15:59, Peter Korsgaard wrote:
> Commit 1e97b2787331 ("ccache: support changing the output directory") added
> the CCACHE_BASEDIR logic, but added a comment (presumably from cut'n'paste)
> about compilercheck instead, fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   toolchain/toolchain-wrapper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 4dde0362b6..703d2fc042 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -526,7 +526,7 @@ int main(int argc, char **argv)
>   		}
>   #endif
>   #ifdef BR_CCACHE_BASEDIR
> -		/* Allow compilercheck to be overridden through the environment */
> +		/* Allow basedir to be overridden through the environment */
>   		if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
>   			perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
>   			return 3;

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
