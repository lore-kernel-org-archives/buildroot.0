Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF53C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5126084D;
	Thu, 17 Sep 2026 09:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnC3sOU7Uvvd; Thu, 17 Sep 2026 09:22:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F23E660838
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636926;
	b=Ha1BzE9xIhir6vyc/aW7AyOuWeUXVBDRYL/B4+5bF5UPWGr69wNBGU00e9oOqUK76Deg
	 m76SAYlJaviPxeiupcSzbXZzwj6nRrMot7mwaVn2iy0g7Tidfv4SqM9kicjgEt767msGw
	 qgzIehc5Q62WYAx2C0pynVIB22/dSZttpZfEzjf/i9YEJoRtFW9IJ1dxds4jPMFP6zpNv
	 fEQcdn2m5SjxX/k8jVvREdUNu4jlYuKPIoOHoeh5TqvIEugqQUAwPViWeHBAd7BJUn355
	 hrbbu8jUTULHdTSUfF2qZgLmPeQnOujW2Pu9VFjPgjPI8qlE93bYr7vZtMvfbpa0P8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2KDU9IKcC6z9hmJactTMVEjQi8irfF9+edbl5vCmjiI=;
	b=Zq//W13OelNzjcFNfoPc/T70acRpq8zrEJhN3kPBF5twjjBRVaHmfFSTuiTHWMDifQdw
	 d9P4V5o2bkskhUD7YR84It6MO9mRbN50TYqxRf5HQOJmLyK0AXldC5Z5emUCp7xD+HENf
	 q76EHcdnTFAuI7sjex9B28QwIIK99QmJTbo8Bnu3FBAeUyhJn9QI+KG1u0rjDfJ42Uz+W
	 mR6h9al0SbR5VSxYVQOOTp0/yOhKmopulNNXrTR7SU1DQGN6OGJixgvGdpp3I4bYw2mxr
	 ygOtaQAkNPjisShWCKFNcDPxQ5th31ONpoKzeB45m1oKsyNSYFw9Pd4ARgz5dhFvJTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636926;
	bh=2KDU9IKcC6z9hmJactTMVEjQi8irfF9+edbl5vCmjiI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WC/EI13O2hyXICNGb8yJBfwkye6wXgvbM/Db5M8xaGMD4ocrTSmH/VzlacBeOHqn0
	 HDdgv/9HWVLiUHhL+h+C15nY6a+t+XUk0W1Ey8IXVfF9/yUYwvX+4NcS8n+N4EGFCo
	 O8+swGkg6LmTavKIPE1jgz5ihaD9Y7vFIQDMmIDv5f2wP0TcnTR1LFBQUUOHXWoT+P
	 CkvP+voRFAvuqsCMRgqEhaS+DMnDaM8UC+FJS+juH7n7FXVo6DTKhxMwQUToleLcs7
	 dTaDY7XGQquPf1uOsJ6n7/Qnch0wJ4DV993ggJNQcZ9fXBsJSbgLw8s/TzUXPmAt9a
	 10DGDDg4W/xHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F23E660838;
	Thu, 17 Sep 2026 09:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0443B362
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9FD360838
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5qNr86Jcyaa for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B143C60835
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636922;
 b=jcvAy53dtdFcIcDTz9zmccEvXryXJvANkP19v5yleNkoHorKrBkX7H9OszK6kdHnT6L+
 zFMWnNeDMfptDpULGI7Uga2T/kbroSxRQkS5wXdvh1wnmdoMvENq9LMD5jC6wsK0Pvhbg
 cU0bmhZLbOaLZU+3perX+6/QRXzEgPga3QXyjmVDPm609kovWN0VlDMdFxe3+SMKAycoe
 1mYRzjTmsEaWJ0mxICoTs14zWwM2mECM93s8QwLPh2/bqmuD91h6ih0D3FiwM6mkodGc5
 JlxaMOkk3HwluUi3zdIdZQv/arWmsBGEVfWRv34fLpOo+iRVYEEVJ5QyaHnpywvbjBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636922;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=nGHRMpYNpMwizc/b/tGYAgH1Pu1oE13uAUW2/FFMuHk=;
 b=YhqNzXzCnV8sYsHrqxNW1pn/o9YlD/Pcyjf0qPSMS4hqaeIcdvluP55ImkueSSdmbccv
 Eua6fUHEtH4RinMwQHjyPOAkaswQCW681MBoIb0eatJ/WLh98xuW526THdsrxcPVLAFy2
 M7OTEx9r7GZXnDQ/RaJbSKPWqjQj4EEr1FgtclasskvGodAUPldupwQZWTRXzsxVPi3Uz
 faB4tD477HzvaUIMo1ifz8yuUoVaIGLxFInSXcxJBvJ6/F1YaOMuNo2rDHFeKMmMiurKc
 fIzCoxaocYycf5OSjtdtp5SF/uglvJp311YC2yzhZdsYtTXyVq/9nP6nCaXq6rmyEfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hTlfYQwD; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B143C60835
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:22:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D5623C5CD6F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:22:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 851345FAA3;
 Thu, 17 Sep 2026 09:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAB3611C7B02B; 
 Thu, 17 Sep 2026 11:21:57 +0200 (CEST)
Date: Thu, 17 Sep 2026 11:21:56 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <aquxJw96FSFv-3NF@windsurf>
References: <20260917075326.1256294-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917075326.1256294-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/3] package/qemu: fix x86 CPU variant
 exclusions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 17, 2026 at 09:53:23AM +0200, Yegor Yefremov via buildroot wrote:
> Yegor Yefremov (3):
>   package/qemu: drop x86_core_avx2 exclusion
>   arch/Config.in.x86: add BR2_X86_CPU_HAS_XOP
>   package/qemu: host-qemu does not support XOP capable CPUs

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
