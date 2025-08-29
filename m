Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D87CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4797A828A5;
	Fri, 29 Aug 2025 10:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz3FI5fXiLUq; Fri, 29 Aug 2025 10:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 710F88258D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 710F88258D;
	Fri, 29 Aug 2025 10:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D76876C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCB66614D1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru2AcZy15pMz for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFB4E61529
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB4E61529
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFB4E61529
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:05:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13790B97844B; Fri, 29 Aug 2025 12:05:01 +0200 (CEST)
Message-ID: <f5394764-bc42-473a-a397-c73bdb292b48@rnout.be>
Date: Fri, 29 Aug 2025 12:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250826195910.18480-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250826195910.18480-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756461902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Na9sgBkXVZMr78dyykkjHRCJYmVTT10NGoDSohwCxOw=;
 b=PXVQcbPeSP0/2h2w2sfOiWpskE156TKwkHIzdXVSGgJBE8+KPz0eUgwM8MS9l8hPSA8uxV
 EsRbdMwb/A20Gh/cFs9X31udXuOxrY8F/fnLtIR1yuS1dLNUE+k9rtR59WcRJ/AnvHOiUe
 nRXCv9nXnZA/NE4VfhLJxEMgyp90KL+5j9rt2aQJ5eviLFleEH8FJKT59v6lfg4cPInnKC
 fNsSDERviAlHHDfu9eHQFnH7nChUeve1u/ArG/+l1cVRb/EpegD94BmpJ98QTHf/l/zNMB
 GkiZgbOWhG2ta9bisrY6pBruwlHof1Z586NjgO4JMj69TZZkbj1slU7mbAkjLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=PXVQcbPe
Subject: Re: [Buildroot] [PATCH v2 1/1] support/misc/gitlab-ci.yml.in: check
 legal-info in run_make
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



On 26/08/2025 21:59, Julien Olivain via buildroot wrote:
> The script "utils/test-pkg" is systematically checking legal-info.
> See [1]. This is useful to check all license hashes are up to date.
> 
> The Buildroot Gitlab CI integration has an identical testing
> capability. It is faster because it can run all supported toolchain
> test builds in parallel. See [2].
> 
> It was observed in [3] that the Gitlab CI test-pkg variant does not
> check legal-info.
> 
> This commit align the Gitlab CI test-pkg behavior to the
> "utils/test-pkg" script by adding legal-info in the run_make command
> targets. Doing so checks legal-info in test-pkg cases, but also in
> defconfigs (this was suggested by Arnout in [4]).
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/utils/test-pkg#L195
> [2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/misc/gitlab-ci.yml.in#L129
> [3] https://lore.kernel.org/buildroot/75e688887d95948c57a11416de3047b5@free.fr/
> [4] https://lore.kernel.org/buildroot/614bec7e-0723-4bbd-8c3a-c801e91c29c3@rnout.be/T/#mcc803eeb38d09c1cc02b1333720845c54af86534
> 
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
> - moved "legal-info" check from .test_pkg to run_make (Arnout)
> 
> v1: https://patchwork.ozlabs.org/project/buildroot/patch/20250823105456.28057-1-ju.o@free.fr/
> 
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2005028829
> ---
>   support/misc/gitlab-ci.yml.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index db206432aa..ada36d0d60 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -45,7 +45,7 @@ before_script:
>   
>   .run_make: &run_make
>       |
> -      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
> +      make O=${OUTPUT_DIR} world legal-info > >(tee build.log |grep '>>>') 2>&1 || {
>             echo 'Failed build last output'
>             tail -200 build.log
>             exit 1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
