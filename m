Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C68FCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 11:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168C161492;
	Fri, 29 May 2026 11:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNcvsWVA3c8F; Fri, 29 May 2026 11:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 043616144C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780053036;
	bh=pVGnacRiYfjeFurE93uZlfYuIpR+xz2GcVHxtbpMiko=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cHQDA0ldNZ8ao+Ycrq4aem8KN6qJDVNlYkgrNkCAJSMgf14TVtJ4X4+TtdxA3E57T
	 gG8m/x9+kPDlORW1q+uqZFClJnk3J81dvdeu5y3tGfZL0cYVtx7/V69tH9xhMav00d
	 83f8CGEfqm+5XeiyhrtiXg8RW45wf0wIdA8Nbehcubdmn1Arc4adro4KLcCCCtz7E5
	 LTDo6gNGZMtnruXIGIg3W0dvahNH/hmKQCtLcWMkolgghWn1awxlmdWQpfnSfICZxW
	 vxiT5Xs8rr4qXbb4ZQ7UlwjcRIlBw2wS1KavikHNfaUynqtfPbfOey96kZ8gCB+Ajx
	 bt4xrz7OAqK9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043616144C;
	Fri, 29 May 2026 11:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4923288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 11:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4B8B61449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 11:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoOwnGIabdCC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 11:10:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D05936144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05936144C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D05936144C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 11:10:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EB0BAC62458;
 Fri, 29 May 2026 11:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45F91601FA;
 Fri, 29 May 2026 11:10:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A621310888CC8; 
 Fri, 29 May 2026 13:10:28 +0200 (CEST)
Date: Fri, 29 May 2026 13:10:27 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahlwv5oXH7vzu4LX@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-5-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-5-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780053029; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=lxFEKTUs5uljxhDrXCDWqzwZ667w2lxoPMnFyPt6CwA=;
 b=aH10bLiYolhEx7UAYWWj4cS5109BfBHf1N/WzHwLgcXIqjyd+jhKi76MJhVAkSdMIEtWMD
 wq8eL1tuUTun6iTkq/aFWUFPfHAem/jQnoXtsqCekupy/99uY+ZRI0ccP8qRl2UBC52Yg5
 lkz6FjA4mJvaVoAIfzBPxvvszFpktFLdINtUFrZF4sa5BOl2ZRbSVWMDqX7UImOuzTYMlV
 LjmsL5G4tzSAcao+/3po28Fa8kvhZko9eXmJR+xNqgOjBEc7iK0KDBF5J0/IvpVzIWxxVc
 SCaCkFxf0j9+aLnq+X64Q9zQIZoA+ZZBYQQikrQpnuLezLp0Nf8JP/3FQySseg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=aH10bLiY
Subject: Re: [Buildroot] [PATCH 04/11] package/gmp: disable C++ bindings on
 m68k ColdFire
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

On Fri, Apr 24, 2026 at 03:23:19PM +0200, Jean-Michel Hautbois wrote:
> On m68k ColdFire, libgcc.a exports __sync_* atomic built-in functions
> as hidden symbols. When GMP's C++ bindings are enabled, libgmpxx.so
> links against libstdc++ which references these hidden symbols, causing
> a linker error:
> 
>   hidden symbol '__sync_val_compare_and_swap_4' in libgcc.a is
>   referenced by DSO
> 
> Disable C++ bindings on m68k ColdFire. The C library (libgmp.so) is
> unaffected.

But isn't that a bug somewhere? Not sure if the bug is that libgcc.a
exports __sync built-ins as hidden symbols, or something else.

Also, why don't we see build failures on the autobuilders, for other
Coldfire processors? Is this affecting only your new Coldfire CPU, or
also other ones?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
