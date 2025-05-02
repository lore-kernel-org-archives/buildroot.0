Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB299C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB06140E01;
	Fri,  2 May 2025 10:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB8zfbxmCAij; Fri,  2 May 2025 10:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A9C414BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A9C414BC;
	Fri,  2 May 2025 10:29:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C3B2229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E20C40B1F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwIAlapkq4eV for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7168B40A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7168B40A92
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7168B40A92
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A61601C1113; Fri,  2 May 2025 12:29:30 +0200 (CEST)
Message-ID: <d9ae6ae1-6875-43a0-8275-1fcef03e8771@rnout.be>
Date: Fri, 2 May 2025 12:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20250415192901.3370859-1-yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415192901.3370859-1-yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181770; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GztS7iL/nfaMu9bKQjTbSQLHih3fTVayYN6Pxggvm2E=;
 b=Gv/2Bq0QDqhH6Q0SaqyN3v9YaCjW7q5nGqA2lSuunoBn5lRXehb2GBn2TAnQjcwuS3lN1F
 7ckaC5++pkysS2iN8wXbx8TP91I/rQPIbRnbZPLkxhnqmcnRClIx69TNUaiWaRmbAzL2zg
 m+jP8FHJKnvk+sNJ8mDw+S9H/SBkNCgSnjnSnwLWxUh0MfNJJrVhngTOScdTAWJcaMQQun
 8sDkkVm+zx1LzFAebbywqtamYE9/9VyRj6zbMlw1g0RvCM8vtH8m641zbHRYjuXq/LNpm5
 Fvq5oKftUtWl/VjqXB/lvnL4BJo2qVyijJW7N3d+uChCKakXrN7STFBBQ4LFJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Gv/2Bq0Q
Subject: Re: [Buildroot] [PATCH] package/vim: extend comment about vi symlink
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



On 15/04/2025 21:29, Yann E. MORIN wrote:
> The current comment is not very helpful; extend it to be more explicit.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/vim/vim.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index fb8062e1fa..7d51a6ddab 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -63,7 +63,8 @@ define VIM_REMOVE_DOCS
>   	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
>   endef
>   
> -# Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
> +# Avoid oopses with vipw/vigr (from package shadow), lack of $EDITOR,
> +# or other packages expecting plain 'vi' command to exist.
>   ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>   define VIM_INSTALL_VI_SYMLINK
>   	ln -sf vim $(TARGET_DIR)/usr/bin/vi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
