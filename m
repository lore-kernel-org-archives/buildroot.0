Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976F3F45A0F
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 10:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6BF615D1;
	Sun, 12 Apr 2026 10:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV1FRNqKAU4s; Sun, 12 Apr 2026 10:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FED615BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775990456;
	bh=PZOfk2/3OZwmo28oqGfPdr+wJhOYXhrqsF5J2tFCpBc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iFk+YC57gc18YLdf4APJzPgkfFkE98m/V3SkkjHO7uiApCz4gyZ1TxKbj/W0AOKsI
	 nSkO7h5FX4s69sobu9kzKq1RI5HDsyQSAj2r27Musx6hUJEfw78em2fGmYOIFQnBLQ
	 fKEFj/tBlZnP8H7DFFQEPUYs6/XETng12rp53Njtfe3PSljqMDkPqh2s8YdKypWRyk
	 NPKHI+cKbdtDVS052oIOGVUWJvd5OkxOSl/rkDjfDd9oZHLBOeJaCUrIhDHjtI4T8v
	 Snii3qNtAb7a3uGXhOcwtYXCe4Vmg1eZG/QpVETNvc1biM+IxuKDpbbW7jXr9Ocrg9
	 aBstb+Haz3dyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FED615BE;
	Sun, 12 Apr 2026 10:40:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7CB283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 10:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B1E7842CA
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 10:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRFYGkjmO_cz for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 10:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47BA9842C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BA9842C3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47BA9842C3
 for <buildroot@busybox.net>; Sun, 12 Apr 2026 10:40:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 219D92003C3;
 Sun, 12 Apr 2026 12:40:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 12:40:50 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 12:40:50 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260411080616.670069-1-francois.perrad@gadz.org>
References: <20260411080616.670069-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <1ec4d2cb0f3041cf1b28085659f5c451@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775990451;
 bh=ctZpNYL11qHZ3cgQR/k/FfwdO5/DM5eusbkpJGY9kDU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BPGLCUQA+OyPuCa0TaapWDIK34IUMArbE6QCYmBnFhUYJmSeP84XXMXsLC5JRlhGv
 jLNk3GxAxXu05Tqxzsi6KXEeILeQE5/oQgfyzeY1EkQANxBbfTfGNRZFwSpOvpPFJW
 WXArtVvqmTYd9rT2NyYrwGlupwgd76H573CbeqLrSkeBrAXHS+nROXAiXJAd72xTRI
 ZuEcinieuV/QD1zOCM46ismx7eSBcs63+lpwLk35t5qjYwt0eOTGkQJiyPyJIHLHvj
 Bh88djV17kM+GQkx8WXZwQwAZdCFGvjNW+0+KW60QQ1cRXzd9Yn9+vJDds/500M/Ps
 AXG+rgAoxpgLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BPGLCUQA
Subject: Re: [Buildroot] [PATCH] package/opendoas: new package
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

Hi Francois,

On 11/04/2026 10:06, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks. For info, I made few changes:
- add package description in commit log
- add comments justifying the generic-package infra
- add missing dependency on host-bison
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/3d454f76fce239a2d7887a9a04c354fc617059c8

Also, could you consider adding a runtime for this package?
You can probably start from the sudo test::
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/support/testing/tests/package/test_sudo.py

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
