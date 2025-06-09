Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF2FC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C1761134;
	Mon,  9 Jun 2025 14:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZdD9ox_cYoA; Mon,  9 Jun 2025 14:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A726661221
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A726661221;
	Mon,  9 Jun 2025 14:23:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62AE11F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49135411C8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlmEO2SGEl1y for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6856540E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6856540E0D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6856540E0D
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:23:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1570425486; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:23:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOdPb-00EHYP-35;
 Mon, 09 Jun 2025 16:23:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20250608110058.15627-1-ju.o@free.fr>
Date: Mon, 09 Jun 2025 16:23:43 +0200
In-Reply-To: <20250608110058.15627-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 8 Jun 2025 13:00:58 +0200")
Message-ID: <875xh59eog.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=L2wuDj9X/WhetZZ/uA3serM6j/NcUJ7GzaAIlGXKJZK1RVu9uu+wKHV91EuvULgPIPLZC4L3+e8SkOfDSlPy5S3jg91Cy9Mi7NUx4DR7KxKkACbhXAeRrVAjrgi+js/9VlBT6liP78HoZWJuomhCjs1lfdBuUEnJdTb78i/2TzRj0uAqqyD678tXk/vmEfihfUNeCB1w4d4y4n1omKHnE0EkxoUn8QbILS0E+hYGGQE/A5AqQno52116WovTkhKbTojzxU3MVCkkMTDN7hReSbxd/l2km0fKwv/50ylVCJ35TGDpbJNxZ91WsppQlaTshInZtWoCE/JmvvTExWf3Ng==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=3ULu0PejXJqTcp1+yf+eOcgqlg1TiBePgtKRZdwfkCI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=L2wuDj9X
Subject: Re: [Buildroot] [PATCH 1/1] package/mender-update-modules: ipk
 support depends on MMU, wchar
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Since its inclusion in commit [1], the
 > BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK config selects
 > BR2_PACKAGE_OPKG without propagating its dependencies on MMU and
 > wchar.

 > This commit fixes this issue.

 > Fixes:

 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPKG
 >       Depends on [n]: BR2_USE_MMU [=y] && BR2_USE_WCHAR [=n]
 >       Selected by [y]:
 >       - BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK [=y] && BR2_PACKAGE_MENDER_UPDATE_MODULES [=y]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a474642fdcd8c69e12126bbe8304479aa855d916

 > Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
