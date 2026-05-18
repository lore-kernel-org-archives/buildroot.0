Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4347CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BAB760785;
	Mon, 18 May 2026 19:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eN-HcurDxbnR; Mon, 18 May 2026 19:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2286C6061B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779133837;
	bh=+9yc3L+fm34tU088He25aAKjn7qqBoY0c7E98G+TkjE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZEpP8dM9wHFLREQzql9obLWbRrfkE+MwqOug3iPZC0QK/c1oJMeIJqd4xTkLH5Bnh
	 uNwqxCyGXH2xzHDCtX3fJV25vK0vt/aA9mBLdR+Lv2zD64/eEUNB2csxo1UQULvsdT
	 NbTrQ+urc65n2EjVupuoyipTB5q3oiECA81BYc2xvaJHdRDXqFpgae3O+K6HrO7h0H
	 VJ95GjQEhXBvaGWksJWP1aDf7dpdflstocL3LXecGRBRJ7zGCAQhtIkVHW8WpC6plr
	 IPxnciZMi16V1mGH4NrbWjGUrueyPwcbBuk7lg6L3Vk/hX+NjVtVEPcG1dZfBwylAz
	 FP0M53JAKXGPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2286C6061B;
	Mon, 18 May 2026 19:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE6B265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5ADA40132
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaFH6-sxXdlh for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31B0F400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B0F400D8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31B0F400D8
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:50:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9474B97BDDC; Mon, 18 May 2026 21:50:31 +0200 (CEST)
Message-ID: <6236e9d7-42e7-4a5d-a06e-d70b4715d811@rnout.be>
Date: Mon, 18 May 2026 21:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-8-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-8-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779133832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/z3GmMxWZUGrXGr2kT9TZDIYaTv9LcMdz8Ad/JFGr/Y=;
 b=bX8wesFjZGEpQGxpJVWq4gd8VF21IKo7nSCE8xUf4MusrofEFiGpvCEjHm9MwORN3OQ7pB
 PvY97AoXzhHZDm7yznK+SY7pPDRaPy7HgIrqz3NvT0PrLsEhTbb6IUb8pPbmDCCdJlTmkB
 8u68p2sE24w2p4LZeMgBfDsPrPFLjKI6xlTh+jFyjMD6rE8b3SeVDrlQ1UJVSwpq96DRpD
 oMM6j0Q8URddsq56tAccfidNrT7vURSuhwJG55oMrE48C8jsp2yClrY8nJ2osbkePcueWO
 4J2K6SalFC7N9clwG7aaee9b1Xi8o/ZP7IOYm5htmhLDOCtEx6CxDv+7tQtfBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bX8wesFj
Subject: Re: [Buildroot] [RESEND PATCH 7/8] package/poco: Do not unpack
 libpq-fs.h
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



On 10/05/2026 21:38, John Ernberg wrote:
> The file was introduced in the project when postgresql support was added,
> and has since never been used by the project internally.
> 
> They already depend on postgresql when the option is selected, so
> let the postgresql package provide the header.

  I didn't immediately understand the point here, so I extended with "Otherwise, 
the header file provided by poco conflicts with the one provided by postgresql."

  Applied to next, thanks.

  Regards,
  Arnout

> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   package/poco/poco.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index fe1dd29855..40dcc1c502 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -11,6 +11,8 @@ POCO_LICENSE_FILES = LICENSE
>   POCO_CPE_ID_VENDOR = pocoproject
>   POCO_INSTALL_STAGING = YES
>   
> +POCO_EXCLUDES = **/libpq/libpq-fs.h
> +
>   POCO_DEPENDENCIES = \
>   	pcre2 \
>   	utf8proc \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
