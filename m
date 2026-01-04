Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0177C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A160C80CDA;
	Sun,  4 Jan 2026 13:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RARY7AfcZMub; Sun,  4 Jan 2026 13:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D068D80DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767533659;
	bh=BRokYEA6mFe1cuySqMEZ4v9VgBvwTp68Q4JmwjfHRhw=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mYZ21uOsNbQuA5btbWV4/6E1e9hXlHNj4vIPfmNx81GuUMjQUAzHd+kfadA0kWwMx
	 n1XeecgsUNo/llgu57sccEB4Ibpzp8a3S3bhvhz/MZim6DTb/07QCRUqgwcRWFHbgN
	 4rfCs9qDP8+QuIg4whdzqW1qVRlYaRx8s7W6X/Nj/zE+akop/9SlzxMnuO+ueil7QX
	 xxGwqwmYLSuEXD6UBzlun98h0fN1Fn3R9N45CXh/lka73NLE7FMoynf+IjboKtKvNJ
	 9FwhYw5lLUTO/f44hk2tWUYE0mGSNkqLHd0p4hKIkikknuwo74H+nMfz+BMiRR/Hw+
	 YOEzEIRoaXtUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D068D80DC4;
	Sun,  4 Jan 2026 13:34:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B928B229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A013580DC4
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auZ_w4jsmSVG for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1337B80CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1337B80CDA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1337B80CDA
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:34:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2107541478; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 04 Jan 2026 13:34:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vcOF9-00000001dqP-1jyD;
 Sun, 04 Jan 2026 14:34:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260104113924.204d1799@windsurf> (Thomas Petazzoni's message of
 "Sun, 4 Jan 2026 11:39:24 +0100")
References: <20250929092431.8974-1-fiona.klute@gmx.de>
 <20260101181830.35ccf7c3@windsurf> <87wm1xn0sp.fsf@dell.be.48ers.dk>
 <20260104113924.204d1799@windsurf>
Date: Sun, 04 Jan 2026 14:34:03 +0100
Message-ID: <87seclmrhw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JMSwFGf1zxTCMZ2x2Vizgti945dj70+/IK2Fqc7KmNRsLDI6F1HphKQrdCdcXMhwJ6Xd9RkIsgYfRa4XTxq3rpy7rQW4UP1W/7OxDnKYSpJVuLDEyKhEuOtFdLvheBlxGgz+mDRIaSt8U7zMHHJKhTHb5Bmibz6ISfKtTZPZorQNbzEa+lxFQDAs8OGPVLIvaE7PnF+Puh9DqdbAYasCh/WQDBCfw0TYhtWOo+XxE19zXpHw77QhaKax0z2VM/87SPQifrqZw/OPub4DLraT002YgKQUm00XoJfF9SLApV5/YgXlcBER1SjOa42jgeRVu2n+YmC5bfqqof0CNdNpTg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=2bCaFVqWFJPtgyrUZR/89091awUrbWJtPDll9q/yvSg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JMSwFGf1
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Romain Naour <romain.naour@smile.fr>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Still maybe we should consider ensuring that check-package validates
 > BR2_EXTERNAL, and somehow address these concerns?

 > I think (1) is pretty moot, if you're not concerned about check-package
 > warnings, don't run it at all.

Or run make BR2_EXTERNAL= check-package


 > Regarding (2): probably a matter of merging BR2_EXTERNAL support for
 > docker-run.

 > Regarding (3): we could also update our Docker container.

Yes, agreed. I think it makes sense to move to Debian 13 now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
