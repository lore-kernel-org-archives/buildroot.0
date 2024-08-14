Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9BC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 19:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5574681371;
	Wed, 14 Aug 2024 19:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYAb3pC0XK3q; Wed, 14 Aug 2024 19:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ABF581C21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ABF581C21;
	Wed, 14 Aug 2024 19:13:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1E8B1BF40D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE78B605ED
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqGMt_lXZTLL for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 19:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 854696059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854696059C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 854696059C
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 19:13:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66AFA60004;
 Wed, 14 Aug 2024 19:13:43 +0000 (UTC)
Date: Wed, 14 Aug 2024 21:13:42 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814211342.393203ce@windsurf>
In-Reply-To: <ZrzwwtPZGEENRwxV@waldemar-brodkorb.de>
References: <ZrysgCNIRtUzTjbG@waldemar-brodkorb.de>
 <20240814195717.43707f3f@windsurf>
 <ZrzwwtPZGEENRwxV@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723662823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CTeP3cqFk0/b2qmPmjsWAYtznLB1H6Lvx3/TElCoMks=;
 b=Xsy8tDTKM5G8GWFojJqXpVBjG2ISL0XHxFjlqT8zikjwPT1iIPjxY8TBEmYv5h6xbGj50o
 liGmtYRtSfUM+SInt/UfpC9f4TlJmrWrD+huDfOyG2PjGP0BHWvOb7vhD7lScrikYI6tnw
 78cO3PAn5ah3K2XQsq7EhASL/gqjZULziv7hNIInVNaTUYbFH6T/RrX/pEZ6pK7p3qmtva
 gpNvS2h2ueffgePyWjPhkC/obQvVMZBmyYofhKwyNBJ7+Xlst5jXhCJFPhG9sn0AajpZNN
 hq6anB/2lREdNWy5h/V4yzbZUy8GSmkNIVQw2iUt4joXmRFdMcj43BWkCdMe8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xsy8tDTK
Subject: Re: [Buildroot] [PATCH] package/libpcap: fix m68k-cf compile issue
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 14 Aug 2024 20:00:34 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:


> > Your bug seems somewhat similar to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028,
> > for which we already have BR2_TOOLCHAIN_HAS_GCC_BUG_104028 in
> > Buildroot. Not sure it is exactly the same bug.  
> 
> Okay, sorry. I was just taking the example from
> package/assimp/assimp.mk, which use a similar workaround for m68k.

I think the -mxgot is needed when we are building a large binary (but
I'm not 100% sure). On the other hand, disabling optimization is
clearly a workaround for a bug.

Yes, assimp.mk could use some love to better express the different
gcc/binutils bugs.

Maybe even for the mxgot thing we could do something a bit more generic
perhaps.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
