Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA85CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 08:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D51A822A9;
	Thu, 14 May 2026 08:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTHO0-YNmJzL; Thu, 14 May 2026 08:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FE7822A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778747989;
	bh=/O9+DG09sTR77g7sPwziV8Hqpdp7rtJaRjR+JaR+xzI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ahy++54zxPDDRXejzOXbJvs4uJFGZnSojQYyf20sxEv9PYcyVwBCDwkkddBo0m65r
	 ctqQOSVCiUz7Fx9628EGGADC3RqepTGF+4wcaSV7O2eBw3DgKoSerbOG1olqbvLI9G
	 kIMfdUlAGWRvvs8Pl9djduZyLwEMFNVCevoTdVbuJHevWNlDPt1bXQK5BDCe5/X2YY
	 VzwP47VxB8DRen7h/1uim7PNw1zjhu/jrOQwCxmEuIGv8ckVfQriD76c2XCd0FZ/pU
	 zI9IiWo8hkqnYUfXiaKt/UaUgIylS9Dww8TK3X+ZJE26GSnwG0Enqeo6Ao7k+4P3kI
	 PFjVMIMYqu+bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7FE7822A2;
	Thu, 14 May 2026 08:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A0537F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C349D822A2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-Fcn4lCucfv for <buildroot@buildroot.org>;
 Thu, 14 May 2026 08:39:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF2108229E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF2108229E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF2108229E
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:39:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8EB765FFBA;
 Thu, 14 May 2026 10:39:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 10:39:44 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 10:39:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260514064055.34049-1-bernd@kuhls.net>
References: <20260514064055.34049-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a34988614f14c0c911d397a554552f64@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778747985;
 bh=PY5ut2usAk9sq88F/M5kVnMRK5oSGrAvcW5sz5XR+8Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J0ocdMmnQ2oUQrtn9nbAZqatQag//Cbf0m6D25gMZo6XqBk/nRPoUHBMLymtfjfv3
 l6i2/cljRuVvbqTzMyV/AN7smZWZPNpdjGW+jTn+ThVB2ioAVNrcB6GhLgNusDFVvx
 wauoj7cbuSMFDTT2gMYxfJgj1T2dRO03UZOtI7VlpJFWO0RydQWEP0C/EMD0MjUq+q
 MjIbX0dEuB/ZNhxbrXF6H8VpR0TK7+oLLwL8k6yulqXqnc8EVdCPe2TYCFznoe8Wmo
 Ig33RBaagFbXlCEF/jjHgRA+tEDjueHtJqV6mPbILW4TSiVbx7XUcTTj5Wdn5MMyCR
 ivAirfspxT+OA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J0ocdMmn
Subject: Re: [Buildroot] [PATCH 1/1] package/sed: security bump version to
 4.10
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

On 14/05/2026 08:40, Bernd Kuhls wrote:
> https://lists.gnu.org/archive/html/sed-devel/2026-04/msg00027.html
> "'sed --follow-symlinks -i' no longer has a TOCTOU race [...]"
> 
> Fixes CVE-2026-5958: https://cert.pl/en/posts/2026/04/CVE-2026-5958/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
