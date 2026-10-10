Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB698CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A6A6066F;
	Sat, 10 Oct 2026 07:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Kua3o7kNUMG; Sat, 10 Oct 2026 07:22:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6211960658
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616936;
	b=JqO8P8eBzT2XmnlogkfBoXTzQA78RaHy3k7DIzQxtW74iUnjba+IjJcYmo68rr8EKMF+
	 PIlNaqJNvEyCB/meu8POHErQf7Jy96jtsnTWraPMk0p1+0nKaKHZX06q70ylglV2kBQkH
	 dOhj0Doc//MHhDZ/Vxbw3dsb8XKOUde9kXWTgGnj0ywlbS05nGowNFXok/qB7XUAroVHX
	 efVWH2Dg4OA4a7RohY+EWax6Y1mEtX4UYxStZWxveI6sRwP/as/pSHehaZO3eWzy7xnA2
	 KV3Q7AdAWX5avE4FOAtNAudSmbB02UICtfkVrPkhMTK5kcqRH0ukFrvZKmlVN6qYfgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X7lAarVRZMXLulIfE4vZxTxn0bJKvoJnS4MlfQ1V8hY=;
	b=BXUSaJ93k28hbuxnJe9kY0C4ehtuNEFrV15ArCHjnIXeDb9NkWuJSAItM2tnMjVgOdKr
	 bAXXv31IlTnKrExaQ85vD5pmVIyPE21V2i0HRsqisAGTa2rPiPWnxZzg50AQ8SSiAnTRr
	 2w4JjDZEV2MKaNnhN0JcZBE6rolY7CQhJQixC2VWQ8Q1UCj9UNMr41xmnYQs/w4cbQ1vX
	 YceIKTKU7ylY4oziSFiqm4nWJD+9HsUn+S4ihPvUsjsn9WGSQBkoksIDPDeh83xUoSg/t
	 Kg8XDU3+Xj4zWj/8O5qaFdMvwwChO/+tX7LtYRuK7fSm9YKRFoRem2RRdhbQSEue7Ew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616936;
	bh=X7lAarVRZMXLulIfE4vZxTxn0bJKvoJnS4MlfQ1V8hY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZQe+MYn4mBHZ86dQcX8iPfA+S4trveHqGIoFNF5lthXBFIwke8poTL7NFtJmbISjL
	 FArkDAXyMqqZkTkGRGVw6j3r5OZ5QzpkIdBPZKuye2wgzOyhBFEzgzzVR+G/NWVTbC
	 oPvXsXJwfGhL/tEBpJvE2NG5R4aESOtjKM5Gjd4ZQszfvqL7JxU3giR0DhBSftSbph
	 VKGLct5RT3s0X+T1Hj29F6INRGh39JsStw+/2lqkUt3Tapp15gztgzCwskAhVv25+8
	 tj0W0gp3TnOyoi5NAoANbl/v0Q8hYuK7HvIdeHM4w/1kuyewkzgnNlZUumPvl+7xP+
	 NQ6rFMd0skyrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6211960658;
	Sat, 10 Oct 2026 07:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00C1B380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF0B24006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyXXF_unGx7S for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:22:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 510AC40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616930;
 b=Rp15WOljS8nOcqCkV4CXVJfIroYbYak41jWMepiehDTalmXAcecNbKMVg0Zk2z536rxv
 5UEhA6kiXq2u9XJY8PNH1ccvFYh14KKmaQXNDYQvoKclwFwTsyEC92Wv0qen3+yO7gw+X
 Vpa1w58dP+mVkWfH52VMRHOiN1BNCW67V+gEwQ9vWddHWDw88z+9Sr3c/MeT7f3ubnRTG
 cISbiTx+QWhGSsA3lya1ylGAF+M6knJd3isNEn3//6zseNq3tTW5plLmrTWXrXC/kC5+0
 qS6vMAEbu/xFYNVl26S7a1zFr9eQnPxw/if5cYt6RnYs1m50dGsAjnLjIwyURwgetBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616930;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=d0Br6oEe6IrWNt/pA7NLCs4aJue+mKoalPS004sxGZg=;
 b=cYMhlOGKuyHUCEX6S2TcW4lC60pmy/TzfAeSbh7K6cTWXxtyOPCBwPI88V5/4UyC5gPn
 8M3Omf6bbnSZBv45Zn2X5IKBwE8z6q/3S0NxdddrM5oMSvZlv2ysN/E6KBbBOQoBgD2dc
 bWt292B98Uf8I4A6fksZyVzRN85T79MkMQZk3CdFdtgT4dTUuEe6SJ8pX/5Jm1bJ8bCTg
 BCX55j7hdxwq7kVziIOFD0oJeHAEg87XI77SRfgiWZFqy1fNti/IuPoRiF9LeDyOuX7QO
 B0CNAp0sIDa1SWN/zNkT7HAedHaZKQ3uh79Zf2z4bcHZBq6omDtvSl2qYhR8TZXyfDg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mOGamXq2; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 510AC40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:22:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8C1584E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:22:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AFFB46075C;
 Sat, 10 Oct 2026 07:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41A1111D70CA9; 
 Sat, 10 Oct 2026 09:22:05 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:22:05 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <asnnmAeLyFhJGnDp@windsurf>
References: <20260926130437.398038-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260926130437.398038-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/linux-firmware: add rtl8761cu
 firmware
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

On Sat, Sep 26, 2026 at 03:04:37PM +0200, Peter Seiderer via buildroot wrote:
> - add rtl8761cu firmware deploy to BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
>   option (e.g. for Asus USB-BT540)
> 
> - while at it add missing rtl8761b and rtl8761bu entries at the option
>   help text
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

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
