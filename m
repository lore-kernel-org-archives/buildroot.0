Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD73ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3A0608CE;
	Sat, 10 Oct 2026 07:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tV8TMtiz2Nv2; Sat, 10 Oct 2026 07:33:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E8AB6066F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617621;
	b=dufVVgIex1YU18qRnC9Jp69Uj2dJirZmrueeywGxXhju8OI1Inzg6o4ARw6Gs9TWrgXo
	 I4T/3vGzlZsrZ2qjnM8dTRTBsTVM/yNsC/EerfeHXKtGg5cFtc37W3GvtRTW7XgPpBYya
	 syFlfSFsf/dxc2U9TE4PwPP5IOFCEGHKgdrtj+ZIRsbCvMUf6ahlSMWkzeO08itdtDGNz
	 gIn+cKFjnpbimFtd0u74epH3N76yXvI8rCOqvrnuOIwXEiYM8TBbpJz6zrwXOQZLLn2KX
	 BJyfK0cKmnJf7HfDT/AP/5d0UZe9Op7Wp6rop7ypDTdWEdCX5oR9GUGWBaWxgwNLs3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SzoDGuFHHqBYwYnw3Z2KTqkqNwh1jX9SgCWQlcqWhaM=;
	b=Mua4DsE+kWVgxnSjtGXM9h2H11Gbq5qT6f9camGvunMMAnu7AEbPgoJQLGJrXUrs7CIC
	 meIMdcIjAQjK6SY+1jmdbYqk060xKQ/xaYpeuzPEA6Vo7jyHhUmGj1AoCKBACMxsffj5V
	 XcJRByRYgtiw2ubuTUT39LztBIIQNtfiVr0J5rL5OL/lo7XfMBPw+DUYAMJZGc0lg3qRE
	 WvBondVWuu7q5aU9l+i1/WwvXqmeTHLlucvL5wXTy3KTJ0m3fJ3/nDYD1lvtlKnk1Fqj1
	 cNRXlo/4iCyD3uv6BMbNbmU3Jw7J8UHb8QV7HGOIufBZXHkuzLgbxS8txkd2Nnc6Ing==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617621;
	bh=SzoDGuFHHqBYwYnw3Z2KTqkqNwh1jX9SgCWQlcqWhaM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mFCcBNmB28vv0/6YSihQgwG/ii2wBGzjQeiU5Qq5yxRUXNTmFHLFhD7/n88IdxDsl
	 amkQfV10W7jMQDq+75HsYV+kgkVwYwEdq1oDQMQig0tz++zwnNTWLTfieLbl+yOh80
	 PEJFoZ30IfQVG4QOd8UFb4Xku8tDyj1SAOGlmjVGZUxduCE3MiWReJEdCNpHzoHAjo
	 5v0sFHAybb5YRI05wy2IKUJytNjzKXTnJvDPAj88NgY7BrmSv8UuLFNku0JunlIpwb
	 enIfhftxEnLFQScmh+DoqWVKxltr/EFPtgPEUfpve0lplt10rR85ji/4g4gCGcN8Yb
	 Ow3LhKOeOZedw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8AB6066F;
	Sat, 10 Oct 2026 07:33:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA8F2111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C35C4006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsX7uKHwZJbT for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:33:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1AC8840004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617615;
 b=HUxz+e0AuBaSPtd1U+k2RDp4Te092Tu4jhTfSdT+Iu6NkgtWRCsX2izKgJiXChvAY8s1
 LkF02bNW10zlOQO0Dv/qoqYh50wvV2y5GqM+tg6WNQZBOtby0S59osN3WAogyRncX65fN
 grddi0jSQ3rbZtGX0IUe3hbLQodCSnMnAC8VIVvBzbXR04u7qvO0bAqXDr+oHQuQvg7nJ
 i7KojFRTXdK//ZAK4CmseNyt4sbxlESqDlsghiKVGZp9clbFt+Ho8YwGH4/NqD6CFTt+C
 HuaRlS2zs1eRMhIrp19dIUlHtRPlYcXZBAS0AGoba2vUxnb2CTy41nH1G4v2NahOS1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617615;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Jnae5nfg0qOK9McgTHqkloryh5ZWPTDug/dcl+SaI24=;
 b=PfoPW75Rg6kn3cOid1Br2rGlJwXnASkVUC3wiPT7IOk2nYG4NFNaJnnKWJCDqN3/571L
 CW9hoW+GmOG2siFEGMai0wIAbsSbFe75JblTfTTrJnl08VG5jZjV4msTcrPiZYaWBFirA
 cNcRRJ0+2d6jBATnsSSlKBeRU23eW05HUIuagChAs6OoF7sbXUhdWwHP7cGIMw5we4Rz5
 FsfKBj+JI+1peFg+epnm3NKm/lUkNxc2/lVtPkt9EMHa5uJVvmTsuRD35j/DEQLEO7mq5
 s5lA3EadoJeweMxIrI6TdA/wboQOV37Mi9YMoJgZfy06U5C34YqIZWEDVhijpNEjxvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EDzO0XVL; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AC8840004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:33:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 88E761A11AF;
 Sat, 10 Oct 2026 07:33:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E4E26075C;
 Sat, 10 Oct 2026 07:33:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5254811D70C99; 
 Sat, 10 Oct 2026 09:33:30 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:33:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <asnqRY5PtIUikXzg@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-25-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-25-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 24/84] package/snort3: fix build error
 with numa support
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

On Tue, Oct 06, 2026 at 06:20:05PM +0200, Bernd Kuhls wrote:
> Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
> package from 3.1.40.0 to 3.11.1.0. Upstream commit
> https://github.com/snort3/snort3/commit/83e9a2dda250a0ced9a105454a5a4fe59c304601
> added numa support, first included in release 3.1.65.0.
> 
> This causes a build error due to the numactl package being pulled-in as
> optional dependency by hwloc, the latter being a hard dependency of
> snort3.
> 
> Fixes:
> https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

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
