Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD10EC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883B380F82;
	Sun, 20 Sep 2026 11:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK4vM8b45AgH; Sun, 20 Sep 2026 11:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AF2B680F7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789904520;
	b=eNtKpbYv2N1+LK11UnvCqSHZPBLvbBJCisITtEVSzgJFm7W1TQ7yJIDcKIuQ/EcxQW1d
	 PyYsKLg6+HsUa2MUn3NKpy/v+8dhLvIJMikgr/Q6iYdfZa0cDC/PlnnPLuL0AVl/K/F3y
	 U6po5LzSxBF3yup7aPMJRnwdtEwUttiBpYPkkD+rVtYddrg2RvBmFshsaGhZlymJj+HU/
	 rO1lS6Twa0l53AYrpKxzh1Nw60Z79fDQzbaHKQPDic2arZeFM2a4E1AILtZ1WWEph660T
	 YyuCs6tVmXpDd7/9829eoujP7D8ixs617adzjCmhDZTUHAx0GDNduuSN2fRVz+IdAjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789904520;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ynmgeyRwrKXwz254hqfN33+Dtt7tIedHpTq70wNCVl8=;
	b=LFELRbBdhr/pEA+xk5hhNBobEKooxMfN4enYDf4KukHTUHQ3IkD8t1yUviEGDUlEt/59
	 RMQVzoVM5STACai+/cRHnbIp/Bjph38cGKqGOezQf7hFSq6MParltkGRxEJlZ1RW+nKCj
	 0R+eZWnKdARTbLRlv+TSoeIYzmGG90YV6RFvRvstcWNSJddvs49v+PifzO3hsYcJYbnL6
	 U0oruXH21ABxmo85zEqKrxf2JcnH8bYuL74+Nh5Fb1mZu26Kf8EUA+erDKoWSoYU8FLCI
	 5K4OcjlhJBHjo3Wj9uTDtOOcXJI25GyLQMaaWT/Lh25zV7kZ5EHww3MJ+1NXg9nHOHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789904520;
	bh=ynmgeyRwrKXwz254hqfN33+Dtt7tIedHpTq70wNCVl8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HIUP8LX1GeMwRM08lErPG4DB2rDY2oBFmfPQE17IB1viTxMqgW/475Bxrh2HfM+PY
	 wEHfG/z42KdlHh04faGMwlk79MOv41uH7qFy+xK/gmwKlm51yfVk91RfRS9Jnwd0W7
	 ZmZEQ7PT47MEdmibV6ow6YTsPniZqP1RY4Pi5NyJfCCOGgboC5KLPQyJDo8ExdR5Bt
	 WvpDVrviyRnYq1GT4GQ+FwB7yWk8+mdg9KnXY1cSLQyFzUq+algN9GXhXZFXbGdkKO
	 Xs/lzd5YXsKAehJvHtxmdjLv4GfMQqWNTJpqoRzHDzK4+Kv8lLoYXAX/dv0vn0GRzQ
	 FNDX4Fs7Od4Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2B680F7D;
	Sun, 20 Sep 2026 11:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0046F392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9BEB80F7D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH0DqSOOKQio for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:41:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA6B580F7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789904519;
 b=MmltNWkemFfR5LtBG4qMMqiHlCyDTAKHAYuMZXFqiSXnJ2WHRdQHc2rxL72lvYfC8Q32
 5GGT+Rz4xXZNKtIaGbHEqXPq6EyUG0KMfkAmPuzKIlPFKbPiLdnXgJ0D1ifCE/AlNeS6A
 5zCwG0nCrppERdcol9k1vgp2EtuM2HcEvfbw7NvEMbr14UZvt+S1IDzTVgV4JW+dHdyJT
 d9gqBoSWx0O83kAo1pTtZvcsRZn9Y2t4rraDcpruBliJtCXQh0qj2t8qq2zp6fKw3B4sI
 U2PDbT+OLm4zPYhNiEPx+A4VHxXCZk94owwCCLOhIx9zbQfgKbAQTQ3bkMd8Fcvtgkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789904519;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Z+t9cW6CK1YCcPZMNOmreLUSiZ3PRf1S21o55jXnVSo=;
 b=YBupeEmP4kK3ZaGYLYzG/UtX003Xx/0UrodyChZSssIV+/JX3UadnwzBILB42mInvdUT
 1RJvimlbuhFeqQnfVbWNMAijK7AauuhUyPUZOs7GWt9rJHJ6q6yz/DMKwp1ri0Gl8GfaU
 +98HqIPFtnRbkiYvhuBsWupg6sBjCo5Ww4PQ6kBz8Qzk+B1b8U4qmz0cMs1FkVHep+KUp
 JkRAIjmnX10FseEZjC4oUlgKMuaYZRuFDV+ij+ISL8+UaqiQymS1Ro4kH1jwMTRYqP+Se
 KsPPsSfXHa7WWX0UduAFgWUydCTDl8e3bvwomhvJRoONc1G7RWMMnLtwBzMtbGYqN0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rAg7n6kP; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA6B580F7B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:41:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C070C1A0969;
 Sun, 20 Sep 2026 11:41:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 810AD604C9;
 Sun, 20 Sep 2026 11:41:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CFBA10328D37; 
 Sun, 20 Sep 2026 13:41:55 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:41:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aq_GSgAvnToyCcvQ@windsurf>
References: <20260920060133.4184-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920060133.4184-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libdeflate: bump version to
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

On Sun, Sep 20, 2026 at 08:01:33AM +0200, Bernd Kuhls wrote:
> https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Depends on gcc >= 4.8 because "libdeflate now requires a C11 compiler":
> https://github.com/ebiggers/libdeflate/commit/a7cbb2258188cd459e436b0c0a1e4b892e2b1ac7

C11...

> diff --git a/package/libdeflate/Config.in b/package/libdeflate/Config.in
> index d2fb0d6c55..b8f452e601 100644
> --- a/package/libdeflate/Config.in
> +++ b/package/libdeflate/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_LIBDEFLATE
>  	bool "libdeflate"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

or C++11 ?

According to https://gcc.gnu.org/wiki/C11Status, C11 support was added
in gcc 4.7. Not sure that it matters that much though, these are
really ancient compilers, so I'd be fine with the 4.8 dependency.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
