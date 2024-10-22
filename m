Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E44ECDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDD96086C;
	Tue, 22 Oct 2024 21:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHzs3Ga9zmFP; Tue, 22 Oct 2024 21:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782D560898
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782D560898;
	Tue, 22 Oct 2024 21:18:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE4359F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD2B8110E
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOgQ8WiW7pR2 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47F6181111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F6181111
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47F6181111
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 21:18:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EE58240003;
 Tue, 22 Oct 2024 21:18:42 +0000 (UTC)
Date: Tue, 22 Oct 2024 23:17:50 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241022231750.087561fd@windsurf>
In-Reply-To: <20241022205103.532134-1-francois.perrad@gadz.org>
References: <20241022205103.532134-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729631922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KddlwfmJ1UriLi23Ag9vJtetazlwr4RHr4/jMfZ2LsU=;
 b=XCE/mitfyCW07zUqXwhMjqxwaultPGM6jpzdWT53B+dMhmddu49vVEca0/2qdgMoXaAM+j
 Ma8vsBTqCYrDUok3pd/Oetwb2y7p3ujjrCUz1odacaWELBirFxVYTN+mDx/l5tuE7b+bQX
 Nj+pZsjl/Xltw64gRl+lfzi5PqfFWbr0KhCbgYoV2vQx1B+/9VnFi7AADeODIpn4RO7qSm
 YCRgqZYnW2M7VVoDrDX4yN8RQ/bHJXuebgSQmnDep7xCZ7R/l3vLUgCgHPxwrjKUsoU2Sf
 P9SqyRlCwYAdG1iqozj5ygnB3CCKbEKpv+/aaS3ZrPdZsXx9CwgVQgeUZKojsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XCE/mitf
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump to version 3.7.7
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

On Tue, 22 Oct 2024 22:51:03 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...1-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch | 2 +-
>  .../0002-autotools-do-not-add-iconv-for-Requires.private.patch  | 2 +-
>  package/libarchive/libarchive.hash                              | 2 +-
>  package/libarchive/libarchive.mk                                | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

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
