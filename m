Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B523CE9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 823A582355;
	Thu, 19 Feb 2026 13:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4VR6hRxyW_T; Thu, 19 Feb 2026 13:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C84982334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771508654;
	bh=7mxHq8ENRYgKh66gNfXC37O3uUgYDYCKED/LmYKWqJo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nUDVPkIOh9vz60yoC5pxnjgySFZs3kYMNggjXfmhK6AWt8nENkDQmCmaUezAXnqYg
	 XxMIDl9Tdp7AbTRFuztx9MBLTh88oNlqmwxlTajzVBHyFVkbB+FZn8mynOGhtYbLQ+
	 c+i0FjRDBFYtou1NJNwWv/Uzrkjla7vOVpzIm237xfPiFn/qVgRI/6iBfH8x1+2+Ou
	 iHOF8OnkyWdL1WMgxFYijx/b0fgcscD8rSkyRDK+15BEhoxsI3sQ7dsEISlt0u7pcM
	 tItpXQpI48gAhbPd3+Vix0D/ZN4Q4P3tAHUCz3nq4YJA1GXN4D4ASpv6b/A+pBEfOl
	 EG4l1OBwtjI5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C84982334;
	Thu, 19 Feb 2026 13:44:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 123641CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBBED8233E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZH5-z-XYvYXd for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8253582339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8253582339
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8253582339
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:44:11 +0000 (UTC)
Received: from [192.168.112.49] (unknown [61.8.147.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7E27C2C84162;
 Thu, 19 Feb 2026 14:44:09 +0100 (CET)
Message-ID: <1ad6a059-973f-4d2c-88f0-017a9dfc912d@bubu1.eu>
Date: Thu, 19 Feb 2026 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manuel Diener <manuel.diener@oss.othermo.de>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260218134853.3119494-1-manuel.diener@oss.othermo.de>
Content-Language: en-US
In-Reply-To: <20260218134853.3119494-1-manuel.diener@oss.othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771508649; bh=rnpBFcY3X8vZ7brXbCVoF+HHjbNVFByp/RrsDuVS6Ys=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=utw2UxJDfMMRNceCGM3QblketXqe1d0FG0gYAWCpwnQPJUUhD4v43ADAHT+BFSJnl
 BOUyo6qG7oUfrcNA67d/VIjeVFiND2t+LLEM0ixGuL4U79WEl1syI88qOvjG/Tf7+A
 UZ4/TBkJniKIvBkBBVp7P4Q+8CIn7X7rK8cgeTZqfDcXdZy9pNebMY8kWi59nFTDqX
 nfUFINnsgYv8+wKyIuXXfcsF537ZQ3kIrAImypHDUSObgnUTBoDywfnL08CV1gj0eU
 BkiOB17NKzbMs+/baMpZ5rhixQn4ct9KoxNpCpNclvnhl2vHGu2wUXIZpy9OC5/QTL
 ef+AeDxbUXF/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=utw2UxJD
Subject: Re: [Buildroot] [PATCH] package/python-jsonschema: bump to version
 4.26.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/18/26 14:48, Manuel Diener wrote:
> See the release notes here: https://github.com/python-jsonschema/jsonschema/blob/main/CHANGELOG.rst/\#v4260
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---

Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
