Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C0C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5793E60898;
	Mon, 29 Jul 2024 18:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if5dbGFbjggF; Mon, 29 Jul 2024 18:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663E66089F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663E66089F;
	Mon, 29 Jul 2024 18:25:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC44A1BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C794E6089E
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01BUrmxbN2jT for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FAE0607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAE0607C0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FAE0607C0
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:25:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29E96FF806;
 Mon, 29 Jul 2024 18:25:24 +0000 (UTC)
Date: Mon, 29 Jul 2024 20:25:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240729202522.162b7bcc@windsurf>
In-Reply-To: <20240727182611.1866996-1-bernd@kuhls.net>
References: <20240727182611.1866996-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722277524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJSCcBi9O8TIemg1e0guGWUycXxg7E4XBLRchlMRrso=;
 b=bO1tjLxAqFuiXMYOsUW6W3+8aBW47J+qbsutnfkSmr7+vVVSxo8kbV+PyoIAGEw9QK1wQg
 4muZzGOQbdlQIONxMfAUZ8Zcmp6vA2H0m7J/l54AqRZbSgwqWxlBA1X4duU2VQsNA88wPY
 ui9dnHt/ef297lAtrylHHN3ZJw+xyfZknd7GL1nCZTMsYbt1w+fMYcRG+vpMCkvkCEhfBr
 9X2zgkfBER1jT6b9MZro0ePPLUayTjac26zoCywpbZowtfagrsIqyXWd/pOJK0NE7kRDCE
 +Guj1P0kWPWju2axg17E3tPqncD4+k/yziLGPrxHyZSRqfI3sRBoeu1u80MENw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bO1tjLxA
Subject: Re: [Buildroot] [PATCH 1/1] package/rapidjson: bump version
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Jul 2024 20:26:11 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Last release dates back to 2016, project is active so bump to current
> HEAD. Upstream issue to tag a new release is open:
> https://github.com/Tencent/rapidjson/issues/2284
> 
> Updated _SITE due to upstream move in 2017:
> https://github.com/Tencent/rapidjson/commit/4a2f2729f1313a7150d1275185f4888224a48753
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/rapidjson/rapidjson.hash | 2 +-
>  package/rapidjson/rapidjson.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
