Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC30C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFAA4096E;
	Tue,  1 Jul 2025 07:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAf4j37rPXHm; Tue,  1 Jul 2025 07:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095EF4098B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095EF4098B;
	Tue,  1 Jul 2025 07:02:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E7CDF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 808F560BCC
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_1rL2uQNyeV for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7C3760BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C3760BA5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7C3760BA5
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 919C5B97003B; Tue,  1 Jul 2025 09:02:17 +0200 (CEST)
Message-ID: <31743c58-5e15-4d2a-935c-6945fca4edd9@rnout.be>
Date: Tue, 1 Jul 2025 09:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
References: <20250630023826.1163-1-git@jdknight.me>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250630023826.1163-1-git@jdknight.me>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: ignore configs/ prefix on
 configuration events
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

  Hi James,

On 30/06/2025 04:38, James Knight wrote:
> Allows accepting board configuration events that are prefixed with a
> `configs/` path. This provides a convenience for users where it can be
> slightly easier/quicker to utilize shell completion to prepare a build.
> For example:
> 
>      make configs/qemu_sparc64_sun4u_defconfig
> 
> Would be equivalent to:
> 
>      make qemu_sparc64_sun4u_defconfig

  I agree with the principle (though I want to think a little more about the 
implications in corner cases). However...

> 
> Signed-off-by: James Knight <git@jdknight.me>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c581067320..46b246245b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1026,7 +1026,7 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>   		$(firstword \
>   			$(foreach d, \
>   				$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)), \
> -				$(wildcard $(d)/configs/$@) \
> +				$(wildcard $(d)/configs/$(@:configs/%=%)) \

  We don't use this kind of substitution, instead use patsubst.

  And maybe it's simpler to use

	$(wildcard $(d)/configs/$@ $(d)/$@)

It would mean that any defconfig at the top of a br2-external would also work, 
but perhaps there's nothing wrong with that...

  Regards,
  Arnout

>   			) \
>   		), \
>   		$(error "Can't find $@") \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
