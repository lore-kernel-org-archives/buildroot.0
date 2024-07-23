Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECF6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F363400F5;
	Tue, 23 Jul 2024 09:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT2Nh3l7kqe6; Tue, 23 Jul 2024 09:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CF0403FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63CF0403FF;
	Tue, 23 Jul 2024 09:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 258D71BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11D42607D5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3BwGrWFV8LK for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E318A60787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E318A60787
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E318A60787
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:27:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DBE5E0005;
 Tue, 23 Jul 2024 09:27:29 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:27:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240723112728.7730ea4e@windsurf>
In-Reply-To: <20240109060128.3974794-2-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
 <20240109060128.3974794-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721726849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8Pzc6eaAKW6i+XZsUkPk0vWUZrj2u8eBB5Pnvu0LEo=;
 b=dal9SvNIYWv1xnC/fnb2gJ7bxkAk7mjtEWSOtSVvPSmvsLwaNyRAHLxCO8X0qy4/oRKlD7
 0gWmhroSNSZIHiq4pXxVjufN73/goc+vbWPBl/uxUXD4gkDz791KujUs7DZ23ed8QcE1e4
 tHyjCOXHRzJIptkyytqS1VcrhVuGLnuhxatWTHgoPKOnutXvPj0Nlu0ISo7s7XWkfH/EYa
 u4Na8L3urFmbzE+5oS6XJM7n1Qq0nGXmlO4gSBxGtc8NFRB6offzzAR9LDT+AfXZx0+0o7
 AEUeCIlYdf1t686lxboiqKmXuI0fgp11XeqlgRDrCpMHzI5ugeNphXOZZp7nuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dal9SvNI
Subject: Re: [Buildroot] [PATCH 2/6] package/python-inflect: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Jan 2024 23:01:24 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-inflect/Config.in           | 10 ++++++++++
>  package/python-inflect/python-inflect.hash |  5 +++++
>  package/python-inflect/python-inflect.mk   | 15 +++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/python-inflect/Config.in
>  create mode 100644 package/python-inflect/python-inflect.hash
>  create mode 100644 package/python-inflect/python-inflect.mk

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
