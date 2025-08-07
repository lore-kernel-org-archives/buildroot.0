Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A9DC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F20DD40755;
	Thu,  7 Aug 2025 22:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlYn7pA8WJf5; Thu,  7 Aug 2025 22:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F9184074F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9184074F;
	Thu,  7 Aug 2025 22:10:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A8A59CF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0244074F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zE0AH2tykJQ0 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72B3D4074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B3D4074D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B3D4074D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:10:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8F5772003C1;
 Fri,  8 Aug 2025 00:10:42 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:51454])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 00:10:42 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 00:10:42 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250805124954.3736900-1-peter@korsgaard.com>
References: <20250805124954.3736900-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <530958903cf98c7c394bcffb194a4f48@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754604643;
 bh=+5k4s1vZQDDF0tW++lzl7qRyvTJ3/BqbkqM7fbwjJ10=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bXB9nrQ3P0+V82TYEuwqwXpnalIe8xKOku2ZJ12elJbHj2H+OVGjtMZGLs3YK6iqw
 AyzqxuPrnJ/2yZ9Z1Nu7AhWUOdaHfqkBuzwiEHhAKu1XLniiFp3C+4FETg1vOb68g/
 QS8Vt/DEfxdsuCn4K1jsGBX7bhWJVrfcQ6v86OQQtdYtT8c2k3nPe8OiNCaPDr/In/
 O3W6GN7vyELR0fFh+z8AB9JvegtgxCwMTIdxJArDmr7Vvte9gvpoOZTU6hUOkamJf5
 27KHPRJbaHKD3ZnyZLTPRXCf4JG7rsh1ALpj1fICfuOfRpzyioBFIzpGIgzVRyjVUY
 S76dzfsq0ZVzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bXB9nrQ3
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.8.10
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

On 05/08/2025 14:49, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> GNUTLS-SA-2025-07-08-1 CVE-2025-32989
> Severity Medium; Heap read buffer overflow
> 
> When an X.509 certificate contains an SCT (signed certificate 
> timestamp)
> extension and its length field is malformed, the library could read the 
> memory
> buffer past the boundary. The issue was reported in the issue tracker 
> as
> <https://gitlab.com/gnutls/gnutls/-/issues/1695>.
> 
> ------------------------------------------------------------------------------
> 
> GNUTLS-SA-2025-07-08-2 CVE-2025-32988
> Severity Low; Memory corruption on error path
> 
> When any error occurs during exporting a certificate with an otherName 
> in the
> SAN (subject alternative name) extension, the library could potentially 
> double
> free the ASN.1 structure. The issue was reported in the issue tracker 
> as
> <https://gitlab.com/gnutls/gnutls/-/issues/1694>.
> 
> ------------------------------------------------------------------------------
> 
> GNUTLS-SA-2025-07-08-3 CVE-2025-32990
> Severity Low; Heap write buffer overflow
> 
> When the certtool program is invoked with a template file with a number 
> of
> string pairs for a single keyword, a NULL pointer could be written past 
> the
> memory boundary. The issue was reported in the issue tracker as
> <https://gitlab.com/gnutls/gnutls/-/issues/1696>.
> 
> ------------------------------------------------------------------------------
> 
> GNUTLS-SA-2025-07-08-4 CVE-2025-6395
> Severity Medium; Denial of service
> 
> When a TLS 1.3 handshake involves a Hello Retry Request and the second
> Client Hello omits the PSK which was present in the first Client Hello,
> the GnuTLS server can dereference a NULL pointer. The issue was 
> reported
> in the issue tracker as 
> <https://gitlab.com/gnutls/gnutls/-/issues/1718>.
> 
> https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
