Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBEBD374A1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC926EAA1;
	Fri,  5 Dec 2025 21:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyJXGUmKTv0O; Fri,  5 Dec 2025 21:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD048606BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764968519;
	bh=dJ7v5FibeaMyFOKBEkiEwX1OitfqBg4XqlcGzcJaB7I=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YeJCfYqP+ZouVLsDoyS71A8JfXX325VTwo1GAKbKpfkJABHPifc7ga4OF4AqBxgO8
	 6JLla28EQfpszIv5IJ6wOlomfFQq0racCxmGGCyINGMKi2lDNndwfQt4tBs340uYai
	 FU9UdYJ5BLpnVO/qmIIgg5jw5Y8Lv5YQQWIeZAzDjQn7jgGR83qGNbnJFgMoHVtSnB
	 RcvalTtbu4qsXF7YquE2DfFQK2n6FMpWJNLw9rUNGMVAbZfd8a+9xviKCPN3D3IfVw
	 3S7L015JK3NLa4Ekvv2BPjTSLSDSxwbDqyaloLwfm2pz++ASpbEIEUH1ZUVJJPtbKU
	 uIMdQHy35JC3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD048606BD;
	Fri,  5 Dec 2025 21:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4674E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1CD540417
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hd3AOwPbXDYU for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F3C640010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F3C640010
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F3C640010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:01:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -442944317; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Dec 2025 21:01:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRcw4-00000002BZH-2tS5;
 Fri, 05 Dec 2025 22:01:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251205171837.22075-2-raphael.pavlidis@gmail.com> (Raphael
 Pavlidis's message of "Fri, 5 Dec 2025 17:18:37 +0000")
References: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
 <20251205171837.22075-2-raphael.pavlidis@gmail.com>
Date: Fri, 05 Dec 2025 22:01:52 +0100
Message-ID: <87wm30d4n3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iYvDOxBPXjCB8B6T33m6nNgVHzmyZG5j0ejv+JLwCPaZe37CxPB0pXrOIiK1lMtiQXoNqTK2yKLgYFamx6GzvUYG608Fey62MWRA1exSrdeg36CsPjntagRt7WPv/EbYJ0id/LKY1Xe/rAaGZ7aGlM7OwFDVAsxRVA6lxS8Z1smkbeT6fOunpYmHQgp711bPzyNAtYcug3i/B5tb1UqJYOPYZmntN2ai/8sM+HkykmjFiZJjTGuaCazw8Zwh7tSETB+0vftdxCjo3GOvJ00s5JVbNfrB/SeMM4utUwAVXwWOKX35wvButhAt3cX86qiPL7MRhmFPRGYtFBOnujhIwg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=ZEE4Bf3FZDX/ahOjyW4XxTlJF5jonuBWTeU2Wi9CvOM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=iYvDOxBP
Subject: Re: [Buildroot] [PATCH v1 2/2] package/xwayland: bump to version
 24.1.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Raphael" == Raphael Pavlidis <raphael.pavlidis@gmail.com> writes:

 > Changelog:
 > https://lists.x.org/archives/xorg/2025-October/062148.html
 > Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

This fixes the same security issues as the xserver bump and needs the
same COPYING hash update - So committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
