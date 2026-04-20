Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB5F588E2
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B5F241105;
	Mon, 20 Apr 2026 14:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BXFSlLoEPQt; Mon, 20 Apr 2026 14:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABD1841081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776696253;
	bh=rD6i0J5qGiTsMbH7CaIuJOLpmJZvqSxfM+18HGH84Yw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=XRN7kcrvXcwtBh4PB8U/MpvPOsSS7hQNnZwdB0NY19W7AFaZ8m0QrO3/klwu2em8F
	 nfx+o5Av4pTNN2RJ4ttUNIssXlRjnOLbs6QDJLkWCCVlSD5HoQqIz3+JlIIJBWvdIs
	 ALvVK6fo+n/BMTjJImGA9lLgNGvxCjckR95pI4qXDlTNqFBoK/68pWiJhl8wC3DlGM
	 MUSU3zn4YusLlFR2ujqQPQY2UEJ1CnstqcsPvcWc0tZkNJz5eWrvWh6TQulrMcIDCj
	 NQ0hWiSXNXBxvN4hHLC/d/yfzIyZoOBCCksAzMCdyHbjtLbyiXDJde4nABP6NPSzuD
	 /o5I7RArws4Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD1841081;
	Mon, 20 Apr 2026 14:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E84A24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 14:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A5D940514
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 14:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZOX0BuiwzMr for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 14:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84AF440082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84AF440082
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84AF440082
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 14:44:11 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 089282C838ED;
 Mon, 20 Apr 2026 16:44:08 +0200 (CEST)
Message-ID: <4ff137a8-9d9c-4265-ae27-e9be4e0c82d8@bubu1.eu>
Date: Mon, 20 Apr 2026 16:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260418132754.476672-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260418132754.476672-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776696249; bh=3e0SDptFR91dXcjqOLwyCcSSYYoo9zzA5i1bQjujlhw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=GdPu3OaNQaahMR7y9RocX6aRBjBhPxgZxBd/Gm402bQ2xYInKnuXEZnvJAJXYVmKh
 SMHQ8x89avdxCjmrxE8HRNTXkX0WXEVYH4hbLbSx1C45Ap8NG9gwFgFN09lnO3vOnq
 d3YHj649K0byKgFi6bs/GVvtgdS15Pyr6Kxw/cH692y5r3HbPFNmlw3pVGw66BYMAm
 MkBTRfq5auhJBKIW6DhI/81KtmEn5SQuRKyPQQonVxQ88dvOhRBFQB8L97qL8j9iw/
 nc6NiA8Wk9LMgTYoVnoPYjlPq4mYBDorBNU9qAIQu77mvPKchFUlKQWEw2edSX98+7
 DAR88YbOta2Ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=GdPu3OaN
Subject: Re: [Buildroot] [PATCH 1/1] package/xfsprogs: bump version to 6.19.0
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

Hi Julien,

On 4/18/26 15:27, Julien Olivain via buildroot wrote:
> Changelog:
> https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.19.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
