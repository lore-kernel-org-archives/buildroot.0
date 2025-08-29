Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F98CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD363615B4;
	Fri, 29 Aug 2025 10:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDRq84VauqZ8; Fri, 29 Aug 2025 10:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB1E614F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB1E614F7;
	Fri, 29 Aug 2025 10:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4696C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9075A4187D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJDtAE0RvyZf for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F14A44187E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14A44187E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F14A44187E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:53:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B65CFB9782D8; Fri, 29 Aug 2025 12:53:50 +0200 (CEST)
Message-ID: <c9ae35cd-5d83-453d-92b8-fb546496116c@rnout.be>
Date: Fri, 29 Aug 2025 12:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20231007203633.2415431-1-arnout@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20231007203633.2415431-1-arnout@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756464831; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Cr1aHhJrX2Ot8EiaAkDtdsP11wA03g16zYnQ9pJj+7E=;
 b=cJ/+F9b9qdSJ5KlNW6aMFo1dW93Gz1vGoz1Xo3ihs2fysvLc1e/MWzCmYgYqiWNtgcI6KT
 SEzHgMOl2p0KvHwfZKSeD4RcfvhJAGF3MGspntUZPzT3AUbrKiUoZIXDsuprBrcskOuxT6
 8I+BT0ALHuvc4fz05qPtSIQsOx9naSJHAcYc8odSHzk1kyfhg2mLT0gpgRferS3t+F+v4B
 EO75PxtQAXgRIrIQX18p2fpcxY9si8JQC8sMbEyVDnZxlBPDGxwDI0R7n7E0lWQRj511Jd
 gvvAEMDlMpvDCnq5bXLLItHtTIH7NHmkDNOdplzXs9Z7Z5A/AmbrlJhTnB2S/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cJ/+F9b9
Subject: Re: [Buildroot] [PATCH 1/2] utils/check-package: allow exception
 for global checks
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



On 07/10/2023 22:36, Arnout Vandecappelle wrote:
> check-package has a mechanism for a specific file to make an exception
> to a specific checker, by preceding the offending line with
> "check-package ... <checker class>". However, this is not possible for
> the global checks that are done in the checker's after() function.
> 
> Allow exceptions for the global checks by writing the same
> "check-package ... <checker class>" comment on the last line of the
> file.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   utils/check-package | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 105902303e..38119f7136 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -247,6 +247,8 @@ def check_file_using_lib(fname):
>               lastline = text
>   
>       for name, cf in objects:
> +        if cf.disable.search(lastline):
> +            continue
>           warn, fail = print_warnings(cf.after(), name in xfail)
>           if fail > 0:
>               failed.add(name)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
