Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47F5D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDE5403FE;
	Mon, 29 Dec 2025 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHKB3tRdfi1h; Mon, 29 Dec 2025 14:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F5AB402AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017165;
	bh=oKU1AvAGmOparsyU3vD8gj1aiOnCXt9Mz0VZpRBV6x0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XYlYsewNoKpo0Yzxn7uDYEeo+UV3bLQYPWNvBEAaialm2E5crNQ+o+NVxJcLwlsbs
	 Xwvi0daC0euhQxGJkIWY8+YHBbUqQqr1y6J9l+H62C79Qwng5TS1wjrU3UPD9B12HV
	 fIU1v4IjmMzqtFHcSpVfnpa3b9EZh4OyrACFqOP38LzHoPVFW6gUZ8WF4BhKnADaJE
	 meqUSbgGoG42nsfpJnC73xlzTafFYskY6KxNVoKBA0S67LgV9DfPhIf3IUcQBZppFC
	 tD/IiOB0VRilNk+w35QX8wN6bLxTqo0FKNTDk3SPQvJtf7N+9yaK9q49JpnqkuICSv
	 OAp/akdwu/vmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5AB402AF;
	Mon, 29 Dec 2025 14:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD19B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F60A402AF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-E4DRpcv10z for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DEBBD4024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEBBD4024A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEBBD4024A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:06:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A39CB2003E0;
 Mon, 29 Dec 2025 15:05:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 15:05:59 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 15:05:59 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251229111526.10487-1-dario.binacchi@amarulasolutions.com>
References: <20251229111526.10487-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <f166c944c984cb5633758dbbb4924653@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767017161;
 bh=JQ6oK04RS94oH1d8q2r1f0ZTaVQyvwSgBup2NMkO+6A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dixdAZlmUIK4Gk2BJiFYoK++l0dsiWdyreBKGMD77soIJfxNi+943ZtdfsncjZHFZ
 rwQyaTXdS3qcwTgeucg9u9Em4fwApYuz3lfO3CjTTs5m6fTtOfwzK2BIVLH44SfZ6g
 qFbZs+bWB6sF6PllWOUJLiPI9y+mKPhjneeSkbD9HcR3yJ0AEPDtBDFUiygWexB0ZA
 w2N/2GZRKbPxI+aFdVhG3QZxC9bZO+UEEoWmObdxWO5s60+BtxKSw2zfPvlptjKaFX
 AKSOEX67ymIEv27/E8Y0GVHL6FbYHQ+4qvwpJwop9rbygxjYcp/BznzC69esQzhPxh
 FAGQk6xI0w3lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dixdAZlm
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.2.3
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

On 29/12/2025 12:15, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
