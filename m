Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C201EFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B7580C58;
	Fri,  2 Jan 2026 15:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMNGN3c8tSvd; Fri,  2 Jan 2026 15:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF2A80C5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368044;
	bh=7a1GS4jZjXmdG+OPe8CjyzgVicfqGcXrDUtDvYGR1Wo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=szomKbIuuPbkKR/z9mi62nEg+jQ912PPFbb1Lp+PyWjBJPNRZx61HEl2W66Jj8sHK
	 NqL8uOnSmikQvcWwLWJ52xKzqe3P5opXcWAwgPNuEJE4esm0IEIw8GWV5T1KP9ENF3
	 FWruu/kM5+HNnDwbb0NzZaku0KTmnILeNe6pcL8HDp3dGNm9UyacMfQvK9AjhHJ4nX
	 boZWYwnqHN8xuK60LKfVEK5JVc9aMmsvxBPyvOJgkq6m8evgRe5wtBX+/o5X7vcNkr
	 syCNCwscNgC0ziiqKE+CSn3tQ+GF7YQ5wGO79xUxurUxye/2eXQ1A7cqF2qj0d+aSS
	 Chd1NiGUsPEPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF2A80C5B;
	Fri,  2 Jan 2026 15:34:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6205D19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E80560843
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kK7xOBNP71a9 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0398E60840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0398E60840
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0398E60840
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:34:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1A9C81A25D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:34:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2C966072B;
 Fri,  2 Jan 2026 15:33:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 820CF113B0726; Fri,  2 Jan 2026 16:33:58 +0100 (CET)
Date: Fri, 2 Jan 2026 16:33:57 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
Message-ID: <20260102163357.5072293f@windsurf>
In-Reply-To: <20251207145841.290481-1-dario.binacchi@amarulasolutions.com>
References: <20251207145841.290481-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767368039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sJYTgQnqWqvgB41tZ4MbKDvLhZs7ZACYdUky9ASt5wg=;
 b=JYEecTpH7liFkv7hn8xnAONmi/xc7Mwo25PWArjUrF6+kMIwL79RMFUMGklbDIASAHpKvW
 VpG4tO7MGLgJ4cNRJQ+I9I+M9fFwaDd4sCwzqFwZOSnzOKD7nuor2r2d7NXoYentIJeF0F
 /eSXaM/2JuqJTRa/pitOvyuZuC99kvb/s6qLHW55+qja45PXAc3ua/MIbTdKjUcoVJsHqf
 JiYTaxTth29DCcEbxOXfMTP5YnSpUMoHFWiG+yEsBc8QITJcIYHnN/ox78jD/RTkRU+EsU
 6fGR6XTWHQvBUQ3BgqIpnbKv7VACNUblQgTDXtLF2nAdrUAI7/JDDdV4dNxNvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JYEecTpH
Subject: Re: [Buildroot] [PATCH 1/1] package/babeltrace2: bump to version
 2.1.2
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

On Sun,  7 Dec 2025 15:58:41 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The removed patch was merged in version v2.1.0 [1]. Its removal made
> running autoreconf no longer necessary. Moreover, commit [2] also
> changed the names of the license files and introduced new ones.
> 
> Release notes since 2.0.7:
> https://github.com/efficios/babeltrace/releases
> 
> [1] https://github.com/efficios/babeltrace/commit/28ba44ad9ca14153e96c94a9100423ea224c1af3
> [2] https://github.com/efficios/babeltrace/commit/0235b0db7de5bcacdb3650c92461f2ce5eb2143d
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                           |   1 -
>  ...ure-simplify-warning-flags-detection.patch | 671 ------------------
>  package/babeltrace2/babeltrace2.hash          |  17 +-
>  package/babeltrace2/babeltrace2.mk            |  25 +-
>  4 files changed, 31 insertions(+), 683 deletions(-)
>  delete mode 100644 package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch

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
