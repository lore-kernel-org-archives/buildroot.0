Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD7FCD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EA5760FEC;
	Sat,  2 May 2026 11:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOoBDxlqj9G1; Sat,  2 May 2026 11:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B4F60FEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777721572;
	bh=AjM/dg6X0cVF8K1uk4ZLQCdhJdHhlPkLZ1xmtoUnQuM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C7kyvHcL+UGVgb63qlCvZxwyEY3TT1/mbgPU84NBA3X3BtML/W/3wrHo9/h5IomDd
	 mNXrwLm4OUyw8/SMbDpm/bjQSafND/PTtobnfDaPvxPg2frlwh0RLLoi/NYzZnF0mI
	 55lxrqBmTcEvj6nYQasBuQ//fBjuO0JNjtljfY1TzXWwIX4FTpS42ifLNJACRqGdqO
	 pMbr6lriem9efPVL+QKKy3UpPy9XaXr/PUCiYrhh/nKMEVTtwD+D/0+pd/ZFmrUZDp
	 wxaP2mu0DozW97Bw3qae/U29I4LzqxHsOUcXEQ4Zz0HDQxPRXKToiYBilo3dRBttQq
	 ZoV6QA8wU1yPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B4F60FEE;
	Sat,  2 May 2026 11:32:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BCD8127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DB4660FEE
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7wm-g9eGYEU for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4173C60FEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4173C60FEC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4173C60FEC
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:32:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 024E360132;
 Sat,  2 May 2026 13:32:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 13:32:46 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 13:32:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430185635.2999959-1-bernd@kuhls.net>
References: <20260430185635.2999959-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <642e67dfaf8e38516145980f48f4d39c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777721568;
 bh=6h0RyqB4Xm//bwnAaDN4XFMUj+mxR7dTPet4n5NKyOY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pkrbXzxD9SuKrI4IjsyUViyiQwXbsDQKSKkclqWax2uOvBqNDL2RJoP/1Zjp+ziU5
 T3L8yjlj3zIe3csmJCAP7uHHtvgbOTjRZPJXvaob+CY/mT1gWEeTjiFjVejlHecxaD
 uRMJ/SAtPIpoXpSEaNY/adrSCro3uc7Cplg2ybxYdEXnhVkb6HR8OyvSbUKXLChurh
 KuyY0Za9ep3F2K5hMIUOkkCijWJlhRx8YRaDwo18J6nc3sPDSj62S4AggLNPdt+lv8
 4WFi/9r5FQoc4Ro/yiv45FcVmxwZ8sL6xaqQDFJL7JdDAFJmfkOENeTe9GsrK+iSdu
 Qjl1yxpg1zWmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pkrbXzxD
Subject: Re: [Buildroot] [PATCH 1/1] package/thrift: security bump version
 to 0.23.0
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

On 30/04/2026 20:56, Bernd Kuhls wrote:
> https://github.com/apache/thrift/blob/v0.23.0/CHANGES.md
> 
> Fixes the following CVEs:
> 
> CVE-2026-41636: https://seclists.org/oss-sec/2026/q2/236
> CVE-2026-41607: https://seclists.org/oss-sec/2026/q2/237
> CVE-2026-41606: https://seclists.org/oss-sec/2026/q2/238
> CVE-2026-41605: https://seclists.org/oss-sec/2026/q2/239
> CVE-2026-41604: https://seclists.org/oss-sec/2026/q2/240
> CVE-2026-41602: https://seclists.org/oss-sec/2026/q2/241
> CVE-2026-41603: https://seclists.org/oss-sec/2026/q2/242
> CVE-2025-48431: https://seclists.org/oss-sec/2026/q2/243
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master. For info, I fixed the license info. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6935bc74121967ab6a01950d55c3bb9a14f0f833

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
