Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BA5CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BC46078E;
	Mon, 18 May 2026 19:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOYqRrJ1EhJh; Mon, 18 May 2026 19:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6E06076C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779131949;
	bh=Oe6LUW+UJCsaK9JuoMvoLTyGfTq2E2FKOLPumcigXOg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JM7lzr2JrbJGNsuE8ndfPL9yOkuUYBgpwUmL4rGxBQ8gZqnKfTJ0yzAfh6n0J1AqN
	 HLyKpWUcgCZdVKDpBnsEVo/JwEnGRM0vYEtpoVvzBaSDMUcy9TLaqYi1rseksI8LJ+
	 m/dk+GfxJT4ZKsrqtMFtsLZwCEBMI3oFQwi2MidDZy9WOt5vBm47sQ1cMG+SSADfJ7
	 jG1JlNqe0llokE1iMY1pcs8Q2r53v3FI8SbaVrkU+uUqs1G+BmDFE7Rskz/7eRfK9m
	 /0hd4yg2qoYfOlAl7AHQ2viZIPdLX9hhOuDweshAJhmxNdSkR9YhVjqh0BVq5rG0EH
	 Lh1IEsUmIlTUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6E06076C;
	Mon, 18 May 2026 19:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C761282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F606076C
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoGU_OGVtVwU for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 792C960603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792C960603
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 792C960603
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CC44B97C0CC; Mon, 18 May 2026 21:19:04 +0200 (CEST)
Message-ID: <19034694-b142-418a-a31c-45a70f075da0@rnout.be>
Date: Mon, 18 May 2026 21:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se, Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-4-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-4-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779131945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5vfZtYnyY0YflBcUhBZcXlCzw/TxZXm9kpoQPAzbrEY=;
 b=SSlzGcsAmQ7otTSKpqDKMFdUt+N+vHsCMIy6EyyFrh4vrDp4n4ofamjHcpwoFoWwKxexAN
 iR4E+c+qhKgUCpqddK2IQr2gxsjzGOWEbm9WvnOLwc5NB53OfBTnqbC7OGQw+EwL7JceiG
 4hj+or6BRdKVXuCBqEU+fewwmsavkQoFdF6SPK3nb/7+Ss3Xbl+R7+izOXW9hpHXAYfgvJ
 hqA8Lorpp1lDCuNFSfrj9nVU3rly/t063ZRcuHfyo2KzE6EuPjKur4QMl+pxa/M5auermL
 2LFyC87n+LAGIPLlpmZmm+VZVkk1AeouLPPYFFfHEikcbe5eK2C0z7BDlhwXAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SSlzGcsA
Subject: Re: [Buildroot] [RESEND PATCH 3/8] package/libselinux: Adjust fstab
 during TARGET_FINALIZE
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
> Doing so in the INSTALL_CMD makes the fstab adjustment subject to
> overwrites by other packages during a per-package build.
> 
> Currently since per-package directories are populated using hardlinks
> this adjustment propagates backwards into the skeleton package, but this
> should not be relied upon.
> 
> Cc: Antoine Tenart <atenart@kernel.org>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

  Applied to next, thanks!

  Regards,
  Arnout

> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   package/libselinux/libselinux.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index a77ee7659a..49fcd13851 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -72,9 +72,13 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>   		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
>   		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
> +endef
> +
> +define LIBSELINUX_TARGET_ADD_FSTAB_ENTRY
>   	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
>   		echo "none /sys/fs/selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
>   endef
> +LIBSELINUX_TARGET_FINALIZE_HOOKS += LIBSELINUX_TARGET_ADD_FSTAB_ENTRY
>   
>   HOST_LIBSELINUX_DEPENDENCIES = \
>   	host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
