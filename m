Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D201D2AB1F
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 11:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E2160848;
	Tue, 29 Oct 2024 11:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqDyfsNBhEsf; Tue, 29 Oct 2024 11:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ECB760851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECB760851;
	Tue, 29 Oct 2024 11:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E78112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7BB040251
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YE3rhEP62VE for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 11:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 737FF40103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737FF40103
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 737FF40103
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:20:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9519FC0008;
 Tue, 29 Oct 2024 11:20:32 +0000 (UTC)
Date: Tue, 29 Oct 2024 12:20:31 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241029122031.60ab547b@windsurf>
In-Reply-To: <20241029053338.766690-1-fancp2007@gmail.com>
References: <20241029053338.766690-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730200832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48z7gRLhO6G5XgiPODfqgh79a4eGE5RCXKA6VFlF5vQ=;
 b=h/0ccQdgL5XJ9rKZCkLtsBUwTivkk68Sy0FzWAgKlQfOO0hSadSTR0fH/89NgyEpKu/7eL
 +T9kfLc2nydXWARP46CZOeMNqaSQ/WwgE+jEkCaWnU+qwaSTnkxdPV9jIbUOYn/M0ZDtzY
 cj0iPu1fmUkIz9gSwPJ/jGNa+3wAsKFVGbeoJlR8O+ychP6HoDd+mTg4wUPqQJkK555yTf
 8QyPS7BedJGW/DQwHDc4bi/P1xDzne9l3OmWIU9Wl3HMeKg6C03ZsBdmRNyWMNljmZ2h/l
 yPxp/X0PUavrrxS0B/qWzoplRazcV9ZCXHkY6QblTrrqOeHO0F1ki8o3bNn2vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h/0ccQdg
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix build without
 __NR_pidfd_open and pidfd_open() found
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

Hello,

On Tue, 29 Oct 2024 13:33:36 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Backport patch from upstream:
> https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
> 
> Add new configure option, allow disable build pidwait explicitly to avoid errors.

Why isn't this auto-detected? It is really silly to use configure.ac
and not detect such things automatically.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
