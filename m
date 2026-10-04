Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5C5CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E50606D4;
	Sun,  4 Oct 2026 16:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCngak5PpKX1; Sun,  4 Oct 2026 16:01:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 282A76060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129666;
	b=X+ZoN+wdjPX2aJs+ATOpoVFePV1isF+HDRmJOCx3KfgUFzXzZ0WiZr6hT1OmulbLkUpw
	 zLKvAC6/+TFxcJ/R3hAdm8rJgBoYbFCt4Y1S74u5YPwLVpRsYjlSzfVP5yCAVhlaOOZ2Z
	 CVxUcTTc26N6Oc8uEUQ6VLIuENz1EwBQsj+W+uDmVhZ/XvAHHAXFNF5iIm7xSCaXqkcvQ
	 nCy87yg7x58LwsE86xygRY81Y9IFmPsc8QYRiZI4hXR3w8EP4oBsLLSeCTGmsbei0NXjP
	 jm6FlepoOaJ2lTsyvho6ahA5P/sX/dfM27xc2FSqpGH3Lcy7fUafy5wl4OruzeyvKTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uCuWJJaxLvZ1Xeb22/Hej2iJOyIJSaNvoiaRQh4suPs=;
	b=AzarMIRyZyICbnpnt2BX73ERknRHl3XNOq28grVZahiPB+kU4yZ8Btns2+gClZCdMGDA
	 cnLxmK2BZbKyZ/2/KC88aO4R+XcDZiWaXgYXU3WKvsXd3GBP5OsH4L1dfFxOLTDlFg+o6
	 QhWiV2geIJFcpbSksfCnf2jUzmQx38qUeJIodovKfLam8oMjWT4YrIshJqVJmo1sjWW13
	 UHj4Mn+AeBPJp3Ijz2ReCPBEH28YtLUhAm2LweHYeb6PrZTDX/lu2t1p+R72+waGyWjXK
	 uSlGlVBxkatCHCCYdoSnBqmqp8XEtIM3MzRhRQ0DblFaVcpuIq8w8Tf3NjhL4BqLRbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129666;
	bh=uCuWJJaxLvZ1Xeb22/Hej2iJOyIJSaNvoiaRQh4suPs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AHgjpKwL53zpLmVZcXPFBGuo0/x4ZdmOkRxSMTLcILL6sriYsbDAz8u26nAW6cRoN
	 YswKIjzIp8ZwGX7lubQJfaH6hSiyiX++W27kgz/9e3LpYUEQL4NgA/OoA9SEgX3EUL
	 0dyWSti7sN2F6am+bSHb0P0QVz25hGOSHJxOil7IFyqsRbVVVGrYuXk9q0NGycG852
	 gzIm6EKygwrnS/B5m0KjgmtigMgPCngBdF6EzKIFix+HtlqwhoZxNsyc7fTzl/PA28
	 USqNh1K0FI+Wa9RYv+80GcQ42KTf2Er9X6zw6yWHbS1T+Mx/tIjMDG5OjpYyfzOTUG
	 BDtW5a0D5Q6Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282A76060D;
	Sun,  4 Oct 2026 16:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E76FB32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC66480D50
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMq2IdVAcqzT for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:01:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 02CDC80D1B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129664;
 b=RluGNWBzpbe+2j6wikc6VpSGh9HBeE3cugQ1bTnBxfgXXNu9awsA/Bd5ugMyZz+0tjVe
 DRLVxjsgbxqA0Xgq+/aou2vAg37wqmZ80ds53MpL0okbWhjdD17zYCMJQ+wvLmxfQO9ue
 CItg7GfiZ3GVxKe28XLYvJ/XIWdjGmOhdJnKQ9DnypPOW/XSWTGiE1ULOG92fWANQ/tzW
 87t+Vr08TSSq2UPjftkOoj9oA5rZA8lhAISbNBizZousfwb7n3T1Ip1osgoxpeKZtJfzH
 M76jHB51t/oPkjCCuAXm3RqpTh942/xeSa0agafKT3RayHNtToh6UR9z6jKI/PqI5lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129664;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=z1+3JsX5mGbcQhx/kZzDZTnsFiKeiruEXSwjnGyeBB0=;
 b=IxKwR5TyLA7fCROcivT/XWF2JLuTdns5+YWZAbCsdt8ZQqLT/KTBX25m8YaukaTuQXke
 NIoIEbJUoptZSzcqW0FYmQ9t20aZLK35+NlfR052IwC2AzU2OAhR6UiNH7Ha/RpNOVrFB
 zLymXGSmDAYAYWeCCsdiEAprIsi9PU3H8ssV99maIlu89r2U/1Hj67SCbAqIN0kxUyXYz
 uos/ni1/opEzDyymzmOoe+KUvwENhrG7HCYzKGA+BlmB09WljjiHBoA//i+P6xo6YMMWr
 jv6/58BaQbdrEFi4oN/vbzm0BMftfxC1SXhSOfaHYh0n5ecgH7ZyqUc1AGYreuyBNsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XXUmC1Vu; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02CDC80D1B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 66DE44E41163;
 Sun,  4 Oct 2026 16:01:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3BD68604FE;
 Sun,  4 Oct 2026 16:01:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A0DA103281F4; 
 Sun,  4 Oct 2026 18:01:01 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:00:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4NepnTW3IU5jy@windsurf>
References: <20261003210833.735937-6-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-6-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to
 version 2.59.1
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

On Sat, Oct 03, 2026 at 03:07:56PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
