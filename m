Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F480CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089C680DDC;
	Fri,  2 Oct 2026 10:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhWDTy-UQTA6; Fri,  2 Oct 2026 10:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CEE2380F81
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790936633;
	b=Gm7Ko2KlXwazLo04k3pWZVVjQ4B7SHCytaXBYUbvtP0U3W5fqoC0puAw3DhwyAMsp1/h
	 En2l+s4t/Qyr77DVSLN+g9NR4jGlH+WmRqofqs35isD1VMZgEJ3uEAo4IZ4XcmXMxgLBx
	 Fr7d2NzA80NVLodFQgELCKlW/EpKu0CCzOyf3nM2Wr5sJnVoCr9tBPqdKeB82p54tTGxj
	 KKTlUCTWJo2jd77l0H6HVdnpFme91mIM4MW/tWb5dHEiUuXBQtrUzovWe9aUeeP5NcBY2
	 2aGfNxrXEQTAi2gIxP8PqhXGeIRpPZvaCwipi0k2Tc9rNRCGQv5P7WzkLYQcKQkantA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790936633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cAxyIYYvK7QT8W+ZqpYPRGmMKCvK3Ct+iYDeVwz7XRw=;
	b=dxDnjCH9VaSSo2Rg6BV9XXdwyMvoP387hZWbe9UQy+CT+R9fYxu2xBf4BspB2wA+QczF
	 S+DaMjIVu/On11IpLce1QzOMxwTFMY9Mgwn0r10qAPrDp7LZzA/2dpAPO3bWoZRZdevFX
	 UT8Ih8JfmYFbux+NLa+gedKFyPilcQp3fQU+IuS/yvgSVn86Il43FG0C9OQObOS6vMtjN
	 lOghuG5WK97AZdJ0EBAqA+9s4bQQRcq7aUXvrGa0UJ09aCvZxtgrQXFXGo51kLBCXAZRF
	 EdmK5zZqlUFPepte1h+63QG7G0nRRnzBCZK88kDz3BjjpePCExmR87zyzClrh1VgYQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=n9toPWT3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790936633;
	bh=cAxyIYYvK7QT8W+ZqpYPRGmMKCvK3Ct+iYDeVwz7XRw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pCGgGph8iSnivPIzHl7CV8Vg6ssuupHobqYILyLR2rGK7jvBfNXjVXtA3qM1vkm84
	 /LNj1J1KZzjSNw6K5qmlEFIO5yhnNIrrlG7sI6IXcl+N/hWDBbNvQxqHLOvBPx2EkD
	 G8gS1Ibv2bQcQU9qlgyNhhnVAJwrxHBcA5eBkODqvxVV3Vv0UiiJxpcSN2PZ+cHsMq
	 ziQipMtHlvyxVtog3+BquwlT6u65Aax4k+4kw+Dj1//CUvhbavNRTeyQMOLLchoxSB
	 0rXjzZySjDZaz5GdTVHD+6sNPb6g2/KZVBs+g3dhaOKorMgg/c0wja0WYFMmlmQbiX
	 arqLSj6lwty6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE2380F81;
	Fri,  2 Oct 2026 10:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A130282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B78B80F81
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOuUAvxFinUM for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:23:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D29EC80DDC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790936631;
 b=LQzLWwKaFrnsbIjDoL5+nNFZ8IxBScoTMzR57oxPa67lbmV4KGmjFJboKCuYG+S4m9fj
 2LFw65dfm/DKErJ7QHcUMWSvXNBdvfjPvWCArGmyYjVeJAcpZyX8LGW799dVIezNkkbbv
 k35ppUdwXb17CFRGe0kXKny8zfnA83RucWJoJ963fC1o/0elBwV/3JHqLn17ScfNoVTHS
 daVWxHRUwfr8+xprAxI+ub9ks+uT9JDURjtcYcge3DKeHWhLp7tVGMxKbCESv5shJHGt5
 qFiCa58h8F7fdlHhKHykn59sSRcvBH6BPCLSuEuoD4dviF1skOxeeN9sytz8MIMuD3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790936631;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2mmbnHFrgROxSipRbXbLIY4GNEEG5DHn3f6tZPuX198=;
 b=Brzd5rmU3oa+isnEVx3ZbqCQyctexSInsYgA0biqdyXPIzQ666w94ugBej7DA1i1Q3sz
 gohU7oLUzXqTkwNfbk24URCW3Od74x07Yqfd//6vKaa1BM1NjZtkujRdVRHxNQKzMC0f7
 YCCpYRxY5PgaWZcLruuPeHXo83+TX0k6gA1SjuUqp8DjrQpSdhH62di4kL9n1cGD36b6R
 tJHs1ydN/TeJFuZVEt3tPayp7qKMAI5aO6UDGShpbHo/bZgkFV/Z/F0FEwPF0+dpJkee5
 WOtJSHBhYCqTHvnp5CMxBuYbUjl+wtfyVtEw7IZTXdmI1AzVG6d1dVwei7GQ5NCesVg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=n9toPWT3; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=paul.elder@ideasonboard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=n9toPWT3
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D29EC80DDC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:49 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:337:442a:994d:7d4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D28AA43;
 Fri,  2 Oct 2026 12:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790936513;
 bh=dBjpc9Pc6LIWTuAjicXtgmu7Ahg2jUM3Qj/JDxAxvWw=;
 h=From:To:Cc:Subject:Date:From;
 b=n9toPWT3j/kPYu+XEJzT+xMlydMOg9jlma7w2dFRlVbrYmnHpCGx5p9n5CKVP45Ve
 Rmv09QIm3HeSn6kLXbSFScJBqnbtGIlsXQhBYUOfCLj6zSYM4/9mQy3Tx1U0/k7YX9
 dw4T/ZqUmNWUHmBAVM1gC1WMRkPKjaQAaRP73wqs=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com
Date: Fri,  2 Oct 2026 19:23:31 +0900
Message-ID: <20261002102335.12501-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/kmsxx: Add support for pykms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for pykms in kmsxx. This enables the python
bindings for kmsxx.

The first patch updates kmsxx to the current HEAD, and the second patch
adds support for pykms as a separate build config option.

Paul Elder (2):
  package/kmsxx: Bump version to current head as of 2026.10
  package/kmsxx: Add option for pykms

 package/kmsxx/Config.in  |  7 +++++++
 package/kmsxx/kmsxx.hash |  2 +-
 package/kmsxx/kmsxx.mk   | 15 ++++++++++-----
 3 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
