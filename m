Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765A4C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AB5D80F6C;
	Thu, 10 Apr 2025 19:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWLcXvX9Zn-O; Thu, 10 Apr 2025 19:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C1C81F43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C1C81F43;
	Thu, 10 Apr 2025 19:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B20A108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A7F403BF
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eojocZ5C182 for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D789641980
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D789641980
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D789641980
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:24:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 78CE119F5A7;
 Thu, 10 Apr 2025 21:24:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 21:24:03 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 21:24:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250410134222.3928051-1-vfazio@xes-inc.com>
References: <20250410134222.3928051-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f716e4f32549b9c0483fe9049b6f2c31@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744313046;
 bh=15RCJpPOgxnPywqiIhW04n338KL+TmCd23+D/5F7Mw4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cev6Zy6jPV3fV3jjXCjO7yXcz558eMomUhPcMY3SCHJ3vOe/4WfRmN+z8ot/NEzKO
 8R0xa+qOwMyE4SHaRDge/WfturF+WD86VJ0TqKpqFmUavcrS4fAcLQoVeedpsd3VIM
 0PyVcnoCPbu7Rvxce15arvo84cTNHxUKGXIH6MN0oXNYyvRE4rT1lDgTfulKdRA23F
 JobO7e8EWhWfy+M0PVU0JYS0ed23Er3EJmis7KygyYy4KcqwCa6/JFTgI2SOLBENcW
 aQ6sWBJhoCuHttu36m09g5Qa2Ebqb+ou1aOrivdolNhN9RPdEqs9lvzvma8rDK/q7V
 yWdUGJANqLtbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cev6Zy6j
Subject: Re: [Buildroot] [PATCH] package/python3: bump to 3.13.3
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

On 10/04/2025 15:42, Vincent Fazio wrote:
> Drop backported patches which have been included in the release.
> 
> Fixup the tk module patch to apply cleanly on 3.13.3
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
