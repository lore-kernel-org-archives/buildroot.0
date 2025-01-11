Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B65E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6AC6071A;
	Sat, 11 Jan 2025 16:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyvrXtTDgv4d; Sat, 11 Jan 2025 16:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB786078E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB786078E;
	Sat, 11 Jan 2025 16:48:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE5A950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAEEB40635
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKfT2oWloyaA for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA20740177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA20740177
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA20740177
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:48:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B117919F734;
 Sat, 11 Jan 2025 17:48:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43616])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:48:29 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:48:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109215212.2424478-1-james.hilliard1@gmail.com>
References: <20250109215212.2424478-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <11f1c2f2e538dc1a83498b6ac5c87483@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736614110;
 bh=mzJ40/kMgEknn9+Qvm7n4YEa8uHV3Rn73Bg9L8ujpoY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KlN/TFrKigyd5/cSZnu6ejF3WYwaPavA1VWhBEzenY5iInoBQdMoXqYJCHz7dvp1v
 84QOD8KNnAvMJredtKa/rNGMJ0KaaAjm75EMtSPuy40fNSOet0ZXxGwIZWRWsdiEEu
 am20Jmwi6S2xWYGlbGRrBK2KQCu038wrBAdEgC4APeQPQKK5+E/oeHOJUuCwR7jGGC
 Qw8c6RowiUpOXg/HYZ4XMC5Rn7cSoRNbP47l+RCbAJlB2xi0fgl2u12Xz8YFnm3yvg
 rV93SipWdD18NVXEkmt5wBKDrn9YfrTZgVKVuCvfeADVPOlxCgOJ/7Ry0e6WgGzo+m
 malQEcqLo+iyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KlN/TFrK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 3.1.5
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

On 09/01/2025 22:52, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
