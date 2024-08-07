Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71133C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2640D8122A;
	Wed,  7 Aug 2024 19:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-18QV4G45sj; Wed,  7 Aug 2024 19:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EFA8121F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14EFA8121F;
	Wed,  7 Aug 2024 19:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667F51BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 546AB608A0
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_XRBrp0XUdi for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 332E16068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 332E16068F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 332E16068F
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:51:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 248DA1C0004;
 Wed,  7 Aug 2024 19:51:56 +0000 (UTC)
Date: Wed, 7 Aug 2024 21:51:56 +0200
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20240807215156.35ad1fdc@windsurf>
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723060317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5yNrz19NDMU6+ISYXkpIU4mGlVdZVQZkI8DHY5jqxA=;
 b=eTYTmIIFHHsral0meZNUYYqFUb2bfGjsXQvQ1uhYB41Fb+D1dCOtRIcIguYn1xXfLx9Ue7
 hAL6Bmxi5/1PS77brjlEdJ83x0ldVLJLF56Bt9VGypYsbrkzyQ0aVbqedVAnpnJo+R/Nz5
 JlL7MenxptEEe23wJd5SP8XIEplfwZyfLMDbfGVl9IhBoxQvn3vSyYuSKNliSawm85v8ii
 SjlfdbMpkbqFc223KjJTZm2wD70DEtSMyw237txatpB6PP3HZdZVI8gXIJZ7boFzY2Lach
 QvK6hKPe3POmgVoZtfzX7x4X56DOJyCmwxDbwjCTB8mKRSD1H22l7wJ8kkBsUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eTYTmIIF
Subject: Re: [Buildroot] [PATCH 00/18] Update Ejabberd and its dependencies
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

Hello Johan,

Thanks for the patch series.

On Wed,  7 Aug 2024 16:33:00 +0200
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> Johan Oudinet (18):
>   package/erlang-stun: renamed from erlang-p1-stun
>   package/erlang-fast-xml: renamed from erlang-p1-xml
>   package/erlang-xmpp: renamed from erlang-p1-xmpp

I was a bit confused about these patches. I was wondering why the name
of the package mattered, and why it was influencing where the files
installed by this package are actually installed...

If I understand correctly, it all comes from:

$(2)_ERLANG_APP = $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))))

which derives the ERLANG_APP name from the package name, so
erlang-p1-stun becomes p1_stun. Is that correct?

I think it's quite unique in Buildroot to do something like this. Other
packages normally install their stuff into a location that isn't
dependent on the package name chosen by Buildroot.

That being said, I assume your changes are OK, but:

- Why are we renaming only those 3 packages, and not the numerous other
  erlang-p1 packages ?

- Can we separate the rename from the bump?

- We should add Config.in.legacy entries matching the name of the old
  packages, so that the new packages get automatically selected

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
