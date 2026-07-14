Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198CAC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22334094A;
	Tue, 14 Jul 2026 11:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Gn1yrYbsfZn; Tue, 14 Jul 2026 11:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0143C4094C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784027317;
	bh=jK+Pu3bMhV8zJ2GyT+KT7M3fGW+oWkmW3R1QORP4o9A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i+1FXfl7n4exh9DQEbD2Q6HH4WzC0Xbvf7MjlQWC8760qs+oRokVk9lQSMeIVviDW
	 9+UvoJfHv4cWzx8W/iYM6LV5X6O3jLJJO7gxilUAXeJokxSUCrLNK7f4/vqL/6La9c
	 HrXJAvC0RliQon4ZZEL/65fKdPOMP8deWXNrqFgqmoAixOWDt/0675g4CgoZmE0ikD
	 P2+Uh8aYzwmT89CwXdr4gvEp/GISYtvIgZvBSMz7n+WB/ILZ6EPR2ame67TGJnVx9p
	 Ial1BTYCKe/oMmccnUL7dWRQHEBcl8xJTord42Fzbb6lYH+FrsyYNpDvJ+gg3hiCZ3
	 O1kmxjTGucKAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0143C4094C;
	Tue, 14 Jul 2026 11:08:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1F6796C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 941264094C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJaIUK8pWZwn for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:08:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A522D4094A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A522D4094A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A522D4094A
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:08:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1C81578034D;
 Tue, 14 Jul 2026 13:08:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 13:08:30 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 13:08:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260620150203.4036943-1-bernd@kuhls.net>
References: <20260620150203.4036943-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <5ccccd1ecfe8271b7a4e364083ff6ab8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784027312;
 bh=NtrB9QGzqiLcAPAOybZafzK4CjMc+TzvmpGYaewtAzI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IJ02V2XGFMyQJ/Q6UJMGtkJb24kIKWcKI39Y54CPNBgVa5MZKEzwQNOGJDkLhUMd2
 MkZVMnNOIV0Q9yWRZlswo1VhxET70vxuouoyxi9cTCAUJXqRSNEaBBC5wpDSycDSC5
 y2hZPUTqCvRIP5MRWk7RcZAif/COVaPEEJdR/rI4JTPc5O5wHD4kLB9Gr80C/nxbJu
 +5KdtPluVuurd8kVTWybIsV9TRhaOAbAxYp3Irv2dCh+gVLgy7GGQMCteTDa053fhT
 Btk66Br5845fkOuim0/6+Tcizrb1z3eKCCTCioF9ANyRr3L44yYqqtmWOmSE12clFz
 Ug7Djt6DcwWtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IJ02V2XG
Subject: Re: [Buildroot] [PATCH 1/2] package/cifs-utils: remove NO_WERROR
 hook
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/06/2026 17:02, Bernd Kuhls wrote:
> Buildroot commit 18bd541dd02b153427fb4f010a6426c8e91bef1b added the 
> hook
> to remove -Werror after upstream added it to CFLAGS in version 5.4:
> https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=dc0dd017a856185422d2f3691062737a9e93ecae
> 
> Upstream however removed -Werror again in version 5.6
> https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=74edf24d9780900f3ce15d2403c6e331b031d454
> This version was bumped in buildroot with commit
> 839546dd3aaff56f26536ea7373978e32563c473 but the NO_WERROR hook was not
> removed until now.
> 
> The tarball of version 7.6 does not include Makefile.in anymore which
> broke the build of the package. As this hook is not needed anymore it 
> is
> removed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this patch (only) to master, thanks.
See my comment on the patch #2.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
