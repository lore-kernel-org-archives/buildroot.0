Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AC3C83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 11:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBE441426;
	Tue, 29 Jul 2025 11:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jovG49-EzV1I; Tue, 29 Jul 2025 11:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51AA241548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51AA241548;
	Tue, 29 Jul 2025 11:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D487815C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB12F60874
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7dcLFAy8Q3I for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 11:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F9606078A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F9606078A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F9606078A
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:53:05 +0000 (UTC)
X-CSE-ConnectionGUID: M3bV51/KQ1uISW1Ux7Fzhw==
X-CSE-MsgGUID: wrH8zZV9SbGo8voD1+ImjQ==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 13:53:03 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2025 13:53:04 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 29 Jul 2025 13:53:02 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 29 Jul 2025 13:53:01 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: ujeBYHK8RA6RJqhX8D1EqA==
X-CSE-MsgGUID: aScbVwDwT5iPH5ihBGqFQg==
X-IronPort-AV: E=Sophos;i="6.16,348,1744063200"; d="scan'208";a="316544354"
Date: Tue, 29 Jul 2025 13:53:01 +0200
To: Florian Larysch <fl@n621.de>
CC: <buildroot@buildroot.org>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Romain Naour <romain.naour@smile.fr>
Message-ID: <aIi2HTxHmOPhk7t4@yd-6wlzhs3>
References: <20250714145242.27516-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714145242.27516-1-fl@n621.de>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX201.corporate.adroot.infra.ftgroup (10.115.26.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1753789986; x=1785325986;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=LOBVq5nTXTBXlQUpnK/a28wl9mExkuV4SUwWDanBNfY=;
 b=I8/e7ErxL729/x4PwM4eBMXUOeZ3Id/0y1zSdoNYP11Uge1asFYkbxcr
 Ug9H4jlmtuLBHobqTAyJop5mJjscgZPFJtmhXRyx8etiVzbXnijDxwkXv
 2PY3Q/I1bOLDVX1S8qZe3/0ODoov9mD63Z0oNq6fAFXFfUds03dQ5/1G4
 MvHxqy2JXD6fJMgpS8rT+9CmgVhU7uFlYE/UefTlEaN7IlhgNg9wpuO3J
 QCxJFeBnQzIb9vHhw5/FbyaJ5Z/ESgeBBWuzyWrH8f3jCHaf5Fi0n0YSx
 D0PCM4xCerE0vuTP0XW7BJj/tdMUMgEVpshixXx1G1Grw60M0ZrmS15N6
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=I8/e7Erx
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: make pre-built compiler
 provide target support too
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

Florian, All,

On 2025-07-14 16:52 +0200, Florian Larysch spake thusly:
> All Go packages must depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS,
> which ensures that we do have a Go compiler available for that target.
> 
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is currently restricted to the
> availability of a full host Go compiler bootstrap. However, there are
> architectures like AArch64 for which a full bootstrap is not supported.
> 
> Thus, currently, on an AArch64 host, we can't build Go packages (for
> target or host), because we can't bootstrap a Go compiler.
> 
> However, note that a single Go compiler can generate code for all the
> architectures supported by Go and for some host architectures, there are
> pre-built toolchains available. When host-go-bin was added in commit
> 7b2a164b7460 ("package/go/go-bin: new host-go provider"), the host
> dependency was properly accounted for: It is already possible to build
> host-go packages with go-bin. However, the fact that a Go compiler, in
> addition to its native target, can also generate code for all supported
> architectures, was missed at the time.
> 
> Thus, we can fix this problem by relaxing the condition under which
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS is set to allowing go-bin
> along with go-bootstrap. This allows a situation where the host can't
> bootstrap, but for which there is a pre-built toolchain to build Go
> packages for a supported target.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> Cc: Yann E. MORIN <yann.morin@orange.com>
> Cc: Romain Naour <romain.naour@smile.fr>

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Thanks for the respin!

Regards,
Yann E. MORIN.

> ---
> v1->v2:
>  - Reworded commit message after discussion with Romain and Yann.
> 
>  package/go/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 7e354b3298..a42e37f90b 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,7 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> -- 
> 2.49.0
> 

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
