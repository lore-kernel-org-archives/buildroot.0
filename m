Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447A5E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 14:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0652181109;
	Sun, 28 Dec 2025 14:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DpapaKMreA4; Sun, 28 Dec 2025 14:13:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3999F810D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766931214;
	bh=7ymzhxKThhQhMD7an+nimOEoyRB8SpDAX4TTqY3LtbM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J+Zr00bq0GCvQefHn+5vlJBBB+HUkV+s/FOFc0MdOO8FP5Vy3qJ9kRVZJCdEHYnBF
	 hG0AC3UnTaBddxJkfKeqPmeKUdhTXehDVSAFeJkrjkcBoaGmfbifJjrgm4FZVceOkn
	 j8bqDRHeSMUdzOqRfXuCHgepYpoOF3RWovASHd1zHXa3JLiwKjt2cbgOFEF0GpXa6i
	 u3ucIMQrRvj0fF/cefmyKmHsu4FBEn0V77KZYL0iar3Ne2wS0tAmb3CEmp+hPQet96
	 LGQxR/nHDO+xN82C2qLyCtBk3VepW0av+oEr1gG5Tdg5th2wZSc4dFHHOK5yarpzJ0
	 sZNsOlqcNB9AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3999F810D6;
	Sun, 28 Dec 2025 14:13:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B43DB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DF06079B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMCjXtDUAcuN for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 14:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FB5B606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB5B606FD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FB5B606FD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7C9481A24C1;
 Sun, 28 Dec 2025 14:13:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4ABAC60725;
 Sun, 28 Dec 2025 14:13:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9F1811978D0A; Sun, 28 Dec 2025 15:13:27 +0100 (CET)
Date: Sun, 28 Dec 2025 15:13:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Message-ID: <20251228151326.756d6d19@windsurf>
In-Reply-To: <20251206220118.2392443-1-bernd@kuhls.net>
References: <20251206220118.2392443-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766931208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M+IgZzSpp9uYc3uPbFVcxriLiYWz3CsblNY95mNcGW8=;
 b=HcrfBiYB2vVm+HnlVBpqEBDUXHiSbtSDwh1Bd9qgSjBbvW75V+5TCe7LCDmTY+ydGzQyYD
 rVCHLX9Pp8p3g+qgikPs4JUQADyA38F/iGvuA6c6k0cvY9+RDAOqF8qL77D6RavKhuTYNn
 hNYG4FRmIkB2PcSn/wCxn0F4vxvw/3O9JbEeAQrKxo3aL1SzoWzQ0ZnROO79amsxVHmEOz
 I3LcH77STdGiwyo9FIKiLHBBgDcQtYteHP4JHha+rK4BbB/bt9xSAj/fvyTJlkwgUFA8Tw
 /hE/hTY5ES2uEOFRzWkbLPkr0mWj5cKcuGV96bl2o0t4RNIGu5cXwN6PNdBPjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HcrfBiYB
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5enginio: update SITE
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

On Sat,  6 Dec 2025 23:01:18 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Old URL returns 404.
> 
> Fixes:
> https://autobuild.buildroot.net/results/064/0647daa54deb9df953d43b438ac05ebefb81b6ce/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/qt5/qt5enginio/qt5enginio.hash | 2 +-
>  package/qt5/qt5enginio/qt5enginio.mk   | 2 +-
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
