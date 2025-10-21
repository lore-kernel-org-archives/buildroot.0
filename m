Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DD8CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 11:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D87B405EF;
	Tue, 21 Oct 2025 11:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An9rS4xnlREN; Tue, 21 Oct 2025 11:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FD8140535
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD8140535;
	Tue, 21 Oct 2025 11:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57208277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48D3B40535
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVfxnSZsl54u for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 11:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F8A940532
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8A940532
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F8A940532
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:41:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CB243C0B88C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:40:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5FD4660680;
 Tue, 21 Oct 2025 11:41:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F2EF102F23F7; 
 Tue, 21 Oct 2025 13:41:06 +0200 (CEST)
Date: Tue, 21 Oct 2025 13:41:03 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20251021134103.6f1e6693@windsurf>
In-Reply-To: <4b8956d4-d402-46d6-a20b-0c380b032598@bubu1.eu>
References: <20251021093500.744569-1-buildroot@bubu1.eu>
 <20251021121609.2a9d08be@windsurf>
 <4b8956d4-d402-46d6-a20b-0c380b032598@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761046867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n68CWOzc9xuU0u2OQB5HIgh/TtCpGzPcrl5JevRqm24=;
 b=A6NJkVcrfVQClBhsgNjAqOnanTaQITHxX+j6YyYi8hti2W7wEkjsh2TTYAogbpnW3VcC/f
 fSpcfqL8+5RslPGFVBNfM+SxtcY12HoLXC85mq/g5raD6iI9wl4do+jzASZPkyBiNtWDL8
 Pr2MX4O0Ewg+0gtnLHSPi26I1/IBFQr5Glu4XMLQKo0RnBOqmNv/YDAShFWXucPx/44Enr
 t3RI9PGOZ0LrBBZf8+FdndmMMZ4YYoZJiV+ILStcJ4tb/kbL2USRn0xrP+v1v8Ms/Xug+a
 2SM5C5G7PguN9ENM/VcP+cGJHDOJRTcs2Lux5uRNodej/7r7CrWokJPDEy4sTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=A6NJkVcr
Subject: Re: [Buildroot] [PATCH v2] package/python-diskcache: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Oct 2025 13:31:14 +0200
Marcus Hoffmann <buildroot@bubu1.eu> wrote:

> This was, unfortunately, a very common pattern in setup.py builds but 
> it's going away with projects switching to declarative build definitions 
> via pyproject.toml. (Which diskcache hasn't done yet, but I assume will 
> do eventually, maintenance is a bit slow currently). setup.py is just a 
> python script and python allows importing modules from $CWD, even if 
> they are not installed. That's how that works in general.
> 
> Now I was confused why past me claimed that the same doesn't work inside 
> the buildroot build and the reason for that is that host-python3 doesn't 
> build with sqlite support, so the diskcache import (at build-time) fails.
> 
> Perhaps a less hacky, but also more wasteful, approach to solving this 
> is enforcing host-python sqlite support is built when diskcache is 
> selected. I just tested that and it works, unsure what approach to chose 
> now. WDYT?

Sounds "meh" to me, because important diskcache during the build is
actually... useless, it's just used to retrieve the version number,
which certainly could be done another way. Having to build host-sqlite,
and sqlite support in host-python just for the sake of doing this seems
really wasteful, and is generally not a approach that would work well:
imagine something more complex than diskcache, that has more
dependencies. It means we would have not only to package these
dependencies for the target, but also for the host, just for the sake
of being able to retrieve <foo>.version? Seems not very efficient to me.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
