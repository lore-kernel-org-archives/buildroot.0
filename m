Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3D4C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF1A80E56;
	Mon, 13 Jan 2025 20:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBh0NajM96sw; Mon, 13 Jan 2025 20:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 338C280CAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338C280CAA;
	Mon, 13 Jan 2025 20:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B641940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE1E403A8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZPxRSDFotbk for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33E12403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E12403A5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33E12403A5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:31:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA8CD20003;
 Mon, 13 Jan 2025 20:31:16 +0000 (UTC)
Date: Mon, 13 Jan 2025 21:31:15 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113213115.6e74bfb4@windsurf>
In-Reply-To: <20250113200454.3108562-5-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-5-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736800277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nToQgZ/g4FFRenjIyLpUE8lO7tRMsIYQzgrfeBDQCoI=;
 b=VmWpmvB/o4LNN+8MKqfs375+/OuM60P3gFMT9TtNlbGOLGGn9/Kneycgy8IHUmlqNOhciB
 EZSlAKQp95zV+/abH1x/pm4JFSOuje/ovQTF5AH4jGpYsUPRXRuCcQFGazuvLnWBEzVn8n
 Lr7oWiZLbIhLHQworfUOi5mpfVZ2lIVNJMWWYrJtQVmfZpWGwI/UC91eXlCT54sdfjbiEN
 5fUUnsUOE/ZB1BGM/0dQ0DtTkYnzhZMzQNtb3t90sj9uCqpRZGH3eEQalWv5VW5hugHaBA
 0q0gsRcJHDIGaYh9wJ0MligIhc0+NAp21RtwGCs7r3etIifYBfu+XAbss0ukww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VmWpmvB/
Subject: Re: [Buildroot] [PATCH v7 4/5] package/network-manager: optional
 gobject-introspection
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 13 Jan 2025 21:04:53 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Introspection gets enabled if gobject-introspection is.

Super minor nit: the commit title isn't "ideal", it might make one
believe that the goal is to "make gobject-introspection optional",
somewhat implying that it was mandatory before. A better commit title
IMO:

	package/network-manager: add optional dependency on gobject-introspection

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
