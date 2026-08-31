Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B78C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37C76069A;
	Mon, 31 Aug 2026 19:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0uJ3U35CXnW; Mon, 31 Aug 2026 19:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788204874;
	bh=ujDF2AlVjM8iIn4wPdot+Y8cP+KZ5E2Ziv+BOGGe37A=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsyn8JpzjMYzk6An7igSx1eY0BzOVNpFAfQq5Rf0urFuoozlYQLxW4WpoGtlq6R3B
	 IZ54+672KqHO9FDhu2RqNwHCp2FcVmkyKrdrM+vnqV1MKjAgnmi0PaHGS/xGTh554V
	 lzYZKbGn/ctdx8jYd6f273rCeUmlQwlW6AmOqYqmqMps/OlWyAcE00IXpB7SWX+tLt
	 sGssEabRNqjTWpYT432tIsMTv318znmkqA7soikSfXSbENDRfq5CitMcW/obUdQviT
	 HwIQ6GDGmyfAONaTREoMWoXPQOFNBDIn5gPoT9qcZU/urhiqmDTNT6d8ruS+68ORTV
	 tBc3Luoww+Qtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED7B6066B;
	Mon, 31 Aug 2026 19:34:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05AC8127
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E027680B89
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sYrWnV1yqqa for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=JCguxYAa
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5C3F80B83
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:34:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JCguxYAaCZ7/+pgxPq1/mUA2yrfTwkT+RGHDf8AXhuzmaw4P+Q7zwUqzAxy0Y6F1L2WUX9ZEjUEd78bukfUiSJEcJeeOazeAKNxeK8nWwUOPxfaJ9SV2R02Tw4xGK43+j0jptu5czAIqZAGkWu1ybvFWxVrGUENVsU7oz1l7g8I9icVRbrrhHZiS7EcJEhT9+pBn8+yBwhe4O6JrZh5xo6FMoMopvOQFwh5S92W1tXyqu/KDwKdduwaY5AWFvog4mKfx2/GCb9fLwR045maFlzPgI18uMQWJw9UFMnkmzS390zaeCoFzQbyvoIQaoykOhrS6W+8NmsBWYDYMLUMqWw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=NelSd4cTUMM2P3H5Kz6H+szR6EY+hmr0OpMzckYN4W4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1429420501; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 19:34:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x17lv-00000002Osi-3R5i;
 Mon, 31 Aug 2026 21:34:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260830221606.33953-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 31 Aug 2026 00:16:06 +0200")
References: <20260830221606.33953-1-bernd@kuhls.net>
Date: Mon, 31 Aug 2026 21:34:23 +0200
Message-ID: <87h5kahyo0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: security bump version
 to 1.3.9d
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/proftpd/proftpd/blob/v1.3.9d/NEWS
 > Version 1.3.9b fixes CVE-2026-44331.

 > Switched to sha256 tarball hash provided by upstream.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
