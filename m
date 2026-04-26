Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52780FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2365861C62;
	Sun, 26 Apr 2026 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ennMxQ3jwVAO; Sun, 26 Apr 2026 16:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21FCF61635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777222081;
	bh=9/fq0JOArTRs5Ztifm5VXqnjIHSyFUfv09r+s4gfnBY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=av1WR/3hE3fe6MC0JKZc4fNuQGkfW3kVtEJh4/NXi+a8W/4XcaW5jNvbqBr8Rq5lC
	 o7rlERw+0pIi+6F81jhVzN5+GfiOmYHDP1UbLtCnTN11zw3rJEbxd2CuL1pqeukImJ
	 XneW+y4C9SCgNRYVvLZRm3D9EkTK9v9UzxYFDlJQNR0Fjik0HDDF/dHiGIP/U048Tg
	 yWGQrjNlrzsOfRIBAST9PVocoPh7bScz5eMUMzTZlViKOWvrEDuSa9WEd8w0o9GNd8
	 LZ6U6Uq28Bipn+SWw5Q5/UL4SnFbTKe4eel9khTJZfWVDsHUlNUYOkTRP2EkErv1aO
	 9ZJ73qOtaIvog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21FCF61635;
	Sun, 26 Apr 2026 16:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D74A1B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D006163C
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hu2C_knuil-M for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5878461635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5878461635
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5878461635
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:47:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6374E2003D0;
 Sun, 26 Apr 2026 18:47:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 18:47:55 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 18:47:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260426071829.369415-1-bernd@kuhls.net>
References: <20260426071829.369415-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9830da2e8e65593475879651d5685601@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777222077;
 bh=pSHfImyU88SYIu4Oe/E6nsRwpnwx5VnLb378MWH4XuE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RW4cudqCQm0UXXP7oOTd+atnxM4q6ry+AX9BMSzxwEQgFMxh19KMW7evfYwOb/ubR
 bJQRuStLwv7slGc/74gHvMvL01VW1evomGmygOxtas5IkBIEzpCGq4ZyRtBTJ6Xdx7
 Doc2qaegdWo5xjU5l7WfzDtlyCRpVOgYDNqxoqd+8sIqdlOS7ckz1grYUc3P5zghm6
 27cJFEkTjfW0HCYU41sw9lf/16nkmmlBeVgFMarYmMEgi3yo6XTHDXCSdJmYxH33Yl
 IMcq5HvI2Aml9CpI+Qk/9d+SgZc1L239mX3RKZ042Ms3lZrCS7+et3mzdf/oyrZ45O
 K29nPNALDikLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RW4cudqC
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.2
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

On 26/04/2026 09:18, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/latest/release/4.3.html#id2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
