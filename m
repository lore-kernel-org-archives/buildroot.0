Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E618BC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 22:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A5E40AAA;
	Fri,  4 Sep 2026 22:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STD-6jJ_UsS7; Fri,  4 Sep 2026 22:50:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9014D40AAF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788562214;
	b=FXkJdpjJCJVEREPC01uttLx51DDBUxxYLYEC4FvuvFn93/+Vrpoqb3CK476MzPFY3Fiz
	 DbLk89fdUHbFYt0XMkuPMTLdTIaxvTOJEYS8P668HM/xO1Ahrf9N1r+XPQ559WSK3pBaF
	 s9s6JhoLXoHrQjuGo1vDdBv4A+ErT0GzXyzJUmO8wzGs0rJqumYspWtaMiMXRE85JPHyB
	 sQoGNI01lGf3DMVyYGoM0lU1yNN8esBuMjob6ddc5jiN1iVE9PNsgHRhzn9sB1OfKFffg
	 sCa1kQzLsmuqBh8kFzVrlP1R5I0D0NSnlsL/jUxrYwWg5ZBehditJWAAqJHGjgvvG6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788562214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=jx9b556Cm4bCllD7Ng6zIeCa9oxFF+zdXX7Y42AZfhc=;
	b=j4Spe0PH8yuqse2EWXo8jGF9bJTmH965Ddpp3xNtKqdnpKuOEDW+APDZE3zKzrxfEelt
	 9GaryzERzr8xHlOWYxWoTDQNGEIebxLrb5jPH3DG7ImcwT0c+MZDnhiKNpZCLXryAEGym
	 ZzsCIEx04Z8FsaTl5ALmTh1uP80hYx0+5MrpezBsOPpXCP5qF77iU5Q0MQs1l4aNc7lut
	 Qsmrb12n+HgUIMaIQgRlIEZAahyPBpmpK8Pf8VxmuwNtexWhctwMyCpj22XboHh0EJbGg
	 dMeyko3/dhxgtgv9rs6XQVhui6pP/GtFZK8IeV7fsob/bcn3c0EXaI+8KNOZOYXfhVQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788562214;
	bh=jx9b556Cm4bCllD7Ng6zIeCa9oxFF+zdXX7Y42AZfhc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JjzydlHg2bRziVJKbaoOysTUUxcGyZ3XoTMBZEkWkRkdBkkACW+GBfn+2KAATOFex
	 PPQO6v0vElH5hB7k/+EGRgDUnuL4qhSllMKqYumol+VcJpICWrVHloLjMjtba9DQk7
	 VW0jkI75vyGsJrM8GaPUzDj9lef2PXELHiaXGqLgFkY32dCHo12efRtY0TfSX0j/yY
	 Q/m8HBVScADO4YZLAGoibelJtUWCi/KmtA56PvmzZBqjnUrJBWDWuKPXqJBatlOzH5
	 al/zpWmFe7ZPaAxYB2S+/3RZQSgu9Trxrl8Bz6Jv0wXqbTUUaRZYu5PG0HN+u5IOtc
	 h3B7aa96OHuaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9014D40AAF;
	Fri,  4 Sep 2026 22:50:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B42D3388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E6B40AAF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1I9h_QhW98xH for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 22:50:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2D4A840AAA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788562212;
 b=SZKHjfW5nzKOXr8ptGT19KQ9+w7NNbfasJgr508CcVo7oNtoT3R55UGyY6RTAb2qOy26
 iy9h+XOoxQGqyrYhv3SpiCM3TiKawjUXb1hZ40DBkBFcI7TK0786yChc6lRSfSbOCiamR
 fOhnINha54Wf/c6xRYFjc05ABLpo11WsBGkqY8zVqqsQM+l+66lI5Q4B7Xf+lyloRuiKa
 BWjjrKiW5jdXmXniAKeFuFU74tiPt3E78bRgI01AHdw0Jv42Rg2Lk2jA+ovqSs7waUNux
 8clFYNQlhR7LmTMpCq9BQCS8eR5WcasBBOfsEJCrDM/Qp93XO4VMBYPjry9FSatrwCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788562212;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Uw21MYIk87wYiFMKFVhU6v1Ato9W4TZTYKE0kYeMe2Y=;
 b=XzHewoZfz2nw5+Alcbpic+vHTIRKdrlpDy7hwPa0PuSaFHR2U7O7eomAP1kBn5ekJJSy
 jTE7Sic4fe5/bYGHTqUfeOQzJQys1vF7h9SQCP58dnqehz1Ni/ELtI3V8x9a20DaxgL6S
 bIi/eis4gE6uWuFKas8ZRhKb9NATGT9wPEvM41Bh3m4HG78UkDAWbLrZRwPN0/B+CEQDo
 jXNF2twc4Fna5DJPybzg+aP0NnbaUwobAd+tnt0yAz5geWO5z+Bo7cAlk02lxu52aTqQ/
 V9F05on5BudViyfZE+1apR/TjO+hsovegyfli3nUwuDmHt0ClMaN6JRaltkjAVriZhw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GqNaRWPh; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D4A840AAA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:50:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1wjzRz0RDw-0110rN; Sat, 05
 Sep 2026 00:50:07 +0200
Message-ID: <aaf09d64-a078-490e-8496-25daa2033bf0@gmx.de>
Date: Sat, 5 Sep 2026 00:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260202150220.3996455-1-buildroot@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260202150220.3996455-1-buildroot@bubu1.eu>
X-Provags-ID: V03:K1:I6KJGD+O4TKj57BAJT11i1QxVSM2niEmaEgwO8X9OtnecI3GZmZ
 4b60y7mty/3q7Wq2xq67qGsBwjd1u2AG558eHu1H9EezGHg4yPQx0y5sKB1PriLYOk4W/7i
 tvQY+mBp/51qlTFYhCrxRwfzZklrabV31/+nzN8tCejKgLrnAa0H87sXoYsx5WuTfemhAlM
 Pc5eiO0v/gA6Zw1hDyAmQ==
UI-OutboundReport: notjunk:1;M01:P0:G+yhbVvUqP0=;18qwbYy23OydP9tD/xalrkYNuep
 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
 tlcygPUj3+9ndW4V3pru7GXNIOAYUznjIKg==
Subject: Re: [Buildroot] [PATCH] package/python-charset-normalizer: update
 package url
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 02.02.26 um 16:02 schrieb Marcus Hoffmann:
> The old url redirects here.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   package/python-charset-normalizer/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-charset-normalizer/Config.in b/package/python-charset-normalizer/Config.in
> index 63e04a7a33..3b01357167 100644
> --- a/package/python-charset-normalizer/Config.in
> +++ b/package/python-charset-normalizer/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER
>   	  The Real First Universal Charset Detector. Open, modern and
>   	  actively maintained alternative to Chardet.
>   
> -	  https://github.com/ousret/charset_normalizer
> +	  https://github.com/jawah/charset_normalizer

Because of the redirect I assume the change is correct, but also files 
within the repository contradict each other (as in, both URLs appear), 
so I've created an issue there:
https://github.com/jawah/charset_normalizer/issues/801

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
