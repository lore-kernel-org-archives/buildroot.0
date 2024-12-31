Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC4DE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F318540893;
	Tue, 31 Dec 2024 16:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBubXEcEuPec; Tue, 31 Dec 2024 16:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D777E4087D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D777E4087D;
	Tue, 31 Dec 2024 16:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F52968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BFC440881
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9Qg4__tQR9g for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 16:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4E6A40884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E6A40884
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4E6A40884
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:03:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -291453548; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 31 Dec 2024 16:03:42 +0000 (UTC)
Message-ID: <a79806f8-0cd5-4b4d-9c34-436f99d3f31c@korsgaard.com>
Date: Tue, 31 Dec 2024 17:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>,
 Jesse Van Gavere <jesseevg@gmail.com>
References: <20241231105535.1685869-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241231105535.1685869-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=D66NrOssCFdyf0QZ0EAdbeZ/GRrmK9XoIrb7ok1uK1pPnXV8Rx6TazOUT0Do/ygZd4Zb3NnUN2GWhD0kCZ6mjcKW8Px3936TCByuxUXX+Xhwu4f0WUSVqYfmnumxJbLWZ4qKHCgECE4suhhFJbNv+ilOnEDE154WOIKxstCp7zKfHPWHIeqN/FVgeaUvP3BRVAouEGCqMGy3H9aj/gcgqo57NgHtzqyG0HT3V5X3HbcAhZi6IuBoYWZIe1tkDvQzVfxtNuBFPPFpSPvwtgDBvr6U4Q2fBchA7BMpWaIhd6idCXNOz0X/SIUMgwRkpENfWj86iX1t1oQy2YEU/OOYyA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=PX/Q8Ezyyox1EpvVGuh+PWMs5u/mbfYBExCX1hJprWc=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=D66NrOss
Subject: Re: [Buildroot] [2024.02.x] package/qt6base: properly ignore
 CVE-2023-32573
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/31/24 11:55, Thomas Petazzoni wrote:
> In commit
> a9aa11544a1358609aee8446723898c6b5f22689 ("package/qt6/qt6svg:
> backport fix for CVE-2023-32573"), a fix for security issue
> CVE-2023-32573 was added to qt6svg, with the appropriate
> QT6SVG_IGNORE_CVES entry.
> 
> However, all CVEs against Qt are reported by the NVD on the qt:qt
> vendor/product CPE. For example:
> 
>    https://nvd.nist.gov/vuln/detail/CVE-2023-32573
> 
> Therefore, the QT6SVG_IGNORE_CVES entry added has no effect, and
> CVE-2023-32573 continues to be reported against our qt6base package.
> 
> The only reasonable option is to collect all such CVE ignore entries
> for Qt modules into the qt6base package, which is the one that matches
> with the qt:qt CPE identifier. This commit does just that, with an
> hopefully appropriate comment in qt6base.mk that explains what's going
> on.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
