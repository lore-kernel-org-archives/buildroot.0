Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA6C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9704960776;
	Tue,  4 Aug 2026 16:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm-tn0o-_OdS; Tue,  4 Aug 2026 16:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8732D6060B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785862307;
	bh=kMMuqw6lurFeysYA+qn/zPcPFmPZC0f4Po+DuLQDvqg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dSnRzGkx6d56/myFcCj1jcV6kinOj0sm0UTNx2awiTWOJoEkztZCY6xGUaopOmmW7
	 RD6kRglw/Op1dwuF3TpbuhEv7Fu63u6b3Rvax68O2HYcN2QSyPB8mjc4zn9lDSCxoc
	 5Wzv5A6Ns3KpzXc8jpl+GmwmDigBaYIQfqVg2v5sJ9B5t046QswdjHS03Xrbrb+BE3
	 vZESS50Wo1gUEYN8FLjS3vaBwuGlBsA9FK098cnLhl2ajpAvtGKRDWheEND3GiGpb0
	 d3e6inv3NAUF3Z21AiSpr/3D4DJqStzPEwZBljDlbe64KRk2h/cScx8G3D/MXXxhy+
	 6guZOcOIhZPRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8732D6060B;
	Tue,  4 Aug 2026 16:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3329C2AA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 195FE40089
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM0bhz1N3N7E for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B014940064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B014940064
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B014940064
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:51:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7A2AC200435;
 Tue,  4 Aug 2026 18:51:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 18:51:40 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 18:51:40 +0200
To: Ye He <ye.he@amlogic.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251224021947.2350743-1-ye.he@amlogic.com>
References: <20251224021947.2350743-1-ye.he@amlogic.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <562154be8967a992133865e130b9d4c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785862302;
 bh=YYxEvuTjW2SDb0b33NVZYwnwalFCsxSRUG3k9j3sirM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VXJCykcjYKNzODI+9UU2a9eS5/kOoQb0Nl6cNiC98PjJLKlZSQf2YZKiVugVLzJCa
 k+xBJr3TDW+xPbJpPoE/ptxNDOlazEAUMyL0XxpEPtPpr6Em5AJDx3/nBAxGL9fZ/C
 JXJH/WIExDxRZyapGgXQIe5rzphAqizlru0RbPBsTVwa9N94Yn6vhCyt9SZEamxmmM
 flxf7LCxwlQPWBoXX+r55yT80wGRt7w/AAV/FAlAJEDe2mBdVkg1WvnCBkuwsHnwky
 aqlMt28j57T19SJZ0XA8r88NNddcYdCR8l1rVzlqg579VwzkvywqxSLqjiane0G0LM
 aimuEuAiqBT5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VXJCykcj
Subject: Re: [Buildroot] [PATCH] package/liblc3: new package
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

Hi Ye He,

Thanks for the patch.

On 24/12/2025 03:19, Ye He via buildroot wrote:
> Signed-off-by: Ye He <ye.he@amlogic.com>

For your info, I merged another patch that is introducing
the same package. Your submission had some minor issues
that were not present in the other patch. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/d046fd08833f91a1ed3bdfdb6394dc3b70fd92b0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
