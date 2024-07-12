Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BADBC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E30D412BD;
	Fri, 12 Jul 2024 08:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOBVj-AOyrRk; Fri, 12 Jul 2024 08:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54ABB412CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54ABB412CE;
	Fri, 12 Jul 2024 08:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D13D1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC1760AE3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utx1T5jQUyJ2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4C72608C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C72608C3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4C72608C3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:47:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D64EE0013;
 Fri, 12 Jul 2024 08:47:22 +0000 (UTC)
Date: Fri, 12 Jul 2024 10:47:21 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712104721.329c2b9c@windsurf>
In-Reply-To: <20240625211847.1419944-4-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-4-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720774042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcQCvbWQ9IvGJjBbc/BXTGyAmXJ+ylHQt4hFFmDcMnE=;
 b=aZufg0IWFHANeXkWh1JWvqoUYREYqnRNorzkKC/pZ6YZ6svzDUcCNzeApD2reOs+bhgHgP
 TOpnwuzPgAAPanOWTJdgzvN5pqyjjxybo1Os04X8HrzlSt/I66ApT12Q5tvq2SdWCmewQ5
 Br+SserBoP7c7p9nqNvh93HKMNJjnce79C1+IYlfnZZ5IWJgozIZKGRgDxwEowEd9u+xKR
 RUZM4JBra7DP40gU6KJt589wjRF01Glv+SRUmEJweV4KSJ0Ea2tBQoWbuBBOg7f2+p0Xbl
 TzVRoEFs/FTnUHRvsUDJw7DR2nKN8W0CoYV8bLB65latjXuZRd8qqT74Qf9Ozw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aZufg0IW
Subject: Re: [Buildroot] [PATCH v9 04/14] package/qt6/qt6base: add blind
 option to enable Test support on host
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jun 2024 23:18:28 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> We need host-qt6base with Testlib support when building host-qt6declarative
> with QuickTest support. QuickTest support is further required for building the
> qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
> not available.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6base/Config.in.host |  5 +++++
>  package/qt6/qt6base/qt6base.mk     | 11 ++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)

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
