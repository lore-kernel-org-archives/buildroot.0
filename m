Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690B8CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32CAC60874;
	Tue, 13 Oct 2026 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B3YETGXWcNq; Tue, 13 Oct 2026 21:02:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB98960845
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925344;
	b=BHoQtax4mrfWvgXfny1UmsqDyz3xg/u8yBHScvkqc0QpWGjnn2O+c9+en8O5cdFBtvg0
	 ob9+EWZ39Fk1HCHVJFrX6ACFtOr7Ku06/vAqm2mOX40spSGiJtrwSHMy5NTDTzrEDxmja
	 2fOb2dbu3F0Lv+hV6TKjEuYr4ZcrTKltVw+y5njM0gn8dFIFTRRJm4w+GUMPC6ZECgM1R
	 4WOJ76w90RAWqELM1AV/CXe7U3f+G3vBfrD3lJzS6GfRFd6CnIsD3eu1+zcHmwXLXWn4B
	 UIjqEbzxPfG4+96cO78sWpGnGpuGkwWetQshsjGVLeIskvo8j/HFXDj7ivDnNMBkOmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rXuuDvlaQsjFbUIvK/SfKCcmjxHssHdq+gQEThiIgAs=;
	b=LZxtuT2oyW8D1K8LvJv0mSjYotlDg+qCHqlt8/rEyevDdwhoYgdqbhmowt4nPhAnP8Sf
	 UpXJDL6ofkJ8EmNztQC/OoZEghw+g3j+n4E+hL51LvdT3wX2TJwODeG0rkW7Iq+Elz3q3
	 GShBQKYs8LQEUuDlg1ivEtSvJywbwAkpOiNEkW7nw/D5hc0nHbptCuXwEyF6yPnTVHieu
	 Hj11udZA2y1YrLNChinjdrMUiwcRZt9eHo+RVOYUC0SIlqk0zJH6HD7Chy/Wr/EVolnEb
	 KNofAW7gs2QfrE/D5eBl9fSDjGCre8wMzHCi5010YIBjIerwjjfqwlh/bgK1r4JBPxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925344;
	bh=rXuuDvlaQsjFbUIvK/SfKCcmjxHssHdq+gQEThiIgAs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fGuhcEdJ9DRjdFATbi2F+7ZhpOWKEAYe93Z1inxZOJftjnXtLYt9Hag0BPz4TCzR4
	 fJfzUccKLgJi0nv9/jvjY0kE7SsRAa9c1cB99mg6uDFjwi0aWnxEWJoGPwtRUMEDwp
	 gIbJLvb1aZqbXk+VzlUscstnfJw7QJH98of2Xi1Xb6gbz5HImTUJEa50UeYtzznSyO
	 iT2KAnCz3NcnCRzQqZL+vsw0ZrVNvosKQjMtgtlyKJkQiEb03+73qqwwmiLUjxvfFz
	 kFGAQjjrldV6oUDuCW0tZw9zavlhx3ebOS0nRxZTs9tQK30porOy9knYKpoBqiFgRY
	 XiR1IIRjwOTgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB98960845;
	Tue, 13 Oct 2026 21:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90037235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 761E0400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL0PsFPJ8VUZ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D9D724008F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925342;
 b=pM3SC0O0NjHXHCdw40qzUsuItk3Ro1MxdtWrLmdIdTTzcVvLm/VtF/ODUFwKgY8nM54S
 KTd7oOI5he2ekDo4YCDxfKQRxsi0AA0mFH/mw/pz+YyvBhFHa11nT2Jys2knIzc14Lhbv
 Y3otuadAd5vc3Fxzv2uipxB93lmE0+1LxjBdMgO28o3Njlxpzc5sUT56Gtv6u60l3gL1v
 MDgUP08vMtCmBzWC0Ulf1yVhDo6cODSmQQDcyVDj30zSk9tMTGnoUJNbcyDPLWllhdv+Q
 m06L/FHLob8a70QtAo4TLJyOYQFynhtwP2OHPTK3E4K3CP+iBUzrYaIOTxAYQkjkIyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925342;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=RCr+hRvErbN4tfQfypzP7+EnugI1F0JOjeTSqsdHG1g=;
 b=tMuSM7eEx6QoiA0ETJh1G2Ar8X2Mom3bjWYl79yteH/qr6Ca6dVOxDYzM37tHZxtyV7N
 Z8/1/Ntoyrr35ZHPf8m+9u5RbYUnmev5Em+0suWEC0tt59PFXrMU2TQ1n82HWWs+WN/rv
 TUgp5q3MZq3Cga8Qitj+E7NpnseOAUig/Be8o2+DeMZkCCc7fwT8Z8qDw2ix2Yw0WcTxb
 ZaalsBh5sglxCkxOC09rvZxvtbmW8kSBLKTHmrUWyS1jE9Os/qfWpMeKncbogVzVF6GPg
 NUhEiSCSEJsHW8mXkDICsKlzQGfm+HOc0bycM+q2edjhmVKUc1L3CnADOEACHnKKO2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="vdUMu/o4"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9D724008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:02:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3EAFCC653F9;
 Tue, 13 Oct 2026 21:03:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FD2760362;
 Tue, 13 Oct 2026 21:02:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B28F411D7196A; 
 Tue, 13 Oct 2026 23:02:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 23:02:16 +0200
To: Bogdan Radulescu <bogdan@nimblex.net>
Cc: buildroot@buildroot.org
Message-ID: <as6cUED1OoRn2HyM@windsurf>
References: <20261011185735.3200892-1-bogdan@nimblex.net>
 <20261013095835.3845366-1-bogdan@nimblex.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013095835.3845366-1-bogdan@nimblex.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/nettest: needs SSE2 on i386
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

On Tue, Oct 13, 2026 at 12:58:35PM +0300, Bogdan Radulescu wrote:
> nettest depends, through rustls, quinn and rcgen, on the ring crate,
> which refuses to build for 32-bit x86 targets without SSE and SSE2:
> 
>   error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
>     --> .../VENDOR/ring/src/cpu/intel.rs:26:9
> 
> This affects i586 and i686-class CPUs that lack SSE2
> Make nettest depend on SSE2 support when building for i386.
> 
> Fixes: https://autobuild.buildroot.org/results/d04f770538412bee77851142ee007f2ff107e0ec
> Fixes: 36fa00354730 ("package/nettest: new package")
> Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>

Applied to master, thanks a lot!

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
