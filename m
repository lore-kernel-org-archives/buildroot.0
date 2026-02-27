Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C037AFEFB4E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 13:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3737260A70;
	Fri, 27 Feb 2026 13:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOPmzy7cUFlK; Fri, 27 Feb 2026 13:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 715A260A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772197878;
	bh=crmOF4+qk+VH28U3dkcslRgb0MlVwbsLB3h0oxuAT18=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pyfH0lY/Uzs4h9HIVXsa0lD04euWWpL+Tsz2vo5yVwRFzyaxkE+VlJO3dJugtK+nu
	 iFt0t2CM+kiahcImQICj9puQotv9n2oAEcEA9w+mVwr6rVYrWS1ZvhcgsjD7K9LRTw
	 e/tAfo/d94NNP0Q48G8x8FdwWdQJS/HNOwF9euVcci0ZRU9NGwsvpwGoZs+2UFoVav
	 lalJ9rvWyFcJFt2WNP7tQaGUSa1YzRnpQk+tJAB1wpOWYd/aQEAVySiunM8iySsKbt
	 sTA1d/062PYGTSxhQkDGTgllxg/x0FpXlbbIPjAoudmtVCTAZ30N1x6JaYR3rdOaGo
	 4YPzPYHjwgUdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 715A260A6F;
	Fri, 27 Feb 2026 13:11:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99458131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 13:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EC6060A6F
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZt_U6zWNBaF for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 13:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9944460A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9944460A6D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9944460A6D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 13:11:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 198941A1A66;
 Fri, 27 Feb 2026 13:11:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E4DE05FE46;
 Fri, 27 Feb 2026 13:11:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 373D61036943E; Fri, 27 Feb 2026 14:11:08 +0100 (CET)
Date: Fri, 27 Feb 2026 14:11:08 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot <buildroot@buildroot.org>, 
 Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Message-ID: <aaGXv_uW9n3CCdm1@windsurf>
References: <20260218124726.120001-1-mooz@blockos.org>
 <aZ1Cc77UDKkaGWsM@L30177.local> <aZ20SDo5Dxnta4be@windsurf>
 <693104517.1118565.1772186066394.JavaMail.zimbra@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <693104517.1118565.1772186066394.JavaMail.zimbra@blockos.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772197872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=MUKEcLi8oR7v1smnec/2PDmC3Re/zu1ZVygLQ1Bx+CY=;
 b=0g6qZrkk+hT9hvqI8wsOIQnEY/4tds5rATsPTBc32IG2mK1JaROZOgNv/B/RgXTcYpl6X2
 KC/yJvGJnzEoJxwGN5LgdR1hPZNcDSqhvxAJNP43JWT7N5hG15KCB1SzSEPvI9LDP+Aan6
 Jn8kBNN7VlG/S7PMDoBV7dshTGLP0tMAp8W2R1sbP20jGWuTy7YJU3UZ4EQx254wkLNpac
 nxmWbNuW9rGJaKTOJJsLdBrnpMgdfwdFAVP+Xzhooprx8fax8r6VyvGcnFELqCXA0N+LSO
 kdf7gEk6VNAJV31yfjzAFG9VU4OjZdYddjZHSQTmXMwd38KHqfpJzkxi1efBCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0g6qZrkk
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Feb 27, 2026 at 09:54:26AM +0000, Vincent Cruz wrote:

> > Absolutely! Could you send an updated Buildroot patch, which
> > integrates this upstream sysrepo patch?
> 
> Do you mean dropping the patch file and making the package use the devel branch?

No, backport the patch to whatever stable version the Buildroot
package is using, and add the patch into package/<pkg>/. Don't forget
the Upstream: tag in the patch, pointing to the upstream commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
