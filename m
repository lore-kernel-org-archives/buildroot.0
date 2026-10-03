Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D26CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609AF60F3F;
	Sat,  3 Oct 2026 16:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjlM7dob1sBu; Sat,  3 Oct 2026 16:12:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2A67960F17
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043924;
	b=o4EsobdajPGQEPC1i+i7TG2l3fxYDMin2gWp93YjrxYbLJkR3jYO7CNj5qK5FQ06DLkm
	 NIxZ6DQ3HcQZD86ETNjFEoQr6wLBCGbyLv5oULRFGFIUXMNJIhqBj5mOqAHLquiS1pdI4
	 9pe5VVLxSoLPO76mUHpwWeJ5YGpBQAdLVuSVg4XHkcoyt3NECFlMSslEuw8Mw5x+7yBms
	 MyFMKQLsPxXZrjRFli+U5i0Bed++JmrS/8mWIbuxPv9BnqD97t8GQJRigUc5eGefZtVMq
	 1eOIFNztsl4O61JbN2IJUBFtMUdCQwD9WXm2whNPSf4foJZQRphMUs2EbuPsVQZKHjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cjz+no5jjO7GmEfE5E4IZDpf0sSH1OAfEi0Ts0ugZaE=;
	b=otmF2Dd6VDkJ5EEMx4ypJ+zKxoZAscG6IJhkABfMS02rNwH0D9EEEOu6cf8it9Cn/ooQ
	 sll6/xeMxSV9yBC55iZ4WRyi6nkiqQC1aoE7kO0gW/YQ+5ax/InPZESs6ZBJW2EHiVTzs
	 qdyYKfUQS2R7+go4AGdwc7ZCSQK/vhuNP8mXBAOngs3cgAqunROUqsQyrG7sUc9270ybi
	 f3wbh3UoWhyczkP4UjuaibYBsymPen098Z8DskMIxPXHA87ifa6bEldDfShQfsFq3ojdX
	 PriBv12BEfnGUByliBRLXv3g//UGmJxo6MN6zSk7ROALugC0okTkj35wXwZJN/IDaVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043924;
	bh=Cjz+no5jjO7GmEfE5E4IZDpf0sSH1OAfEi0Ts0ugZaE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PklFtSIe2Qt2AQTTq1WN0ZDbtXXfNeptKI2icVL8r5rDvIEF3zNM/qmXVlOFVc5wL
	 7oDMju9Q3IkV7KdTU5A1I2Vh/M3diQWh073Oad5aVdRKcv2vA4NiuQlI+aUbvNpWwy
	 vEIcKXAtRb837hRmc75uq7kQhB0FY+srYMQqeI+ZHqku/25kpS0ZfOgLlNn60IOmfS
	 JmaywiEb3CVodsfW4d3SBIDbHXe8APvF7HkDbzMR1dJTUEvdaalWQp2vS1/to3Nzry
	 0d9FRwN5VxzjH98FcQQuEMGpZp6rSxwbqXQnnaWa4fj4nyZUxzGXHWo5ivYS3ZQ8Df
	 O2Uu4s2Q5yqfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A67960F17;
	Sat,  3 Oct 2026 16:12:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25440335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D3781772
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQSuMgQutl8V for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:12:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8F7AB81773
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791043921;
 b=LbDUMMrc8Aqy+wyKjz+sjiPjucA0h2O3rnC6QdTrifCxghJZgAYemDeDPzypWyTYfU2u
 QOtGXnUF60erHYkh+sPoVwhrl6j8vQaEDvzkObdebmhTrL2rSYgnIB4BjxfU/HHL2i6ue
 5d8FC1jd90QGky0erKwrGslXNusv3U2pP1I78vTlM01wiwZTizQjGYDivEO08x1VymSA4
 T5Hf3xeIZFaWOaVSRIU8vazzPqFLLko6KfIztN8aBLrWIhA07Cx8RAwkVGyhDIogn7ABw
 l4qZ0ZAgmkmjmLD9ob1zW5M7hxpnTM7z0NBk2xt4HUnAMgz8N9gOQDKYCOROgPfichA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791043921;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=oU+33dTwE6Xrg2PlFu7EwNPfSI5wAOkWisRQKC77Frg=;
 b=QntWtmy0ypLkKz2SV45j9EyRRIcNXfGGHcK5rdSMlnTZKWS5anVrI9b7CR2QKMwjDgvJ
 7P26K5YPswDdBwUqyAzk+gfuakxZDgliuiYTMmJJoJ/OSagPyiWuDYwKnYJBvjYMISJjV
 X57nhsjA/2ItpoMXxHSjLeffQjkyM9biR0WiF/zcG8EV+/5Q/y2QWUY83NCaYumjJbd6q
 EJBYIcRCo0ZH2/4QGVN2uDHjlsg0FcbQhxldvQvf2ozw5rBUxWzpniLgDnQqDOwhXP4ZR
 zsSM4jAJ/8H6NEDMeMFH7/I/SeY1nlrKGzYfboBTMChWl7fPvgIWyOHpX/l4NY8wZmQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="2Ek28/7I"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F7AB81773
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:12:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 384A04E41134
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:11:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D145604FF;
 Sat,  3 Oct 2026 16:11:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 056081032827F; 
 Sat,  3 Oct 2026 18:11:56 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:11:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <asEpSMkzfg-4r7Ls@windsurf>
References: <20260920174242.368233-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920174242.368233-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: security bump version
 to 8.0.7
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

On Sun, Sep 20, 2026 at 07:42:42PM +0200, Bernd Kuhls wrote:
> https://forum.suricata.io/t/suricata-8-0-5-and-7-0-16-released/6315
> 
> Fixes CVE-2026-45764, CVE-2026-45766, CVE-2026-45769, CVE-2026-45768,
> CVE-2026-46387, CVE-2026-45759, CVE-2026-45762, CVE-2026-45765,
> CVE-2026-45747, CVE-2026-45770, CVE-2026-46352, CVE-2026-45767,
> CVE-2026-45763, CVE-2026-45751, CVE-2026-45752 & CVE-2026-45761
> 
> https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391
> 
> Fixes CVE-2026-63452, CVE-2026-63450, CVE-2026-63449, CVE-2026-57227,
> CVE-2026-57229, CVE-2026-63446, CVE-2026-63448, CVE-2026-57224,
> CVE-2026-63447, CVE-2026-63451, CVE-2026-57222 & CVE-2026-57228
> 
> https://forum.suricata.io/t/suricata-8-0-7-released/6467
> 
> Fixes 67 security bugs, all CVEs are pending.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
