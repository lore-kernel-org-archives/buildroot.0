Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB44BCA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 757FA616C5;
	Fri, 29 Aug 2025 17:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFwusiHQwsVY; Fri, 29 Aug 2025 17:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92024616B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92024616B7;
	Fri, 29 Aug 2025 17:33:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D17A769
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23CF84541
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIwOOQgWcwl9 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10D3884518
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D3884518
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10D3884518
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:33:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19B71B9783D4; Fri, 29 Aug 2025 19:33:39 +0200 (CEST)
Message-ID: <670efbf2-f387-4da2-837e-a5d323eef55a@rnout.be>
Date: Fri, 29 Aug 2025 19:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aLA14x2bTEN_ALy7@waldemar-brodkorb.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <aLA14x2bTEN_ALy7@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756488820; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ai16JFgzs+DNDEXHeUsBkqelKackgyBeLWvCeJMX9Zk=;
 b=FN1dfyHY3utlRta3tDaFq8XJiX/fW6Yb5UYEYeBQHLFKi7Ci2GkqsrTrK0idlSk+29kqhN
 3kNPsyyozZi6K0viHKVL0lbiob9ckRyZlBM1JmhNGVqSEcdlggZ1ARzv2T8BSjFHmEXY+B
 /5iOWRBy4S192X/7yfQM6m2XexIrDHkwx/Xud1aJblrlVBcRxTEmeZNJhYvOd6PG/GjtQH
 UbTs9R8JqFhYb/vbvO9FXtjS/esNoWFVBNdzEmYtciKGHdJl1xMC8xOGJ28ya+nqW6YK9q
 LHFvOKnHDnoq100fV3A7PJDLpLIA7GOmvDbeitIOsH43UlPTFq9kBBvbUxMu+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FN1dfyHY
Subject: Re: [Buildroot] [PATCH] evilwm: fix compilation with external
 toolchains
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



On 28/08/2025 12:56, Waldemar Brodkorb wrote:
> Switch to generic-package, as the configure script isn't really a
> autotool generated script. This fixes building evilwm with an
> external toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>   package/evilwm/evilwm.mk | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
> index 78b531095b..22116b7714 100644
> --- a/package/evilwm/evilwm.mk
> +++ b/package/evilwm/evilwm.mk
> @@ -18,4 +18,26 @@ endef
>   
>   EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
>   
> -$(eval $(autotools-package))
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +EVILWM_CONF_OPTS += --host=$(TOOLCHAIN_EXTERNAL_PREFIX)
> +else
> +EVILWM_CONF_OPTS += --host=$(GNU_TARGET_NAME)

  Could we use TARGET_CROSS here (which includes the full path as well) instead 
of open-coding the condition?

> +endif
> +
> +# the configure script is not generated by autoconf
> +define EVILWM_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure \
> +		--prefix=/usr \

  Looking at the configure script, I think it would be better to pass all 
possible options: host, prefix, mandir, CFLAGS and LDFLAGS.

  Regards,
  Arnout

> +		$(EVILWM_CONF_OPTS) \
> +	)
> +endef
> +
> +define EVILWM_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define EVILWM_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
