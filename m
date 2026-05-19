Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11098CD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 19:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2237480DF6;
	Tue, 19 May 2026 19:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dw0Wk_IoriAz; Tue, 19 May 2026 19:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA3AF80DDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779218018;
	bh=TRBOP21eXqkNNde4DrWE5Wrzt7O7MdpohoUG/pE9hbo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ajGg5owGgZcA5K9ywj6jcOp6/52suOSQPFTMYt0PR977hJt3blXTF9Y08Cg+Fe99J
	 Z4lDplUOzZI/zEvk1V74K300KsDaO2MngdYYG0lCNLuss1+2Pu7zK+4y44AxhIL4+9
	 6WYrFh+qq7+CDT+q8lcY8yBHHZFv19uPwNk+t7/DvK2ppZfWYW/7KSMWaNOzT8vqN3
	 VPEA3sjTNUvlohaDj7g1hPgGesK58L3G5av7Xedj5tUxgOyjESKKjsbpF2tNQDvzSS
	 2fO+b2faPcuMRv5pFwKHw1swegbLh3p73lxkO2nfIwkNok/Y6jr+LnhW8m7DL7bylo
	 ZcSW6/Nixlr/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3AF80DDA;
	Tue, 19 May 2026 19:13:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88FB4282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A4EE40514
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IV33V2Rmrble for <buildroot@buildroot.org>;
 Tue, 19 May 2026 19:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1E0F404D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E0F404D3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1E0F404D3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 67B722003C3;
 Tue, 19 May 2026 21:13:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 May 2026 21:13:32 +0200
MIME-Version: 1.0
Date: Tue, 19 May 2026 21:13:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260518180500.101442-1-bernd@kuhls.net>
References: <20260518180500.101442-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <c8c96dc2a35e6febb505f671e695ae3b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779218013;
 bh=Oysd8r4R7y5wbZj+AcNTR5hZU6cM0e4tj5qHhZtrj98=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hfJEywe8xDiAkFespLcCwiqhmH/LJaRCoP8XcMy0aBQ1Xq4oYyngb2cJbaS8cpWAn
 oZtBeF1EBKgAlBSdpb/EKvr2C2xsLqPU6RxHQgCi+r75GSCeHm0pAxcQifWEZOsvCk
 mr8n7sNQaugnyeHsj9q/bcRwD9jrwrC3NrdjepTwMc6GABkyjVCSRCc0baEpU7ugck
 q//7iVGn0gQOabj0zLcIa5GwWji6LsRT0IX0R4tpo2HYoMZww43el9Dl2+5CAcx+d5
 xQzBlqsmre6DHySvL5Z9Fr8BQ4zYYRWulW1m1Si5V1wbD396RWLQfCOz3vzceRrsmQ
 fV1KXkhP9LOrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hfJEywe8
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libinput: bump version to
 1.31.2
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

On 18/05/2026 20:05, Bernd Kuhls wrote:
> https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
