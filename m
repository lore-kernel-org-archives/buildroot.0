Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE55E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 07:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63BD60833;
	Thu,  2 Jan 2025 07:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fX57K5fkK09B; Thu,  2 Jan 2025 07:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA29D60849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA29D60849;
	Thu,  2 Jan 2025 07:32:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B3CF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 07:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0092C40713
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 07:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24kI8RUq-WIt for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 07:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72D6F40708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D6F40708
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72D6F40708
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 07:32:13 +0000 (UTC)
X-CSE-ConnectionGUID: kGRtRl30SQKhw8ra/SBx2A==
X-CSE-MsgGUID: wIcn+gl7TdSpP9acgfvmFg==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 08:32:11 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2025 08:32:10 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 2 Jan 2025 08:32:08 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 02 Jan 2025 08:32:08 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 7yc6ydXJTyeGQNWz+yHo9Q==
X-CSE-MsgGUID: kAWtMeDtQCGIsz118qqsvQ==
X-IronPort-AV: E=Sophos;i="6.12,284,1728943200"; d="scan'208";a="234691402"
Date: Thu, 2 Jan 2025 08:32:08 +0100
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <Z3ZA+DvZocfr5Jok@yd-6wlzhs3>
References: <20241227130231.862029-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241227130231.862029-1-ju.o@free.fr>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1735803133; x=1767339133;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=BARvoxSeIXQXnFN2Ei2QW8WRmPjPRpdZcbX8qlCoZQI=;
 b=O0Wx6cTACBQcrt2CHU0037yN/Yoc3+SKt7cAnyOSJEPI5dRrduyXc06B
 2FOCdu+3FUxRvaQO8DCARik/lIABxozAnqMHysMGM9iDbf+84M9EEn+Ok
 NEZK9cvJLaZ3imAM7VERy3VBz97LiPrViCZWdRWOujMKXnITc42ugli3B
 4oCapQ0VQ/jXYQC/W91UZQ404xxLniqC8ZgKkfDVvIk88XVjEa1Sk/TYZ
 5afCyOMMJ0dPH3p7MFuLrRNnS7FCIt7CdZi7jh5KUtYzzvzNFvFOzObMn
 3gdwfGps6DCO0q4fC7DCOoU2gH+PDVEf2sAPO5WjsliHrHKJ/UiNIFpU2
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=O0Wx6cTA
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new usbip runtime test
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

Julien, All,

On 2024-12-27 14:02 +0100, Julien Olivain spake thusly:
> Commit [1] introduced the usbip package. This commit adds a new runtime
> test to check this functionality.

I'll run this here later today, thanks!

In the meantime, here's a preliminary comment:

> diff --git a/support/testing/tests/package/test_usbip/linux-usbip.fragment b/support/testing/tests/package/test_usbip/linux-usbip.fragment
> new file mode 100644
> index 0000000000..592f461145
> --- /dev/null
> +++ b/support/testing/tests/package/test_usbip/linux-usbip.fragment
> @@ -0,0 +1,5 @@
> +CONFIG_USB=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USBIP_CORE=y
> +CONFIG_USBIP_HOST=y
> +CONFIG_USBIP_VHCI_HCD=y

I totally missed NET and USB when adding the package, so I sent a patch
adding them:
    https://lore.kernel.org/buildroot/4b86d26a5cb2a78995974e86fc69b4ac1fe3d351.1735802949.git.yann.morin@orange.com/T/#u

I left USB_EHCI_HCD alone, though, as devices may have different host
USB controller.

Regards,
Yann E. MORIN.

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
