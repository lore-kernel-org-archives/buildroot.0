Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1D6C5B54A
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56020406EA;
	Wed, 28 Aug 2024 15:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpWcmKN7tQ31; Wed, 28 Aug 2024 15:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E85406EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E85406EC;
	Wed, 28 Aug 2024 15:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 106181BF2AA
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F291A607A6
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 15:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5o_HLHVwUTM for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 15:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C04BD606E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C04BD606E2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C04BD606E2
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 15:40:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E801BF20B;
 Wed, 28 Aug 2024 15:40:18 +0000 (UTC)
Date: Wed, 28 Aug 2024 17:40:17 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240828174017.3862c155@windsurf>
In-Reply-To: <20240828110647.150583-1-roykollensvendsen@gmail.com>
References: <20240828110647.150583-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724859618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Rhzid6mjG08dlZtg+M5K/3wrRLlLdOyONsn4+xAoMQ=;
 b=loVADjV1epdGR/OEA7i81DROH8tGbPYfz79dxUnjyM9nEKM3uk+OivAKe4N+2Mvf8MyQcB
 nNfNrVIzjUFoyixdCtiDhXCbL8PW/tsVxvEQBSTXmG8i1kLJqHmUfsl1odnmcCsCIoWCFb
 A//ZpYYweNZ9tF2k9j0nzuQsP/GZNXeLnMMZAOQJvxgzDl76b/7H6zITUQRfIhHRDOA35r
 4NgHdEzk0EaH3qsfwanXYzwBzlxO8fEFGOm27VOsDBLpBy10mVVi6QRGICwvokiEphoonb
 MwGIYThapjgGYj1laYqK/D01bukQOUtAL+ZqAuyzzngS2YDQYP0oanXS8WjdQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=loVADjV1
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: fix license information
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
 Jesse Van Gavere <jesseevg@gmail.com>,
 Andreas Naumann <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Wed, 28 Aug 2024 13:06:46 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Do you have more details? There's no commit log, and it's just a huge
change in the licensing. It is based on what?

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
