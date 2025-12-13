Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECE3D5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 13:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8BC60D71;
	Sat, 13 Dec 2025 13:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uVLMZmKKCZI; Sat, 13 Dec 2025 13:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 583DD60D4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765633775;
	bh=+JPreNq6Q2amlVv0zGdZNaNsl2KuCJ1P++/jviDQ1F8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdIdRGmoFvBBr+9mIJpwfE9tBF+Y+HlRQOf+/TyvmPsn5oMNMzuEAfmJ8YlEeGygL
	 i0ulqDhKjIzUOQOCNX0aB5/k5oBqRF6LmXs2dGmy78B5XLYHlqY7XzjXxlQw1Odvi0
	 CegdrlBF0I1VQfVcIsSoIaRoreL9fpY5Mn8XBKCx00ph903E1lZr4rFCRXyir9T/Tr
	 8xyxO1bhI7NTmroprObLELSUshlg31rnSrccLUFLFWhQsOHp6B9TvePXv5Ny37fnnp
	 psmTipXzmRgz45Og1BOezBlJftwM+0IuT5w050o+Kzg7lsxLPH+iGYeK3M+T6y/9Ih
	 dgVTg9nTZ/QlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583DD60D4D;
	Sat, 13 Dec 2025 13:49:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C242C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 13:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 148D240235
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 13:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNC0kMdeYROV for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 13:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC7DE40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC7DE40018
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC7DE40018
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 13:49:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1625766581; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 13 Dec 2025 13:49:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vUPzz-00000002XDu-0YLh;
 Sat, 13 Dec 2025 14:49:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20251030190936.262624-3-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 30 Oct 2025 20:09:36 +0100")
References: <20251030190936.262624-1-thomas.perale@mind.be>
 <20251030190936.262624-3-thomas.perale@mind.be>
Date: Sat, 13 Dec 2025 14:49:27 +0100
Message-ID: <87o6o2ze3c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=D4RNftE/JBIdAAvzM22crx+0VSF2iBdaw3Jzz1vTQsKbOa5lQYRiIcpue3wTIbMuXqtHVg+QZBo7lx61EjOvqcMbC7Wk3C9mfiXG78CupNsM36SA8MFu65tO+fZHXAPJPoHrBSGy4yBQe2WtGzOeHOZe837Sz87M5i0NiwAdponmDqgTfxNys/0lRndWC2eQXDFwlY+jjkrxKAdDjiZFcsSlcUPY0VW0p09w/1rYhQI51JRQIcSMuVrY8M0ogCUhpGZvCHNEH5crPpZ2JptJi3d63Po94SWbv/Ilp7NZ47DPLSmmmUoxrmS+yN9hNEnI25G54RuyWGmMQGyLIuyDaA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zr0vunIDbfRreZc2Q5SH0MjBKf+siNcEhwtCtGB5xUA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=D4RNftE/
Subject: Re: [Buildroot] [PATCH 2/2] docs/manual: mention CVE trailer
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Adds documentation about adding a patch that address a vulnerability.
 > The patch-policy file now explain mention that patches that address a
 > vulnerability needs to include a `CVE:` trailer with the reference of
 > that vulnerability.

 > Until now only adding the reference to the `_IGNORE_CVES` variable was
 > necessary, so the documentation of this entry is modified as well to
 > point to the patch policy.

Maybe we could extend ./utils/check-package to detect when it is
forgotten?

 > +----
 > +CVE: <vulnerability identifier>
 > +----
 > +
 > +If multiple patches address the same vulnerability, reference the vulnerability
 > +on every patches.

I reworded this to "in every patch." and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
