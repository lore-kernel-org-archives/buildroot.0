Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B543BCD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 21:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 668BC6F9A1;
	Tue,  9 Jun 2026 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0Ep9PQWrcyb; Tue,  9 Jun 2026 21:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FE56F994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781039133;
	bh=4I+zTiAWBWRCpVHzsXJcyYzs4EJsfYFW3eHH0D4qm0I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bp9YSjN4zDqQR46t0ELuWw0G3vLd63/r57JAkFf1UH5MhBY6i9Ar1BW5MFi3Bs9O0
	 1LVB8JqXMLtp95l5cGKBsC5RbC99380Gnd/Xqe1V1zuIS0oYIOWABj7qEslWTxsytO
	 1bwpW6mw+4GNLYO6lmdgg6XoHiGihmWsjNRzCV0Q8Z93G+/ZNXNqhrUfnq8OrA97mO
	 TD9SNlit3pvuPZwT3v3eJS6Ryam9cX4+hF8N/jCB6HuUOamVkOrMBBJvvl4ABBy1m+
	 5nz/JcS5pjBIj715wSBFtjMhBin0qQzM4z7agkmNUbwKV/XOsVm4sir73eJtEIU1UW
	 0oaZaeqsrXd3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FE56F994;
	Tue,  9 Jun 2026 21:05:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB29225F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D10D04EE1A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TW3YrA3zCJER for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 21:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFDCC4EE19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFDCC4EE19
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFDCC4EE19
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:05:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BE938B0053E;
 Tue,  9 Jun 2026 23:05:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Jun 2026 23:05:26 +0200
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 23:05:26 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260609164349.3008084-1-peter@korsgaard.com>
References: <20260609164349.3008084-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <0f214afdb34d7c86564e59dd476ed641@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781039129;
 bh=RzJeMTR5ytem4QtaZnbz8eCVWkZaLB4rKa4KjJzZrHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kcth3K4p3uJ9HTp1hydTdh4j2BTYavu8vvlIeqZOy6U91juN1quHSz1I66+Cz7hCR
 phv4X1PUBcBcm3n6tKgIq/kD8r99IG02el+qJMVwI3YIafUgA8lAtGnLB9kIrmnFGp
 S2dpz2I3kMfdJAXUbQJrmcm2/qNAwSK6UIPIabG8OfEDnZ9Trxm34BBdDycOs+Qq7B
 7I4GxrmKWGSte67Fnu+WhQC+2lskN6WfSXcuI9CxN09BKN7cVGntOtD5aJTvN7lrtx
 l6vR4YJShBGim945x/CUdFkgpXtS3YfKx3gvj/3PqL0QVBaq9xycoMtVdWcJxTaOLg
 lGtU7SCBsGD1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Kcth3K4p
Subject: Re: [Buildroot] [PATCH] package/apache: security bump to version
 2.4.68
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

On 09/06/2026 18:43, Peter Korsgaard wrote:
[...]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
