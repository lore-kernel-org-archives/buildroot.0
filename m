Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E6E93800
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9D64243C;
	Sun, 12 Apr 2026 19:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cq15e-lnSPzq; Sun, 12 Apr 2026 19:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F232F42401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776023881;
	bh=V44/3HuoAK8QcCaka2aHhU79TU3yzT2MUD86ezx3DV0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lhXQFlbaPR1jqfYZFdKqJL2SKeKX3I3isD2wbGcYiuuea5NRw70ZQE57YylbdMuIg
	 3iakPD20S2qPNvDHl6Oi1j8zgMkFCnFTYwhdU+PFwBbYEC7J1cO7YsnktWAbKkEVhG
	 kFokuaaqJAZ3cZFIc5bqBO3uqRXyKqj3AQ9agdzlrOSZ7Lf2il0GJETRGgHERSOk0C
	 LjvJorr9o/oGGw7b6xbEi4vy/uMzQkau1Lrfoykg1vxHRmwZdsbJ3ljQyDjSu1Hje5
	 OjDqbSdRXXIJDMr97SdHTifBTDq/xdamj9Y67KfX3Qr12meHLjnLQjecd3fEpRuRoE
	 t64UfsUVFB3Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F232F42401;
	Sun, 12 Apr 2026 19:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F72237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E95F4241D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huswor5Apz4x for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 19:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A7D0422FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7D0422FE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A7D0422FE
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:57:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D4F5EB0054E;
 Sun, 12 Apr 2026 21:57:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 21:57:53 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 21:57:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christophe Vu-Brugier <cvubrugier@fastmail.fm>
In-Reply-To: <20260409110740.3651654-1-bernd@kuhls.net>
References: <20260409110740.3651654-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <fdcf05308161349c5fcbd880c6a5c240@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776023876;
 bh=Aj+A+v2ctmFTcMnW8vy5XfGEhDh4D+0ODDFtin62CNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UReUGgZVRZRGViODr4iUPCIY/O/RonY8Yd7HCXpuww3AtJVE4WP91xQmxosPNnQuu
 ZTaErbQ6UsAorWUCle4allGsmeU1u2WURx509aPEpl7g/PfQE1L+T9ECZ8q0/E25Z6
 qqbZBFaI3vMJ899SzHgGKtw+6DCSFkf/aWwDkVSYpMHhJNmDIla2ndeV241go4cWf/
 lEGDmjD/b7WUulORcKK1E4vP5y1vHDz6zYOeyemhobOlsNgLQHtg5X6N9T1ZUY+QkZ
 cwkLMeeWqNouo9z8cCvvA2yH59uyRPPLBk9tJ6o41O3jJUeZZFue7p95r0X71uYnNZ
 U9avuGL9Ov4Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UReUGgZV
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: bump version to
 9.34.0
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

On 09/04/2026 13:07, Bernd Kuhls wrote:
> https://github.com/LINBIT/drbd-utils/blob/v9.34.0/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
