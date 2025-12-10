Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D389D3E780
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA25E40E97;
	Wed, 10 Dec 2025 22:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-eYgcK5pVBY; Wed, 10 Dec 2025 22:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38C340E20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765404056;
	bh=TeZzolCHAieI1zEFcHCJwANs2kY2/L4R3qIPt//4YNo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hm8/hR6TiEXGeHq7uxBfgSKRLDUPWJLTgjTtZQ0naBJ5k0iX5nK/+IYddDydYLHsf
	 gFzcvw1dZOSRij6t/Vj9LW7jvSo/2CERMpdhXbk2tp/mo2BtBrJdjQHwI7imsXbX1i
	 sqk0J9y8U5Xt7WLISKLnKeIS3UCF2ufakg92kBxHsHvZWqoC+xOAdpTGIE2hsoaBUu
	 GbMlhQR7zutsmIeE8hXwhSE3S7LPkCShWUm3PWw2os7ypQMEgdVoXJ/1Tq4/N6X85w
	 Lnlh9Fa3NgNub2fD69Xuv6vlZnL7pQcCNMw66RK+n32iP0pWgCw7KnvTSmO91BF0yy
	 Gn6aldMfyL1zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38C340E20;
	Wed, 10 Dec 2025 22:00:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F684E7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 22:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12E8D841A5
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 22:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRc3y5Qx_bA9 for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 22:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 164F9840D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164F9840D8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 164F9840D8
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 22:00:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 06FD65FFAA;
 Wed, 10 Dec 2025 23:00:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Dec 2025 23:00:46 +0100
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 23:00:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251209212130.1019185-1-bernd@kuhls.net>
References: <20251209212130.1019185-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0d028fd81b6c96152131e7b4f94fdb3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765404048;
 bh=2bi9LpyEvpoQM07m3p1rL0aMk/xZEk5KRgW+n3LKhDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hOMwnWHOHIcDconW6RPf9VbEt8PRaOSbqWwq7TcSjX4z/97/aP5QMqCiuErDafyJW
 Ik9hakwpisU0liHYVjdvKM8iq9OlIqXKZr0k9niZKNUvtW2SctWjn5Htkm/In8EX4t
 CKdz4O2R9Pj6iT1EbbGei3tgoeHADf4KDUkUCxcqM3X60yzqWwoRG3J/bQeOcPw0Fd
 W8IvJfFgrFDetfNUF8lvm+lgJrldMVdorW6wd+4ykHN1WxruZZJDxBm6bdGI9nyW2S
 phvFMES793CmhrThn49c5SqBx6IbgsvMuJ8E70+uQe5efn9TUUHTa/XqJMLAZdrqxW
 cVLyRqtBoobfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hOMwnWHO
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/gcr: bump version to
 4.4.0.1
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

On 09/12/2025 22:21, Bernd Kuhls wrote:
> Release notes: https://gitlab.gnome.org/GNOME/gcr/-/blob/4.4.0.1/NEWS
> 
> Removed patch which is included in this release.
> 
> Added dependency to libsecret and switched to gtk4.
> 
> Added configure options for vapi support which depends on
> gobject-introspection:
> https://gitlab.gnome.org/GNOME/gcr/-/commit/5970a456465b6b6a6a3f4c215e1926c3c3c3f5cb
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
