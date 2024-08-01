Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58993C3DA7F
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA0184527;
	Thu,  1 Aug 2024 21:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tr1zSRdhzMo; Thu,  1 Aug 2024 21:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E9184513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E9184513;
	Thu,  1 Aug 2024 21:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 837061BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DEE74029F
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQnhAcOL5eOO for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EB4D40114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB4D40114
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EB4D40114
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:48:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 809C320003;
 Thu,  1 Aug 2024 21:48:39 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:48:38 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240801234838.455f3b19@windsurf>
In-Reply-To: <ZqnxLYzxD9Hs2NiM@waldemar-brodkorb.de>
References: <ZqnxLYzxD9Hs2NiM@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRhoEd87wcFD1ZNPJ/e5gZDQvcBZjV3A4tcnU4jxMVY=;
 b=VGqp8xV6womWM1MD+0/pfDKegczatEnaXZqOEkZjUK3JsdLC0jqIfXuMHbcwKXO97dYgqW
 kvF9My1S66d+quGue4qlL3Gi03WJXPBU3YV9hKSoxMz012G/+q9APbQpS1s4I54JFFVpBa
 SXd9mgnomAUwNWAUcl7GMXz3dDHwQJmGRpSpEc2OP1oN0+6YqwhPNwI36bLgCbvp7xNlh+
 jwEXoWLw5pj9SHK6gWXqs8J2U0500usXDcXK44kveLHwcftRJ0/tzi4Xic1iDhi5ZV/lRa
 6aRRraqe4bHN+JPTNCNflM4aM/WwMHGSh/X6/ZkcjZeDLJs9bVNbO6+rZL3r0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VGqp8xV6
Subject: Re: [Buildroot] [PATCH] package/strace: update to 6.10
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

On Wed, 31 Jul 2024 10:09:17 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a ChangeLog:
> https://github.com/strace/strace/blob/master/NEWS
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
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
