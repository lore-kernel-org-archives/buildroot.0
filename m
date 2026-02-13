Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62920EDF148
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 10:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2505E41BF8;
	Fri, 13 Feb 2026 10:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUr08WwxJwmz; Fri, 13 Feb 2026 10:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91BEE41BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770979455;
	bh=Zoc4bE99qk4n3fW36zkyXftLeepPKuFxb/fz+CwxQug=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XFAUs+KTwrsiaQMbcpeqvMkUgm58XV9q3VUjmRhL611lhPv5ZQTFexB/iykHHya3e
	 RmQqe4B4zBaRgXk8LBB3V9lD8T0ZB9jGgEpct1Sbi6OgMr8wCLgsOeR3iCkINjgOE3
	 JklAwd2XA4B8YMNgXCpdBYT0UIYQKoewjgoS2VD+rlL41dIyHZ0cOsfgnlOMYY25x4
	 NMKJMXHerYQn4ifIXGi9skEzgobixfppZcShUZRYpgfDrLO9ucftDSQWopDMO3mV0w
	 tRipfaIbc38bFnLl8MJ5gFyKkiMYoc1Wda8JrxpIPSW+UeqVnXc+JO2fCXwapRpjCt
	 Iia4Kqdeu/bPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BEE41BEC;
	Fri, 13 Feb 2026 10:44:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAB71255
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F9C040B01
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKV8xDud9xJP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 10:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A021E40208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A021E40208
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A021E40208
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:44:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 25EB96012D;
 Fri, 13 Feb 2026 11:44:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 11:44:08 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 11:44:08 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <28f39cebabfac2467fcd43416b74193d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770979450;
 bh=+wZaHv8cwOxy1Hl9X79HwXPwU4iZPujpcOKHlV+qXBg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PETa7xMJVbnercLdf1gnxWEOraTDim5aHEesjYe7rzCINwLGnL5yUD1AsIVk/pBOA
 C17bYpiG2+V+gQaCu/et0mFfD8YygDfjHIJwePoqSIbRvwX1g5YvV8XsNe8nhK7e6/
 ZNMcszcWsVYF2ld3HhlWqbmuM6cafUE/jVQBgQS+In0DZYr35LK1OkTR/1NvPv2JAO
 kZFRhQ7IPEx83fnatXdhC4CIZ9da5fMjUr3pr53jXyPLTHFHGWY3qOFZ9lLonz1TNG
 BMO0QndAPjJQxJS2lmjlO8QC5nzYO5nWVpUYm9y0HNY7DEF5iiR5ucusz0ZmVBdr8g
 Ch9DvMeAend+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PETa7xMJ
Subject: Re: [Buildroot] [PATCH v1 1/3] package/linux-pam: add security
 patch for CVE-2024-10963
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

Hi Raphael,

On 29/01/2026 17:10, Raphael Pavlidis wrote:
> See:
> https://github.com/linux-pam/linux-pam/issues/834
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

I applied this patch only on master, thanks. For info, I slightly
reworked it. I fixed few check-package errors, and added extra
information, to help the LTS maintainers. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b95ffe208b087699d923f048ae8e29bffb587b1f

The rest of the series is a somewhat large, non-trivial bump. So I
prefer to keep it for the next release development cycle.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
