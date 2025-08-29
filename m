Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7451CCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 21:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A97661ABF;
	Fri, 29 Aug 2025 21:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zC37HTfU8CWk; Fri, 29 Aug 2025 21:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FEBC61ABB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEBC61ABB;
	Fri, 29 Aug 2025 21:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A2F69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B71F61ABD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1emr0klxCXzV for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 21:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8501B61ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8501B61ABB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8501B61ABB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:45:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 99D791A0DA7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:45:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6511B605F1;
 Fri, 29 Aug 2025 21:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A93E81C22CDFF; 
 Fri, 29 Aug 2025 23:45:10 +0200 (CEST)
Date: Fri, 29 Aug 2025 23:44:59 +0200
To: David Pierret <david.pierret@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Message-ID: <20250829234459.01a60586@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756503920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=8uE90dTBqRcqZ71Bc+wq8MVzMvzt/yS/1tugNjAEXyE=;
 b=pNW7Cgxs9nhJnYyvH3oj8Oww70L4QtfWxqxAD0C+PkK2OyE/QUH/b2LnM7jX6U+kpTP3b4
 Exoh4z1H0G8iUYzuVKFSMbMg8hNB3DyL2Ee1jf4oxo6PXeLzS7r1JD3cEnJOxjVGccqR6N
 gsHP6Ewo8aqnv3A2bscfSrGgkjz1jjhEng5mrwzWHNAAb+uvC+33WgQM+X6r+OFG7WepzS
 hKSSBLscz1c4ntrNdeLxr7ttS0etzf7QoBiPimgy7UMYQGCd4B+ClhxBnTci8LXiz5iRG5
 iWoIhjL9fHFCLFEpajqePAleboNqdmYm9F1byZNnLiBg1RE2AZgcNvQrlScw4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pNW7Cgxs
Subject: [Buildroot] Fixing the Buildroot 'bat' package
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

Hello David,

You are listed as the maintainer of the 'bat' package in Buildroot. It
turns out that this package no longer builds with GCC 15.x, and you
probably are receiving on a regular basis e-mails telling you that
there are build failures.

See:

  https://autobuild.buildroot.net/?reason=bat-%

Basically, when building bat, it uses the 'onig' crate in version
6.4.0, which itself contains the oniguruma regex library implemented in
C. However, this version does not build with GCC 15. My understanding
is that the onig crate has been updated to fix this issue, but bat has
not been updated to use a recent enough version of onig that fixes the
issue.

Could you have a look at solving this issue?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
