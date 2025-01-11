Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53DEE7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA1E4049E;
	Sat, 11 Jan 2025 16:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuQWjZpjEarV; Sat, 11 Jan 2025 16:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734434050B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734434050B;
	Sat, 11 Jan 2025 16:44:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26DC1942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A22608D2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzTvrD3P6gUb for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31DB56084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DB56084F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31DB56084F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:44:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 60C6A13F879;
 Sat, 11 Jan 2025 17:44:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43616])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:44:08 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:44:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109201646.2387085-1-james.hilliard1@gmail.com>
References: <20250109201646.2387085-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2e257500dc54c8fd01a27c1c1b1e4ac6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736613849;
 bh=GKhZFsUHy01OSSn4JODDVfA9cEKlpY5kG2NVMQQhFuQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ARAtcRg1+ZtRMsOyA3Cl0eZYbBYMlndnxyCuxV+H5u8iWTWMANm1dTu3eIOb20/xQ
 3CPxvcicQ2Tmzv2aeD1yY+jYvYcWPTqfHIwyf/0fpKKCXjAYs+hj03reyOmPRgskRt
 TYitp6LY3/NmHAL2rt3d203ZWYgAbelShKULP/F+Xn0jiRZfeMLVc7At9Vz2WKOS9y
 Q0pqw7uIe6N8GJofd3VrIGNeBGYTH9hhG4bWIsl7+Px+iXx9n0G5y+1eyGxJgHPf/p
 RpStkXEdSz7HshivhkFMzZ3rVzPHVxaGi13LOipoVQuWoAHnsdbBagrhhPAA6ju8/i
 UIoMpTWmo0u6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ARAtcRg1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 1.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 21:16, James Hilliard wrote:
> Add new host-python-setuptools-scm build dependency.
> 
> License hash changed due to year update:
> https://github.com/thombashi/DataProperty/commit/ef109407122cfe4784053e58bb7e25d2e75e2032
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
