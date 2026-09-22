Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0D7C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD819607FB;
	Tue, 22 Sep 2026 20:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNsRlfn2ci7z; Tue, 22 Sep 2026 20:40:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 044116067F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790109617;
	b=jSFiXkgQK/jcN46YVsp7oI+9ridaCqvm7SvIx3T3znTT/BmWzK1qphIfG4CSYPBe5VXh
	 I9sZ/CpYtqAQsBith3UNS4f+68iBJmTutrEq88s4OFyiaMXGQN9SwXcTJkUZ5VZcMNhY8
	 dQ1qqZtR3qPoj1it9CUiCvrroS7kPDC1Z/jKyF9MK1baj4ZmLlu/8MQMynMQtmeDBE4Xo
	 o8FyfZiQ4wdQMdlC03QJn8qoqEvsG0uQ45JuttQlbTvFVI/wCTI0PDopBp7PCt2kwGJJp
	 4o2f6gq/Al3vCa33G26Xt3noHGzgUb+VJ1D3pRZW75Idg0LCo//f0Zh2zNmSG/JC8YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790109617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Xpef3LxLvJJJCvrTHj0qqLcyoRDMFpvaRT6e+ESq7xU=;
	b=ENfhVdf3xXZgbDSPF8Ig+vwjcbTFPA5jbVpnbk9+hCl3YShC3BUAx9fcPtL9tnESArs/
	 GbS/2IFaLz8CttukaLJZ5ZsD7eIo+sl50YiMBMObGXg2iGVA3RBK7CJlyDV6eFF7eMzqp
	 dBGeZQoEqjUnwqHJgaLtnTm/EO/yjhErV9PHXZYyj9i0c05i8cms2v/JFkyNhXu2jvY9J
	 7m6W2GGS7CukF9yzjHdThQIT+tdtLdqyspp7zslJ8q0P8j0zyDp3Nsq0/EgdTy3D5T7Wp
	 qsT1iZ+XrEBYIFt4+ttiwfCsd5mb/vEkml0D3vnSGf6bbjjv0bjewxKZsuVY3XWWw2Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790109617;
	bh=Xpef3LxLvJJJCvrTHj0qqLcyoRDMFpvaRT6e+ESq7xU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k+Glaygu8t+/xbIecP+vpBz5LMDOycPYgKfMvsYl3Ym0k/6AadZ6d+/VTjcqDRpRd
	 0tTC0vM7I41sIncdH+xVM6AkoX20ZlRFn4aW+JNZ5ax8HuuvFaZyNwiD2W64Goew4K
	 6nzgNYOLOFVbu/BphaauSgCQlcRn8H/CFy9wJ7JNxfGPyuWTEZywEfEIYJdZCerDFs
	 j6DsWgif+G9D+0RpGCxE99Wmnz7PUHMEPIj4s/MqxeU+Pcf6vU/F+XDwDDPQaMqv12
	 9oEKLba6MfGOSwfFHfVddSyyx1UrjHo0PBe5g6pWzeptASx+OWFaLc7gpUFHswhRdd
	 LJsscKxR8PF9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044116067F;
	Tue, 22 Sep 2026 20:40:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E018F498
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D224A40776
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlyM5Sz1wPvn for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:40:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DA22140778
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790109615;
 b=tTpaKtIXIzize2VGK+/m6wQ7m3Xni7hfWWWaRznOzFnPnj29VUtPLQnvjuFuxt7w7Fxh
 YLA2mD6eYrcbTn/XIv9ZdQ/5UndVJ8aYWG+MYvpoKQjpcrV5IE5wgZE2SNf0rfN1SZkdz
 u0XrUUvOEdWfUzjGKrMFV+ozbzyykD01S5iNw4FHTa42Lg9PNDmmJscy2AItqUHToFLJM
 sNRQWGDRfi69vGA0MwDmuJ3qaSEbtbs4LXLMdtK5kkM8fBECSyZrRG9LaPH+CLOuIXGmu
 dBDs/E77cJ16WEstqBasBWVbTHK9fQt7u88M9yD5fmDcUkqtBfrYobs/20nOqgurbDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790109615;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=eDb+Dji7Eh2fxiYQN3KE5VTN+/cca+CyclMlRBRYCTo=;
 b=BDwBAeHQG95r8p2MpQYuX1cUDUv7DdnKRa2ph+QCaRngr0onfWvasDx87Mhv1CAAxL7U
 6XpYDLW5M5uJt63DOEfrlPVC9XKVTJmjlhoKl5x+Ut7NTXKN+xH2KkfzJBDfCWFPA80e/
 qUpYSteZQfS6R4fRlGSdjwMVDk+uH3ZIp8+916VvlMM0m9wzQnidFIovreMrsH4kJfad4
 orFRbh6xJ7o7/hG8EsnGrOngYUGJC/dKgOP/vCkV3KIi7lrMiIRqsDi8IqjWSzp82Jrhw
 j3t3jIRwiPFq8d09GQxCoQjXWlgvFsrHrk28Jn6t93mZtOAK3jGPqm96bEpds6BWi8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P413caIk; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA22140778
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:40:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 433862003BE;
 Tue, 22 Sep 2026 22:40:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 22:40:10 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 22:40:10 +0200
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260908090757.84261-1-mf@go-sys.de>
References: <20260908090757.84261-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <18ec2d2a37b079c526429eb3cc4d4bdd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 01/1] package/sdl3_image: security bump to
 version 3.4.6
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

On 08/09/2026 11:07, Michael Fischer wrote:
> 3.1.1 was a preview release. Among the changes since, it fixes the XCF
> loader issue reported as CVE-2026-35444
> 
> The LICENSE.txt hash changes because the copyright year was updated
> upstream. The license itself is unchanged (Zlib).
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
