Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAE6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A064B41885;
	Fri, 12 Jul 2024 10:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_-zkJRowgsK; Fri, 12 Jul 2024 10:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44CB84187E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44CB84187E;
	Fri, 12 Jul 2024 10:03:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D28FF1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCDF660655
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jS-PURHjYCQ2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FC7B60654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC7B60654
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC7B60654
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:03:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B76501BF20E;
 Fri, 12 Jul 2024 10:03:00 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:02:50 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712120250.1620af31@windsurf>
In-Reply-To: <20240625211847.1419944-9-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-9-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720778585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/RZEFcvWKZ2F2/3prBN4aB08XYuSZYKC2oLsGlNq3s=;
 b=Otluqq7woWwOEVht9udDzNNi32K06A6FPpvTDJL7kdIgTI0SiOF9AVFY+NCzuPNzaCCgpc
 /w9TWp7Z5niV8YP5PGMM/KjjuqKgoz7Qr6SGPcqj/iQ69dBPehpQLLLpGjqgUc89k3z6Vl
 uhiFJTCW9KKUFXDCWmRBqVlf8ExLiTbDcVLiclcXMXZ7cRpv/50GcI8KwUZsod/UhpHzhv
 wVA1gZJOsfXJd+aAPu3GdWRS6+2my9M6REmEwKvSBsdDYkmAGucl2M35n8NXXNPwiq5tyD
 ory39v76euBu0svgR6+hTyUFNq/QbQ0d1UYJV8qEkuNBTLBg48R5I24kihil9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Otluqq7w
Subject: Re: [Buildroot] [PATCH v9 09/14] package/qt6/qt6declarative: new
 package
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

Hello Roy,

On Tue, 25 Jun 2024 23:18:33 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Add host-qt6svg to dependencies when qt6svg is available to build the
> required svgtoqml host tool:
> 
>   Failed to find the host tool "Qt6::svgtoqml".  It is part of the
>   Qt6QuickTools package, but the package could not be found.  Make sure you
>   have built and installed the host Quick module, which will ensure the
>   creation of the Qt6QuickTools package.
> 
> Select the host-qt6base Testlib module to build the qmltestrunner host
> tool when the qt6base Testlib module is enabled:
> 
>   Failed to find the host tool "Qt6::qmltestrunner".  It is part of the
>   Qt6QmlTools package, but the package did not contain the tool.  Make sure
>   that the host module Qml was built with all features enabled (no explicitly
>   disabled tools).
> 
> Select the host-qt6base Network module to build the qmlprofiler host
> tool when the qt6base Network module is enabled:
> 
>   Failed to find the host tool "Qt6::qmlprofiler".  It is part of the
>   Qt6QmlTools package, but the package did not contain the tool.  Make sure
>   that the host module Qml was built with all features enabled (no explicitly
>   disabled tools).
> 
> Add patch to avoid checking for FEATURE_ssl when FEATURE_network
> is not available. FEATURE_ssl is defined by the Qt Network module. So
> we will get the following build failure if the patch is not applied and
> FEATURE_network=ON:
> 
>   Attempting to evaluate feature ssl but its definition is missing.  Either
>   the feature does not exist or a dependency to the module that defines it is
>   missing
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v8 -> v9:
>   - bump version from 6.7.1 to 6.7.2
>   - update hash

Applied to master after fixing the license information as follows:

QT6DECLARATIVE_LICENSE = \
	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
	BSD-3-Clause (docs), \
	GFDL-1.3 no invariants (docs), \
	BSD-3-Clause (examples), \
	GPL-3.0 (tests), \
	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
