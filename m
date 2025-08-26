Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE4CA0FF2
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 17:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DB3606A3;
	Tue, 26 Aug 2025 17:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mlh2DDrxNrsV; Tue, 26 Aug 2025 17:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4294C6059C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4294C6059C;
	Tue, 26 Aug 2025 17:11:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2801CB0B
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 17:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18D4D807CC
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 17:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCCyh4i9kJBv for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 17:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9643804CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9643804CB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9643804CB
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 17:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 448B0B978328; Tue, 26 Aug 2025 19:11:18 +0200 (CEST)
Message-ID: <614bec7e-0723-4bbd-8c3a-c801e91c29c3@rnout.be>
Date: Tue, 26 Aug 2025 19:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250823105456.28057-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250823105456.28057-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756228279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GjC9uFFYoB2bHYp7gmn3JGIgDkkwoTUac1MSlviFxj0=;
 b=hQHYuuABWn/531jjJVjuKYhzWmnhGxQBmiMmE6JGnZE4+nVOevfkHm6YG3Sr8Gn7EwyCEl
 wENt1tAaDBeez5wUI6CmOd2lN+nVvg0dyCb1MrRNR1Vg0R0lo2LVDmKi7nlrut5tmk8L7M
 dppUrm9ipFZnFZ7TYQEp5aInYiMRT/UuKYJvqSNeTbqdJPbuROUhNQ1haW86TCRYwbZ3Pb
 /FlyVstBaRFWrudJxPFdQdbJ5w1NTODZHCH5ngYeXzh1V0MzezcJ5TOPDc6gwXijYVaVAY
 2JF/5omfnvnvTfGcau51SO8xwp1ZSg/6T+PVDxcKy+BsaeaW5OYT/vV/ik6vmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=hQHYuuAB
Subject: Re: [Buildroot] [PATCH 1/1] support/misc/gitlab-ci.yml.in: check
 legal-info in test-pkg
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



On 23/08/2025 12:54, Julien Olivain via buildroot wrote:
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
> "utils/test-pkg" script by adding a "make legal-info" command.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/utils/test-pkg#L195
> [2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/misc/gitlab-ci.yml.in#L129
> [3] https://lore.kernel.org/buildroot/75e688887d95948c57a11416de3047b5@free.fr/
> 
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   support/misc/gitlab-ci.yml.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index db206432aa..2358f573c8 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -135,6 +135,7 @@ before_script:
>           - make O=${OUTPUT_DIR} savedefconfig
>           - echo 'Build buildroot'
>           - *run_make
> +        - make O=${OUTPUT_DIR} legal-info

  Instead of doing it here, I think it makes more sense to do this in run_make 
itself. It is also relevant to run legal-info for the defconfigs (especially 
once we add support for license files for custom kernel and uboot versions). 
This also makes sure that output from legal info is captured in the log file.

  So:

-      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
+      make O=${OUTPUT_DIR} world legal-info > >(tee build.log |grep '>>>') 2>&1 
|| {



  BTW this should be applied to master - we also eventually want it on the 
stable branches so master is the correct place.

  Regards,
  Arnout

>       needs:
>           - pipeline: $PARENT_PIPELINE_ID
>             job: generate-gitlab-ci-yml

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
