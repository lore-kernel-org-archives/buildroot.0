Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D32C369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 15:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92566F5B1;
	Thu, 17 Apr 2025 15:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8Abwvm2ldCo; Thu, 17 Apr 2025 15:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A4A5612A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4A5612A1;
	Thu, 17 Apr 2025 15:50:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF8C722D
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 15:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A057D4172F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 15:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGBP05fEmvDF for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 15:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B83C141812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83C141812
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B83C141812
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 15:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id A324316297;
 Thu, 17 Apr 2025 17:50:43 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id DoewxcK4nEvC; Thu, 17 Apr 2025 17:50:43 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id B6FAC16168;
 Thu, 17 Apr 2025 17:50:41 +0200 (CEST)
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: Christian Hitz <christian@klarinett.li>, buildroot@buildroot.org,
 Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 17 Apr 2025 17:49:58 +0200
Message-ID: <20250417155026.623495-1-christian@klarinett.li>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250218214830.169568-3-roykollensvendsen@gmail.com>
References: 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1744905043; bh=ryeEAYaDLpfCLv9mnNwfedISAEQH5qn+ThZL8
 ODnvsQ=; b=ctv6R/JjTkLCUGB34voThQ1oUVnXzGCXyB22nsLi/I8HhSPbaRrXE
 /Oo1u4EZhylwNcbXfu+bB9l8xwBQaynTA/6c4rsuIQeb/BY038ymXNdW9Q/pb/Mv
 vTIjEZL8YJd/FZpWGrGrRO69iK9g1S33Q79gMZen+HWVCntXxh3LAA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=ctv6R/Jj
X-Mailman-Original-Authentication-Results: mail1.hostpark.net (amavis);
 dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=klarinett.li
Subject: Re: [Buildroot] [PATCH 3/3] package/qt6/qt6tools: build only host
 linguist tools
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Roy

On Tue, 18 Feb 2025 22:48:28 +0100 Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> -ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
> -HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
> -# When we have qt6declarative for the target, we need to build the
> -# linguist tool with host-qt6declarative support so that it handles
> -# QML/JS files
> -ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +ifeq ($(BR2_PACKAGE_HOST_QT6DECLARATIVE),y)

This host variable is never declared in a Config.in.host. So when I select
BR2_PACKAGE_HOST_QT6DECLARATIVE in another package it is not set and therfore
the tools are not built with QML/JS support.

In order to get the QML/JS support I had to add BR2_PACKAGE_HOST_QT6DECLARATIVE
in a new package/qt6/qt6declarative/Config.in.host file.

Regards
Christian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
