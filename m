Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BACC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C709B40001;
	Fri, 12 Jul 2024 20:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P56ORFpMOCOU; Fri, 12 Jul 2024 20:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 991F5402AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 991F5402AB;
	Fri, 12 Jul 2024 20:54:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17BD51BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04FF1400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEgHrdG_zsdJ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4996400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4996400A6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4996400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:54:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95EE9FF803;
 Fri, 12 Jul 2024 20:54:22 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:54:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240712225421.19997cfc@windsurf>
In-Reply-To: <20240712201943.457747-1-james.hilliard1@gmail.com>
References: <20240712201943.457747-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720817662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCS20LtEowyoWW5Azi0Zlo5jOYv34kLIaLzwqo8XyqE=;
 b=IzgSItF2qcSGwEYOUjOCV062UkyvtKg97+HNm5wF5O6LbFrWymCHXgIljzs7QwcUkMwkAa
 KdYsRqyMVRO6fmFs3KhQHK5QgmvMWTRRp4oMn9h4W2PHRTHTWOQlgfvy+G1Y/K8VzwDEPx
 vCNcP7xunyo3A94UO0FRwF9QSsJdFtwtx0K6UVoNN7qw9qYuFTLcZFTglqSPUr4dnj73vD
 CGNlJpKgqDi4i78SwNSt0b13Y9d4N4qhrI/d/mmB+J7LwIxo4nEWl0bKBF9ps4n+gwbHiZ
 BEvc6V7ETwAbeYQRscswvF/wvRWvRPI3z3MW9/Rm7XoL/CHOEgsoa364wlpEZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IzgSItF2
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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

On Fri, 12 Jul 2024 14:19:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/prelink-cross/prelink-cross.hash | 2 +-
>  package/prelink-cross/prelink-cross.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
