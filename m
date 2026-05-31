Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE71CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 384B660FBE;
	Sun, 31 May 2026 17:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VcIlTe3NjTv; Sun, 31 May 2026 17:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B38D60F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247466;
	bh=f5JMhaOuQ8VkVDkQhBo669Kt3CmBVlXe18rs+8Ahs78=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J5PaUWDMOyC/psewM5JRC2nc0N68P65tCyO4NjGuWmhi9iT1pWYd1BRq3lLYDy5FC
	 m6PAayvQHkrjyyEgXVuW388fv6HdkS0yRp/tiRM4x+X9wUGJKuPLbUoBoMGCU0N+oR
	 S8v5nhElDMpDY89+v0fuiCtytST3aPY0Ug6y5+tuoooFpoYUgicRPcO+np/d9DXRjJ
	 uBYIyJlou2E4+QG7j2YUpffP2U6wvmVXFMbK9gWbrrchA5i3bBmU5ZNxMLP31FWhm+
	 1SVA6WCYWOTucyruePzcv8nLjSbvk3Mt5hiAFb+8y6PQEbZYKu7bnoWVzKPgy5hiUD
	 py92PcKqLoohQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B38D60F9A;
	Sun, 31 May 2026 17:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 617AB2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 530B985029
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7LHxnDtms7j for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D91184C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D91184C0E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D91184C0E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 60E1EC62474
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:11:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B546B60230;
 Sun, 31 May 2026 17:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 977DC10888CC7; 
 Sun, 31 May 2026 19:10:59 +0200 (CEST)
Date: Sun, 31 May 2026 19:10:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ahxrlXQWucRPWMJK@windsurf>
References: <20260531134342.2889504-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531134342.2889504-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780247460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=9rQHV/Pj8Bu+LQXmVtsHBoMXRpgsm/ST01pEFGqYJc4=;
 b=yJg1E3LGwFpeJDGrbi+ymz0lcEn9p1UT1Lq5YyunT3ErjzEDUU9ICu3Wzza78lZqLOR28H
 F8afz+Tvn/bAuGAfYnjmAAkeYsi23kSs4uPztvUYvOs3LPlfesbor8+SYX8FnWwEoICiFQ
 S0EZub1f7pVs0HoM8GDWc9Y1WNtM4yYvugr5yxpUgbsu74xiKe5ymYSx+BT9DQNi6wO+8D
 QSqiiIWY9QJhUPI0+jacIS4C1ogtmS/Wjfv8SjYONCz9XkMIiTTYAF8P76Twm0jFLqTVAa
 tasaDh3+o4tbHn5T+Td+rVRhtnbgsSDFTRn3D/KX7H6HWfuGa/6vl2eoSycJcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yJg1E3LG
Subject: Re: [Buildroot] [PATCH 1/1] package/sshfs: security bump version to
 3.7.6
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

On Sun, May 31, 2026 at 03:43:42PM +0200, Bernd Kuhls wrote:
> https://github.com/libfuse/sshfs/blob/sshfs-3.7.6/ChangeLog.rst
> 
> Fixes CVE-2026-47187 & CVE-2026-48711.
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
