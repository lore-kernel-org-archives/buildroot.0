Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F353C5B555
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460BA61638;
	Wed,  4 Jun 2025 17:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cI5ce0dwpw0L; Wed,  4 Jun 2025 17:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4FF6164F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B4FF6164F;
	Wed,  4 Jun 2025 17:17:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23AC61A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20EFE41FC1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNIYmqqmjLIT for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 733E341FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 733E341FB4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 733E341FB4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:17:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 097511C0FF5; Wed,  4 Jun 2025 19:17:29 +0200 (CEST)
Message-ID: <6b262bfd-61aa-4413-b3db-9739b5046ba9@rnout.be>
Date: Wed, 4 Jun 2025 19:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, buildroot@buildroot.org
References: <20250403044747.322647-1-hayashi.kunihiko@socionext.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250403044747.322647-1-hayashi.kunihiko@socionext.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749057449; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lriSUBdhcIcQRgIvAK34xpBoImJApTXwXtSlf5NeA3M=;
 b=QCjr+76eRKFJWLjw3qgi8h/nLNswPzNTqzqG4CEkrGumeWrth9m8j0C4Py9mS9i4o5kLal
 JN2X1DGqygXOfymtiOAowSIBJkCiLeg0rl1nXNvpdadClYRztdAJOKwpNAz7iOkaMqt0SW
 O4RoWM3EkeF/NrzaFJfhJXtokCd1kLzmwt9gQZqdijpaxBJT3D7NrCOJUdh46/lxgMaMVI
 tsXx7xrIUvHyE6Sv8hGpthOvEqlU272n+8G02lzg5MeMqLEBbW2o7y3Q8Ty7zpgpX4eokZ
 pPqW9X2/P6AmNx3q/9zc3HJJDp5FTuO15sZwp9sbEICDzM7ienWjcbFOCMHjjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QCjr+76e
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: remove absolute
 path of link source for fw_setenv
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



On 03/04/2025 06:47, Kunihiko Hayashi wrote:
> For portability reason, it isn't preferable to include an absolute path
> in the link to fw_printenv which is in the same directory as fw_setenv.
> 
> Fixes: 42646265d5dd ("package/uboot-tools: add fw_printenv to host uboot tools")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/uboot-tools/uboot-tools.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index d897a6bc17f4..1925047ccdcf 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -220,7 +220,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
>   	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
>   	$(HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
>   	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(HOST_DIR)/bin/fw_printenv
> -	ln -sf $(HOST_DIR)/bin/fw_printenv $(HOST_DIR)/bin/fw_setenv
> +	ln -sf fw_printenv $(HOST_DIR)/bin/fw_setenv
>   	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
>   	$(HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT)
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
