Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FB0CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C7160EAE;
	Wed, 10 Apr 2024 21:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpqIvG_GIp9t; Wed, 10 Apr 2024 21:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4246660EBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4246660EBB;
	Wed, 10 Apr 2024 21:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6827E1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 543BB407A8
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG6n7mtTAEoV for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28D6841528
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D6841528
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28D6841528
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:46:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B49F420003;
 Wed, 10 Apr 2024 21:46:04 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:46:03 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240410234603.6eb1ed12@windsurf>
In-Reply-To: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
References: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJ+LL+oRsxP7p/7O8wljzIsIPxJV5O0afCSU8fniE3o=;
 b=oUizVvsiRva3Bwd/qA+ECi90sIflZT/qXccMS7UVS6rDjufuoVOSS7duh3xOOTUTkJ52u2
 6UQ1jjo4KPtcOziPfpiv+/jZfJaSvV1sarw9UxIeB+iWIsL0mBCtYUxZR2Lco+PHbPnrwx
 oPfE6d9rN5ayvAUQAs+dZb/LbxlFJA3TH3UJ1YvEJuzvEjwzk7wx41aBqriti6aEf1N0I+
 NvrrtqZbMSDWYJTPdVfeVc7PE1mHtr6SDaDGba1/RSmfyWK4WfLyHoi/jpdPd0p67Qv11h
 P6dMZbTCxKFMp3SCAaPXl0GymtBT+tV7nqKBLnvTQINxS9lt3D36L0Iv1t7kFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oUizVvsi
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2024-03-25
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Mar 2024 23:50:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With this version we can build with Linux 6.9.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8821cu/rtl8821cu.hash | 2 +-
>  package/rtl8821cu/rtl8821cu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
