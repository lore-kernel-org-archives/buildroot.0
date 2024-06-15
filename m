Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6587BC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 12:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D35046066F;
	Sat, 15 Jun 2024 12:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu5u7oIvCgXz; Sat, 15 Jun 2024 12:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA26F60731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA26F60731;
	Sat, 15 Jun 2024 12:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1DB31BF304
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 12:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02F660764
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 12:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXFbRVdM4yqK for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 12:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2860260749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2860260749
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2860260749
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 12:46:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9C72C0007;
 Sat, 15 Jun 2024 12:46:51 +0000 (UTC)
Date: Sat, 15 Jun 2024 14:46:51 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240615144651.5f2e05f5@windsurf>
In-Reply-To: <Zm1L7ZlBXIV2iowQ@landeda>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
 <Zm1L7ZlBXIV2iowQ@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718455612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TP29eTBMfauvcO3MX54NRu9JYBOxz8QreF9ISYjyn8s=;
 b=UyYzNdFOsB4IdjLc44+Pw5e5aG6fhvQMckiFTA9qj2Z4ghYomMsjt6qMuJQ/E0L+joNOMP
 t4rvPJzdKLsnlVW+9UF06KfuaQhHpif2Saz20MkA05MmOqFfwJ9Hc2zxZ+IyIPPIrDqxQ+
 Xd6pbnyxFhQ5WyBPsYoltzkSNeWKkYSKAu6vmryV2+EWQcD6t6W3kXabJLhZr2ITG7Z8Xq
 QBtNxH0SstK6BkPLffRgzwmBqAHzYO+d8fzJDTHsD9ereepmZKokp4QZkAoAz/zU3hRp28
 2NCeqzGFsoo9BKv1pMUqMUbS+rU5EBChFZWQWy4t/Xe4/5KC4WXmJLTkvF2oeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UyYzNdFO
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jun 2024 10:08:13 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> It would have been nice if you had suggested a plan to deal with the
> existing issues.

Indeed, but there was a reason, see below :-)

> We can extract the list of bugs from Bugzilla (as CSV):
>     https://bugs.busybox.net/buglist.cgi?bug_status=__all__&limit=0&list_id=26023&product=buildroot&query_format=specific&ctype=csv&human=1
> 
> And then we can extract individual bugs (as XML):
>     https://bugs.busybox.net/show_bug.cgi?ctype=xml&id=3
> 
> Gitlab can import from CSV:
>     https://docs.gitlab.com/ee/user/project/issues/csv_import.html
> 
> However, the Gitlab import is ultra limited: it can only import issues
> as a title, a description, a due date (optional), and a milestone
> (optional).
> 
> There is no place for comments, attachments, status...
> 
> So, what do we do for the existing issues?

My plan was to have no plan at all, and simply "ignore" the existing
issues. But alternatively, we could do a massive close of all existing
open issues with a message saying that we moved to Gitlab and that if
the issue still exists, it should be reopened in Gitlab.

To me, this is probably good enough.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
