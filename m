Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F0C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED689844FD;
	Fri, 12 Jul 2024 22:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJ474S8ZvxEG; Fri, 12 Jul 2024 22:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F118C84500
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F118C84500;
	Fri, 12 Jul 2024 22:03:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129681BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3694845BC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATl2cuGLzcq2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:03:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8D6B844FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D6B844FD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8D6B844FD
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:03:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBD351BF205;
 Fri, 12 Jul 2024 22:03:36 +0000 (UTC)
Date: Sat, 13 Jul 2024 00:03:36 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240713000336.501eb3b0@windsurf>
In-Reply-To: <552ccb1d-1be8-4ec0-8ea4-70d2de771cdb@bubu1.eu>
References: <20240215224614.3028380-1-kadambini.nema@gmail.com>
 <552ccb1d-1be8-4ec0-8ea4-70d2de771cdb@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720821817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdhHgvMqg9RhTzkf1jy3+30j2g5yxhy1X4SkKmWPvUs=;
 b=IPN8VH7GO30EC/cu+RBA1CSPBJA2sWZpYVjWyqqlGCMYAIjFErQbpdu4c8UHJoLyoeCl4f
 94Ur7eBcorRoYeFRVdQy5DmAkbxN0afpp2nVhUlPoIyRU7uzbiGMtXa/6lfsi6rEjE2oah
 ThpgE4BZQ4U1ykpLFmkKDnJ1y61fgrqFpjaafc7QAITnhOuw6M2+LNwOQesWtDqTkeEkh4
 e+4631E3eQiIQZ1VDjhqdrh4/5kyxbd8sd4JmEytY8+e/AjWQW4Tg74QJQDw69/hv7WAwi
 2DgVy8oA55Umd+shrrSY2y06IfO68orhlbj+4V7u1Utk1j/api/6JGxH/uuqsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IPN8VH7G
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump version to libuv 1.47.0 and uvw 3.3.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Kadambini Nema <kadambini.nema@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Thu, 22 Feb 2024 14:20:02 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> I think one patch per package update is preferred for buildroot. If one 
> update depends on another one, these should be send in one series, but 
> still as separate patches.

In the general case, you're right, but libuv/uvw are kind of special,
as the comment in libuv.mk indicates:

# When bumping libuv, check if a new version of uvw is available
# and bump it too.

So we do expect both to be updated together.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
