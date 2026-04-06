Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C4BF46C4E
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD1260AD9;
	Mon,  6 Apr 2026 16:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kH_9bjvwgYfW; Mon,  6 Apr 2026 16:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 770A760AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775493247;
	bh=DC5bGYg+gcUmV4oXmEkB/tBXifR1KABPJZ8zPwxGd5w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sHqw0IIxmQcMqehzkmQZ1zArwA1pYyAV9dGKCHAk5BS2tyxt9EnSNFlXA7SDNvkkl
	 jHSTij4KIAfWQYhXEjFBXuBFeI0UUrOK6qmswUNCFt2qMsh5OvBp+9NLau9PbqK5rL
	 nWk3tTfNwX8FYqoEnpCIItBzWRARJS/hvIgH/9NiQxSOnSZAf32bPSu0n7j4rDsiZm
	 Qxv82vlMljNI7AjGVFHm2L4D6JxljNGBGkwcHO8Oa0FEpTi7cl0+p9EOY8JgZv96Q9
	 X1fQlumqR593i8NiGynmKdFWO0h0tnIIZFoMIkaM+KOTKB5oIRmWuTStJGYTqs6kej
	 +MsOK+bNfsFKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770A760AAD;
	Mon,  6 Apr 2026 16:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F2652EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64F73409BD
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7STbvgih0If for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFE7D409B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE7D409B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFE7D409B6
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:34:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 96E6113F8E1;
 Mon,  6 Apr 2026 18:34:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 18:34:00 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 18:34:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Wade Berrier <wberrier@gmail.com>
In-Reply-To: <20260403181413.3893668-1-bernd@kuhls.net>
References: <20260403181413.3893668-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <96f82cf58e1b2a131d1d401121562e29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775493243;
 bh=ZeEl8kdk3m1vJUloo1muQOE/6SRavSGLK3ITjy2hLOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p7TfTfmLvlqGrb53OezjHOmqO9TlBx2IaefxgDP7z/vQE5Zfs5yKNACZc6eF2ZGpH
 m6wH9soMk83kI0ZrGDXVBQ1KkiDkQ9wTHP58zI1dZaZpZ5JLgMtZfxzqsHvyZIgRsj
 mIc9HRksX9ixxWMI3EfYADpjG/ASbdyWKUG7i7t4Yjoq/15bOnt5EV3iloq4Oyv+44
 ixYn3fu3zCWfVNF88qqry6oCWOFzW3hnnFnszipO+45qETYwLTJ0gvWxXpHE/5+O+0
 ijKDn1G0iT4j88aQNVbsp5uJMvh7M9Z/NbJ+ZWgv/cz+mq6pQROlbsPKTpTh+8VFKE
 CM+jHA0Z+uZ6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p7TfTfmL
Subject: Re: [Buildroot] [PATCH 1/1] package/ngrep: bump version to 1.49.0
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

On 03/04/2026 20:14, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
