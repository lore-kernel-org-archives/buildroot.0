Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A81E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 19:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863FF407F1;
	Fri,  3 Jan 2025 19:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZKBtJag72Fb; Fri,  3 Jan 2025 19:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59CD2407F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59CD2407F7;
	Fri,  3 Jan 2025 19:12:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60BE1AF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EE79810F8
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAimi6ncki-x for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 19:12:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E442810E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E442810E7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E442810E7
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:12:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 91296831;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jan 2025 19:12:02 +0000 (UTC)
Message-ID: <e12a7205-f14a-42f7-bcc9-e1d0853c63bb@korsgaard.com>
Date: Fri, 3 Jan 2025 20:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
 <20241228200754.4012273-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241228200754.4012273-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BsjGdh9ekhRL3LWGu02gNU/olo/CFyQKtC12otnq458IDaROyAfI6wSwqZU6G3OLa0nhcVK9NATZog87MvWTCeqx4knM7V5mV4XHJdgNWtsVZDhYF6fWBywMMiDBV+q1SwkfcormBV3Zq3WyHEWvmm5c5k+niYCNBA3/7zWeOrqFZzjn3lYWBC1NPsX1Ce79Cy42L//8NVrrNDj9NVSj0FTyMcdcjYDBeIrcab01NQB77juC6HP7WFdlzvOZ32NfSthy10vLTXZ5sdux2LGb/tSr3zsZ7FTsd1M78+Gm/O9ypFmAthdW+33n+C4Sulgcb973dtYjIi5toXdyoB5EmQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=GxSHkBDwNf9pGwgTc7l0yxnlT2dDnwrfbK6D1UZfPJI=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=BsjGdh9e
Subject: Re: [Buildroot] [PATCH 2/4] package/weston: bump to version 14.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/28/24 21:07, Thomas Petazzoni via buildroot wrote:
> From
> https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html:
> 
> This is Weston 14.0.1, a bug-fix release. Most of the fixes here are
> addressing some build issues with a C++ compiler, but also addressing a
> more critical issue that was causing the gtk4 test suite or other clients
> to crash when using the headless backend.
> 
> Some distros already carry a patch to address that, but in case they
> have not, this would be a good time to update.
> 
> David Edmundson (1):
>        libweston: Send seat name before announcing devices
> 
> EatingSumo (1):
>        libweston/screenshooter: Fix build when __builtin_clz is not available
> 
> Jan Alexander Steffens (heftig) (1):
>        libweston/noop-renderer: Check shm_buffer for NULL
> 
> Jan Engelhardt (1):
>        build: insert missing wayland-server-protocol dependency
> 
> Jeri Li (1):
>        libweston/desktop: avoid weston crash while xdg_surface ack_configure
> 
> Marius Vlad (4):
>        libweston: Move weston_get_backend_type after enum declaration
>        desktop-shell: Don't attempt to re-add the view to panel layer
>        libweston/matrix: Fix narrow conversion with C++
>        build: bump to version 14.0.1 for the point release
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
