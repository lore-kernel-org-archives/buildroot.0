Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CF3C79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 08:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0453240596;
	Mon,  7 Sep 2026 08:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hHcyg7I4vQt; Mon,  7 Sep 2026 08:12:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E8B6940550
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788768768;
	b=SfcB0qbHPQ8Blw0AaHhqhxqPXHa/U41dEJbGAqrMSkhYsF7036PYlQZlvRzXFS4vE5So
	 +adrX1qxQfyskcbq8isyJCh132/7ZSteSepKDg0q4qA5AJX14n7sUQXjjOQZQkHc0QDx5
	 l7wIenlSF/ndstXJXJmjJm+dgZa6mWpwjaWk2tZ1hpBJ+C/AzSEP9083+OuYvnaIXR6MA
	 Lk+B2bTS6c23fGyZy4Mz7I9aeSn132tfxpOXyxSO6ivIfg1jwbK47gPnMV13lT3CnU7C1
	 mbySdrbWVaQ1x2cXcumr2uDuPiTiQ0atyMfWPLwAm2KE6SE6H98VqZs65/j4QSaiuhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788768768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5B3ZMruZtxzFKz8gfauMmatfkghlfKrS7xHUcUE45Xw=;
	b=DSG6zSNbt6xhL5oTMDnp6XkfSDzs2x4p/cs3ZIXwuDlNIzdKazIigWS0F00bjrE8gUu0
	 1kdJI6cjKGb7i2J2wHKBeYaJzGD0UsV5pWs8mc0jogUXe8pmwXhhZe9RtJtrInE2Q3NEi
	 U1IHy8X3Bf1fzNGGNLqNTcOWrJARQVBWoSh2s745IrEuWDIGwUCSUhoT1+EbYOlqE6NXe
	 +d/CfP4ghXJ1M4FJhCt02oj21GRfoVe6ZCNq6OpAjCld3thf5Zs3Mz3Ri+S8Q+kO+sfor
	 9V2Gr5U12xjCU8rkda+8yA2Mtkww7Xr01xJMPJ4I7n1TMyEDirioslwxROvJdcCOqjg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788768768;
	bh=5B3ZMruZtxzFKz8gfauMmatfkghlfKrS7xHUcUE45Xw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ax3t3glnxoZaNRaekp2sXjOgW/e26ohQEeCV7wX7lafc8OrldSbDnJ9P0rquRqUcR
	 4H5qFAzqi+iOOY7hRyWMhLCDwOMQtm52oQXEaIM4mlOn6K7YQhW3XJsckVuclARJCd
	 pO7lEh9Dwg5haqFMp6EUDNwcgi1qBfXNnCy7bLbPPS9wMEL/3nS/XsawH19y7oMaOD
	 ZYDiBOR4/to3Gp+/WIUHaTg1/Zm7UMx6cZ7dT4AvhmKgZMGDlFPinfwSBm9jp4acWa
	 c/1TAYQo+eitJW/IjosvK+io6Bjop4rfLhSrsNGmB+h4z5c4no52tNjTaua5ghqfNR
	 OEnx9sHPV43Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B6940550;
	Mon,  7 Sep 2026 08:12:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A97CA118
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA6E60634
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-7DrGdy0d9f for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 08:12:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AD44D60631
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788768764;
 b=kL9vciZ122IfSwXXbGzUbIX9xdBfFahuO/pGlZmt8OifUtAzbmR2KdRlMcUrvFv8JdXA
 Mah3JDp5KwoEcflKrZgMaQxE61/5m4YTvIem5iGctKPfM6Xjgkz6fOMxDUiKOBKlJm/L2
 /ouulYuzjQtWuZTTDMv49S4BOKYtLpvm5B44av8uL/6aKbLUnekp07ERx9M08qzcpCG2q
 59FOlbqqu3VJJp1U0P+8w8lELv6Ikx4Ld+TyGRW/kCvetkGSdqLhqJ1wm+f9uYULcivZ2
 4NAn9T6iPY73kmS7u0B1Vg4PTiaQTtHMZutoGzuMwlYYI1K6lHq7hLUvpMEmjBBEo0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788768764;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=AYsZ2/gEcil5XOOklJm/Jw+7SKyswxNxVAnGV/U1pCA=;
 b=SDROqXk2Ev3SxLaHnwU0LYugFgUcWC+0VC+r33HUVE5iEKh9yMvz1uk6qezkJlnS6BWm
 7b36rdXW62839WZINrDjTkwjWAcylVKDLq/eEfNK6VTaEQGbYqR0+77LPoT/Un7vHiGmn
 ZK3kQjifRKuET04tJ+oPAiK0YhB0eSXvRB7gL1RfPynIiEUPfDNyvgRWFLEr7fNtH7xyO
 T/wPNEVhNC/yL9os3aWBod0YhNmvMAnqBdm83OIZJS8TjKwxUhaAKvefIZxnLpBfs7U8d
 xbU/7EZAPLfN70dE0X+k13YpoKVYM6oh9dqhOz6iHBOqK02EDSdsrPXY0OiJIWUj5YA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=E69FBBqf; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD44D60631
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:12:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AB48C1A1A13
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:12:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 809CF60383
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:12:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0AE211C7A43E; 
 Mon,  7 Sep 2026 10:12:39 +0200 (CEST)
Date: Mon, 7 Sep 2026 10:12:39 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <ap5xxEjbIUYUJMPa@windsurf>
References: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
 <ap5WKkAd5WBJhAsj@windsurf>
 <dd27b98c-64cc-41ec-8312-60286fdb6c71@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd27b98c-64cc-41ec-8312-60286fdb6c71@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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

Hello,

On Mon, Sep 07, 2026 at 08:54:33AM +0200, Maxime Chevallier wrote:

> Looking at the kernel history, the KHDR_DIR only existed between v6.4 and v6.7 :
> 
> Added in v6.4 :
> 
> 9fc96c7c19df ("selftests: error out if kernel header files are not yet built")
> 
> Reverted in v6.7 :
> 
> 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")
> 
> And it looks like even between that v6.4 and v6.7 window, KHDR_DIR is just used to
> populate KHDR_INCLUDES :
> 
> 
>   tools/testing/selftests/lib.mk
> 
>   [...]
> 
>   KHDR_INCLUDES := -isystem $(KHDR_DIR)

Ah good, so your change would potentially work across all kernel
versions?

> So I think this should work even on kernels older than v6.7, I haven't
> tried though ;(

Can we give it a quick try, just to make sure?

> I can add these details in the commit log in a resend if you want,

That would be awesome, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
