Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4104FF8FA6B
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 12:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A6E40629;
	Tue, 21 Apr 2026 12:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hhgBx8uA-Pz; Tue, 21 Apr 2026 12:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334E540547
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776773415;
	bh=Onhmjxazjs0k/rdrgqyZaGXV6odfD0OqK4NZAL66LrA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nyehhK1Fo4WFeydWkgsK9OJpLh8FPX5iMAa+r8pFqathPrgVYBMiQHHCR6/tAE9oH
	 XRALUYI22hsCTbNaAhKHPrXbl1siCfIqXuaSKqXvTCMzts8gKknaeyDxDg8ABqYZvY
	 P6THbzDVWIGuQi3gY4N3t1j4fuIzyjiMIaYvdp0ShJYYOq3iynWLIM8P3UiEey6hwq
	 oqvPUk4QWdGJr3fAnxgdynyV0K/C/66004HVDwqeao1A3iBDeBg8wx0Q8OT9GPgnnN
	 z/qd3+JO5Y4XjMIe+HkDk23rc8A5LMp4kmw7NMPsrGjed44FN7+jXwfVHCFr3pqeE6
	 KgXkx6J12uzCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334E540547;
	Tue, 21 Apr 2026 12:10:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0868D257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E30C0606E6
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EoYud7X6ulH for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 12:10:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFDBF606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDBF606F1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFDBF606F1
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:10:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 386A95FFB7;
 Tue, 21 Apr 2026 14:10:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Apr 2026 14:10:07 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 14:10:07 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <20260420220839.1232620-2-fiona.klute@gmx.de>
References: <20260420220839.1232620-1-fiona.klute@gmx.de>
 <20260420220839.1232620-2-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <0f4bdb921a5d88ed946a1e27268104b9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776773410;
 bh=+eWxBEmVHcAgdB+pYPwK+YecBiXXara5f6GciEV6gWo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=umzJRGd0HboxF/wkumLg7v13LNwhV5vCj+UHJDw11Ql2o+ASzLUv80vzy9uI+jNGb
 tVko/+Iu72KT7Oc7lC29Wpoh3rEL6GX3eBJ5E+GB7dhtQ1toY5FXgFgBlmFcCx0M0K
 Xuo4hkFcvARVt+N06GAZTy9Qg1ERuuRKEyAlplFnUqmEE2mRfdeUUr9qbO+77fkf2H
 aUy5GWzAIYLPR72TAAFw3NXwtZdg1jpNgHbvulzU5DGe7SQOVLhmR8SqNcAJS3aeLJ
 yy+XMtUAaGNs9q01m1P9Znd7JMGE1pZFgFOxl2zPN/GljVO95puY5Ddwj0QBG10G/6
 BuRMFFpdPR0BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=umzJRGd0
Subject: Re: [Buildroot] [PATCH 1/2] package/musl: add upstream security
 patch for CVE-2026-6042
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

On 21/04/2026 00:08, Fiona Klute via buildroot wrote:
> Fixes CVE-2026-6042: musl libc: Algorithmic complexity DoS in iconv
> GB18030 decoder
> https://www.openwall.com/lists/oss-security/2026/04/09/19
> 
> Fixes: https://nvd.nist.gov/vuln/detail/CVE-2026-6042
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
