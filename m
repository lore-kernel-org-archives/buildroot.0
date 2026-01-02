Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A8EEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B634060B68;
	Fri,  2 Jan 2026 17:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkgnwnWm_XvC; Fri,  2 Jan 2026 17:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE1960B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767376616;
	bh=qBIcswToEjubh4ENTeaIbJCRMXN+CVQtOVpNUisEzDU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WGPzX7W06gRSl5nVf87zGWXGToa1sC9a+xsvqtYXRhfBOKhtf3Gek/nwgOAw8a7j5
	 HFIhkq86Ox3iEDbRBruOzzcIv6ex/IH6xCuMNjFwkFkFH3P+ivfjpnMuWkOiBkItYM
	 0JQSHrl8Y3Pg00erAm6MB3frN0MBGz0cE7i9VDUeZy6EUG/sVPVWrpByDr+F5S9wa/
	 ox8hSRTzPLNFgvYbfVKLntQi5MOcJF2+NDyFkm8bi5ZGxUs1n5smzSffy7H4ypvCL+
	 5tH9t/V0qFTheMjMMyJBgwkXpK/qA3tKLikLIAfKPjL9WW+JzYfJO47CxejH3JKOsJ
	 Y7uf7lFPfhEqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE1960B61;
	Fri,  2 Jan 2026 17:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56805D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 492DC80D5E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HoZYKFKfco4 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3915580D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3915580D50
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3915580D50
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 730881A25DC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 47C9A606C7;
 Fri,  2 Jan 2026 17:56:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98F11113B0445; Fri,  2 Jan 2026 18:56:50 +0100 (CET)
Date: Fri, 2 Jan 2026 18:56:49 +0100
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Michael Hennerich
 <michael.hennerich@analog.com>, Philip Molloy <philip.molloy@analog.com>
Message-ID: <20260102185649.494188cb@windsurf>
In-Reply-To: <20250908115200.3295727-3-philip@philipmolloy.com>
References: <20250908115200.3295727-1-philip@philipmolloy.com>
 <20250908115200.3295727-3-philip@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767376611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6gHwS9Fko22EWkKtAPkqWT/CEu8yam0ijKB7K4WLfyM=;
 b=wH5emy3CMnHs57PyAebHETHAhCsbsftlTEGnNqu3SdqlT26v8f1Qhr7DK2gvv0U43eTVxT
 KBwE5rhr2eR/8MlOKsKml4DOZoG6bzPKtMHBipNradkOgtjLS/Gsyc1JwN8rehrZRgdGYj
 ROCpkFw3oVhQk+VOuHF+HqZEzRFWtpGe4sCxmvgKSSeuwcY+Xkeq4xQ7W0N8r5Tl4OEDyG
 /uhqyyjeIhdrQHImt/dEJAmiDUVQruKdzKcTJKc5+75qVLFil8qOszjN2azcfMS/y+aJLC
 or6hNZn4c1RMYcE/kRSopdrts8QpbfkHRsMlzbBMU/AfiqWnpJnfAX6nq6ZMaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wH5emy3C
Subject: Re: [Buildroot] [PATCH v3 2/2] boot/uboot: add ADSP LDR binary
 format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 08 Sep 2025 11:52:07 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> From: Philip Molloy <philip.molloy@analog.com>
> 
> Signed-off-by: Philip Molloy <philip.molloy@analog.com>
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 5 +++++
>  2 files changed, 13 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
