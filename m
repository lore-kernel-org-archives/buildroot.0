Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF6CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422C56150D;
	Fri, 15 May 2026 09:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86bpDbxURgoN; Fri, 15 May 2026 09:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207D361346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839126;
	bh=/pEq2x9hfb4stdNwFZOU1VTRQKpD7hHvFuCi/lC8kTg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V5iyBiDbiqma5hKfwuxA/W1USpNksa6r7OQeJwk2R8HQpQ2xIsaFru/IkNSVWSgmm
	 2eOanKdiU1bIa+sRXiAHvxLkFCWFfpONOGAji3CbSP98Aism7f8CjLB2NhEoKI4QSa
	 UeQWhO+kEWBwzy/eutEqkREsJOprKQa2hQNH6Wb4WiZ2lBLqHPDTZw3UBXbNSsnn5T
	 ut4WyhtwM9oCQozOpURQNTzIAQR7N964nxUnHCIr96OzLwbqd8q6EyjorayQEsLRg8
	 t0HFQ2rMg28DL29E91V0NmiTuHWyK9BBTn+MV15nHmqeCyyIaFBzdyjrNJbrz6Peap
	 ZvJ2E8EYnJtUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207D361346;
	Fri, 15 May 2026 09:58:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A04BF36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 859F384164
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlhO444YfV_n for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:58:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8446080EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8446080EC1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8446080EC1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:58:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B9348B00548;
 Fri, 15 May 2026 11:58:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:58:39 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:58:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512162230.3068267-1-bernd@kuhls.net>
References: <20260512162230.3068267-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7516e2fcafde03c2278dd1b314ee17bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839121;
 bh=iONPcf7HxzKJdgFlVv8Fm9J9zbyhM6HWjq5sQPZhM6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M7xEkm7XXD5lH4U8ma7h99j6UEA0UbCaVe1VZr4XbSWmBzBxKvdp0fLx5hRCQENbC
 x5rz+KUHrDtWQHx9cIFo9/vjo/kW5bRGm2K0xQHXXZ/Al3eDgatPOFvq41vURwqT0J
 TEPrGF+ZUmE9KZ26wHs5QyfYbuW92tKz6SIgi9OC9qifmUG8BV7InLUIXt7E6wtdky
 LDritaM7/n7g2TXH/hrQ0inh1mpwZAwv7QCYHy+R+LZfbz6BImaNPkNmRszAgEQIJm
 TJSS9tD5b6TYbuwQK4tWHwZK7H6OWEQ4EiBigTUe/3TEV/ux1sPuuf/wg4iP2kGtaa
 HdbFhFDff2YBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M7xEkm7X
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libdecor: bump version to
 0.2.5
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

On 12/05/2026 18:22, Bernd Kuhls wrote:
> https://gitlab.freedesktop.org/libdecor/libdecor/-/commits/0.2.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
