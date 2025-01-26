Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D796C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D3E6064E;
	Sun, 26 Jan 2025 10:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYAOjCdf4BC6; Sun, 26 Jan 2025 10:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0430760661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0430760661;
	Sun, 26 Jan 2025 10:43:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8699DF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64F774063C
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-inIVO77cPl for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CC2F4062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CC2F4062F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CC2F4062F
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:42:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 439B819F522;
 Sun, 26 Jan 2025 11:42:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44912])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 11:42:54 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 11:42:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250125182148.234260-1-thomas@devoogdt.com>
References: <20250125182148.234260-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <16d6d5fa0dc9be7c219a42b7f7046b2c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737888176;
 bh=PyMI0ycBFf/C1fPc4uw/LIJ19qg8kOfiLIJsMadCSFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dZGiqO3+rZ1XpePst7DQMY3KNxpFhOaAm5Wy5mg+0JKHFTSmArNB5Rdy/f8zOta6x
 XEPpIxtYqDQ/5oR0Jg7JHoMw6DbyOR0S1s4mUMOwjtnkLFbvcKfvJDiBtJij3pd53m
 H3C1e/GItp19zzge32B5EacRNOi+HrKe4/tw1bzDUt5BmKkU2Df/to2WY79Kn0XobM
 49GbMGsJOq25nG1fk/qsebe4Erplfy+xaGr9zrZ9DWDiWe8jdzY1FKfLAFCxET+S8Z
 ZYa+q3yn53X+w6IvlgFn8EMPYPRxOEzCKCNkZ8RkEgi554ZDWMypaTGct4suGLTz/B
 jDPd09WDvVksg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dZGiqO3+
Subject: Re: [Buildroot] [PATCH] package/fontconfig: bump to 2.16.0
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

Hi Thomas,

On 25/01/2025 19:21, Thomas Devoogdt wrote:
> -FONTCONFIG_VERSION = 2.14.2
> +FONTCONFIG_VERSION = 2.16.0

This bump seems to introduce new build failures. See:
https://autobuild.buildroot.org/?reason=fontconfig-2.16.0

Those failures seems related to:
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/436

Can have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
