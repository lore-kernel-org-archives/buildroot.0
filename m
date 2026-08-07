Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E93C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE19160A6E;
	Fri,  7 Aug 2026 11:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_HDEBzPJCwv; Fri,  7 Aug 2026 11:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3518B60A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103702;
	bh=JrD1jDB2h0iDiVbB0M+JaYRycGZ3MOYxRrTO1PJsgq0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=V7by9+UgWbowY2DzZArFQZzvZbP7PROdSNQeFoNH5zBmVLPk9dZYJY0U7eDo7BqQn
	 M++b/UR1GwawCVOSIVcwsCLFqud/bamRlcrXT8GBbKeXlhgmtSEyCb3JSbC20WoLW0
	 KChWJ1USWr5XDMbE2njghmah19xLWkNqhKgZF8z28e5eVUaWYUwCTCKKhBZmPpZhfr
	 /tEd8dmS7j553eIap5HZzVpUOWj6CjTXTZ4MCFrMbfWmfDmMk/dIgfKMRpv60uU3KL
	 no8cQwNTkQBpy/ns8KK7iVs0CxcHu+xrPWByA4AnQAY2miVdma88kfso/XZ03VfszY
	 KthCpK76EzTJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3518B60A3E;
	Fri,  7 Aug 2026 11:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86A3210E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7879140105
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amI8HQlM-_u8 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 635BE40092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 635BE40092
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 635BE40092
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:54:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso23125945e9.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103697; x=1786708497;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9n1YNnJMK/vYxCdwm71Fk1QMReFfwuJXW4BRXXksHJQ=;
 b=ApMCry+08ry7gLn9JQpXNRcBrRoEXQX1MHKti3gIK82/dgRCEm6LwUFlCnvBRy4ve7
 3YD9oaytLd/u/Cnz5CdkcQLcq0Tr5Q9+MJTpD5tr84cah4LXUeI/lUyOb/fNgdLpAu8G
 ztWdzUmLdHYMOMcfIr7WuAXCD2g/jkjv/d20RoNYw0B8sj4j/fDtgvBhLpLD/vm8QKi+
 JV502zJgLp4Uk9ub0gW70dltPB6dAD8NpGn4PGF6qL7zLAvWwe60zSxeb8Nb4EUJqNjX
 kkIckSPDWtsnz5hZWB+xFLu/DMh5a41387Fy73lmXvo2sS/B369Iu28PqQPymIiqIcz8
 6FuQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rquf4jn1FaI9e7u2Q/rqucS+8LvC7VcG0LPzIYnmTLjLK1EBJJWwiE/fW9D11rXPo9iCD7N0vM8eZY=@buildroot.org
X-Gm-Message-State: AOJu0Yxhv71wJLGbkUy5mRYoOXEmIVp9qhpLG7yURvnonlOK67YusrN3
 OYdm9OnT6/6fnEKIMz/DEBolDA37Md6xrdWakzWJtFj5w5xmey7gJa4zPg8KaFpmgZM=
X-Gm-Gg: AR+sD13e1yKYgjqc6C4Jkz4kmKx31Nup3bexQBGwGhOAdujzhyZNlhgVh8+CRuUkuHA
 G/YbMCFlo14N4A0JXhdzCW14mVN1GsOmhFLi1+aJ/enJau3So63OuMXTOt5AQtmxF2M/fa3JryW
 0iTIt86ddPYotSS7aWLD3eGVLLxQfIJkfnTpdbhx/IJTe7hfP5DtCpqYdpDPlWJFZhQIg8w60ms
 XKSh/Mz/Apc0myyw4TZWlNuYOWAWArjHL5LeJ9tXhL6Lsu4mgYv3nS6njWpOX1p9kKrdtsn9iY2
 MvZzmw5EjXvyS8ONOkKo9Exf222uBZW3HoUb0zVE54TKH0cU8Lk8JERu3eJDerzxxbszvG5jmhE
 zopTgHuugLmbNDHjsQ0DLX+u2hI8pO+51PAicmj6/L7+BRX8d3j5oNIyLWKmn5Zq2G0FgENSvg6
 6U/xGKRryrYwTtmBqvwnPYR/TomvBiolwB98CICzh3v2eo11t+eFB2pjTNJj7pVSbTKSlujjEC3
 FFLKoB6C8NrOq/dwnUe93Vy/T86Qp4IjWJeiiC9AbnPL4NF
X-Received: by 2002:a05:600c:1d23:b0:499:516b:83d5 with SMTP id
 5b1f17b1804b1-499516b83d9mr201984435e9.11.1786103697505; 
 Fri, 07 Aug 2026 04:54:57 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002145589sm5580056f8f.1.2026.08.07.04.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:54:57 -0700 (PDT)
Message-ID: <da6bcfc9-e07d-4867-9a03-8dd8f397f126@mind.be>
Date: Fri, 7 Aug 2026 13:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260621165336.2426158-1-romain.naour@smile.fr>
Content-Language: en-US
In-Reply-To: <20260621165336.2426158-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103697; x=1786708497; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9n1YNnJMK/vYxCdwm71Fk1QMReFfwuJXW4BRXXksHJQ=;
 b=DGOGLvZle1Xfh5GAPVrwn3y5CVulWjqwJ9kQG2xHBaRvQBulkTLiLCdutB5nrwNN1t
 Ldw/Xgt0RfYlH6j3G56OOW75hvfxRqH/Q/S/pabDIGWcaQCr6aIP07a0MlCmITAKGu59
 hhv4kzYmPeSi2RWXoJlylLU816aSuEAdNz+oON3Mo1g3EXzKWOhTfyI/ojb7f9C67GDq
 rZjHK3dQHSETOH/cvOI7vQ7pD+L+6i6WMTFYvQuTNWn3S78oziMkj2Xm3HHNNIw77Tuy
 XPgoaQbs54MfZvD8aNO4kwY6KiZngFEW5dfsURqRolOGYVSB7VtMadFHu49fyAx4JinR
 Aoew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DGOGLvZl
Subject: Re: [Buildroot] [PATCH] support/testing: TestUsbIp: wait for the
 keyboard be detected
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/06/26 18:53, Romain Naour via buildroot wrote:
> Running TestUsbIp may fail when checking if two QEMU USB Keyboards are
> reported by lsusb. On fast host, the second QEMU USB keyboard may not
> aleady detected when lsusb is executed. So wait a bit, to let the new
> keyboard be detected.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
