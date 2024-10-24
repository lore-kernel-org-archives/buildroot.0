Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F8BD0E415
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201BD403EF;
	Thu, 24 Oct 2024 20:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm2MVgU7YggV; Thu, 24 Oct 2024 20:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E29406AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E29406AA;
	Thu, 24 Oct 2024 20:30:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF9D3497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B081D4068E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVS4jKpNJ6y3 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.54;
 helo=sender4-of-o54.zoho.com; envelope-from=aaron@bubbl-tek.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B891C403EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B891C403EF
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B891C403EF
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729801829; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WkpybLowzFPlgY+BqpxEKRGt9F2MbA+FFvUern9Cf/Xq6weQFqFCxbTlYdVlw28PMD/w4ITbb3VM7ppJKsfvfD0zioKfQVHRLrvJn+OuOZuiQhqO8fv3gs7I7fD7EtQeCkkUrQmWKw/JXJio/rPhgELSBjisStl2Kl/tccaXsuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729801829;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lQ/RU+tafLWsR2O1Zbx3DwyMjPn9wBwN3v8cSDndE4M=; 
 b=HJmB4QEbobz3ViG+gH6aJKn6eb5VuMJk4O7mIpDaTwxF9mtzltL3Z0kqsYC2+0XVHMsGAizYQn5Sy50nQcYICRQGp+INLbnU1mEgMc9A2HEU1LKlB3b4bCcZ+WitpuZ/KsLuM/es5Np0qEPs6oB+0P3g1pDuJuVngLnzdul0yjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=bubbl-tek.com;
 spf=pass  smtp.mailfrom=aaron@bubbl-tek.com;
 dmarc=pass header.from=<aaron@bubbl-tek.com>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1729801826709930.1678528835896;
 Thu, 24 Oct 2024 13:30:26 -0700 (PDT)
Date: Thu, 24 Oct 2024 15:30:26 -0500
From: Aaron Sierra <aaron@bubbl-tek.com>
To: "Aaron Sierra" <aaron@bubbl-tek.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Vincent Fazio" <vfazio@xes-inc.com>, "Andy Yan" <andyshrk@163.com>,
 "buildroot" <buildroot@buildroot.org>, "Andy Yan" <andyshrk@gmail.com>
Message-ID: <192c0393182.d05ea8bb202213.1651339018002716691@bubbl-tek.com>
In-Reply-To: <192afcdcd6d.1213d420c999874.906482760730917485@bubbl-tek.com>
References: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <Zw_FDy5XWpeQ78sG@smile.fi.intel.com>
 <1929b27b55e.1242e8abc627480.7414881916261699452@bubbl-tek.com>
 <ZxJL9O0KM7WP7b-d@smile.fi.intel.com>
 <192afcdcd6d.1213d420c999874.906482760730917485@bubbl-tek.com>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1729801829; 
 s=zmail; d=bubbl-tek.com; i=aaron@bubbl-tek.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lQ/RU+tafLWsR2O1Zbx3DwyMjPn9wBwN3v8cSDndE4M=;
 b=S0WdeXwzotkKZCKAlAZQYasw5y8e+lwsQEGC63uzfGOpTWDOQ91jmvj07oeXsThD
 En5EnVJID/u5tZCs4b2BLz0Cpn5Lvjuo5VJ+ar5Vj64RahtsYEkkSYEalGR/BPjrvfo
 P0lfDF1Y0ZozxTqPwboPb7seV3ZjLM3e1stYs7yc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bubbl-tek.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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

> On Mon, 21 Oct 2024 10:59:13 -0500 Aaron Sierra  wrote:
>
 > Hi Andy, 
 >  
 > Be on the lookout for contributions to your repository that address my remaining concerns. 
 >  

I've posted a pull request to your Github repo, https://github.com/andy-shev/iotools/pull/5,
that expands the runtime (and project) documentation, while adding support for symlink
installation in a cross-build environment.

-Aaron
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
