Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB14C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80FB981045;
	Tue, 23 Jul 2024 09:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IS5r4TV_srdu; Tue, 23 Jul 2024 09:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4A08105C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4A08105C;
	Tue, 23 Jul 2024 09:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4EC51BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90E8960686
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ix6pqG6kkipv for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FB22600B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB22600B9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FB22600B9
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:31:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD69DE0004;
 Tue, 23 Jul 2024 09:31:42 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:31:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240723113142.470c58a8@windsurf>
In-Reply-To: <20240109060128.3974794-5-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
 <20240109060128.3974794-5-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721727103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5u7dTTrqZcBK1qKzbc15q41e4HB7kxc3zuAQLXHFiw=;
 b=lvbRVhg+rsFsyoCgXyel85iUL/+wnr0ljwilt7vZZYNq3vCb00Q0ST7L3Fln/UYoQLwyVh
 fjDuyUCweolRFubLoevdI5MhdMpqI3IBLCkq7XuEyX1WiHijFYcrNedEu2ntJVmbINBJMo
 YVWCnHw9+nslNmJwKxUSUM2MWkD261CgwO75Zv5c2b1TLgrKgorc7lMl9JIZ07vlSytsON
 lZHRitU18IYILcqTHxUotiha3XHCecZVX9IH5k5nfgmp5tCe4veWOzvYbeX0FB/kCqCgnx
 f9fCORKWVHo4LCG5+fpOMSpZlQ3z3S36VeG/g5SzA3TxL+2jgPcfpTO6hGoAZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lvbRVhg+
Subject: Re: [Buildroot] [PATCH 5/6] package/python-jaraco-collections: new
 package
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

On Mon,  8 Jan 2024 23:01:27 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                 |  1 +
>  package/python-jaraco-collections/Config.in       |  8 ++++++++
>  .../python-jaraco-collections.hash                |  5 +++++
>  .../python-jaraco-collections.mk                  | 15 +++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-jaraco-collections/Config.in
>  create mode 100644 package/python-jaraco-collections/python-jaraco-collections.hash
>  create mode 100644 package/python-jaraco-collections/python-jaraco-collections.mk

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
