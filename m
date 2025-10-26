Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F2ECCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 18:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C20540FA0;
	Sun, 26 Oct 2025 18:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtJupeJ-C1Lk; Sun, 26 Oct 2025 18:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 474AD40F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 474AD40F94;
	Sun, 26 Oct 2025 18:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E358D7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444C240F94
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx0uUqLEbMHV for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 18:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68B7040F90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B7040F90
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68B7040F90
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:15:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 19A9678035B;
 Sun, 26 Oct 2025 19:15:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 19:15:44 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 19:15:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251026102925.1361128-1-bernd@kuhls.net>
References: <20251026102925.1361128-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c7f5655aba3890681a7cc81f01548744@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761502545;
 bh=0bLTZqMVriy5ZqfXGZaTye2JBBuFpT0qK8+F9h9606A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eMw1Vis0vsdDEFA/xaVVsYSiymOX+XTRqig3tolwK0Um3a8KQIHTIjRyzkrIu3Cd9
 eSlYA0Kxj52BV/AlnJztbvZhuxlP0jWPNnydVwNvD48gWPxriqrHIv8kD9cg0Z8/Co
 2qF8ScHRR/jmza/20PtTPqMpZIrfh7jdAX0X9W2dPMeOHO3nKxinf3OAyVSg5JOgf+
 5hbfti/Hlh0/rO/FwfLZ+hPcDjxQe60uwHIKEy8aLPw7nrztXMtcLwOPm96eH6201Z
 Y2hHyaTNbchOb/t6pLcnx9RV6q/b3Fk2Pn2C93raGLRrVVBshGoGOy3D8bGiDu26eH
 EaPkxS0P/U88g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eMw1Vis0
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.194
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/10/2025 11:29, Bernd Kuhls wrote:
> Removed patch which is included in this release.
> 
> Release notes:
> https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=922a15cce7163b2bee605a26132d833dc0c29074;hb=eb7f17d5016a75c6fdb6431aff1c1804d8c290e4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
