Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C5FCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB43B418B1;
	Wed,  3 Apr 2024 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5jEnIiXVTXo; Wed,  3 Apr 2024 19:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF2C9418AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF2C9418AE;
	Wed,  3 Apr 2024 19:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68CAD1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56CC582279
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKv5H1fMbIcU for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 363F58226A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 363F58226A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 363F58226A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:52:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C206C0003;
 Wed,  3 Apr 2024 19:52:49 +0000 (UTC)
Date: Wed, 3 Apr 2024 21:52:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240403215248.6abb6405@windsurf>
In-Reply-To: <20240328215638.67750-1-fontaine.fabrice@gmail.com>
References: <20240328215638.67750-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712173969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/suwAJzZ7N593q6P78ikfGMH9vzCBWCwN54E7WVvzjY=;
 b=WIW7bBXmCSZG3Jx7AuZGklW1WAPQ3kEMhQYbqtKOu9WRJQfGLoFOn6qUf0YqAuq1Dbj3gf
 AzO55gx1NNjcu359bsUToaNPjQWqWRM5e1G+snWV6agQe4RlM2IYtFXhZMEdiX5PRXHOpH
 tpFiFdJTKLfWuKk9tOlmH+0miJjk4kR338VPG65J/BNnSFe8bzjKbS6LQOr9kHAXrJp80v
 i/1hWLNKuZV6FW91ehB4l+Zj1UHYA90toFukrOAlBOSG88TE9AnxFzE832jVyJuATbSgWQ
 n3YDqX0j6oFtgDwzYBkieSpE84jbFX6GcmwVuIYyMme65SGfDxFnxvt+4Q1orQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WIW7bBXm
Subject: Re: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version
 1.9.1
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

On Thu, 28 Mar 2024 22:56:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/maxmind/libmaxminddb/blob/1.9.1/Changes.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmaxminddb/libmaxminddb.hash | 2 +-
>  package/libmaxminddb/libmaxminddb.mk   | 2 +-
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
