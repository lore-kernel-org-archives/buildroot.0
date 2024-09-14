Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DF6C0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 10:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E74403FF;
	Sat, 14 Sep 2024 10:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhLAn2eoMCBY; Sat, 14 Sep 2024 10:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E4640179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56E4640179;
	Sat, 14 Sep 2024 10:08:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7A1C1BF846
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C66C160683
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCtyBsaae9I4 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 10:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86A5F60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A5F60655
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86A5F60655
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:08:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FF37240003;
 Sat, 14 Sep 2024 10:08:12 +0000 (UTC)
Date: Sat, 14 Sep 2024 12:08:11 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240914120811.04cde88c@windsurf>
In-Reply-To: <20240904211049.866640-1-roykollensvendsen@gmail.com>
References: <20240904211049.866640-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726308492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/2qJndaxMyTxBQjVbovrqZICkFAzKpT+UIuE8LFsRY=;
 b=XeA35UgZGCSysV8EKIqnsbFgGncMfPBGo7XI9tiBKZZYjUBu4wuiFNSV0Yrsn3C/4ApTTr
 0nfPz1lKFNL/KT8MgRDY4117f1x4PHr79xLLBO9w3uTRpDnTRuQ+r54yrB+64UJLOcP+XW
 45HeDDgilFavnHfLj/8aNAQM+90pejUKtK6/ZP4beUwtHYYsXDe3meCIFQMlihqCL96KRz
 hquun/CvnZpyLQ/4VM7oNh53+TnJtTAtqHBje2ujevtGZRZUJ5hWFfaAl/sxNYPT3te1yv
 R/AG6zQjcpuV+q7rmPAGPQILVkXfgkgwLOCbducmlqKJbaM5kadJNnZ08cYiTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XeA35UgZ
Subject: Re: [Buildroot] [PATCH v2 1/3] package/qt6/qt6base: allow selecting
 the host print support module
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 23:10:44 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> According to configure.cmake print support requires us to select the
> widgets feature:
> 
> ...
> qt_feature("printsupport" PRIVATE
>     LABEL "Qt PrintSupport"
>     CONDITION QT_FEATURE_widgets
>     SECTION "Module"
>     PURPOSE "Provides the Qt PrintSupport module."
> )
> ...
> 
> And further, according to configure.cmake, widgets requires us to select
> the gui feature:
> 
> ...
> qt_feature("widgets" PRIVATE
>     LABEL "Qt Widgets"
>     AUTODETECT NOT TVOS AND NOT WATCHOS
>     CONDITION QT_FEATURE_gui
> )
> ...
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> In response to:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240904122040.738362-2-roykollensvendsen@gmail.com/

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
