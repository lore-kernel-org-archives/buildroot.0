Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2FDEF48F9
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 09:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DF341B91;
	Fri, 13 Feb 2026 09:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNZlJP14kvbX; Fri, 13 Feb 2026 09:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E6240BE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770973952;
	bh=WLsORa1uahO22I7GVCkxvw3huD/6n/Z/t09/gmPd9Z0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yoncolv4qgY2Sl6Up8WHkDvc3H8JJL95Y2XDqjRIqiKo/u5f0f4wY1F4/ol3xpWRR
	 G2ydh0fMvVYdrkM8Ijd2BpDGV/cDq315zPhCZn65uNlZicr05Reyhknb+0p4OVNGaZ
	 qpabQrS4z9uyENB4R/F4M4YdkmM4L2qHqxfxs2brHyv2riGxB6HT2YCvI+VvxIu0uC
	 iDsWb0EBXmoN4XaaqKuD/mTY0oEzAwhSn83JBkcfNKv4I9VN2jqPOvtx3T0C8uf25g
	 PohRPhFUfha/8nn0Ws8e1AtWqCZzCNQoCmbEMMtAVvKlw1kUDYdGGz0AHJqTfmrF34
	 T0QVYLWD+GO5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E6240BE8;
	Fri, 13 Feb 2026 09:12:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 974A3EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 09:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78F6240BE8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 09:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT0rAfpqQhE6 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 09:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59D464053F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D464053F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59D464053F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 09:12:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 15C48B00565;
 Fri, 13 Feb 2026 10:12:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 10:12:25 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 10:12:25 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260212102336.154817-1-thomas.perale@mind.be>
References: <20260212102336.154817-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <f8bff3d4189b16920ce7b125a8f0e6e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770973947;
 bh=srdVgxTOlnYhcyhZCddZCAoc/dTV1l5OqvC/vuP5JqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MYXa1e8QdIEePAscrCMMbrv0pPuoUsFTBTKYwf/3syOMgUwBWaWYEJQIwOTjga/2h
 9tS9v1sSEIha6SwcPAYs8kkJpLOZGeFPPZCJZJUeXqplhumemM4AtSWVU4F5yPxJ3P
 Abo8U1x4huyFa4wjI5i5/f8kLjrqGik8u4makPf/bvHfBVris+6VCo1wZkFNYmo4Z9
 4ypfe1+22xTlV4JAM1r62mDMwjpELy/LhCTF2gP/XH/++fuK5fN2TPmBa5SKtQDwyt
 2ZMBNKKllwQ8i85OozLndm/Ex58Bk9C69jP3BYjsvYj1cONTdYvBVuDugAxxYDeBOX
 /urpND/PBfE0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MYXa1e8Q
Subject: Re: [Buildroot] [PATCH 1/2] package/avahi: update _SITE
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

On 12/02/2026 11:23, Thomas Perale via buildroot wrote:
> The github repository lathiat/avahi now redirect to avahi/avahi.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
