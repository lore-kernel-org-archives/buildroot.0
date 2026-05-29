Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288ABCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF15741F08;
	Fri, 29 May 2026 09:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKlxuF4E-Bx9; Fri, 29 May 2026 09:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F363B41F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047191;
	bh=T4jWyL1M6y8IdawsWrsq/rQZjoOzvBzPihDTsaSVJlA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikJZp5MjosczcCiBOHm8nIY2G76PJafccfo+H4ApCPGGILQ3O9m/FjzVrYBMKhf+m
	 VU4Hkd15ZTBfT5Gf/wJD4IzKSiY6+sSofQK4V/27lc1lRCZ19PVl6ngRKGYPFFVlEM
	 v3KshdoORrk6YepuvvZowuUUlwl6PEEV9/plZ1d/NrFIDUSk3iMDdYh7AhOoJZki3O
	 Edd4zAADkAAUUEtQNbFrtIcXMQoeTLc3AZ1zs9AL6BeupompoAS+4kEMTCNKfVaOco
	 gH8Uq1zzp5gbAjJXzp0OVRXz0krL+GJygG1i/btlqagBmdfELYJHeJWR2btFV0/LjT
	 ZuwV7tfoW2Ppw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F363B41F0C;
	Fri, 29 May 2026 09:33:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D0B2F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C08F41F0C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDHbtR6NNrTq for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E40F541F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E40F541F08
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E40F541F08
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:33:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1590370299; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 09:33:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wStaQ-00000001cot-2l9f;
 Fri, 29 May 2026 11:33:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260528172452.25273-1-raphael.pavlidis@gmail.com> (Raphael
 Pavlidis's message of "Thu, 28 May 2026 19:24:52 +0200")
References: <20260528172452.25273-1-raphael.pavlidis@gmail.com>
Date: Fri, 29 May 2026 11:33:02 +0200
Message-ID: <878q92k1bl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NYjAevRQT2zbqrdQCtcnmL9gbL7NUDRRprN/0xXUAW0rrWoiYKS3RGWjOx8OgtXDHdRDXiMQWaTi/08UyjWUc116znyeMXakIIqvoQU3y5VtIanXm/3wrG/+dvKAroQRMaKGIFEuMwfOiv3UjjbYKHfKeCsUpoXvCoOkqByarAz0aEp2NumwMj5arIrFmHBJ9aVKvw7rQZcnrjfHK9drZqSikvjIzdQZAAufws1Dpyzr/hNddWfv6TP2/JuT9LXdQIbiDGCGWLni5AUpcU1efQTRm0DzEHVxHCxaJEzmpGI4C3SpwvAsLsEvrNnbNRWDOUuiEpxXw1Soxu7pUJW1AQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=BQ+qYUHE9y+kbLLzOSCf6FKO49dLIXTDkH4l+cCHgKY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=NYjAevRQ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xwayland: bump to version
 24.1.11
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
 > https://lists.x.org/archives/xorg-announce/2026-April/003697.html
 > Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Committed after extending the commit message to mention the regression
fixes included, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
