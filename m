Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEACFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051056172F;
	Thu, 27 Nov 2025 20:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koJe-vMVzPwH; Thu, 27 Nov 2025 20:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDDE61024
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDDE61024;
	Thu, 27 Nov 2025 20:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4C02A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8778266C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJBHFKZdLV6Q for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77DBD82438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DBD82438
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77DBD82438
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C5DEB979CA9; Thu, 27 Nov 2025 21:06:12 +0100 (CET)
Message-ID: <223e4d0d-a0bc-4831-b9cd-5e3d9d2f6d6f@rnout.be>
Date: Thu, 27 Nov 2025 21:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Doug Kehn <rdkehn@gmail.com>
References: <20251101103530.124285-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251101103530.124285-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ThibXw6NjrHCpOAdnEyfwDbluM4ED89eS6MhomQXVZU=;
 b=cBA9ypy+sdWhd4h7LbKacAsf+1pD36fGQqLxRjnM/3K8yR20mY6TXsjx8tKau/XPYenwvX
 OAuTSZNf4gKJVjLaqXR0SAJGnaa6MTGOTHdO47JnbvoD/0D71J1yvGud7N8jn0dQyExLoe
 MFJ1kVjI5FROki/1xpEGmxxbziuTz4bouw4QqNeP12MfZBfXG/pwfZWxmCHMLiW5NB5WZK
 MFnwZXmOYGeC4mT80nHHapuzLSBkQOhwpUZZozpkfGNStvaYMG1s60f7Xoj0zK/u5odOgY
 GP2WEUfHPaw/lroeNSl8aTmXHPxpszj+uWUtHqLhGQsfbfgjIJjPgNz8htWRow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cBA9ypy+
Subject: Re: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: fix build with
 gcc >= 15.x
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



On 01/11/2025 11:35, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/c30/c30b29723a2f3db6fed5ad0bf0e06c126a857953/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   ...-name-bool-which-is-a-keyword-in-C23.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
> 
> diff --git a/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch b/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
> new file mode 100644
> index 0000000000..a3812fcaff
> --- /dev/null
> +++ b/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
> @@ -0,0 +1,35 @@
> +From 8ddb983a546f632986a84a784c4625110f7782a2 Mon Sep 17 00:00:00 2001
> +From: Arthur de Jong <arthur@arthurdejong.org>
> +Date: Sun, 23 Feb 2025 15:22:38 +0100
> +Subject: Fix variable name (bool) which is a keyword in C23
> +
> +Closes https://bugs.debian.org/1097481
> +
> +Upstream: https://arthurdejong.org/git/nss-pam-ldapd/commit/?id=8ddb983a546f632986a84a784c4625110f7782a2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + nslcd/cfg.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/nslcd/cfg.c b/nslcd/cfg.c
> +index ded797a..b984b0e 100644
> +--- a/nslcd/cfg.c
> ++++ b/nslcd/cfg.c
> +@@ -207,10 +207,10 @@ static int get_boolean(const char *filename, int lnr,
> +   return parse_boolean(filename, lnr, token);
> + }
> +
> +-static const char *print_boolean(int bool)
> ++static const char *print_boolean(int value)
> + {
> +-  if (bool) return "yes";
> +-  else      return "no";
> ++  if (value) return "yes";
> ++  else       return "no";
> + }
> +
> + #define TIME_MINUTES 60
> +--
> +cgit v1.2.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
