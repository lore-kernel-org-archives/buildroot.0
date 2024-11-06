Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40D2D59F7A
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE97040585;
	Wed,  6 Nov 2024 22:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1d91gHgwBn6; Wed,  6 Nov 2024 22:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC12406AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC12406AE;
	Wed,  6 Nov 2024 22:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E780B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B17840716
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IJK-J4ggQ0e for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 147FA40585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147FA40585
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 147FA40585
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:28:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E36A1C0007;
 Wed,  6 Nov 2024 22:28:34 +0000 (UTC)
Date: Wed, 6 Nov 2024 23:27:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Kellermann
 <christian.kellermann@solectrix.de>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241106232740.7a852014@windsurf>
In-Reply-To: <20241105181142.1421388-1-james.hilliard1@gmail.com>
References: <20241105181142.1421388-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730932115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIFi1CTzC6IQxOwx/H9glqqBp7hXQ+g7OSPEt7cAwBQ=;
 b=Fir8fZlqDVKeYH0dEWMO5cuxGoZSyU9KaRTndNCwGyJEZzAcRbswIICCquj3KAgDqCQJUi
 r8FhTyV2db7MRHNb3Z/sGz7So/r5RkPigfzysvD1fkKBDIhk3Blro5bITEMLpQhtAzYkbL
 dNJTgRXknutUxHGFYI5dF7rXab8uHfW0gyGSwpxlJRjegPLroWVbwrhT7qPwthdvEhnXy1
 +VXfBNAexpaqnxcuoXtirg4dpDZg1GrJTzmGamGTSthTKYFMAemtduwZx9wfP6SOpO+aQq
 AcyI8MSlcK5YZE4CoRQ4h59UjZrmQMU0wHmiGOR6g9OQFklyYnmMrHa0gS+LtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fir8fZlq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pylibftdi: use poetry
 setup type
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

On Tue,  5 Nov 2024 11:11:42 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pylibftdi/python-pylibftdi.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

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
