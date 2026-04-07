Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314E1FF512E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F12A140C50;
	Tue,  7 Apr 2026 17:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alMZ4_ONtD4J; Tue,  7 Apr 2026 17:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F2A40C2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583575;
	bh=1Y0ec37vYfCYQgTTonriZGwT+ho60zsl1XWD1BvUjIo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=snF4lf4+7KPdmneHH02P+ufFLS1+ezsRx8QqfUw1fkGOYhb2UM8Xx4r1W9jnnnvrJ
	 mrDlsdjJplf69y6sckvF2GWNkaMVEQ80o2gMM9QNK+88jgoCixzreMZG1ONAHn3mrG
	 Kq2AEnAEZco2/7sly7n4d3WxocqH+XGVmuttm0n5y6KOVB+CmWM3DNq0x4aOHHIof4
	 zzkM48hoN8ZGfwHYNfoei1nbP3d7aZy6tROqKDQnKq5yGK/brna4m1wKHdD7E4pQrG
	 6SSAV4beQaIkhDQMX93b5AfejV+RsBvM8nnVuw5RQySKvdkQPkDRb1ZYQ+aObCJiVo
	 M+v7u59s7mg0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F2A40C2F;
	Tue,  7 Apr 2026 17:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C01AC237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B16DD60642
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5syPjkueP2EP for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EB7160DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB7160DC6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EB7160DC6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:39:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B15CAB0051E;
 Tue,  7 Apr 2026 19:39:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Apr 2026 19:39:27 +0200
MIME-Version: 1.0
Date: Tue, 07 Apr 2026 19:39:27 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org, Jonathan Ben Avraham <yba@tkos.co.il>
In-Reply-To: <20260406184858.1335459-2-fbstachura@gmail.com>
References: <20260406184858.1335459-2-fbstachura@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <ff9ad5a1e9daa6153e416c1e931a4db8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775583570;
 bh=s+ZbIIcL6Qo1LwKoFU53b57oIwsBUTdEIJ6gssVWr/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RBaQi3pPGmt7hObR4kUMF+Z/D39rE5YFcaVG3KMBePwdZ6otTHZhoP1j3jysms7g9
 orok0PeVAaO6ZG61uX4M9f24Le7vqJWCJd2cRTfAbf1B16z5ZyJBYqmOJcfoFK59Gc
 9QWziJWThqU8eplurjh192LrX0PBRZKSozFvc+QogyIbSLdNrbfL8vu+PhW9KIT7AP
 ibPFbXxh5J94GAIH4qFoih6WJxzCBHzcYnNSNuQAkzMWrljdGx8dgYljJBA/HieU0Q
 KUIpjLffPctXPn+ziSeFv0fk3Az6+cYtl4QFU1FohnTz7WdXigZd+tKJgsOXHa4TAN
 HRSRuLpfqomnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RBaQi3pP
Subject: Re: [Buildroot] [PATCH] package/libphidget: bump to version
 1.24.20260127
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

On 06/04/2026 20:48, Franciszek Stachura wrote:
> This is also a backward-incompatible upgrade from version 21 to 22 [1].
> 
> Version 21 was deprecated in 2020, it doesn't support latest phidget
> devices [2].
> 
> Version 22 is covered by BSD-3 instead of LGPL3 [3].
> 
> Release notes: https://www.phidgets.com/?view=changelog
> 
> [1]
> https://www.phidgets.com/docs/Upgrading_Code_from_Phidget21_to_Phidget22
> [2] https://www.phidgets.com/docs21/Main_Page
> [3] https://www.phidgets.com/docs/Software_License
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
