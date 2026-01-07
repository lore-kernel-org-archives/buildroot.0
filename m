Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54043D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D1A440F2F;
	Wed,  7 Jan 2026 17:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id it3mk7plCIuW; Wed,  7 Jan 2026 17:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3745B40F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808299;
	bh=tUUCT7PqKsiViGDRX8DZlUngVUTHzPnfXpJdj7CEKyA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XDr695ovsFkqQ7v6dLtSdR3JYt4SV27sA6W4Lx8HqODG+2wCdK+WvL8Mx25WqZSoy
	 kGLNv3Rrin7S/vImATHn1wLlNkYvgQASQlpSnaH7/aGEH/UX90Ef72G8jv8TZS565n
	 G/2Cd0eVskuiTKZ25zyL+xuIuccZygHpLk4pjP4umEniLsvs9ZMb0kPFj4GCzhK4Xc
	 B/Z6Kt8xqdceJgbuTtiHIkSXDKPVxouAHJAAgZaZ1h3rYO8ETSWLOiq8y2I5kafd8G
	 SmH1Htiem3Knl2351Fn2oxU9WOIULjJ/NT5wf5XSbSsRuJ1srqzbRN6J6Zup9n4zaa
	 Hhm0+WgqYwjeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3745B40F25;
	Wed,  7 Jan 2026 17:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 359449ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 333B960661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcDr467x4c9r for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F78D60653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F78D60653
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F78D60653
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18483B97A704; Wed,  7 Jan 2026 18:51:35 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Julien Olivain via buildroot <buildroot@buildroot.org>
Date: Wed,  7 Jan 2026 18:51:33 +0100
Message-ID: <20260107175133.228048-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228225801.2a9182f6@windsurf>
References: <20251228225801.2a9182f6@windsurf>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808295; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=S1jBlDnywpZek7zV9bnJNMFdzIe72+2F7YKzwWsTieo=;
 b=Ms2n5N73fQL/iagXSdVMDz/4na5gwlsQ3tLCYDBN/aFKiefoUpQdxzVQPTRLbQwlJypDwx
 BkvyxpDhvjbIF4ji4k+dKb9BawK2DnvnAQcIu94qCG096hRfsLoiiT650Ucx2MKTmTmClh
 te5Cwy8P/d/raDUvi5IfxoTAkRfd5MjZ5CP713Jhd9NyT7XvXi5UrF7COrAQsQ7fc2lL/d
 tyhhtqI6eZdqlFGJ/WXwWbZHzyQHrarRlh91MHXjIpPyiL7hCEE1q+cegKTir5Ulj0B98T
 e+gxPWYfk8gpMzREvBfULyMVZEo40yiqmtmygpLnfyCQXITyR+N8DS+PuG7EyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ms2n5N73
Subject: Re: [Buildroot] [PATCH 1/3] package/tio: Config.in: add missing
 selection of libglib2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Hello,
> 
> On Sun, 21 Dec 2025 12:57:06 +0100
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
> > Buildroot commit [1] (package/tio: bump to 3.5) added the libglib2 in
> > the .mk file without selecting it in Config.in.
> > 
> > This commit fixes that.
> > 
> > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d85e9df431af790930e03d860bfa098108888a0
> > 
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Thanks a lot, series applied!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Applied to 2025.02.x and 2025.11.x. Thanks


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
