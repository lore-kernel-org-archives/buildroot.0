Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B603DC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 819DF84631;
	Fri, 12 Jul 2024 08:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujGKP5c3pdXb; Fri, 12 Jul 2024 08:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86717845FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86717845FE;
	Fri, 12 Jul 2024 08:45:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 940441BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80DE440A03
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2Rt64Tij5qc for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2369A40917
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2369A40917
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2369A40917
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:45:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04DCB1BF20D;
 Fri, 12 Jul 2024 08:45:45 +0000 (UTC)
Date: Fri, 12 Jul 2024 10:45:45 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712104545.3156e984@windsurf>
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720773946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDr82FjSbLSDEYwwrx6Hrf94Cro4m4SaI3krRhbcuxU=;
 b=ivy36c54XchznJ6hPvQRUl6FJ3++nALRl28Lx0DV9EjCDwSozbBlzM12kmwbYwEZD+JDQU
 Lxw7HOeVEmQ4evh8wFUwXKfGJmQ9z8dXx3Z5qu2GLkS8+/EXwdr9TRuv+NpO8D5vudhsn3
 m0h5eK8GkaqVMSOpBXsW7rGzrmq4ugJE1SvwVTjQ4GyWd2rnJk4/uHdpMXyhdEPCqZ+TNi
 Hyup+2GymcW7jFg+nTz7uo/+sZoH3GOgywRLUTGE/pRXk3c6P6hTbCrDn2BlJFyeO2IJzx
 s4yG4SHUeChC79L+O+1ikebfQnnYPPCluoa6KLVrYnf17aGvqNC0wukC9Mn90w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ivy36c54
Subject: Re: [Buildroot] [PATCH v9 01/14] package/qt6: bump version to 6.7.2
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jun 2024 23:18:25 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> For details see [1], [2], [3], [4], [5], [6], [7], [8], [9], [10] and [11].
> 
> [1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
> [2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
> [3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
> [4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md
> 
> [5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
> [6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
> [7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
> [8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md
> 
> [9] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md
> [10] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.1/release-note.md
> [11] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.2/release-note.md
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v8 -> v9:
>   - add release note link for 6.7.2 to commit message
>   - bump version from 6.7.1 to 6.7.2
>   - update hashes for existing qt6 packages

Applied to master, thanks. Please note that when sending new versions,
we prefer to see them as a new thread rather than a reply to the
previous version. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
