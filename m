Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90740CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D0F60750;
	Sun, 18 Oct 2026 14:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cyDxvfOHfiY; Sun, 18 Oct 2026 14:29:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BD896072D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333783;
	b=qSQops0r5XeB0D5bjPDB7O2G7gh64ZxJEKAPyWpetJkEfiwZ8yTuf07yL6GFnwHaHx5x
	 4ExWZGWjpNBiQ/z9Us/8gFOaeKqBL8p5wFq/+rAm9tFSuUtylQfMu78PnutfAYlmRKLtG
	 xOqOCtYVKzJVefbULun7o4GxGv/f3U50VetGDy1QqtF3jWCxUL4piXb9O6c0zDGNJXtGw
	 KQ7LQCLLd6WcG0CVoX5ZdFhUefcX6FKjkUrT74ijExau5qByDPSCJwh6upQXu/QZZYoxn
	 IrS33A2WQw1SuQh1tT5vVSg1iTH8pSepFZQC/Ob/PApZ9G0MRJN5LjZnrTEPoNPY2FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=JgZ9fVpRnWBCXERQx1R9NH06K9M5m1kth8avxbsD+zfJiGsq2J/rqJWEfjgq59alHAnl
	 9LYD/SibwjbcoyO+MuBJO3/L0S7W+EI06qnQQ5kDWtzi2Wuq55V9kwCQZCloSK6V8E2UU
	 DSZoC9VsawHAX6UwOo5ZeRFKHGO/igRtCOoOW+GiE1aNbeE5NdOFUOya2vhJZF7g93xRg
	 lPTyMZ3hbJCWizfP42wLJW7xm64DaBuhpAMIofVKGYbmg4skIC35+sXobl/ypgYkZwzAg
	 5sW24MeEEkNPtvkxvdvvWqoHnPt1eHbLQs5LCupqq8PQA3xev8mCzqWvIs7Qyqu/o6g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333783;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V71aisSIaE3V6It/+CwabFH9koY+ZQYIvTDDB8OOANpjtxua7qFdjpjuko/UqxBCT
	 bPfI+nIZwhRuxz8oEhHymw2Fb19GcEyPn1mNedUSrOI2thsrPXxKKAptLo10Bd8l2V
	 kqZiVxnltcngr90HQB1fGQNYUGn7Y6O+MuDD1Al7yta0yJtmP2pmVTYoRgjiPBnKuU
	 339HLgxNRQu2KGDspStqeJRYAg9IDS5378Chj8uNBk7CE7rMPziToXXYtAe0lPjzhV
	 Ksz7dWK8XSbrf4oYOz1GQNKZ3oGDi7AYvkpXbtgD8gQpc6MPrVqIjDxqNPOzNcfw1H
	 04Xaxa+GgtBWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD896072D;
	Sun, 18 Oct 2026 14:29:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FFC12A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6284A80D91
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJMU-NxX69ke for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:29:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A9F1580CB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333781;
 b=OaEzjtiJb5mR7lWK7UYsnbDoY2Er0abO6U4wGqicz+lT2OfILDaBWZzSRxYP7QX3DkQx
 VMw9y+DdT+/bpEUft8M2riPKirY/XxvWRKOI6CUJ2yp2+pA80kYXqoZ10y0Te5SEn0a1P
 wviTHmKZhRLaXa/tYhbQ1MRqtJTeG5BmSd4WWV5MR1HIct+RkVp2XH5c6n2625kt10Vnx
 Kq/SQzbyifPJFnaQBVuYe+CHJMoGfKXIGheTibg7Ayj5KYvnSXXZwPnXGZ+azoTRvNZoE
 ZnASk7O9R5eg7MO7/VdCDkXtQt5RvnTqiKSf+U8t8kKH2vQDsxJUFoLjj6QgfB7phdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333781;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=XQ9UgWU4uAcu+K8fZmB0dQEV+j9vFnRCdel5v+qwArWPmmw9vXjsgntNxPRBWHRKNi1O
 qoXJqgvkT4SQB5n9+MxYSEq2FdsycZUNycoo/iBVqtwLMuSPZ/W9wkW10P46l6qO1kW1/
 GXokDZS9g/+1DiueHmS8CYjYkMF5AGl/2W1WnNJTnwTRXkWdT6EW3C0YiN1kh4E2B3PRT
 PmmQioB91z5e7xAD2yg4lL8e7R2U7BUHgjCDSZ/cB3UNlpZD+XyqcLiADFL94dsEKCZkw
 6qkdEoYToz6e5IoTXdDUt1Vw6jdHiz234bMxJJGuTplFiO/tRp3+rR1/1lpOCBnMMhQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hWYctsem; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9F1580CB0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7FDF613F846;
 Sun, 18 Oct 2026 16:29:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:29:38 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:29:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-13-james.hilliard1@gmail.com>
References: <20261015215210.3426895-13-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3ce95f3e07a19ed27aa1d1b571f7dbf0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-serialx: bump to version
 1.14.0
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
