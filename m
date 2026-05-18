Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90C7CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 735D3605F1;
	Mon, 18 May 2026 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVKgy60-jumZ; Mon, 18 May 2026 19:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9933060607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779133085;
	bh=FgtPJ+iPrjFv4Rn0yKscau0hRkFyf4bSy5p/aH+Sx1Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h42H7PxqRcANWNn6/t7sCGiS2LQC54dJDGAFu/b7U3OlQ+9Em+2UC3YSDEzQquRsF
	 VE6CSrm4EABHNwf3eNA1bEGRDLcGyV2fUW6yB9a3xIUkBFQZj6DnDAYVftjuL4gPpq
	 mIR3/3xtBCvVGbQCI7v4vkmXVAxV52Z+uq9KtaS6s+C8S624lC3iGUvSAy5O2Ms3OD
	 uLXE2+e0EXeWOfdlH379BWPXncOULJqhYsEquZQHhEagyNGFbjRE1ivT+rHf+DaTAw
	 wuExxT0jqq0CepOKTjTSqrWt9LT1HW4OrveAQ0+H7T3TSVkSgfopznEoyFE1XQFOKa
	 7NC1fPKdCqwAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9933060607;
	Mon, 18 May 2026 19:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C736265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B22BA408E0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPS_O7_YYOAd for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1354408D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1354408D2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1354408D2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:38:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F5BAB97BC21; Mon, 18 May 2026 21:38:00 +0200 (CEST)
Message-ID: <a9341fd4-57b1-4964-926a-81a7a27770bf@rnout.be>
Date: Mon, 18 May 2026 21:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-7-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-7-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779133080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=sQrC5PsKA0KIaLz7Lmjt8r1vC693S8zNQPMolxwKCyE=;
 b=L3DAPiRaiNJH0PQqLP0O7dJ3JpBE+oBG6rnpawIgG0e7yCXFsju05Q/i8PFM+FMygVYkMB
 8vkQcIHHL01eWQ5oK3NR12yx54QDIalvbzwOYl1wEmxUzAdquDHH39BXVOhOFYhgw+RLh1
 cnXQA8h9r09KwteCd2RXdsHywYe02ziILwlq6/dKC7jW89e5AsQ0CYDYPbLazd/ZF7+4EZ
 FzQn9rSUV/RD81XHODTp7ljisbHFJirmo4stWXmzLGcmXCX33sbuW5o+CieCEThsJQqs+/
 hABbuP4y9fWCWm+KwGLrHE2gePpcktVVLtS8IKjoeL+nLWpo5NyEpWIRvoh3jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=L3DAPiRa
Subject: Re: [Buildroot] [RESEND PATCH 6/8] package/pkg-generic: Purge files
 that should not be installed by INSTALL_CMDS
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
> Packages such as mutt, bash and gdb are either generating their tar-balls
> incorrectly, or break automake with custom directives, in such a way that
> AM_UPDATE_INFO_DIR=no doesn't work to avoid updating the
> /usr/share/info/dir file.
> 
> Add a post-install hook to both staging and target to delete files that are
> needlessly generated and conflict with other packages post-install when
> building with PPD enabled.
> 
> Since the currently listed file is documentation related, which ends up
> deleted anyway, there is no TARGET_FINALIZE hook provided to generate the
> file at a later point.
> 
> The post-install hook is added at the global level for easier extension and
> also cover non-automake based packages that could be similarly broken.

  Isn't this already done by remove-conflicting-useless-files? If that doesn't 
work, please try to fix it rather than adding yet another mechanism.

  (Marked as Changes Requested in patchwork.)

  Regards,
  Arnout

> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   package/pkg-generic.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index dd440e4062..1675b1263d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -343,6 +343,10 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>   			mv "$${la}.fixed" "$${la}"; \
>   		fi || exit 1; \
>   	done
> +	@$(call MESSAGE,"Purging unwanted staging files")
> +	@$(if $(BR2_PER_PACKAGE_DIRECTORIES), \
> +		rm -f $(STAGING_DIR)/usr/share/info/dir \
> +	)
>   	@$(call step_end,install-staging)
>   	$(Q)touch $@
>   
> @@ -373,6 +377,10 @@ $(BUILD_DIR)/%/.stamp_target_installed:
>   	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
>   		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
>   	fi
> +	@$(call MESSAGE,"Purging unwanted target files")
> +	@$(if $(BR2_PER_PACKAGE_DIRECTORIES),\
> +		rm -f $(TARGET_DIR)/usr/share/info/dir \
> +	)
>   	@$(call step_end,install-target)
>   	$(Q)touch $@
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
