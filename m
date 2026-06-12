Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB795CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871D88088A;
	Fri, 12 Jun 2026 16:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YCMrWT1zUHq; Fri, 12 Jun 2026 16:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7570839BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282136;
	bh=VdTDK/30A5IVBYm6TYg2lI6bcYqP248FWSkCfpm6zLU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XtvklnZPl0sp/UpxrML5NhY92s3abRFR52CGtuTSYklDljRekt4Re2hm518geiz0g
	 IqQwkvQxOi+8OUVThwpjIEkWrOO1FTam3jMsevGQeam3KIpSC/IiW/9yZ4p8J6mKUT
	 2g+/jCiQzz41XcqidhzACvcu0VZVyOWc59OTtNrC0rNW/0zwpeCUAL8B0uwziueOp+
	 X4ov8tQRsPmZF+j/I0tKS1yvNhmiEv4cZNqrEJL6YgkzSdOb/dMrd58VSuAa9659ws
	 QSMxLXdq2hd8Dm8pTzHF8B8qdXjI2NU4m/52MzL+UNZpgKwN4Py2dMLM2PZKWU6lhT
	 d5o+0wH1bIWUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7570839BF;
	Fri, 12 Jun 2026 16:35:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06467F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC96E60F9C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVxL3l0P6_yl for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1779160F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1779160F93
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1779160F93
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:35:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 55DBC5FFA3;
 Fri, 12 Jun 2026 18:35:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:35:30 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:35:30 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260605151850.2908568-1-aperez@igalia.com>
References: <20260605151850.2908568-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <3dfa3425e131b54c3ddf2bbb0a08f93d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781282131;
 bh=V/Glg5vhx7NZXQANrcxoyoyCi9cQdyHW1XixNYAYjgE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nJcLNypvwsSLydSH8vDoksaIzsLQQXSKBs6B7W9SLHBnsOL+JtJJyFwTTYjxOiId7
 OGsEFa/6/aZTuB7jddyxtUmkQux815EyFftJunMFvaRa4KWysZIRgi7c3YPvX3A4AR
 9Unurmvwjazwh0DnQIC6hsUG9gioSGmiJXTDkO+aRUCxD+IvRX7pkzKOTD/u0HdV6F
 LzkHpwP2Tw3QplJsDuY2fzwONdyAB8FW+Wz5JrBMilotNvYWX8VS1JUl3tEw7ybeVr
 MMksUYOgk49v8OQrNVIBl0bxFmEf6RdsrGVxcZW3kdmarx++gceyoi858/dy6UwsoZ
 gcH82jyD+6LjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nJcLNypv
Subject: Re: [Buildroot] [PATCH] package/libavif: bump to version 1.4.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/06/2026 17:18, Adrian Perez de Castro wrote:
> The most interesting changes are fixes for a memory leak, and for a
> couple of crashes. Otherwise, it is an incremental update. Release
> notes:
> 
>   https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.2
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
