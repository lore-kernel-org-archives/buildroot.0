Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FF4C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8FA2410F8;
	Thu, 11 Jul 2024 17:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNQhJ8q7VzxA; Thu, 11 Jul 2024 17:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D15410FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D15410FB;
	Thu, 11 Jul 2024 17:58:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E87251BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D55B26066D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0ZHO7zQUN3B for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE5A1605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5A1605DA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE5A1605DA
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:58:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB6D6240002;
 Thu, 11 Jul 2024 17:58:23 +0000 (UTC)
Date: Thu, 11 Jul 2024 19:58:22 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20240711195822.2f07883f@windsurf>
In-Reply-To: <20240617151020.31120-2-flaniel@linux.microsoft.com>
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
 <20240617151020.31120-2-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720720704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iw4vUy/AprtMz8QcvMdr2MxgkKcZ8BdgnCv2O6iz19E=;
 b=mCvwK38nbx4saTNtiJkE9V76YWLy5GbhG2HCEHN5EjinWOmJ30xaCtbJ7dcJIZn3AESEJN
 K5OMZNIrh5ue/iPD+WyfZRO8HNo0+DdxGOr/kOqbKAH8IY+yoVMLeMjG8Wn1rhE1XHnuwM
 yc8dJuch5F9PW8nbOnF3W514Kn5Nf6QMiqsfplPBeJ/Z/hVT2xTm5qc5vKj6C70PQpDD5w
 EreQ2bHc4rhDPheLiHiZ15+8uMB03b23mRsOi1YlUEeAPGMo0ztFqFKJnZZqCADVIQvHsj
 qYO9kNGrXBfvt4rdWBtAGHdz+jbxgd/Y+eiUmV864Id5dMvFSPko+nPWGny/Fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mCvwK38n
Subject: Re: [Buildroot] [RFC PATCH v1 1/4] package/pahole: bump to version
 1.27
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

On Mon, 17 Jun 2024 16:10:17 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.27
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>  package/pahole/pahole.hash | 2 +-
>  package/pahole/pahole.mk   | 2 +-
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
