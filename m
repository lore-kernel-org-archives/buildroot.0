Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4758C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 13:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5250941846;
	Thu, 29 Feb 2024 13:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nv7EpWdXBA0; Thu, 29 Feb 2024 13:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 259374183F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259374183F;
	Thu, 29 Feb 2024 13:42:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA491BF33A
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093A54177B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IM_EzxGsR68 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 13:42:24 +0000 (UTC)
X-Greylist: delayed 432 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 29 Feb 2024 13:42:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3162B4027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3162B4027F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3162B4027F
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 13:42:23 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 14:35:10 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Feb 2024 14:35:10 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 14:35:08 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 29 Feb 2024 14:35:08 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.06,194,1705359600"; d="scan'208";a="113012104"
Date: Thu, 29 Feb 2024 14:35:08 +0100
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZeCIDJkn+SbXgndh@tl-lnx-nyma7486-2>
References: <20240229131108.363533-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229131108.363533-1-romain.naour@smile.fr>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1709214144; x=1740750144;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ccHTaB+8NU4925sZldlY8akR2W6UYgbURl3fWap9R9M=;
 b=A3HTKOXdxAyZU3HeZ3Gvj8OHgHhSCDZ6jmh1t15W8yckc4VvXNqUZTbH
 6AO3jri6blKl0rjmTxwurJhTaNZ7eTW0uw+ToKLQ8mtud8LSBIRNpixLu
 9Xn7s3zbUAeoLCuH+BqRV3pVAzGpjj2rD2DY9Dtj7i7QR/JZFjsip1uTE
 eVa3YEkzm20YrZe9ytuyTMyclwvJHFqC31qQOepxw4ygJRfEjPjUpVz6J
 /KHM9UxpCXfLp161O0vaU6N4J4uCU1QioVaGenDa4E2wpU68e/imVPIkk
 M1LorE4aSiy0iBIBNEhn17hDLmYpN1CHbUBRIqPNE8odUnyt3RU8h0QA2
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=A3HTKOXd
Subject: Re: [Buildroot] [PATCH 1/2] package/rust: use host libraries from
 HOST_DIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

romain, All,

On 2024-02-29 14:11 +0100, Romain Naour spake thusly:
> host-rust package depends on several host packages to provide tools and
> libraries but it doesn't take into account HOST_DIR while building rustc
> compiler. Indeed, rustc needs zlib and fail to link if zlib is not
> installed on the host.
> 
>   error: could not compile `rustc_driver` (lib) due to previous error
> 
> If zlib is installed on the host, we can notice it with ldd tool (while
> it should be linked with the one provided by Buildroot host-zlib).
> 
>   ldd [...]TestRust/host/bin/rustc
>   libz.so.1 => /lib64/libz.so.1
> 
> Provide HOST_LDFLAGS using llvm.ldflags in config.toml.
> (HOST_LDFLAGS provide -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib)
> 
> With that fixed, rustc_driver link with libz from HOST_DIR but the
> host-rust build still fail later due to another issue.
> 
>   error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6256881545
> http://autobuild.buildroot.org/results/a6b/a6b28783f29e6b729824bf42679a62f72ad5bee0
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/rust/rust.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index f7a5c0fcd5..c464e77f4f 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -64,6 +64,7 @@ define HOST_RUST_CONFIGURE_CMDS
>  		echo 'cc = "$(TARGET_CROSS)gcc"'; \
>  		echo '[llvm]'; \
>  		echo 'ninja = false'; \
> +		echo 'ldflags = "$(HOST_LDFLAGS)"'; \

But then, we would also need to add host-zlib to
HOST_RUST_DEPENDENCIES, no?

Regards,
Yann E. MORIN.

>  	) > $(@D)/config.toml
>  endef
>  
> -- 
> 2.43.2
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
