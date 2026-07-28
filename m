Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3522BC54F4C
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 13:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7516608A9;
	Tue, 28 Jul 2026 13:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEgGX-tuwmZS; Tue, 28 Jul 2026 13:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3246089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247110;
	bh=TNk1IJFNanY0oqyFGToZoD2YzhTldFJ2VBEUeGUn4Pg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FckFAxvfhUs3G43zhHJB+Wg9+2OPpo6afZAwJTgDr1zrXjFQXV7HxwlCwbDNFBa1O
	 Z+jHNbeWJiZxUZxWSN5pK723iePQoA3iwEbBM6JR9JLbO6irbQqr5cr7mh5QtYrO25
	 j7ZuucDmhXfJgJU1yi0/G4leKfMBVirtl+Lsl/QwrZVdILTKWiJ6/4/ULxAkLxQCFc
	 jw2INhuV3UChQ0V95V2nAWtGYgoMGakvBh/zQi6sV/ftwhbSr3WxF16TWntXSasSYg
	 iYfmd2HJgXHXJcyeqN4pwzdUGS8IPm+NJv0tnSHoTsIF/uQEX7Gkj+HygZ0oDhWCDP
	 KQ+aNHe+ORPqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C3246089B;
	Tue, 28 Jul 2026 13:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA8302E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC60C409A1
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kjdBhBnrWK8 for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 13:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBF1F4099D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF1F4099D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBF1F4099D
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:58:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2095001122; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 13:58:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1woiK7-00000000Ggi-1E7e;
 Tue, 28 Jul 2026 15:58:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260727173634.2763661-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 27 Jul 2026 19:36:34 +0200")
References: <20260727173634.2763661-1-bernd@kuhls.net>
Date: Tue, 28 Jul 2026 15:58:23 +0200
Message-ID: <87jyqfqkqo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ewPvJrfTWsumDCgsUNP+g6y8QavWP0ZkeT0DZ43YmxMTwpNefH04DXVJ17YYd5HGuDnE/igHSvGiWcYrDHtgPe7Z81oJq3G62AHL0KeJW3zAmiNNmJeBRDvYa8i0wicuMWGojtzomeBiKZraOVGRvdPO6sk3JQ2Zt5k0uPSnFc+nSRatqAUrnXY6G3uQa4d6Z/iH/Tld74J3WACQqtUeKu5NdzyFynqocYr0v+17JhryYg/JR/ERlyXNf4/SW8Md7HYC+0OoOrFpSvpS1FQL3PN940/P/WXUJIynWmURJyVIBMwjwWO/GqFg7Q/fsTxulIOmaiI+s+/k/5PkhD0xyg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=jpgbUkTlf1pKl2zdGezhc500xlVi/zUKI6/VE4lU0o0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ewPvJrfT
Subject: Re: [Buildroot] [PATCH 1/1] package/libdisplay-info: bump version
 to 0.4.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://lore.freedesktop.org/wayland-devel/m8VW4lhPjVf_0WLHD9BxrcFL67zweO2GpHqTEWBsrK4SQzFV1iuVJ9I3I_hAASg9hNA5hWmQxxEFetyGsNOtM7Z5Cwefi66h-FzVKMGKkIs=@emersion.fr/T/#u
 > Removed patch which is included in this release.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
