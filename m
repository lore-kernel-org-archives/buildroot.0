Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176BACF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D324097F;
	Sun, 13 Oct 2024 10:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTkYS1xcIyUP; Sun, 13 Oct 2024 10:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E10DC4091E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E10DC4091E;
	Sun, 13 Oct 2024 10:47:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC4601BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C80944049E
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4gj7pJQ47pl for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D95540238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D95540238
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D95540238
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E6CCC0004;
 Sun, 13 Oct 2024 10:47:45 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124721.66eefc15@windsurf>
In-Reply-To: <20241011175859.2767194-1-james.hilliard1@gmail.com>
References: <20241011175859.2767194-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRddY8JDWz8/I9i4G9exfmzu9B9Cc8QDo8QyLV9EYXw=;
 b=j2iiK4r47tEBeGUlo0aOOjXi2kcbXYU+mzgNBCYHI+dKnr57cWO68kMnbFtfCbM+hXRlQ7
 Zy0gU9wZ7X0Jw1mj6/Pvlpm+rA0aTVA+xyUpgQwzea+xqG7/6R/KRGTSSfXKYGjkjO6Mr9
 E5cH6x6yzuWguDIfvQpHQcYJPbsvz0ep+ZC5+8A0gbWD6xMLNiP6Yf4xWUodNc1yoDA0Du
 UVPbrhzk39WjqkNGDV73DttL+S8BC02/E2D78cDkinYvU+6SCXVxiNtdmh79h61W2bBk7P
 eCRVZ1kQCN+G5kpHnTGzmIdn61No/1DwkDXR8FmZTKq6Y+vf4FHRuTFsOr8qPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j2iiK4r4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.6.5
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

On Fri, 11 Oct 2024 11:58:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cbor2/python-cbor2.hash | 4 ++--
>  package/python-cbor2/python-cbor2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
