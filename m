Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1A1C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 474534149A;
	Thu, 17 Jul 2025 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0byPfSibzQ7I; Thu, 17 Jul 2025 20:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C850413E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C850413E7;
	Thu, 17 Jul 2025 20:03:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E34C226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E904149A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUzZUksayqGL for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C26C4413E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26C4413E7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C26C4413E7
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:03:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03A4AB977A8D; Thu, 17 Jul 2025 22:03:14 +0200 (CEST)
Message-ID: <8dca488d-16eb-499f-bb6c-79b172bcbcb8@rnout.be>
Date: Thu, 17 Jul 2025 22:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20250708131418.666495-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250708131418.666495-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=VGSnX+Jtxh7nNrPhG5943lCT9+4051O111AF0AxVTNk=;
 b=g9zii6YgNVjAu6OkHGJxyWjgBTMH4b1nLdit3JZWW5Fx+UzejapXRDltO3dzBig04EtikA
 o8xNLupR/r7xit9EBce7l+Yx7R+643ZtRrFptkbDs9eCDIJwKVy+rVb5yTnFKzT+J+NvAP
 W1unTJ0ERBgdnD60wIDTQ8NuceMybs30VbgZEb8lKA6mSkjfrJGfd4W42QnBHBsp4AbALY
 I2hEjo4ZGY8+GXvcmjqaSsPet7pNIdj8pGdNESd32SU4S9XiKdC/kz8NYpXKxdd0zhrgQf
 6dZ370BFAifHM9WuHHWxmAWkOF5cxMGszuSsoXPLXuohYp+UDN1fA4MRtIVpNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=g9zii6Yg
Subject: Re: [Buildroot] [PATCH] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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



On 08/07/2025 15:14, Marcus Hoffmann via buildroot wrote:
> From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> 
> Since the version bump of sudo to 1.9.17p1 [1], the sed command in
> SUDO_ENABLE_SUDO_GROUP_RULE no longer matches the the line in the
> example sudoers file shipped with the sudo package.
> 
> This commit fixes the regexp to match the new sudoers file.
> 
> [1] ee86844e632d5760355154ea4e928c9228f3dfd1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/sudo/sudo.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 4e1405eaf1..f57a86805a 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -73,7 +73,7 @@ define SUDO_USERS
>   endef
>   
>   define SUDO_ENABLE_SUDO_GROUP_RULE
> -	$(SED) '/^# \%sudo\tALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
> +	$(SED) '/^# \%sudo ALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
>   endef
>   SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
