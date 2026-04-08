Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BBA10FC441
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A0941032;
	Wed,  8 Apr 2026 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qA6Iwhzgr8nV; Wed,  8 Apr 2026 21:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA50041067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775682542;
	bh=OqaSbwHT/GSveampsf5N3CVtRPA/X6L1aRhJXSVLkdo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IWRdoPljR9TNihhtyV6GuBGi5qekFKVQwgGslF/fFwhziI7J+v4H535rjha5swTgJ
	 Y38LQe/QVj8EgMDSgbiw8YMfkca1L/dLmtS9+0ip948dvXuiQsKVJ95SPp/PwkN+7P
	 jHigZsvRD5Vf1GX3fkpWiTqqzQPPIcEF/NKMs2qGTrGEK/JQHVEKTjLj+tILaNUo7o
	 uB5ItGKLo49UWOrFmvLWqxqh3NDRq95+ymegfhRX1ZnJCPT7atxnzNButP7URjWBdC
	 nysiTrnoLRj3i78LI6AyanKZWWheaFqXkQ91wC3U/pLxrKwNIg9mbNbwye0OD0606m
	 EB2LZ2s317R7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA50041067;
	Wed,  8 Apr 2026 21:09:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 849BB2C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EFEB60F54
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_btKtxTzyfb for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 21:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8338860F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8338860F89
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8338860F89
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:08:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D0B5F5FFBA;
 Wed,  8 Apr 2026 23:08:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Apr 2026 23:08:55 +0200
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 23:08:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408085506.1641767-1-bernd@kuhls.net>
References: <20260408085506.1641767-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <14707cbbfacdeb893b0697ffa708b4a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775682537;
 bh=9uFmrpmoT99M7AyTuhUj0RS4K/zPJhZNLsnTCS0qBAs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q1tKDBFwyxYcKwQ468sPl7+LT+pmwr+BPlGOR5dj5GXrIRV0SOKrSmkLm3fmXE814
 +Qouw1zSJgts+Iq8jqIhv7PbRiBk1QjjXd9k2mzpazeVhQuVC/I79VcHK57TBXvddp
 qU+MaKCGhv/e75Aov4YVrHkDXirEXIhEsXpdlIdMef8BUOTtSPio/EbJmJQmGkKfpF
 CcOKk9BCDue/peYjbHm5Qa44b5yQUlmH3Xz0ik9J4zNo/wMgSqp6TmUbfLmPVoH/X6
 mQcI1IzauvXmE+V38syvL3fkxSHZDdQYKNHMkZskIPkwIxpZPAK2U83x3Aa1J04OxL
 mNSt5HAwmle0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q1tKDBFw
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: security bump version
 to 1.0.18
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

On 08/04/2026 10:55, Bernd Kuhls wrote:
> https://github.com/strukturag/libde265/releases/tag/v1.0.18
> 
> https://github.com/strukturag/libde265/releases/tag/v1.0.17
> Fixes CVE-2026-33164 & CVE-2026-33165.
> 
> Used sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
