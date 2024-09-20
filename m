Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3B1C78853
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 15:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A26742425;
	Fri, 20 Sep 2024 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bsgva1NatPXX; Fri, 20 Sep 2024 15:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 144F24263A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 144F24263A;
	Fri, 20 Sep 2024 15:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF061BF39E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 15:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C17D605AA
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8brgztq1xcxJ for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 15:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1570605A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1570605A1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1570605A1
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 15:02:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91B4DE0002;
 Fri, 20 Sep 2024 15:02:44 +0000 (UTC)
Date: Fri, 20 Sep 2024 17:02:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240920170242.68e8ecb1@windsurf>
In-Reply-To: <CADvTj4pXQTNFZ+95H6Hm4euGtKrs8GeJ+-fPCcg6o_9SP+vHuQ@mail.gmail.com>
References: <20240915044131.1398816-1-james.hilliard1@gmail.com>
 <20240915100852.6cfe5116@windsurf>
 <CADvTj4pXQTNFZ+95H6Hm4euGtKrs8GeJ+-fPCcg6o_9SP+vHuQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726844565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+yhK6TDOv/pMX5nd4g5/Ig+yuSfWFz5123t+gMyv3c=;
 b=LuKo87mZSHfjj8s4DLR+OTSn9KFkX3wO+1ZJ5CwQHlMYdAWZD24nKA9rmw8pJAqO4sDnea
 44s4TP4M6kGu39njmEfh6TuMYaFm7lec/4agoiu6tSoouAG2qF4TwuaELDwuCL2MuPloI/
 Mnu1QXn+a+TAi+4fi9l3QtLx6envLOsUj9mPJc9EoWl6cVMQfgGJCbL/394hQ0xtrQPAsp
 maNQ3q2WsxaUGwwflKdArKcq11ciz4OkOJ0EMF8ITteC1RlMR3JB4kHM9wKfO2ctK+E8lI
 YhPStGrNIUoavvVw0q82+0QSDZXw/TDB43YZDLGaqmfd6kiPN1emD5z6FbBItA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LuKo87mZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-daphne: bump to version
 4.1.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 15:42:22 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > On this one you had forgotten to update .checkpackageignore to drop the
> > reference to the patch being removed. Suggestion: use
> > https://paste.ack.tf/bbebd2 as your .git/hooks/post-commit to catch
> > this kind of minor thing.  
> 
> I dropped the ./utils/docker-run part from this hook and it seems to work ok,
> was there a reason this was being run in docker?

Yes, it is important because we run flake8/shellcheck, and they don't
have the same checks from version to version, and the version in our
docker container is the reference version for Buildroot (and our
.checkpackageignore file).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
