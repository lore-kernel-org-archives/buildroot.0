Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7F9C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D09360C06;
	Wed,  4 Jun 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFeY4sjhH_tC; Wed,  4 Jun 2025 18:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4584E60C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4584E60C14;
	Wed,  4 Jun 2025 18:20:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9DA1DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E99240077
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJvLUnPNnAkT for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:20:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5AEF4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AEF4005B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5AEF4005B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 976C61C010A; Wed,  4 Jun 2025 20:20:54 +0200 (CEST)
Message-ID: <f1b9346c-2e73-4f44-bc0b-48a08aa3cac9@rnout.be>
Date: Wed, 4 Jun 2025 20:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1723543467.git.yann.morin@orange.com>
 <0273851a98aad3af35b660c047ee64ddb1276271.1723543467.git.yann.morin@orange.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <0273851a98aad3af35b660c047ee64ddb1276271.1723543467.git.yann.morin@orange.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SMXZoNe8pV9jb3vA3st4+/fqGNJACYLS3uretJ1978o=;
 b=KysAUJsp6C+k5NSzNkJz43wTOlZ/0HMvJVQlcD5RJJqtMESO9R/9bVr8eSP8rGxUef09sI
 sqw1/mOSQ3ZW8BbE6IXqPMn1NTAz2Gl4k8ORcuQGr6ejzco2RuOr8PhBiqiN3NYcX3jRQ1
 t8Agw0w/7N5XJZYfpLlrwt9TXF9g08VIn1d5+Ey5ur5PQwB9yORCVywk1z9zzOMH8NRS+O
 T2GSuZP2pHrwG4WM75jvPDPAa/lTzB7PqDzlqGu8/N3IGWaHcFzeAn/n9IyiFkBJhYI3HL
 8HZWlSN9Rgv2fzBN/xJ41yJKMWovuEWAozLDjv/uhee4LuTSXwo4a9p1963l/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=KysAUJsp
Subject: Re: [Buildroot] [PATCH 1/3] toolchain/wrapper: check unsafe paths
 earlier
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



On 13/08/2024 12:04, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> We currently check for unsafe paths right between adding our arguments,
> and adding the one passed from the command line. This not very
> consistent.
> 
> Unsafe paths can only come from the command line, as we are not adding
> any of our own (hopefully, we know better!), so we can run the check as
> early as possible.
> 
> Move the check very early, but not before we handle --help.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   toolchain/toolchain-wrapper.c | 44 +++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index e436889760..03977eb408 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -321,6 +321,28 @@ int main(int argc, char **argv)
>   		}
>   	}
>   
> +	/* Check for unsafe library and header paths */
> +	for (i = 1; i < argc; i++) {
> +		const struct str_len_s *opt;
> +		for (opt=unsafe_opts; opt->str; opt++ ) {
> +			/* Skip any non-unsafe option. */
> +			if (strncmp(argv[i], opt->str, opt->len))
> +				continue;
> +
> +			/* Handle both cases:
> +			 *  - path is a separate argument,
> +			 *  - path is concatenated with option.
> +			 */
> +			if (argv[i][opt->len] == '\0') {
> +				i++;
> +				if (i == argc)
> +					break;
> +				check_unsafe_path(argv[i-1], argv[i], 0);
> +			} else
> +				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
> +		}
> +	}
> +
>   #ifdef BR_CCACHE
>   	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
>   	if (ret >= sizeof(ccache_path)) {
> @@ -474,28 +496,6 @@ int main(int argc, char **argv)
>   #endif
>   	}
>   
> -	/* Check for unsafe library and header paths */
> -	for (i = 1; i < argc; i++) {
> -		const struct str_len_s *opt;
> -		for (opt=unsafe_opts; opt->str; opt++ ) {
> -			/* Skip any non-unsafe option. */
> -			if (strncmp(argv[i], opt->str, opt->len))
> -				continue;
> -
> -			/* Handle both cases:
> -			 *  - path is a separate argument,
> -			 *  - path is concatenated with option.
> -			 */
> -			if (argv[i][opt->len] == '\0') {
> -				i++;
> -				if (i == argc)
> -					break;
> -				check_unsafe_path(argv[i-1], argv[i], 0);
> -			} else
> -				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
> -		}
> -	}
> -
>   	/* append forward args */
>   	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
>   	cur += argc - 1;

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
