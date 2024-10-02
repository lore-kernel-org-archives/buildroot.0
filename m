Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF923CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A942413F9;
	Wed,  2 Oct 2024 21:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBzqAeEKQNBA; Wed,  2 Oct 2024 21:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376B7402F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 376B7402F5;
	Wed,  2 Oct 2024 21:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 515671BF31B
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4865A400D7
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSRGXEQYdRsD for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF25D402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF25D402F5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF25D402F5
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:43:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DE26FF803;
 Wed,  2 Oct 2024 21:43:58 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:43:57 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20241002234357.5fcb23ff@windsurf>
In-Reply-To: <20240920061833.132700-1-thomas@devoogdt.com>
References: <20240920061833.132700-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727905438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9F6sSOyuOkptiLK19RI8gixWf5CcdaPQz5QNB3tFNo=;
 b=PfNpVnOg5qTBkI8IRMjgONJ3wxJmX4v8vDLU+lX/3VrkHY9+q1Prj1Zy+hQLULHAxGmBxY
 40N6XXpoZalV+s93nmCZIJJ30qGUJ/EYZLrYR3sPG6ugJBJTT4QZXRZsFee80IEVSlSOJn
 aTJwgqzdV4Zy8Nl7ogfhT+DVERIoY3siD1i7dfN1uccNY5rQDULwyfIcaVvm7Edl5eBTGO
 k4OjCOjdXJTNuLnbL9fwglp3xzrYZXsPV0GGgpqte2y7AEcyLBsCSSsSOGIOPR2mwRR9fW
 WrpZb7+cH/HEWFwU2nTBn8TgHGt5O4RVemF1UxLOUJ7Q7GnIIXO4FSKvmgjtcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PfNpVnOg
Subject: Re: [Buildroot] [PATCH v1] package/cairo: bump to 1.18.2
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 20 Sep 2024 08:18:33 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News:
>  - https://www.cairographics.org/news/cairo-1.18.2/
> 
> Upstream patches have been dropped in this commit.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  ...p-IPC_RMID_DEFERRED_RELEASE-check-wh.patch | 41 -------------------
>  ...3-meson-only-require-cpp-for-windows.patch | 38 -----------------
>  package/cairo/cairo.hash                      |  4 +-
>  package/cairo/cairo.mk                        |  2 +-
>  4 files changed, 3 insertions(+), 82 deletions(-)
>  delete mode 100644 package/cairo/0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
>  delete mode 100644 package/cairo/0003-meson-only-require-cpp-for-windows.patch

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
