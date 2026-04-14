Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEFFED7B9A
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 10:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CA042A05;
	Tue, 14 Apr 2026 10:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCrewrPFVVgr; Tue, 14 Apr 2026 10:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205AA429F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776162637;
	bh=34ZUxWtWxhv6fShBUCwB/1vI4WXdXhI8hWcLwwYkI5Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AvnblbyAvMSL1GlSkwfwRY7h5wC6HBoFZqwzTI6RX1rov1U8QOG6J5wKL3lYh1rwO
	 uVMRDNs5BqY7OzDbF+NtKIsVBwQeK3pTKN0o3ipbPaPPZXcxdyfdPvFRxiZ8paCg4D
	 SMwecVVy34g/rD/WXwioTOdlhzUkZb5f779JUhrmN58U1ba0H2Na7srouf1K4HF+x0
	 PzoiBnmQ34bxpFL0ufbBCvvArbnJ2EHu3ZeznB+UBKxXQXgP+aRLydjV9Lv28lVhQY
	 9OmJPpd21qMzEvWHpq/aLJJxpOdfoKAQ7HFQga96TM/zinTFtNwRakN2SDdF8mxBVi
	 JNnYxFpAOCnjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205AA429F8;
	Tue, 14 Apr 2026 10:30:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 338AC375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1971284A28
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pE3JhoseIZIK for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 10:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 366C28115E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 366C28115E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 366C28115E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:30:34 +0000 (UTC)
Received: from L13942.iliad.fr (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AF31F78050F;
 Tue, 14 Apr 2026 12:30:29 +0200 (CEST)
Date: Tue, 14 Apr 2026 12:30:28 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <ad4XRC3n62kbAvfb@L13942.iliad.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
 <20260413151148.42226-2-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413151148.42226-2-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776162632;
 bh=lrOtEhPR5fP3W/Lot1gS8/KsOwpTzESZkO+W0G76vg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezrDeYTA5F1CpZhoP0XtGkl0jRC/dxRrJVyTh5T5OnVqiLkCydrjFsaDcaSbcfFtw
 Xkh0NikV9i/pfS4YVVm+ROge4omBxAn475xm5YtGOP+d4IEfjDsk20tFxos2AV1G9n
 H8T7XgVlgD90oeYWOIgPbgJOBRwjqCRawMce/5kx7rcVULfq8hY9Plxz1qLEwrrX6A
 /BSr7wK3HMLohjQi0NjTRfddt557ATTb2KYpFteCCIecW2/aU33FZRgnyMeScaeg6S
 BhCoD2gNQ2RtCpFwxHZhEZA4iGR8Rtbjyj3ihDa7ZbnJkM2UiiiZ61HkZwE/ll64U7
 KiStwC5c7cKUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ezrDeYTA
Subject: Re: [Buildroot] [PATCH 1/3] package/libecoli: bump version to 0.11.3
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks Maxime,

Le 13/04/26 17:11, Maxime Leroy a =E9crit :
> =

> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Assuming the build checks with:
  https://gitlab.com/maxime-leroy/buildroot/-/jobs/13897336249

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
