Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D4AC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EFC060786;
	Tue, 11 Aug 2026 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sam5dJnen5Dk; Tue, 11 Aug 2026 20:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B715360711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786478684;
	bh=5IfQE4OpWwSZ8lMmU19t56wVqAnkedLqwCjDr8BSPqI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eGZEsYQDnOXx1HRPCei8l67F9Nrnena3GuAVTe+dXRxQFHeU6AzSbkiMuISr23C49
	 XvzHGd1Q7Dr4Z0Uv6+OSGEuXF7iiDI76J1vBLHaf5rR8jEZfj99gdUMd/IFrRCg+Bz
	 2ltazhZUXgE8ipND2wkCK4vZPd4W53e7Z8YX/997sUqLnTP5LT2WXZWr8EScTbwRFU
	 WEZbzzRUt2MEAqnCUP9pttky04kEfj4BgshW37v/P7sObcrdcqnOhSkTfJQzPI0qF/
	 MxLzPi6luQygufTGrDEV/0sxykixmqu6qwuduz1L/W8GgDXMjYnc3Q5wyyaHe6J2Dz
	 d2yPyBqnpKTfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B715360711;
	Tue, 11 Aug 2026 20:04:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62EC049B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5498640638
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAodgy8WFAFj for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 20:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BB9E40637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB9E40637
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BB9E40637
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:04:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EEF3119F54D;
 Tue, 11 Aug 2026 22:04:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Aug 2026 22:04:38 +0200
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 22:04:38 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260811113502.106639-1-thomas.perale@mind.be>
References: <20260811113502.106639-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <f6f2f2908e4ae1a9e1461901ddcf1424@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786478680;
 bh=Nwtgm7TQKB+e/XHex784eimDxSouH/nfUPkMlVLzCuk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U1ow/bd1RwghU6ckUBXc5VOqa5S6KE3ZWnvzPPxPCEd3N5kJclAYJEhe5lSlOOdwp
 q8enzYrEo94RFeUchfX7aun0kWIDS9OtHEYZfam6yO04Fobaw2rsrh9anULGT1ESJp
 GZ8N31fhgKaUZ6ZJjgEnk1p2LU4viER+oHy2ryAfyBZv1R/3dvErbJoTgt65Bu96M2
 Fx3Dd2yrEeRxwdD28BHegIzcjli7Rd1fYlJjjAVgdySAm9TOxIurHvNXALkLnB31ew
 ynfA6qd8P7I7pxavypSrWt3eHiWNNuBp4oqU3k+GASUE4L+vvedncvz6KJBH6cfIVq
 V0giqSz+ZQT+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U1ow/bd1
Subject: Re: [Buildroot] [PATCH RESEND 1/2] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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

On 11/08/2026 13:35, Thomas Perale via buildroot wrote:
> The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was 
> introduced
> in [1]. The IGNORE_CVES entry was removed while the patch is still
> present in [2].
> 
> Re-introduce this IGNORE_CVES entry.
> 
> [1] 75c594d446 package/busybox: fix pending CVEs
> [2] f88537c46b package/busybox: drop stale IGNORE_CVES entries
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
