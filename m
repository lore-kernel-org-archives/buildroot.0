Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D219D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738B98230A;
	Wed,  7 Jan 2026 17:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZuwstUEqHL8; Wed,  7 Jan 2026 17:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8811182360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808226;
	bh=N+oeOfWu9qQM2YRKETLREhHAxtKTuPKe12wl2oyDB2U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jaZGmj23hpA77u2aIyQPaPv0tq3KSkIlQTTKLV1Fa8cXDBFS2n1Pf9FuJ6bzGn7Jl
	 DRqISntZHLcCloD8FTqaknt571EaNOC6E1x0tBbaB463F4csc2D/6vebisxdIGqlT1
	 tX9kLrqgTK3paBf8hSEFSn32ozBw3MeELYVVWqV3NhW4ukXgY9kpu59y+l16k6u5Ss
	 gfUbeB0lvruYdlUnJxcXm0+dGKG2TDmuqBdHTwlgWn6Q0/s2XmCc+Mqrn8ko8GLw14
	 5cgOJ7Y6D7cUuD+RehaSXHPZ8bX+n9aCgjCwddmrLEp9UFzbhhTuAygQ+8j2txkKEl
	 VDzcnxSlMzUmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8811182360;
	Wed,  7 Jan 2026 17:50:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D75825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13BC5607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grraDdYs9O37 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0456C607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0456C607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0456C607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F895B97A192; Wed,  7 Jan 2026 18:50:21 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:20 +0100
Message-ID: <20260107175020.226254-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-14-bernd@kuhls.net>
References: <20251221223441.185169-14-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808221; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=676sfCYQ4VFi8/bVEXjabJzz1xHVMBllM+Kmo3aqdCs=;
 b=AtB59FRNk9JP12XXx15Nlzxgfl3vNeqOFJqgDJpM8h4ZFdwKE3ddxZGI6sJXdzDjTGqheD
 HjYjhjACJc33AEXjw/xkq8IPNi8TZyTOrkIYx8cXBDu0khRrC0l8ZfnkhM2bIFPhIFJXsE
 ytuN7kVCJMLVIKAmp8xRITTnQz5n/LZrwnYqY1nmJPx2E9/Bo4Tu6J+4VIldtVWUTIZHi9
 aUWUaq63jlA+zseRDNKWN7yGhOZS+o0BERbYeqErT6WdiIOnUb1UdHolvUnyHBsC427TnI
 QK7pyYb8MYrCPO/dagSCRYVIGT5M4eIM2hXqeljamU/ytgJQy+A97xlHOaWGig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AtB59FRN
Subject: Re: [Buildroot] [PATCH v2 14/23] package/python-minimalmodbus: add
 md5 hash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-minimalmodbus/python-minimalmodbus.hash | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
> index 635090fae7..ee688e49d3 100644
> --- a/package/python-minimalmodbus/python-minimalmodbus.hash
> +++ b/package/python-minimalmodbus/python-minimalmodbus.hash
> @@ -1,4 +1,5 @@
> -# sha256 from https://pypi.org/project/minimalmodbus
> +# md5, sha256 from https://pypi.org/pypi/minimalmodbus/json
> +md5  a981b31df61c7dd9fa04d0def72f8486  minimalmodbus-2.1.1.tar.gz
>  sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
> -# Hash for license file
> +# Locally computed sha256 checksums
>  sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
