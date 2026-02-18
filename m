Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B09DE9A049
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52258815D7;
	Wed, 18 Feb 2026 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1u2qeD6eOwb; Wed, 18 Feb 2026 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C27810F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771451121;
	bh=nS6gcA3qxB6tjJgsaiPYJg7JYMAIsIR0JjxS6qYl1Jg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EXMTfVgdLvCRjKbX75HoAN1nLUt8egC9DMTt09UGueITqYecvA/z3JKZ8jAkUTgaZ
	 pxPYdC4T8rt0Mdyg/373qqUfIMkg6/TxbKXBI31pN9CU36fETZRluyEcZPddInwqHh
	 e3vzo4bOPtDwlbaiZmciCK04X5TudqSQj2jLZnSlgFnJBIW/PoHfzg7fhN3CudAqOX
	 koB8HH/qW2Eu/xlQeeTFtEE6smZkpaPVVdBAPIKLe5ljZFJ4mDub5iiOKkfL1jcQUx
	 egCWOkDNByBrJTSrTV1/0WSE8cGKYmHObiyKO8MCeQyxv5C6FmUhTLmZieoDIzgUZJ
	 xgvIfwGETH1xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C27810F5;
	Wed, 18 Feb 2026 21:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 843A81CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A274403B2
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yw5Mr9cMYJXy for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 21:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6798F4035B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6798F4035B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6798F4035B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:45:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DEFBB2003C3;
 Wed, 18 Feb 2026 22:45:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Feb 2026 22:45:13 +0100
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 22:45:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260218012159.1555509-1-james.hilliard1@gmail.com>
References: <20260218012159.1555509-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <02b14874884a69a726723245ba184efe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771451115;
 bh=RNxHw80lDAo5VxFc/lFmh5mZi1LgHZ0GJ1e2Eu8E2Do=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e/6609QAVNR/zkhvdZXbNRhUsrlrmyHfY8SixOQOW0uHrrVIKX4Kbap7YGX0u5Esn
 hWNDtPyMdO7eKqxRqgS8ycA/Wn2XKr751Cy1GEcX+Eq38akpt1tf9xjRlcs6FlbcQ/
 vkKhwj08/aCWdiUJpMpgSmdfFFzBDKmbxZpsmx1Sey+JrmOU7e5MHzSW3sBHmIAuDD
 TJVPA12ZclZFEWU4lKCHMwFZj0M0e67NvvjB9cUrkY3Y4tfuhHCjcKMXXwNEqHa4xg
 XCDjC4men/xVDnDLrFh6gekwiwYIV7qL6ZVLST8Ye3lpMjG/CICJieMwN+3DK8BiW1
 3KEfFUMVcTsHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e/6609QA
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: bump to version 4.0.1
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

On 18/02/2026 02:21, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master (since it is a bugfix only release). Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
