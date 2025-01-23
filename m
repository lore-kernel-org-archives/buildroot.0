Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D56C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 21:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89225403C9;
	Thu, 23 Jan 2025 21:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4ByWcUMrFCF; Thu, 23 Jan 2025 21:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CAC403D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CAC403D0;
	Thu, 23 Jan 2025 21:20:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5705B959
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F9D740467
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cii8ls9CKrSS for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 21:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8226D40264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8226D40264
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8226D40264
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:20:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6BFED19F59C;
 Thu, 23 Jan 2025 22:20:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35696])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 22:20:05 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 22:20:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20250121222226.3132314-1-james.hilliard1@gmail.com>
References: <20250121222226.3132314-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <15f56d864a0d6b396b169698026bd38c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737667207;
 bh=+QGEW3XjU+VV+Mz6K8ujJut2HBSDddVOWTASiJCpPu4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bpv+RM9XvxPAWgAn1X/7ZmEjD1c14cYetJxxPbka3K+F6Jz0q8JbFIjhUtf24G06V
 Gtl+GpZZTRakp0Lzfqnx0B5xQ78oAGqqjq471Pq+AMxChzEitRRFfL6BE6V0kNel6C
 QWxrYTT2u/ZArb8978id+XRSRuwoila2lMxaqBhk1H5BDU4/LL/Gr4WDlT6xfYEnAo
 HL6Y082U8yM/I2DZI+nvO4obBo47lbupTJF5KEHbL3wZHnQHHnOuko4tJMJUT+YDIh
 iA/hDEFwl6BMUPeDLoluaMTRlVC617lTzouvba+yOt1xtSX6KO2mBArHfkhr0T5uY6
 LNE6m/hg3ZgPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bpv+RM9X
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 2.30.2
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

On 21/01/2025 23:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
