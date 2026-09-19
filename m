Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B178C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 13:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA2F60693;
	Sat, 19 Sep 2026 13:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKR6Ofth5fV5; Sat, 19 Sep 2026 13:06:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A856D6067A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789823171;
	b=IHy9r6Ce5eiWcdJp6UaHqF3BYI1x+PsKP5CuYOUDXJX9dVevu9HdGQmihQCauHgUhvvo
	 IGq0tPe9oMEAwJ6/dXOLbYWu3nea+Fy1IPoy+0Qxqkp7e7Ja+WV6Fz3k25/Gr/hecGnfi
	 QSG+XNlukBrmL1Q7ndo6D2AMsvvSGCERA19j0AX+6t5E0qZRYOQ7763E31gyCqmsZl3Gf
	 EJIv0vDuooPmRWGx669ZlkcsmPI+NbXn2DQKMR91ajsl2BruN2LLFNxGo7XJ5e2T87r0Z
	 QDC4y0UtgxKuDXPAUdQyO+g00ng4iy9ZuAeCEfq9yFLqgfzDYv39VqHXxcAXadpv/ew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789823171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QK/nNhTqKAKr+UpRZp3sm3Lcg85+8fbPxijqeTAt140=;
	b=YNoOirh5vilJAsnCtOkUmTdKhyimGZJoDDGEeDUKHVdRpqKwx1j3UERIZmQRKnHqQfbq
	 3ECpI83Lu3BIv2sSX1WOoPoFYhaAWvK7oWolmBLfD+D1Ez4yRqBlko+HEcHP07Y74sWSE
	 wV9iR1TQxylyRKoJAis+hZ+6kRcE+YqpJ61+bujyRi00yvQyWkfaoNl3+6kJGZzNa9qQ6
	 I5TR9DcF8TDGUk0EMkFmZeTTugdkHeQ6zNX3SYnW0ibOsRxu8uEuWU8MslukunE5VyaEC
	 GPqrQavpM52BP8/Us+5Iun/DZD6bXXsaHZlMo2+pbwCKudDkNk42ndBpPXV3B6N3v9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789823171;
	bh=QK/nNhTqKAKr+UpRZp3sm3Lcg85+8fbPxijqeTAt140=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U2WCh55RMp0WjJ2SKy1E8eio+LbMADDjPkrTkcVUiAw5mIcKqwIyEDakwvyokUTDt
	 AXXfPrxaEPvgLRrmfLCwEjjY3RO6VlZEJLZTkVw8clm+4OWRnZPG/jB68ZlkN7kGvt
	 H1+sV9yCDsaKaxjY6QfT5Whx3KNGnoq5W72SLcJGVbCHWjuO+t9USLPNaZKWdpvD2X
	 8WHU1dFLFK0AQx/5rkqc7FoM8QrDxUc17F2Yk3X+z/dP++DF0RMiQIns1dyq5P86wz
	 EzaigEtIbhtwHjindzqT1JQpra6ORS0k4WOSNAmwOGDe851w4xTxpNt2E8p/8ax/qR
	 lhddktBkMFo4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A856D6067A;
	Sat, 19 Sep 2026 13:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D1D13D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 594CC81142
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 13:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5YmxtJNQ4Rk for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 13:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9F9F181136
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789823169;
 b=jfFWYHRmL9v415xiGn7uo2Ph5kvCuXWm9CYaWCjeIlBOWaYrcNdWdsiDOox3C/Jfjqom
 tGjL3ZZ4z55mqRjRy8tikQS9Jla0PZYhwm5ke6LNkhEFBB/NK9zlkCsepra6IJTsiQq6v
 y8xvQX0BBS7j2tuxQ6xB8E0OIYoWgXfTaEtplxWXpNIdM9HyRQ65digLHHxYPRuu+U9U6
 mdIc6cHkNDDXG2DKFF1rVhWNw0kctdCgqk1txuozJqRV1iyZvXRVlnE6WrcaRsgkYIBR5
 hhb0rtMW1UY9JMWxY8S6OjHf+hqAS//Vyzia6vGunovTtYpo1LZwSU7IpBrXautlpqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789823169;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=d7G+rDRKvhBKhJQpbCEcEfLPrl0RdW6TGWfS1ehVGaQ=;
 b=H6Gna9OxJHlT8p3+XFqklyhQs2wmdlWQrvV7slSxQD9Blj5UpuWWj8Sj+9D9jwDo9xO1
 zfl+0tEVOlt//jQCyiKojmWHnvuJ/9VAl/35YrcTlfT9mflmLcyRcuC33EwAEBUTFPo8o
 Hs6pnglaK5pO0awB5CbnGAVM32SxYKyrTXYcTbkzz9vV8ag6+vsiei3C4o5Jm6DOml2/n
 ajhb45/0dC/diqrfxBOlgh/O7yB1ZEo9LXEUBtdvb29GeA+7w8sLbcoFOIyXDi6ptETKd
 LVHIRA2QqXNoCiluXKZm+KHYodODnKIjw7F1VZkx6lIuPvwYx3eOY3EdaRd94rqJHYw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Vnta4dhA; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F9F181136
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 13:06:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id ADCA578035B;
 Sat, 19 Sep 2026 15:06:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 15:06:02 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 15:06:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260919101008.1338862-1-bernd@kuhls.net>
References: <20260919101008.1338862-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <74cbb62e3b766d6749ee1594a1d2b4d9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-48-g1f5026241
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

On 19/09/2026 12:10, Bernd Kuhls wrote:
> Fixes CVE-2026-8674:
> https://gitlab.com/gnutools/glibc/-/commit/1f5026241027260e9280039698bca031484c82ad
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
