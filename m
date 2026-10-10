Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06103CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1326405CB;
	Tue, 13 Oct 2026 17:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPd9q4ZA8Ynd; Tue, 13 Oct 2026 17:54:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8E86405B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914084;
	b=CpH3ps+gMg4ZePedSdbdOj5kyGjqa94KhW7BHOzud7s9xj5A6/UqgpAvv+3nSvs0Ku1n
	 tmq5ZRqj/jGLsAzi4WZPZOEk5h3X5Ki7bXgpskYasTKMxeLN7bKQ5ivrWQ7GQUBkL4D73
	 491QFLTqphr7dOlqAuR03KPhstc9CNV89J4vSifit3regzf3oe7t9p6Rii89riwtLJl0J
	 gucQPoFyjB6wcehWskSiQZHe8ZwVuim0irGHHr8bAl93w6SwcwVkoyn8RAWtI7Z5R1Snj
	 Ke1+vhDj50xfqsTrOIz/6soQvjKjNRFahT1ghb0A6O0bw4P5CJhJTF9OWbT3Y+2maaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f1XGgFoLWZ9QZV6zeJYg3aqdqcIH+f/QiQzPW1uNMdk=;
	b=i7vBi8sYskWi5Xr1051PSBZHZOd6OrGAdWmIOPxvWoSvPIVC6jOBbbsdgXfTcI6aUaZS
	 /4cdnfCPesriidgOcf9ZrBvMYDbDsnZqAthXOE0x5gMpzaVXD0NhwxgWlLMJ+DSA2TGqq
	 NcZCwkOdn6J6Et5wOQry6BZ3OaIdY2ZjIbQCivw1yIyWDe5nnGjeOthoDHh8ODa8DjbJ2
	 xKoF9u3pU++ktSAulndJt5+AscYc6MMy7WPhiFgvpoESnZgslQ8fEEI2JBOlsBUuWqqqA
	 vglIgwREljgqpRMecIbyOFeOJ82puAIchmz7Mf5fJidw3WxaXWQMiKwtYNEjRP/CiMw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914084;
	bh=f1XGgFoLWZ9QZV6zeJYg3aqdqcIH+f/QiQzPW1uNMdk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SfqJN2hjxl4iLCywopw2Ty9Yf5a1ISngP+fqMhTjjE7/HwFoGnOdAsoPboTtG2MuX
	 mAJKdn8X79+V14wDXcZ8J69HDg3t/JoAw+BAXHSxNMDdsJS8XBpiUrcI/i6UtRPBbB
	 AJQ8ISTBbZBytsS9R2lsfpd6dwiRwFT6sDZ9e0443t7bxWKdjiddW2GahCp8p2w6XF
	 IYEARuhpqD0bVro+Uzd1zrJtrAIUqZOjtX85KMsJ+5+dmdcf7/4G625RAZaZRufvQV
	 KICsJJXO4itK2w6TjoWxc7Y9tjnOjRi1IBO1JMOlR8qcZy4wIxiXsrQv75/nfvbnoN
	 RXTz+CIotFRhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E86405B0;
	Tue, 13 Oct 2026 17:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4CA4362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C70B9402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3rJPKgKM9iD for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B65B24002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914082;
 b=SHr6CeszwXgm6K2u7xj7x/cwlgzaxPXpQ7h6+tgtzI/k4GIigyM9ooajuBIhmiMxh2Wp
 5Y+z6DeRwoMEENUv2MIV0BlaDP5g8lsKbBQY+05R2wXwINA+g0Ta53/V7fnx8EsK5S/xZ
 /M1ruOCROM0ZWQjkcjhUUsMu9N77+Bqci+J6U3WjXNXVQ+cEzmE79m0GvHYRc5pzwQjvk
 Hrb4lthYL07W8eCSC2OlGyruZONV3TXp69SIRqvQUT9x5Wy80UPjZgFY8RwZsXDujdVb/
 7kNuTrJGo2spqkBmTgw4Ro7OWa2ixMxqji4OUKlhK20CPPx3lLT1gs/wIofsCqozSMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914082;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=4+rOJZtlucpoqHzHDo7kmztJDYs0bpR7Ff6mQynARzc=;
 b=RVZtt0RlnYcV3IViUP+t/5hD2afPfIXHVYEay75QH9C0QpCg9ogZnSLqw3lmVOykcbMv
 LkQMPNzGraHpxIa626X/ihlQUP/ipYuErQic9fIJwOFOXA6/7OM2ezZ4m5SByEBdAllxg
 myi+HriisKosJAa/MbfVCFjqf/6g1pKklpFoh+6+dcM6vZlPwfmacMEqIZVI7n1N+3/bJ
 MubKVuuzINvSwf7bYiPQ19WvqOVzqm7WQ1VhB3kD7DJaGKpij7ReJAPNxaQzgVuQfCRkl
 CJGAprxbotGnfRDhQmN7XS0MUdQTVxoYZ8V8lEXMEGHqj3NVHvb7d8J6vULY5Y6vEaw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mnaks0o9; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B65B24002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E3944C653F7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E55A60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:39 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id DAA4B11D718BA; Tue, 13 Oct 2026 19:50:28 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:35:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asn46AatN4gw16Rx@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-32-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-32-bernd@kuhls.net>
X-TUID: rv4x3XsjCMKi
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: DAA4B11D718BA
X-Spamd-Result: default: False [-1.72 / 30.00]; BAYES_HAM(-3.12)[93.17%];
 DATE_IN_PAST(1.00)[81]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[kuhls.net:email,bootlin.com:url,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 31/84] package/freeswitch: Add support
 for OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:12PM +0200, Bernd Kuhls wrote:
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
