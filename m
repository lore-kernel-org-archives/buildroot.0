Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E282CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE25F811FD;
	Sat,  3 Oct 2026 13:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABviF8Ln1fCn; Sat,  3 Oct 2026 13:18:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CE11981204
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791033500;
	b=ryGY1QG5Xl10Y/Etlpzwio71sxFQVEBbXR8c3xRZQZasuAmctzbwnitxXxN8MvuORZ02
	 YVW4pUG8KMZb++J82vRHoE8QvZjJIwriQnQm2rM6lTaO0bsx4ekhBY5W5GlbWDVD80gKd
	 NL7yQDycmLB0pbgRsxd1vNa2HPFDQC5Up9CqDtdioPrach7Phgr3WoWJzHzaZZWF/cuOL
	 fmFDQveG4cSvrbwdZf7wkiBe5J0KiqUhvbUl5WVuvgF68rZ7q5w34ztBJrMRh15bkalYz
	 N6NL5wkjQFfCXrnhbuQ1qHU8py6yN19F1aGPMzocnHXsJL3ChRMdSOxfX7FiFTPbs2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791033500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M4vgYxsb1wRmXKCSZ3r1DvDaSY4WkXPiT6kdk0AdY/Y=;
	b=pnzpTY5Qc/pK/AXuaof+2ksI7IumRSQzZgOdHsOh6yp4aVB9mHeOCwtq8B4X5aAxOCkU
	 Kcq9nZHY1kO3+CQNTOkQz/Xu9d33+ZFTEC8DEVTsCNfqxB9CBPuUqrUsz+p6q85EGc0Ok
	 R5WvErMcbnQci5KoD885jrArf/nXQ0YjM41HnDQsMSUXjYkGNI6TLlGKGWl5Mgpodu/bC
	 QO9h16wIBdXAHAs28vhYMPKRwTV+JwcESG+6+l2kTQJaiBWap5dbUltPE1doVfyIsOeW/
	 QX1oRINqQHKV6YFV4y16sstONcK744aWPruARqRPvvZM+s8X4SbyXNOKKBw3t9ogOAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791033500;
	bh=M4vgYxsb1wRmXKCSZ3r1DvDaSY4WkXPiT6kdk0AdY/Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SF9fE1C9nk4PMY3g9bAYpF11cXrQlD6TQnNxlVuBgzilyyiDBmFhgp3Ex4PjE+nDi
	 4t2MaisTcOvPlIwjJ0DdUuUpy6qU4yTyGw/FcaPD2SLx8pQitznFGzmu8+hkUolc40
	 UywzFnaXs65I3eh6//Y/oPBbc2jzg77KrxE/qbvrO2zIVH4cn6Id/vbwVXth6L4DWT
	 fs2NFR5Er8W/G7YoD0k+geeJLnggYw27F5uSTMtU8OVOsIGqpPZgU1lBnKj7bka9L3
	 wxIoDijd13RIyAEH19vjyVv3y2ykGYJIy1MHUvUt7W/i/rQGNhcTEkCG05imnxo/wP
	 5qvGJ5xlBvHyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE11981204;
	Sat,  3 Oct 2026 13:18:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F0F2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A9D96067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc1OSBhFQuzu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EB766067D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791033496;
 b=hTY5+N2qYAgFRZuF1R8yJ5sxAb6txeJ4Da/NoBcykf6dbXMPBslFhxraYyTHnJKLY+If
 HDV3oDoJ3P5tH4iVD4rf4rE3RLSxbDO6iOsmQW9kqk+UPH0fk+I5nOxLJ2IYEovOZrx2S
 eH6yE4NwPjcMmKVBTb59QGN2k9tsNAO9N8XtG02eDnkkOo4UV89tz4ORXvb+R1GeCo1gx
 7LPph0Chkc7/YVkZiicjPQY7fwR/4QKiE/afJQmQKbqcRSV7GBFdK8FKTbLp9IKMzAZay
 k6iUWb+g5im4TJJ5t/1vIqGY4DRJJE39H2l11D4VbmsTPF1/S431U/PhMgumgjH1USw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791033496;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=3L4pxUJf8ybZVgriYCT0mVGEbfJFsFJnk1E4mqkmjpg=;
 b=S5ulB6Wfjulb6MrBqvCEkRMucuiNn0in++ulG1kh9bmkOPELUUX/KCZyZKwxQHSOhShS
 ceVrO9yqEPeDVJ5u9laTvc08nUe04rMWoTzGRg8x0a2cBJyPjPT3kof9jWLg4tVbXn4Zu
 DUBfvg1Qm7PD4khngc2gOyHtqSY2ADTMrVBKzf1K3gUdHfJbZkakMiL1tU9L+K/M8a+ll
 kYFYzzVVYRDwsEUwZMJCJTNjNHCs4gp48lrPicBLpc9DZylBJFsyXb7ro9wzDEfGeG6Le
 3fXDzjSFaug40t0T3WPOEd5fZUu81WVd3GNOoiy3/5KB9J5A8Knp3xCS42iWRmgR0Qg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="wgQ+/fvi"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EB766067D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:18:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CE0A51A10BF;
 Sat,  3 Oct 2026 13:18:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93010604FF;
 Sat,  3 Oct 2026 13:18:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01DF8103282A8; 
 Sat,  3 Oct 2026 15:18:11 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:18:11 +0200
To: =?utf-8?B?QmrDuHJu?= Damstedt Rasmussen <contact@bearware.dk>
Cc: buildroot@buildroot.org, Tudor Holton <buildroot@tudorholton.com>
Message-ID: <asEAVp1amsQVJIQM@windsurf>
References: <20261002202935.943329-1-contact@bearware.dk>
 <20261002202935.943329-2-contact@bearware.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002202935.943329-2-contact@bearware.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/openjdk: CPE ID for openjdk
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, Oct 02, 2026 at 10:29:35PM +0200, Bj=F8rn Damstedt Rasmussen wrote:
> This allows OpenJDK to checked for CVEs.
> =

> The automatically generated OPENJDK_CPE_ID_VERSION cannot be used
> because OPENJDK_VERSION includes a '+', e.g. "25.0.2+10". NVD will not
> accept a version number with '+'.

Could you add some evidence in the commit message that these are the
correct CPE identifierS?

> +OPENJDK_CPE_ID_VENDOR =3D oracle
> +OPENJDK_CPE_ID_PRODUCT =3D openjdk

This line is not needed, as it's already the default.

> +# Override automatic CPE ID because '+' in $(OPENJDK_VERSION) is an inva=
lid for CPE check
> +OPENJDK_CPE_ID_VERSION =3D $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MI=
NOR)

Also, should the same information be added to the openjdk-bin package?

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
