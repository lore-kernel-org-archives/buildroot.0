Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6957AC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C4A40AE1;
	Sun, 20 Sep 2026 12:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQiTp7vF8j8y; Sun, 20 Sep 2026 12:10:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CBF2540AB4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906207;
	b=b6F40rEF9Lf1WJoOT/Q6AnzF90wyDxe+9M53u4hbjrvYmIf/7hvJzITYLVgFnV4NBCGr
	 yYwcM+coIREUclEgwbFE8yx7qen9D1WFt+tJ/fedqUgCyuaRXIjZlZyTXilotwKOfzrjI
	 pldR/VPuVNsbY2+p0SBxw2sdc6OJ34MwY6SZeqbioZM46ql58kwttdhStnHFZ8G3HJ2bM
	 YiooKdVxH4KRRjGxB7j96ZA2WNjQgWYLrX+HEP7a5Fl2pFk7FXxW4Jw+IolcZjHV4oZMu
	 OsVAlTgi9pRg6LDtVhL6GRpKT6N8m7UjWLhPY79q1emv5CqJ+O6Bb/rzhPDS6FK78qA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=G4utri7fA38wMefWivE/MScit3sFH+k5gbHXB+DB7/0=;
	b=nw5eRAYkNp0Qi0OlzW4Kk5A7XvfZkebY0WRuMN7i3jXGZDiLmD8JcR+H1pJxpUeSTa9E
	 0+oMHDKY3Y53dV6Uu3h7mefwAFfuY98rRCigCnucPJ6aRaGdGw9fR82/9K7gYENVaEzTq
	 M9ChtDBPwCFwpj1yDkEM1as0oFbT3wOIq1MZ79Rk1o1NjvqbD3+QjymROe1CTNuzpR4Tn
	 rNzC//7ZI8bGh7BCLONtFrj5HswHj6xFAp8mW4HOBzHr+SC0seY63rr4fsz4ggU07g4gA
	 A3EG1wxxN7ntpZs85eYkHFaIxiSSG/YrFTrbT625JG013HTDmGMot4b4YGQWlGtJ+YQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906207;
	bh=G4utri7fA38wMefWivE/MScit3sFH+k5gbHXB+DB7/0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L8d1oN69jCR/W/NX38nDmWTpz0OP0g7xrh1Pfye/gdUUISc4+x/aTel1KNT1XCpU9
	 Exj7vRmdha0mRIBQb+8HchunaLFLzZzRa/TPXk+smOqWkGtZU6LUUlRjfoWdten9Ho
	 r2eAKWoj3fpmSFTlF+y0ucKic8M8yV93tRjlCHvvhCaOSRh3bZFoCiG97k553TIwOr
	 CgAiKyKux27FQ1Z9Mynq7V1kJrQvXnuSMaIGOGuVBOd+7Kra22Nbv3r/wduqJ58SIJ
	 C9KxTksVNf+vhGSxHsvOpfjRBy9ooxuiel7DlMSGnQI/1VBL52IJx8GvpF4ZHvG1v4
	 ucod+MzmTtOJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF2540AB4;
	Sun, 20 Sep 2026 12:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 274F3392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00FF460624
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLFNutq6yrHn for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1168B6060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906205;
 b=nceC6c6pWRYP5jw8hqrakSX4I95DXmo6w37OSeF+yvvxydRJ2/5GlE+TSLpQGifyRTjx
 aaFq91wrchB1qSj1oDXUFe4lIXs8rG0Js6jJ6LXWdwtvPfpcCWIgv27/tUV30UwbnW34I
 b/gZBjNEdRCKmTnc7YCM3y3ENCrP7x1C4cyCJ/36k04JQWvommPdzefIDd5vi9MBcEWJf
 wUh9Kj6xc7tXz0qkT/e6Qji0ENzihsmI+4Q0WPykRkVCx5ER/5QHhYSnidaMq/Mn0cYVr
 xavIHFynlZbikUtfAxLM+0pwcvqDKXA5WYJ4Is9uaqUh4woKS4qd5GtlxmvgrSvo0dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906205;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=g4WMZuQGqVJkrz/YbcROjVdMaKVHjzlGXyF9E+kjjj4=;
 b=phRDrpXqr4tBakmmv8K7SZTvydz5DX/rBA4s8OI1nTiri1rM2wuebDKjxV4VR5TfqUs4
 ueO834/nqcKdgMc538P+ffQn6TXEGBH4mzAiISoqO6EPWheUEf7qWvnPKP/EbgnMp+hwQ
 HFkEI6Cf12mXcLWSU85hg1w8ymCB/rLkYD20I/cowak7Q26eRgK1JcavCFam8MPQUR1Nw
 NIMGn+bk85kybxBz0Yryu0fYVpOknQp5xSJBqOJPiyjvzN6ew7ZTFI2Ue8wJwjTZT63SF
 I8SmZYRhDw+oTZucZA0Q7aRNEBainuafOZfnE+xr+0g670aarY8A6qgJrI3vTEcO0Gg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gbAT1sbh; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1168B6060E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:10:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7B0941A0981
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:10:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E58E604C9;
 Sun, 20 Sep 2026 12:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A03F1032829C; 
 Sun, 20 Sep 2026 14:10:01 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:10:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aq_NFPHzZXBnhdwv@windsurf>
References: <20260920115126.1062295-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920115126.1062295-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libdeflate: bump version to
 1.26
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

On Sun, Sep 20, 2026 at 01:51:26PM +0200, Bernd Kuhls wrote:
> https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Depends on gcc >= 4.8 because "libdeflate now requires a C11 compiler":
> https://github.com/ebiggers/libdeflate/commit/a7cbb2258188cd459e436b0c0a1e4b892e2b1ac7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
