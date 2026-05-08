Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0746CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 09:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8171D41AFD;
	Fri,  8 May 2026 09:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7TZ0RE8hSLc; Fri,  8 May 2026 09:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A73041A71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778231138;
	bh=N5AuiQPWdkfXKxy+DpcQD51dmqr9WIipTdFzkz0WYp0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mxSSoJbG70Vnhu3GUU2/68dcJgs+hvY3YqTulSd+z9wLAWtUMTNYnGiUu1AIDhK7S
	 4NYSTC6hZS3ASspka3Utikihqk655iPmkWqcQcui41zuf4P6vRZUtTTzUurKOy8xmk
	 jyN3eVqeB/UIzW5y67wkCOQIkyRrAqt6+xzkuhZcaIqfxdLdN2XX7UKbnt00dtaHlt
	 5P2NZcTb6RYAb4F+e+K5wGbXNNISSSt4UfekShAo0GTfWJ96yvHG2hdaiFI6lM0Fhc
	 SKjfsNK87sIO/u6QZ6X3+/0GBHQfKKAKtm1IzfFkM3/IN7IJ5jr0LOdsUUSePDLsj7
	 dVLUuf6VLw+zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A73041A71;
	Fri,  8 May 2026 09:05:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADBE9317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F8EF61516
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5qQrWY-qvWT for <buildroot@buildroot.org>;
 Fri,  8 May 2026 09:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C60A9614F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60A9614F8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C60A9614F8
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:05:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D6E606012F;
 Fri,  8 May 2026 11:05:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 11:05:33 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 11:05:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260507202811.3399651-1-bernd@kuhls.net>
References: <20260507202811.3399651-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f733b7f9ef634bf8a857e655ae2cdcaa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778231135;
 bh=meHgbK/jh5ji+Vxj1M3yIicoMPBIdIPXWm41xjix4xs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FUPm12DrEI3twLG/QNN8O8bE8ip3AGtMD2YkwH3sU1tVg8mKuwR5B2J20OLZMIMf7
 aDdmMZsZOtXbPI+CUPWNBquGV7YXVveqMpeYnrjmSBmYvCj2cYlHhJiBU2ZGuGlgkZ
 WnwW3MkZafUfS6h27xQQCgQgDbRUkQjzkxrv9mVGWrM0pBQrz8vOamfK/GdMRiz2BA
 YUpfXKV/uyZgD+WRWx7bbjbL7GAxHwZpS0fJRalJsQVmor2fBzjwIaf1CsKVBZMq+Y
 Rf/UYvLJPyyjtDJBbGOCU8PRHbQtto3ikRO/LS5JihWmm2wk+ohgbk1GD3bvtBg4td
 GwFG5U4Xxz1BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FUPm12Dr
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.6
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

On 07/05/2026 22:28, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.5.6
> https://news-web.php.net/php.announce/492
> https://github.com/php/php-src/blob/php-8.5.6/NEWS
> 
> Fixes CVE-2026-7263, CVE-2026-6735, CVE-2026-29078, CVE-2026-29079,
> CVE-2026-7259, CVE-2026-6104, CVE-2025-14179, CVE-2026-6722,
> CVE-2026-7261, CVE-2026-7262, CVE-2026-7568, CVE-2026-7258 &
> CVE-2026-42371.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
