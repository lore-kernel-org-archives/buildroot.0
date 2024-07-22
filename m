Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C64C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7EB6400C6;
	Mon, 22 Jul 2024 12:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y-ddY0UZYAY; Mon, 22 Jul 2024 12:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BC7640177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC7640177;
	Mon, 22 Jul 2024 12:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE34B1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA9F4401F5
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWc4oNbI3MgL for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76F0440177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F0440177
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76F0440177
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:52:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E497240008;
 Mon, 22 Jul 2024 12:52:37 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:52:36 +0200
To: ~bubu <bubu@git.sr.ht>
Message-ID: <20240722145236.4e7ec0bf@windsurf>
In-Reply-To: <170715461915.13905.5968173515742280918-1@git.sr.ht>
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9pTj8uhD0Xoi3ctQMJO7OjFfmUR/bNxOFAtTVT2TAg=;
 b=Mn9c+4/pqr05J/X4knW2YbdB1tgSYyx9VB2lUHsMXYSeo9dJf7hU0uB2NMwteNFcA81HGL
 Eu65XCysUIi/DQFOQKbD7ULp1IM+KWBTYIuYcfnq2hYbFINlG975YyuhuakWrhsVv4zwKF
 iUGwfI2ztMROrzhwAEQOmqGwnjCL9sP7UM5q3pC5C+AZa5c6sgRVSLnT3zbJ3U1OTMZcGp
 /EG494Oc17ea1oTcPyYLoHCdzdJ6Ji4HDfxAJzcF7ffNDLaBPiT3YmXHZqlrE/15+ZM4QZ
 C1P+Awxcg3EoAENbue/53CrmCaL6DZHEzJF+IaYtHpj/Q40giDQjDaIcqx95+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mn9c+4/p
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 ~bubu <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Mon, 05 Feb 2024 18:25:10 +0100
~bubu <bubu@git.sr.ht> wrote:

> From: Marcus Hoffmann <bubu@bubu1.eu>
> 
> Add a runtime test for fastapi. Use uvicorn as the asgi server
> application as does the fastapi hello world example [1].
> 
> Fastapi depends on PydanticV2 now which is written in rust so we need to
> run the test on armv7.
> 
> [1] https://fastapi.tiangolo.com/tutorial/first-steps/
> 
> Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>

It looks like this test is no longer passing in our CI:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793123

Could you perhaps have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
