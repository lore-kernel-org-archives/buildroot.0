Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6A4CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AABA941607;
	Mon, 11 May 2026 10:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0nalFTTPTTQ; Mon, 11 May 2026 10:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134C5415DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778494856;
	bh=PMo1AcYOQhari/fW0ZeCOB0seYWn/pEj5UwdHhX2E28=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=olhudgp/jDR188pjegK5JEOPNM8Vxc1yqtBIrWblaNtgLPkTJW8ZtXvJYJHqFqzUk
	 Q45Ddz/4vcnwnzAqTQMwITxDWg37r91jWadchGSGd8Ia2aqD8aG7QDcapzUtDWnqAj
	 GztCTO8RwNShCESzsefA1kIoPrDvmgBH5G250pJ3abgJOZ3GA7Yh2+9XnTruGNUZV+
	 d/uuIawU/CZoL9peu831WsUElMYzjM9oS2jm89zDnOZ4SGHKmnBiOFmc6jWXi5mkYW
	 pR7qORF669WhjSq+HrAVv42x6NeufRthJwqGVi/hMdjNv2/wgOKZ9MOVi43JWJPq+f
	 ztoMTz7bX1/dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134C5415DD;
	Mon, 11 May 2026 10:20:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4769272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9B3F415DD
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MiI3LDHK7KXP for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C084B415DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C084B415DB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C084B415DB
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:20:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -750570389; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 10:20:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMNkm-00000009DPj-2DQ3;
 Mon, 11 May 2026 12:20:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
In-Reply-To: <20260509093853.1651716-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 9 May 2026 11:38:51 +0200")
References: <20260509093853.1651716-1-peter@korsgaard.com>
Date: Mon, 11 May 2026 12:20:48 +0200
Message-ID: <87zf26nt6n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UjD8jTzhnzX0Yv8TGDDGfWql7pHe2mcNblyHJJ70lQSJDeTWfxAmYoiqQ9w8P4JO1LOIGLxMGwV6vSZmzDeXrqmitMXXKr3qFlp+ohts3DehDKPykiRw89iciGZ8+4DXyEA1GwvlxOIee5vWXcLNeDTHVOHctG5LuioCJPv407yBPFZ5teUfL1JmsPyr7UNG+aedH4W1FJdaMPbhrUfsjL3UQt/nsRdeI6YUr3nqY2zV1YbD11nqxhZFUZTwo/EaP9LaS/eIajTWL+SEAKfB3Dl+AdPZv538FwrK8/MoI5JDGLyQhVlDRnIm8Dhe28mmLi1Ov/MXWC04QzRspKZ9oA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=HDLssYKGqPzBspxCPqNhgaxa/bqgBTGVlLPb263VV6I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UjD8jTzh
Subject: Re: [Buildroot] [PATCH] Revert "package/python-setuptools: bump to
 version 82.0.0"
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This reverts commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92.
 > This breaks u-boot < v2025.10 builds using binman, so revert it for now
 > given that v2025.10 is a quite recent release.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332016
 > And many more.

 > Longer term we either want to upgrade all the defconfigs (which will not fix
 > the issue for external users) or find a way to patch older u-boot versions.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
