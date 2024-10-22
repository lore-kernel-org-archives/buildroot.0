Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D3DCDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9260A607C9;
	Tue, 22 Oct 2024 19:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81UacRjriTZL; Tue, 22 Oct 2024 19:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8548960885
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8548960885;
	Tue, 22 Oct 2024 19:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D79B8963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5DEC40182
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLqeFdmjgEEk for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EFAB4060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EFAB4060E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EFAB4060E
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8C08240003;
 Tue, 22 Oct 2024 19:17:48 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:17:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241022211747.5841a7bd@windsurf>
In-Reply-To: <20241013194125.2810087-1-james.hilliard1@gmail.com>
References: <20241013194125.2810087-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJ8mWRKsUDcZ0bMjoN/28zJ/8jKKmehvNVGoWqiP11s=;
 b=AcIsTQBmwKzXGln8/DLvXCpVv+GmKuXZ6dbvbkzWrIP8IXxeM+d8kj8XHDrMa+vFsick9P
 RJF9LxB7mjNCRfO1iauf5ijc14kk9j3VLl+BH3Qz5U0y+RgbDUiHOCIwhf7AJrQTo69u0Z
 T+4Ib14X8zYEO6t8s49Y5MHu7D3xh6HtiCD4w7+P6timQ3lclBGptYRNJM3QyxJLDZGOji
 Q8VPJVTuX/NgIezS7C8o6zJB+D5Li15l4lvqIJJvtHWK62FSg2UzuiGZtmJifOh2xHJKrn
 VKAmHTiB/lw1cuU9COfaB+qSQSbqms4b/sWK0Cl53XFlkfq+3GyZ4BBc5l1ZKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AcIsTQBm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to 0.31.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Oct 2024 13:41:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> From: Marcus Hoffmann <buildroot@bubu1.eu>
> 
> Changelog:
> 
> * https://github.com/encode/uvicorn/releases/tag/0.31.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-uvicorn/python-uvicorn.hash | 4 ++--
>  package/python-uvicorn/python-uvicorn.mk   | 4 ++--
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
