Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326ACC282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 21:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED16A40758;
	Fri, 14 Mar 2025 21:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VZ-cxJwASWg; Fri, 14 Mar 2025 21:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D126A407A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D126A407A6;
	Fri, 14 Mar 2025 21:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3694EA
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF766400D2
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANjqiaed7n7I for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 21:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C12DD400A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C12DD400A8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C12DD400A8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:37:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 63C2BB0055A;
 Fri, 14 Mar 2025 22:37:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 14 Mar 2025 22:37:30 +0100
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 22:37:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20250312103810.1950590-1-buildroot@bubu1.eu>
References: <20250312103810.1950590-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <03e0acef68abd8e303ffb7af93cc5af3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741988251;
 bh=tu4VNTBbkdu4togaDOs27JckJSZOL5Xe3TWHUPONQjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fZueaEQFCZsuGSpQNjP5OgFZ2Ff4e8lJBV37WBCan0eq9sOV1/Qbh7z63QaD04nNY
 gDDTGqobwpCNXGXDYrvCm5luCIz4B8ymrfJOAYmFg5VpV9PJQhuG1+DwHabc2v7blB
 kmf/URinn6aDovnrcPN4aI4LTldgej9c/o5cKsGxn3xWT936tZg09HLticB6YehX04
 YZ/+0GWZtJcboEgvYwf2Tq9O07qFxZ2mczhjK5CKhSma+iVqXgA6f396ywvNWE7lEJ
 rE1otBaHUDf7JJanDOKI0WPWYubQAgJBTJDsYKjPTmBBa5BtQMmj4WWHRypNCvoFr3
 jw3J+0F2/sebw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fZueaEQF
Subject: Re: [Buildroot] [PATCH v2 1/1] package/can-utils: bump to v2025.01
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

On 12/03/2025 11:38, Marcus Hoffmann via buildroot wrote:
> Remove patches that are now included in upstream release.
> Package switched from autotools to cmake based build.
> Backport two build fixes that are already merged upstream.
> 
> * 0001-Include-time.h-for-timespec-struct-definition.patch fixes a musl
>   build issue
> * 0002-CMakeLists.txt-add-an-option-to-control-shared-libra.patch fixes
>   static only builds
> 
> Release Notes: 
> https://github.com/linux-can/can-utils/releases/tag/v2025.01
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
