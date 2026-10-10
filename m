Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E539CCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B388A6064A;
	Sat, 10 Oct 2026 07:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Qezq5YriE-G; Sat, 10 Oct 2026 07:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAAAC60663
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616158;
	b=i9SZa+86RTTE7+Y3pS3tZY4zTmIjAJ5PiWZ+x7PxRYGOeQ7OFiOsWrMEPp5hXFy3RuVg
	 afLLf5TeGgGqYKbJjiwII0SpDgaEsk9n84jsHrUy/USye4CdbBImAL91fBeKUN9AnSHe8
	 kzPjIU22UvCjIxSrjSmR/ykP8j90PeDViy/bY0PQgP4qZfdnQe1+AG/D5UN4DanArpHEG
	 iOvKt/LM7wjjcAt6y9K1sInHLar6peTb/DFx9wW6Z1TRIxafwdCyF3wiPdI1TS2rJJ2bx
	 BuFL6VH2dBrdOIqMl61iNGsITenBwyxFJdoHKLvHJAopR707T9VMRaljVfrR/mN92uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qN2rXUglVCbx11Vu/zJxiW8dnNi+cAw3oYVxaUg1K4I=;
	b=VlDmcU8Bc/7EXPC0YTydCLSnTHFbze7yKdfOlPvt+u71sLAi/yenw/FW+kNcfMkttXAu
	 9/VnGjht3r0EHFhyrsrU10B69/KYsOSxblaTyGsuuLAZW5Ou8PZd+aa/hNSrf9++SCThu
	 hmA+wwUeI9SAWmGnh2m9raqr3Y2THtvJJQ/eRqNRizFWoyErIUcCOiAfCyYSWuaA2wSjB
	 jBGnqSu2S2RzEDP3jBjumlxjYVJzCuIsJ6HlaKyI09iaqprsmYANDU31lxK5dGoiBQLWU
	 1piRMKGVQnPTRd/BvLe+TpaR9SChWtNLWn1baIp1gJXZrw7XYKMGNzKLlU7w2koH+0w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616158;
	bh=qN2rXUglVCbx11Vu/zJxiW8dnNi+cAw3oYVxaUg1K4I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c9Z+HYmzUKQB47Pl5ToyENSS4DAdUDkdi8hk6Dp3Rrs5H23opdsEt83KE+OSq/UMs
	 MLZO5twZfmINAViZUuPZ2vm5+FG9GzNEDu9eC87YclNLgMBP2Y6LdU5sVeyTeKqwSk
	 E5evN9a9LdtSVvKMjuEHU9ds3v+Iy8Im6SEEdWLE94yP9koWgagNlSh5tyL9a1PVr4
	 VPItInGMQTRKNwTCh8lM5yX0fa/mmF4h6zv+B6qQ3kKo810CN3aL0S0zWGbGUbAx/d
	 uqtpIqKQhR2p06LQbsnxmc9PfAj6HUVxy7dxTEN1x2YU2RmsAyx6lpt0/SD3F/Fe/W
	 P28IV9apFTFCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAAAC60663;
	Sat, 10 Oct 2026 07:09:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 111D1111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EB636064C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFiNrkbYC9KD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:09:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BBD36064A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616155;
 b=mBSl6XUe+ochuaIXbXT+izDcT9TScj0wLF+pUyu/gCov6VeBbAOdv8ckR0vbX0eiGC/m
 l0QvxlvlXFI4TIjwN3r0aUn+9qAbC0gWkLc4sv917OevAA+eDBFdk8UMRCxzU2A9D0iOL
 KGjtEeZElBSYyQQlzxgifzH1xjl4eNYfHGM1W91VErVz4A/8J70b6SPniIyF2weEyWr3j
 DJO039fqjM6zj7S6g0FUUa10OBVH8I9Ugagp9eDQXLXWY9xo3bnDGrLm/6M3wcj0A9v4U
 JJ+mlpmCt3mRAIAsZkyU0HVe3HmwSUIYON1lm8kVOHolZoAjinz+nqkl9bB1ynvOfPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616155;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Q7Yo6zn+LMo3HI4yVLEeNo3cm9i40waxQGO+vJerdRo=;
 b=fuUM+wQVgIcIiRscdNIJRep8IJK8LJIHkW+bKaSQrmDQ+oGLYrTH5W1OL3JoxQ85aTDQ
 0U7raMRQOl4HEa3L5H+zLRQCGyaIzo8wz3IAgesY0Da8qD3+Du1gIvDtsEd1G8Rj5Da6h
 W7nGKND+6SOf4C3EGeCqY8ZIHBZtHOEzBRuXZF4ltv14i0F80sLMAKQr4SM2bEuDcvlWo
 ekaqu0b6GJK4CPcZM+Vm42Uj90PQVtjzTX2hwAuUWj9mVFYBY6qJ+HW4/VDRjRpHO/vTP
 ERC56biQwzDOygHv0lnNsT9ituQCyw7bE+XpXqtXxIAxYTobqDOACTAz9MnQ60YXsPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=F63DS1bE; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BBD36064A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:09:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C33841A116E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:09:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 838896075C;
 Sat, 10 Oct 2026 07:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E21DE11D70BC3; 
 Sat, 10 Oct 2026 09:09:09 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:09:09 +0200
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asnkjc72-g9oFSBQ@windsurf>
References: <20261007200115.516421-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007200115.516421-1-mr.zoltan.gyarmati@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/quazip: bump to 1.7.2
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

On Wed, Oct 07, 2026 at 10:01:14PM +0200, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Series applied to master, thanks!

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
