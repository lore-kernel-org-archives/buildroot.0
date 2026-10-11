Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D28CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C409540411;
	Sun, 11 Oct 2026 19:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9plLT8SwNKr; Sun, 11 Oct 2026 19:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F0D48405F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791745942;
	b=fpQUc5e5Pl/kKrvzQf4jH8UnxTziBaNDoZ0ypDjZImDUmn0PnMAL2AiSTaFeHB3gWnmP
	 Q+qXKIDgwDtfnSiaKrJQ9EVqFbfdi7y1sdTl/AFds50k39o/xzvBBOoxlXPw13qGdBSVE
	 91B1trVh0W/RHaQLn7ZFscbbZluhm4BN0u9ChWmiJbJGSsGkkPpO3WUGiUou3OHbC6pJ+
	 vCLgbxtRLsG43XitJ6zmUe+seIUM9Guc/jc6iMzaAl1gtTtD5myn93ij+zm0flNLQqnXF
	 8ZZKMdIQbE3QX0DZ0o78G+TSrHgwBi5f3uQumwmBBj9KgSPY5gwFJhgPk5gz82IZvHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791745942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=qVQSB/wxyskUBaHJ4mRLZA+WpMbGKlPEN3TwdKDygMA=;
	b=I0g6bHarTVont595U223LhkXKmMLoRJ9zWf/lrZM37UZx6ePq7y/5NPZJxpb3qmT6SCZ
	 nn/eiRwLo38ZvzJ+oJSAauBpbDtheycjUY7EQU1JyWrIDT0Aun0OFI7CjzI3fFZNNWD9q
	 DIVDwiwLGvCRL2oAMSlksbUBvf238G1Xhbk2Bf1H8OH/lYJd/DZXXeOUGak7QpEI2RcJ0
	 NoxI8qDda0N1y/SNvVXj4NFtz3yddm8+H3R42iasRn2Wue7KNXAqIl1yro0nW9wjF81tz
	 6PNhQgHOT/PKGihIjBUpukG53PtVQc5pZR7i4djQ7ppIHVlmV8K+27MYut4xGEw7X+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791745942;
	bh=qVQSB/wxyskUBaHJ4mRLZA+WpMbGKlPEN3TwdKDygMA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=sZurg4mP7+GMTkFhRrDYgsTbmIH4vlryUPVtUTkErsLkut0kZpLdExn8j2MQQWgTF
	 ANMOyl5yocIIt6iHCRvelSrUtFy/PqzVBaThzwK3QFBGYxYa65Y00UNDad3avFCIQF
	 3I6er9tMNYV9J31s7FaR4ngHSnp8gxy+3wkcN+fS/5y7gezGxXIxt7iW1j9kC+Lvpg
	 ZMtNzTaW6HsV5qWPxhve9WBm2e3xyU7sZnYXrAwQO4HKsmOjkk7LkhExL+WQydzhsv
	 sS96+Gv/qKGVNPhSIB3sqnuTuhwU8LHngQMqEDrwb0xY95dOVsVx/nOyXPsADZKWv8
	 Xg7fDPI1q/hzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D48405F0;
	Sun, 11 Oct 2026 19:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E3B675
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FAD28083A
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZJV8XqIhwhq for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:12:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 95ECE807C5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791745939;
 b=lcFvseDdkIu5I8BpubXUL4N1ow51SYftjPuV57qEM/66d25AkBWNDfTc/bZC9rsao/fa
 wi795COQOceKL0EQlbDAW8QeOSlktZfDC6RFqMVhJkQKnFDdUD15NwOKcCx9GChhscqaD
 bMgGiMNuekQhvfgxSfEfX2OlzlYHzk3SKSSbucmkZiBggk52SM7NEme4pVTnFVYREOAvy
 IOD+ps2e3OCAGA8x3o/03hd+qawggTzV1v75ngcNoKKL8aMZi7BfI07scUCfA4c252SGa
 R6R3pkoOjwlnyytytfL+B/yzhMG85W2t3PjCmLVCYBF+1ddvrdCH7NaWU8hnCXhdq2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791745939;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=/2MAYGsC5Fyi5Az5PWRei1ueNXcJswHo6zLEVp6ITUQ=;
 b=LawooEHuE6RwAayoGFdpPUcXG8iKu3Wt1EOnGSV4M+iCAN/apnskzA6XhZyIuqTEbqgL
 0V3D0NhyzRd82G+g1fK98csUOBXZ+99lPkFjqcDsFeYcdQGcjwgi2BgPf3F3Zhz3sidgi
 kJsuII5JMMC3TPi+Mm5yycFHVDVcfHgUX7y1oziU7Xcu1zXYtlX0eLgYtis6PPTYcEbRn
 pjqOqlJfNssTI3946ptxw+16LTxC8tFfpmgowjdlHIr9krRI8PGJG02dTcBiKgzCVdlUC
 wdXkaHx0rbc2PIiC2Z1HzrDq1QS+T8UV286VX/GDaH6NiId5uXW+ClZvU9XyMzmdHIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BIvUOqVC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BIvUOqVC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95ECE807C5
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:12:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so7895295e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791745936; x=1792350736; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/2MAYGsC5Fyi5Az5PWRei1ueNXcJswHo6zLEVp6ITUQ=;
 b=BIvUOqVCocWDRHM0cKd8XrMLtTNpE96+u0I866m66uFrODRUZ6BqNt89761N3wlwup
 MaVLGGpO04otDrsrjj7NbaRLDZJyKYZXHpB+mLv0AgMaq1G0p1wmTjPO544HlPuYBsIh
 5avxtBaPwQIRib/S/K9BCF7ekwCr5888qWrijLn9JNHeQMYzY4Zt3xemJEYqkWuvPUYW
 XlbD9zVK6WpMgp7C47TjOP8tirrjKIFYiLGUTU3FEi0YISStn64rxh0/syt+9rPyTHoR
 iNkuf+KlYq+2dr/Ny6JPVzjoLIecb5EvBhudcCVmKj7EAzThrdz53mE9bqyYZF0iDSWM
 MXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791745936; x=1792350736;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/2MAYGsC5Fyi5Az5PWRei1ueNXcJswHo6zLEVp6ITUQ=;
 b=kekKT9kQDKpd6HJql71eyKVq4jth0SrvK+rPw0vpdxZrH98FEJ6oZ34j4Roi8/rKM4
 hnwtAUCo/QOD2Oj66ibjOfwh91y9Kx5Ci+PL9GPI6eRgPSWxFZVuvipWyG50c13FfapC
 p+GfqN1+zF0hORNHOs//qPLdUnfIUJEy8dVDSXP/l0BIZLwKkxYcAmhJM/UcX8ZmCXsY
 Lz9xwhZtAsCCDBbmY/jbDE6bGWTc5WnD9OZ3CiCweSP1PaM02nAbvSKBxMfULS2Urel4
 rP3l4RNopq0Z/fiyuzNz7M5lwmHgo/hXpnWDOI7UFaVhnJ2YsNZD6yVykH1xz8Gdn0og
 SsBg==
