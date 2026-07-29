Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BB1C53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 980F7606F6;
	Wed, 29 Jul 2026 18:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKizglwpWgZr; Wed, 29 Jul 2026 18:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63EB8606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785351240;
	bh=C3qJpv9M74VQw8m4u69tIPjoNvHT0f7zSWwv5ZE3cPE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KrzK+GCtSH1sE0s3FK3fNdR2CaVbdAhKirGrJfxo523a0oAm0A2UErAO8DGbWL0oQ
	 gNT+KxTnEg5sgHX2KYPAo2hvtIOCA9dN5LuC6si9+z4Y/zobjCf4cbLuw6+sY1cA7+
	 m2KisN1JPueQhBMQxFqcG6eMYr2y39J6FmhkTXOX988koiyNWlRAnLRQHMJ6/bckfR
	 ATINP9nVnyVnb9YVV41k+M9DEgOETLByct9y1+00EOgkmvsOkaTrfgOPLh1AG0Lolv
	 poqCkdhHVWxaEvyemNTcFVHFYPeHONWCj0dBxFo4u6IbSwNhG5JJILQbaMenB0RBu9
	 adWunaoyUwIXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63EB8606EF;
	Wed, 29 Jul 2026 18:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8403226E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B9C80DFA
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gredB3P43ht for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CFDF80DE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CFDF80DE8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CFDF80DE8
 for <buildroot@busybox.net>; Wed, 29 Jul 2026 18:53:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 706476012D;
 Wed, 29 Jul 2026 20:53:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 20:53:54 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 20:53:54 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260729080618.6192-1-francois.perrad.86@gmail.com>
References: <20260729080618.6192-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <6f50aafc299dc6c9487506ceafbc2989@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785351235;
 bh=OP2UPv8qB+81MkO28kaXZ2zrq2dkrTffKC1g9DeniBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gEuHrW1YB7zzOtH1PROSzp3fgGDtFriInlhGkbdCobGRhA1PT2hEEdedKbeLwkweo
 P3BiP+o8AuzYvDn0aLVf3KsOop+xm0/ZdM4x4mPpnXOzLRyEJpG9OXruj6OeBr+Gk/
 CjAJhYKNqKyUgdsyhUp6+wVFaLjRh6u4tYfH2NjRb/0EFQUQ4qEdVi0EAR7cUf6T0X
 gyV2kipdXh0BFfk6vQyhjTyzmidRKK5pPxahDoQ7AnBmfXBpMl+jDtM2POc+lwsxgz
 Qa0Dceusvwkb1zJjB9dCV/nOj7iBlAtE53kOmUSa25yjwZvfEWga84bHq5j3Piz48g
 ftrLRdN+XPryA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gEuHrW1Y
Subject: Re: [Buildroot] [PATCH] package/lua-dkjson: bump to version 2.11
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

On 29/07/2026 10:06, Francois Perrad wrote:
> see changes on https://dkolf.de/dkjson-lua/
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
