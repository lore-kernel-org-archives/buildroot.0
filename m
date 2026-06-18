Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95D6CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8908C61403;
	Thu, 18 Jun 2026 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBo21_9nU8ry; Thu, 18 Jun 2026 19:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A022C613E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781811537;
	bh=gWMR+DakKyGjUdjYdzQ3MrZV5sVmeE7z48UFoThEkE0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VtfxpzjxVJSIfwX6hIBSJOD59Pz1YAyWkNE7xPxU8r4uie47COjcDrtymcOk+d1Sk
	 TrnpUH0dYyD6dOil5NY+3B13RGo2dI0KgJ604DMe6qfmv5UuU6TCTP3DTdK8nXsb2E
	 /EYDorfas/lYlUYb/103fw0X6+y9xdzOZ8iWKg8kZoqPetdHLxTo7eyH7SIcsKJ/KC
	 e1K4VUM4nJhLv+2sxogfKC7M8K5QH6RTX7KPcSbBD9EopCHK7bLqveuX9CZHTJQuwz
	 oGx2zj8APgJ64SFBo4Rsu/zg8k9OJ2ALEeTsXIas4KlvN+Jab0l3ZWCwyAn3GXnWBP
	 Zoe+vagZLKSGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A022C613E0;
	Thu, 18 Jun 2026 19:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66E1D2BA
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CB78613E0
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oW--igu88t6g for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 19:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6389613DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6389613DF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6389613DF
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:38:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 829718940; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 19:38:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1waIZa-0000000CoWL-3dTp;
 Thu, 18 Jun 2026 21:38:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260618075411.969878-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 18 Jun 2026 09:54:11 +0200")
References: <20260618075411.969878-1-giulio.benetti@benettiengineering.com>
Date: Thu, 18 Jun 2026 21:38:46 +0200
Message-ID: <87zf0rd4ft.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hZ0EPCIgu12aa3VzZ6YQec6abjOuVk+GAAv7blFAi9sKoFYkAsyG+uR8LeGufkRjPVkqEYCtOdyJXYZUd6j9Ptr5bTlv2Dv+9cAQC6sc+HsZSLQGXpydQpKdF+vy5L0uxIg8F3+ouW652QThZDydGnU0NLRFU3evCPzuOwLtpDWYc2nkVfOwXonNxXotM16d8AvkS7PoYOuszL/Mucvneje+eZgtZCGzbWe3CNAS4VHvjYy4eE647VaOKSh9hWZbXFcOLq25Qaeck1sqR2VhIgSfc0GgqUJlC8ItqkDNOpZJySDdnMFaIxRjmtBXNdxqoCWSDQmmDRrYyqq43Jh4ww==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+AmsbIJGrue4dLhMdvEPfIyrombVUiff3bKaOmclDno=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=hZ0EPCIg
Subject: Re: [Buildroot] [PATCH] package/util-linux: security bump to 2.41.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Security fixes:
 >  CVE-2026-53613 - mount(8) TOCTOU race on target path.
 >    The SUID mount does not pin the mount target directory, allowing a
 >    race between path resolution and the actual mount syscall.  A local
 >    attacker can swap an ancestor directory component between these
 >    steps to redirect a mount to an arbitrary location.
 >    Reported-by: Xinyao Hu

 >  CVE-2026-53612 - mount(8) TOCTOU race on post-mount owner/mode change.
 >    The X-mount.owner, X-mount.group, and X-mount.mode options use
 >    path-based lchown()/chmod() after mounting.  An attacker can swap
 >    the target between mount and the ownership/mode change to gain
 >    control of arbitrary files.
 >    Reported-by: Xinyao Hu

 >  CVE-2026-53614 - mount(8) SUID bypass via LIBMOUNT_FORCE_MOUNT2.
 >    The environment variable LIBMOUNT_FORCE_MOUNT2 is not filtered
 >    via safe_getenv() in SUID context.  A local attacker can force
 >    the legacy mount(2) code path, which uses a two-step bind+remount
 >    or propagation sequence with a window where security flags (nosuid,
 >    noexec, ...) are not yet applied.
 >    Reported-by: Xinyao Hu

 > Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.5-ReleaseNotes

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
