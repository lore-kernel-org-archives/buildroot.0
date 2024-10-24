Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E86ED1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E96412FC;
	Thu, 24 Oct 2024 20:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcW_2yY3OvHv; Thu, 24 Oct 2024 20:58:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910EC41322
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 910EC41322;
	Thu, 24 Oct 2024 20:58:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B88634960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991CC60BA6
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4f6YIE9_jql for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:58:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7945660B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7945660B52
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7945660B52
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:58:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC2981C0003;
 Thu, 24 Oct 2024 20:58:16 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:58:15 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241024225815.7410f599@windsurf>
In-Reply-To: <20240922025051.2621578-1-nemaakhilesh@gmail.com>
References: <20240922025051.2621578-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729803497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHzRsiGjqKNPTabU6sHP13aPOO9qZhr7Bx43zbh39uA=;
 b=pXiAo0qR4NnW+Hjd/TDDLXkSIsUGOXP0AGVXyDWt0Qhz6FUkN+2zCz9YJtFwQUAL8HK/KE
 GuZZX01tMmpxmnY22cASXzCXsb3E2g5d85/E7dMBJechjCtcAEKQ2NVBcOpki4rVTZQs0V
 FHMIh+Tgo5C7GVv56ZZgSYrGw7JvS4KU3XcjOXU3AF67DKmK+DOmcBnFBg4DNwcTZ8TwDS
 nbeYplQrUtfkyVQfZKva3YnHsL4GlLaXsc+urEUp8Y6MRZbxP0yQ9saOxCIgHIExx1Bkt6
 MycEfTn0siATvmfiBMhQNi3OSAsuSXL8+QIgnz1NsfPS8Onfjq1dXSjltyP6Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pXiAo0qR
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: bump version to 9.9p1
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

Hello Akhilesh,

Thanks for your patch!

On Sat, 21 Sep 2024 19:50:51 -0700
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> https://www.openssh.com/txt/release-9.9
> 
> License sha256sum has changed due to inclusion of the openbsd-compat/base64.c license in the LICENSE file.
> (https://github.com/openssh/openssh-portable/commit/ef2d7f2d3e1b4c9ae71bacf963e76a92ab8be543)

We like commit logs to be wrapped at ~80 columns.

I fixed that up, and applied your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
