Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09001C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A642D4016A;
	Tue,  6 Aug 2024 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ai_MUeU64NnX; Tue,  6 Aug 2024 20:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A03D401A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A03D401A6;
	Tue,  6 Aug 2024 20:23:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 195721BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05E164000B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wh7x9PqjW5Xf for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:23:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD81840232
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD81840232
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD81840232
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:23:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D06851BF208;
 Tue,  6 Aug 2024 20:23:09 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:23:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240806222308.2426b0dc@windsurf>
In-Reply-To: <20240204101140.1403357-1-fontaine.fabrice@gmail.com>
References: <20240204101140.1403357-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722975790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+92F8Exh+xO3DdkRP47yh7pHQ4b6tW/eNd9mumDEP8=;
 b=XTUS9SYi6CUYYesb/s1XcBoN2VVfcJQdamzpQ2yNV0496AQDXTv0DlKNQbX5gqfulQZyhi
 gWr13b2VzzAsZu9dUd01fWJE+EQv/lfpL5OFSGFsA2Ix6cCk9F8cduk5MQo5y8Jv47Q8uu
 PGyV93Wm5MDFNN3u+J3SwTWhHs0SKz5Ka/wofmF8BF3yZjgGNMDwBvBNgsrdcv3IrEnghv
 rl2ro88CbE99m3howV5YCZ5xNo49lSsNxKZ0638pVcKmiWDDkRmFdDrrLGIhDfKEXhYl0h
 WoOMlZd7bzD8HebnDtLShcHCJve+44ozEDEZhmowHc5M0zcSKxf506kZi3CE2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XTUS9SYi
Subject: Re: [Buildroot] [PATCH 1/1] package/htop: fix
 BR2_SHARED_STATIC_LIBS build
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

Hello Fabrice,

On Sun,  4 Feb 2024 11:11:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> With BR2_SHARED_STATIC_LIBS=y, the generic infrastructure adds a
> --enable-static flags causing htop to be built as a static binary.
> Adding a --disable-static reverts this. This will fix the following
> build failure with hwloc raised since bump to version 3.3.0 in commit
> 09243186df3168022f0b23b8a9677c6313033769 and
> https://github.com/htop-dev/htop/commit/c8a61850dd31ab64eb8ad83929ce86d2adbeb96c:

[...]

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/04bd5633750ff5cef048ea78c9de043d3ffcfa32
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/htop/htop.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

I was initially not sure about this fix, but in the end, I agree that
it's the right one, so I've applied, with a slightly better comment in
the .mk file.

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
