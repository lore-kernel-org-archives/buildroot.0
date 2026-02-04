Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE988E95363
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A1A605B0;
	Wed,  4 Feb 2026 09:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bvq0_esw1rq; Wed,  4 Feb 2026 09:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97F2D60A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198330;
	bh=xtjiHJ42W9h4SywBew0FWwIcKl4bZycZS6J099MnzS4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=cPuREa5JqnUtMgVW5a3HI1A8R9irl0rXvQh27Gt9x0whOpbrFPj+xd4ISSk1E7iAG
	 2MhBVodGkZygWhSpQQaNBkVWpPpongsr1neKbvCmodfm+FAW+MwGHUP/Uz1KU1+SpA
	 1oboc93VX2E+7AJk85adNUAKv3wi4kVimY2EQo26AT7DhhWk32KJWIy8yg0dOy53Fz
	 2G0a88tlIIMxZ2GD7ZP9CuW8XvRlHsZ0p5a1BoJN6LALbo4Lyxd7nXxpeWhyhCh4rI
	 U/2zZXpN2sstQz2rZQ8xhgE9bv8K0AVLi35d7iZWOE5Nw8DelAXmqh5aN41vJ9+GDR
	 rGawVDWGLtLgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F2D60A7C;
	Wed,  4 Feb 2026 09:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F266F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C1D540B46
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDYDyRGWef7X for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 658F940B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 658F940B38
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 658F940B38
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:45:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBC60B97AD58; Wed,  4 Feb 2026 10:45:24 +0100 (CET)
Message-ID: <7697351c-3349-4826-9dde-0ef39d10bb10@rnout.be>
Date: Wed, 4 Feb 2026 10:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250531000554.28543-1-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250531000554.28543-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770198325; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Y0wz2SBgk8MUkW/vZYo0YUrDTBYevX8uwP2GmV+50TY=;
 b=ab0O0FNI+LCuZpfocP1b4VMR2oHoh6SkddUv0UGa3iYFbhGQKk7VyqqdjibxgvLAkK0HwB
 3fqpqsu66FcP8D92rTDOmseleMyGZDA8D2CWzFwKEEn24rKsxowKNSfib2gLIwHNtebMKS
 /pVuMhGxWccq6su6B83+b3nU+nsTpLu77fCWCgr245G9MfkDZ8SetYmUaMbh84Lc1JaN43
 TFxiJlyagG+/Lmsnp2x0RCukxL153dhmRGjdw4k867A4Co2qCCN7v5aewNN59SLvDkjW25
 2r/uQUVALK/r5+cK0f+2JjdBFa3KNtD5YZTLgET2MnezAhzGiKOqsgtVGOZklQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=ab0O0FNI
Subject: Re: [Buildroot] [PATCH 1/1] core/sdk: pre-calculate files in need
 of relocation
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



On 31/05/2025 02:05, Florian Larysch wrote:
> Currently, the relocate-sdk.sh script scans the whole extracted SDK tree
> to find instances of paths it needs to replace, which can take a
> significant amount of time when the SDK is large, particularly relative
> to the number of files that actually need to change.
> 
> However, the resulting list only depends on the SDK tarball itself, so
> we can calculate it at build time and ship it with the tarball so
> relocate-sdk.sh can use it directly.
> 
> Testing this on my machine with somewhat IOPS-limited rotating media,
> the time goes down from:
> 
> $ time ./relocate-sdk.sh
> Relocating the buildroot SDK from [...] to [...] ...
> ./relocate-sdk.sh  5.19s user 26.21s system 9% cpu 5:34.40 total
> 
> To:
> 
> $ time ./relocate-sdk.sh
> Relocating the buildroot SDK from [...] to [...] ...
> ./relocate-sdk.sh  0.49s user 0.29s system 103% cpu 0.749 total
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to master, thanks!

  Regards,
  Arnout

> ---
>   Makefile                     | 10 ++++++++++
>   support/misc/relocate-sdk.sh | 11 +++--------
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c14023fd98..95f207150b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -600,6 +600,16 @@ prepare-sdk: world
>   	@$(call MESSAGE,"Preparing the SDK")
>   	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>   	mkdir -p $(HOST_DIR)/share/buildroot
> +	(\
> +		export LC_ALL=C; \
> +		grep -lr '$(HOST_DIR)' '$(HOST_DIR)' | while read -r FILE; do \
> +			if file -b --mime-type "$$FILE" | grep -q '^text/' && \
> +			   [ "$$FILE" != '$(HOST_DIR)/share/buildroot/sdk-location' ] && \
> +			   [ "$$FILE" != '$(HOST_DIR)/share/buildroot/sdk-relocs' ]; then \
> +				echo "$$FILE"; \
> +			fi; \
> +		done \
> +	) | sed -e 's|^$(HOST_DIR)|.|g' > $(HOST_DIR)/share/buildroot/sdk-relocs
>   	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>   
>   BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
> diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
> index 981d272425..d25bc55279 100755
> --- a/support/misc/relocate-sdk.sh
> +++ b/support/misc/relocate-sdk.sh
> @@ -37,15 +37,10 @@ fi
>   
>   echo "Relocating the buildroot SDK from ${OLDPATH} to ${NEWPATH} ..."
>   
> -# Make sure file uses the right language
> -export LC_ALL=C
>   # Replace the old path with the new one in all text files
> -grep -lr "${OLDPATH}" . | while read -r FILE ; do
> -    if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" != "${LOCFILE}" ]
> -    then
> -        sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
> -    fi
> -done
> +while read -r FILE ; do
> +    sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
> +done < share/buildroot/sdk-relocs
>   
>   # At the very end, we update the location file to not break the
>   # SDK if this script gets interruted.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
