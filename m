Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1321E8538B
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAC683163;
	Fri,  3 Apr 2026 17:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S57Ye9PczvN4; Fri,  3 Apr 2026 17:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFCAC82EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238466;
	bh=vWV9g7erKJfBho2VO9KEizS8RKW8hL+gEhBCKaNv5vQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PCCvHgXgM3yU8iiM7cgfjy7VWRwKUoz87wnmC5QKW/dZnHSeIt11L0Kloo51CsgTU
	 QwU8Iojyvq6cBd49O5lFNB9DFTWCbJQLywaT5H4VR4s9hngPI+NpODD4DDXEbkgABU
	 /Xm5K6HiFEVIuP61Y9R9mXvuP1ptYyAhc6UF4MZ03OKufIRFn2t10MCH3QtSmZeLO8
	 ePlIQBn/p04gzf45fTr282GNY+GTp1bW9Adh9eKvWtF/ME5HjLSvluK6amobt6jztJ
	 /7PFUf+3Slt8WL/T1z2tjI6lvvZ9rVpbpeVwjetuna7yldrUE/qlnOg2ocJOv+DQtr
	 HZvSuClFe2hpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFCAC82EE1;
	Fri,  3 Apr 2026 17:47:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8375C1AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D2260F23
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8KpBADa2R6q for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D42060EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D42060EFC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D42060EFC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:47:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4549D78032A;
 Fri,  3 Apr 2026 19:47:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:47:39 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:47:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260402180452.2780094-1-bernd@kuhls.net>
References: <20260402180452.2780094-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <fdaa4b0a9461ca9ba42a5a0e340847c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775238461;
 bh=s/XVQQ/7V9w6tJrqAOZrc+Gnk4O2DSeD/WSTKqCjzIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U1kR7gjFh7nTlRNmI3QasJgT/L0dWFoTB84RC74JMEwiE1MjJphAn8Dy+27k66yot
 u7ib5Cr8fH4/8jCcQ46fyiN9vcRiCAPa/GAkbYRxgrgsTZ2XuFFGG9f7x1suXCmHxR
 1OW5SeBKguHgrdpS9dY2b7cvU0j0HhBWlupkUMqMNjeU0aPT2xrO7TLL19Tgvn3aln
 JkGDuvSuHowFKS2J5Q/XM7Jrr7NVpAGIIh0clK5631BM4u2h7Av9gUk0dNIwkleSdS
 wMJ8cSaOh0jkP7Omu1vI5T6ir14rh2BrAChaaBDGhBH9qZ5E/WXTUllCc+sx7gsJwC
 NGDfSBLifYZxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U1kR7gjF
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.1
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

On 02/04/2026 20:04, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/latest/release/4.3.html#id2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
