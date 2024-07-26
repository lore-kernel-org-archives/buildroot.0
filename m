Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D7C3DA7E
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 06:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863FC406C4;
	Fri, 26 Jul 2024 06:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6iieHnf6-cS; Fri, 26 Jul 2024 06:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626FC4098A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626FC4098A;
	Fri, 26 Jul 2024 06:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC781BF83A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 497E46070C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPX8O7Ceic34 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 06:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2559760634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2559760634
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2559760634
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 06:43:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC3131C0003;
 Fri, 26 Jul 2024 06:43:31 +0000 (UTC)
Date: Fri, 26 Jul 2024 08:43:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240726084330.1c5c22c1@windsurf>
In-Reply-To: <20240725195053.2966114-1-bernd@kuhls.net>
References: <20240725195053.2966114-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721976212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DA/rCAKfdCxLlrJSqYAI7JtWCOCH2qrmrmh35U8k1uw=;
 b=Yqzfp+OOBPM1xicrQCVKORxLKZsfk3Hh2bnh6sq+CmYrKL/2N0rEDwuTKlDQR8u7R07HMO
 2vEMFgu/LmDvM19eY26EinKcpJYpm+L5lEAbmCodQUQUXtK5B0t0Tn6q9aBxcnW/OKkev0
 eXeZtTayiGI4dUh70D5fOJXq0tNbleJYsKV3F/s91NbFAa1SjHlmAknbAz49lXu7Em7v+r
 uvA9qkMROGnmg5Mz4MvyJkTnsj0MjSZan2J/2AFCMzbaI0FCuvdZYlkFYo0NmfB6+dv6Tr
 GWZVdjZvNlyBwC4ksBxsYvjqJg0qo6cnGWktVNlLhiUh+vb1EL6jBSrDe/vJtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yqzfp+OO
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.62
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 21:50:53 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2024-40725 & CVE-2024-40898.
> 
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.62
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
