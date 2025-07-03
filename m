Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95396C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559FD82CD4;
	Thu,  3 Jul 2025 20:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiVl-Sn4iYaz; Thu,  3 Jul 2025 20:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7971482C33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7971482C33;
	Thu,  3 Jul 2025 20:48:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F94B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5FB760803
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kgm3yGt7nmZE for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F1B96073D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F1B96073D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F1B96073D
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:48:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 41410780626;
 Thu,  3 Jul 2025 22:48:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 22:48:31 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 22:48:31 +0200
To: Tim Soubry <tim.soubry@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250703083918.30310-1-tim.soubry@mind.be>
References: <20250703083918.30310-1-tim.soubry@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <599eace8ee0800b5975146671432f271@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751575712;
 bh=lS9adcdENF9x6ZjQnX9TU9J3q3jBWNIb6nKMR+3o1Jg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ld9/yPQLdeAkLu3OZ8zbeWcBJcgleaeWMpejTc2Ug8vFUWm0Tj5FQGzyEcdoV/sER
 pZehRp54luFiRa9+MpOLvo3GQVPjTKRJ7DJRPD6w+cYXS1z/kYfSUQX4V6EgBxp+GZ
 AnrwaLzNG3yaGJV0sAJMB9yjHC6O3Fkr+ifvwYi1knAJgtv1baqi8wjZeDu0HjLVZA
 tfPH2gBvyT5acNYXc9eTTiGAdgycNG5ym1XVYnW8wr4jiLcmpzU37WVKY9PQEK5KV4
 Av6ZyBpRtigI4YJjJgv9LC7HDXbHpdTUYgHKmVDPAAuhRd1L9prBx6KFSl0EWKngIr
 n3c3IUNjc30FQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ld9/yPQL
Subject: Re: [Buildroot] [PATCH 1/1] package/sox: ignore CVE-2023-34432
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

On 03/07/2025 10:39, Tim Soubry via buildroot wrote:
> Commit [1] introduced a patch addressing CVE-2021-23159. Since then,
> CVE-2023-34432 ([2]) remained the only unresolved CVE reported
> against the sox package in pkg-stat.  This patch adds CVE-2023-34432
> to the list of ignored CVEs for sox, based on the report from the
> Debian Security Tracker ([3]) and the sox issue tracker ([4]), both
> indicate that the patch introduced in [1] also resolves this CVE.
> 
> [1] e2f856d18d package/sox: add fix for CVE-2021-23159, CVE-2021-23172, 
> CVE-2023-34318
> [2] https://nvd.nist.gov/vuln/detail/CVE-2023-34432)
> [3] https://security-tracker.debian.org/tracker/CVE-2023-34432
> [4] https://sourceforge.net/p/sox/bugs/367/
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

Applied to master, thanks.

I changed the commit id of reference [1] to use the commit from
master branch, rather than the maintenance branch. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/e868b974a799073428b7565925507697e049df0a

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