X-Gm-Message-State: AFq9FYIYhQaUc6gYF8WExI4SUixOkppegDkBBoh80kbbBESHZU4l0R+/
 YUVaBb5dPztg7oF0P7GsJd2VVxcvr8116UWdAOkQqxLGGZilFBZqUOJ6
X-Gm-Gg: AYBFou1BxS45ti0c9KTyU1DAqaktIaQMjUcTOZh05sdihyYyjIs6phwwdIGqHTW5wxB
 LYGXyZQHkg9DcSkDLajJ3K6JNxdGTduGoy3KSyuPADHEr5S6dbmMXFs1xuxcvVerz7FF1usBQCT
 ct08fVCITUh65l7RMOO3t4C3ZxnEgYI8HkccH3KaJ6RU8mROBrdSjylV52lA5IvOPhRaxuX9n4s
 NNpV+4Ibu/rPVDbWUF30o8zaG8AGadztjIxYOdD60S0icYVg6565mfJVAv7L2God/vZ883vcchU
 g+D+/mFgdNBh4kwFUAaOzat58A4bixTLHAZqYov9lumZlQ0ZvmlsmvsMuTcdrEZtebU7dJD0t+Z
 zxQV1aC3dZm/F0tGPf02pX1gCwDbeGfSwUfMQAhcBL0/kuMCAhbm+H+OXVOO+xTyUxKIJ73guJ9
 3Lv1g83RK9wLKShRcJ6/lEVvu28ZhJ85Zj6/MPnwnuvog7/wEPwzFKWZ7NjN8QH0h5S75BDKAsv
 3YJ1Z8IbFhX+n7p0m+K4IFW21ZXxf0tXbU=
X-Received: by 2002:a05:600c:19cf:b0:4a0:1c43:3c04 with SMTP id
 5b1f17b1804b1-4a18e4a988dmr130308235e9.13.1791745935949; 
 Sun, 11 Oct 2026 12:12:15 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea1021sm210903365e9.10.2026.10.11.12.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 12:12:15 -0700 (PDT)
Date: Sun, 11 Oct 2026 21:12:10 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261011191210.GA129909@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 0/7] Update kconfig inrastructure to Linux
 7.2.9
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

thanks for this work.

I'm having a trouble to apply your patchset. Could you please rebase on current
next or master branch and push your fork somewhere?

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
