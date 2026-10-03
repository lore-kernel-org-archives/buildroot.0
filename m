Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D18BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1706A60697;
	Sat,  3 Oct 2026 13:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qHsrejIgY_X; Sat,  3 Oct 2026 13:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5160D6068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791034946;
	b=DZ+sFYrmk7KEXnl1fl697sdpDD/xlDZtmlQgsA5JcvnVy50Jmu8b5naRUQhmPl3MGr1w
	 m0jxxXpVfJzLFbbxCyDe+N+0vWI2PUDpkmQXuv6kphJ0Td69iovnViDF7/A86vabGx2LI
	 s6h6NEUOFzCF/3DZQR4ktXKdz9p/s3bxrg7AeqMxRGgFkgLjFO23omwz+R/aME7aXqFJ4
	 pSOjR7qzq0WQI/lvvgdzFTLc8rqDEVwB+MwYk8yKJUmUIeOCYi7C7HPlwwArNiQHoHkDP
	 vwgFy/eVspTWjZ3e4audzSCtc9U/UuSgDGqjPO6o7F1XKNb6g8IPSsi7ls0PnaoYYOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791034946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=quGYFlKohCnUtvrMnwQR3z4o3Jw9J/bghxxcZUn61ko=;
	b=gm0TA3MoQKYH/BkX7qf6/eTRh8u9IWfu8u7JvZkGKxXxQpr00lJyVcYNR+LHSQ63tB6v
	 CtqQIlkWxJx/WPgw0iLS4iFBVHPTx1x9/HJrEyT0cOgdG6NgUtKSxEYXFc3jxWOUfIkMJ
	 EeDkilDK5px6Qra31k12OS2wr3u5opv95Y4czGwMzzSZyeUiFZ0qKMBIiAAfUrcEcRdiU
	 Bf1kPzGZ8LCDQYVBBOvYahTzgijzxg2aMGoD9Ii2M8Q5cir35yDLob8Jjn3hn2BXC91BS
	 Iy+oMhd1iVZ7OHMEWPWn7gToSDcuepvHX8VLTBP+AXxfEkXBNhmx9wy55fj6wKLFDdA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791034946;
	bh=quGYFlKohCnUtvrMnwQR3z4o3Jw9J/bghxxcZUn61ko=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s1MKxTc3BEd8o4xyz8989TCZCGzL9PZfa5QFlujFuV+4vWdY3nwwMTYxefv3zx2bT
	 DECwS8D1rlIlEcCWDKsEYNmxIpxlDEnUufkcgHISyykEVH9JzIifEhVzI43oIcesMI
	 z1JEvua8PV0+hvSjy2lLDmHD59uMJj5OZQM426NI03IG7Eft1brQ08Td83ybBMRAvv
	 UFgKkOIuFjvs2WGggQdMobhVFO60V5ONhwxHlrskGAwvXmcBg3iSBg/GfrTZfE6VED
	 jzz1O6ZSOYjwFUFKF1icbOpu/eKwH8cxR8y0jn/vUcHQnJb+QlSS5+gwa0SZNlDWgw
	 WIWsrn4gnh+Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5160D6068A;
	Sat,  3 Oct 2026 13:42:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3214C335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4B5460602
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsB8-oRsIn5w for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:42:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E0B5460601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791034943;
 b=JbnTEWvGESl7aA/WDrW7LFdYchMIyE0SbV1X0GyCfNcS/vk1ZFbRuzNrt+7VZwVrUvmk
 DRdCMZYB8eC/PuihmEsOmbQUL+/KVxDrAYfQzF64Xmaa+wOT1NVmqTYiGj8B9+mWn2w9y
 xtinpCDdWEACW7qJzfAVZZU56uMBpyP8rpFnAay8kzBqKsn/wVsiwXMVhft4IhLhIdlif
 GvT0mT5v2E58QJirpE8DWGt5y2aifek2aqoUereCBo+ugG/8eRP/n4YvHXv1Tnrs3W3X+
 NJ50Wj3tPbs+g38OGFCByBaefBUXfiKTszmDrMa5Oj+61izQGQiUluH1pwZ3FdiCJNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791034943;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=O/XbGjuxZby2M4FsdeeE8HzK9pugokAiUSRI+4yZRkw=;
 b=NkVlHHq/5CNc5iltL+F0gTm5+RXI2S2RQ8FOihDodB5cSuOIqb9h0Kb2ny8di1ZQimcY
 6DW3AnIizO+Eug1ClXvZQnVmv1IWPOmLGRWbyvLjJI26/MSLrw3iD+bqpCPJL6hYqpAC6
 hXpL2LhZDCTKfmKy7lbfaJZaVuA+f5skG6DO/RSzmBy8eQepVUFD+ZeUnqDzwhVcXNup2
 H7XYHPk4c4QVjvBU0lCfs2dADi7T6Jmo9s+EPL8KYo6SiwKWP+yjNUqWVn1KbfA8s1dFP
 jqZZWlYT28Mst/miHCqQqf7ZfHoUzhCl6BFrTyWq0I/uzbkEkNT1XcKa6MaYRmIPmaw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="A9TbGLp/"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0B5460601
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:42:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AA0621A10FA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:42:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E168604FF;
 Sat,  3 Oct 2026 13:42:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8A48103282A8; 
 Sat,  3 Oct 2026 15:42:18 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:42:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asEGIKDfdaZ40HAA@windsurf>
References: <20260929183607.1849293-1-bernd@kuhls.net>
 <20260929183607.1849293-28-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929183607.1849293-28-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 27/66] package/resiprocate: Fix build
 with OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 29, 2026 at 08:35:26PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...precated-OpenSSL-calls-fix-upcoming-.patch | 597 ++++++++++++++++++
>  ...aining-build-errors-with-OpenSSL-4.x.patch |  47 ++
>  2 files changed, 644 insertions(+)
>  create mode 100644 package/resiprocate/0001-ssl-modernize-deprecated-OpenSSL-calls-fix-upcoming-.patch
>  create mode 100644 package/resiprocate/0002-ssl-Fix-remaining-build-errors-with-OpenSSL-4.x.patch

Applied. In patch 0002, I've updated the Upstream: tag to point to the
final commit that was merged.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
