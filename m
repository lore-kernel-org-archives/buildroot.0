Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15486C0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC8360653;
	Sat, 14 Sep 2024 10:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPfnNffDjw1U; Sat, 14 Sep 2024 10:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E8E6069C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E8E6069C;
	Sat, 14 Sep 2024 10:56:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03A051BF846
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F37606069C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2ITpYAejkkg for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 10:56:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A317D60653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A317D60653
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A317D60653
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:56:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3910D20002;
 Sat, 14 Sep 2024 10:56:52 +0000 (UTC)
Date: Sat, 14 Sep 2024 12:56:50 +0200
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240914125650.6afe0bdd@windsurf>
In-Reply-To: <20240911132021.2318073-2-christian@klarinett.li>
References: <20240911132021.2318073-1-christian@klarinett.li>
 <20240911132021.2318073-2-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726311412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Xp+lYMflKOGzA3XNjXD+szHA1kTxhLbbVpBDrIVrNs=;
 b=UdZFWC+DN3O+WmAfYlUP3J4f7Z9qZ6J+X7agaimbqoLRt308MeStsKa1fyg5vALBA5IsbW
 +c+cJrFrtbpvHvOPyGhCd4zerXZJhd/ciuoTRvVZHKVH8Z/icKRMCOO8VHU8Re0PvsRNu1
 OjtoLevtbgii8MVpOgeN1s57BtSZD7ZtWtWsexxudAq5DBFxnFIPK9QlAegs4gcL4BV969
 HB6NrJZ29M4pYZDNnEQldLfJDoXTyoc7E7pcyH+1V1FBDKsT9D05uV6zaO6vm1abgiIvjo
 e665t/PlddpsEBRQxV0JaVHKM1uGcndmWwVxdzTerzRYZgs6yAj0Kx074C2+XA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UdZFWC+D
Subject: Re: [Buildroot] [PATCH 2/2] package/qt6/qt6tools: enable QML
 support in linguist
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 11 Sep 2024 15:20:20 +0200
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> When BR2_PACKAGE_QT6DECLARATIVE_QUICK is enabled the qt linuguist tool
> lupdate should support QML/JS files.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  package/qt6/qt6tools/qt6tools.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, but after adjusting to:

@@ -49,6 +49,12 @@ HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
+# When we have qt6declarative for the target, we need to build the
+# linguist tool with host-qt6declarative support so that it handles
+# QML/JS files
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
+endif
 else
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
 endif

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
