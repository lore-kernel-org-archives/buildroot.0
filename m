Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA74D6E2DB
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 08:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E4285488;
	Wed, 20 Nov 2024 08:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7YQWtFee2HA; Wed, 20 Nov 2024 08:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0941785489
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0941785489;
	Wed, 20 Nov 2024 08:45:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 175EE970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04E4F4EB90
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LP93uqoSsCH for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 08:45:16 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Nov 2024 08:45:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B0414EB7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B0414EB7B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B0414EB7B
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:45:16 +0000 (UTC)
X-CSE-ConnectionGUID: XIAZYeZQRDSb7WuAFqk8+w==
X-CSE-MsgGUID: vuqqikzyRl6CMmsiXD64Uw==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:04 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 09:38:03 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 20 Nov 2024 09:38:02 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 20 Nov 2024 09:38:01 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.12,169,1728943200"; d="scan'208";a="224535704"
Date: Wed, 20 Nov 2024 09:38:01 +0100
To: Simon Richter <simon@sinic.eu>
CC: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zz2f6UeSKuyrpZuJ@yd-6wlzhs3>
References: <20241120073755.17583-1-simon@sinic.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241120073755.17583-1-simon@sinic.eu>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1732092317; x=1763628317;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=tzp3ygwfG0N1D+cXZmwHqaZBAGJ9om8MYcHMgaZ1VVY=;
 b=KiFDE38vrzY06oNig1/GEyXLS9jwVD7wKA7C3sHGDEjdPPaCZ6axQ99z
 mZ0Kwp3jFtrOh6hMwW1bL9s45KJYmnposI5dqflukPsNHJDIJBVQt+yT9
 cgd19+bcLBciYzRUmvIHNYTTq4AEJRjUN/8XFALGbmCVmjxGI+wOCqu3G
 yst2mtjOq2FfVkIxrg2lt2V3cv85Q4aGc05uDwpFQaW1Z0RUeEPy3hH/8
 xa9Y4IBHWzA33cU8RkJ2ml58Z6d+fxXNwdqklt5G8e6vx7ju8NICtPE9p
 m7IMItS0MjXkdASiRYQj1seW17Hs3Nb6DA+dYD82hpoEr119GUrKQ1tFJ
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=KiFDE38v
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simon, All,

On 2024-11-20 08:37 +0100, Simon Richter via buildroot spake thusly:
> This allows <PKG>_SOURCE to contain characters like `&`.
> 
> Signed-off-by: Simon Richter <simon@sinic.eu>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9ec84d0f45..96cc5a1d25 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -176,7 +176,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  # Only show the download message if it isn't already downloaded
> -	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
> +	$(Q)for p in "$($(PKG)_ALL_DOWNLOADS)"; do \

What this change is doing is basically make the for-loop useless.

$($(PKG)_ALL_DOWNLOADS) is a space-separated list, that may contain more
than one item, so it must not be quoted.

See for example the cvs package:

    $ make defconfig
    $ make show-vars 2>&1 |jq .CVS_ALL_DOWNLOADS
    {
      "expanded": "http+http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13.orig.tar.gz http+http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12+squeeze1.diff.gz",
      "raw": "$(CVS_MAIN_DOWNLOAD) $(CVS_ADDITIONAL_DOWNLOADS)"
    }

So, this is not the proper solution to your issue.

Indeed, having `&` in a filename is really asking for trouble all along
the way! :-/ As this is a downloaded file, have you tried URL-escaping
the `&` with '%26' instead? If it works, that would give a one-off
solution for your case, but maybe we need to handle that in a generic
way (somehow)...

Regards,
Yann E. MORIN.

>  		if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
>  			$(call MESSAGE,"Downloading") ; \
>  			break ; \
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
