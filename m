Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCECBCA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 14:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 883A1427E8;
	Tue, 12 Aug 2025 14:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-oEQQ6Z5bzZ; Tue, 12 Aug 2025 14:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F93E42797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F93E42797;
	Tue, 12 Aug 2025 14:49:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D11D5158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 14:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2CCC427B9
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 14:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUyUQftbEHQZ for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 14:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5B8542797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B8542797
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5B8542797
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 14:49:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 41D6F2003EF;
 Tue, 12 Aug 2025 16:49:29 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 16:49:29 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 16:49:29 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250812075237.1214602-1-nemaakhilesh@gmail.com>
References: <20250812075237.1214602-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <396284c66c5653fcfdcaaac029ac58a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755010170;
 bh=MMxZFv7enRSKcB6CPZBoGWU4jlz3EdICZuSzG065eEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BF6HFVCc2yOx6YeQnwxlg/ZQni86BcL1QnPB/ygu+sgfwHJwshw4AMs1qgV59WK/R
 DOAAqBeSPxPTG3PL2AYTcN2WvbPszIqNem0OI5pASzpVuQmrceWX2uQB8v56sgAI2F
 R8jJC9Fwx8Pz56qRxobzBBl+OWu+KIBEK0kdI8IagvI5iiJaSbIM9NISue+Rf7thi5
 kesjeDydv2dqCjgUDspBmPaW6hSo0sY597Q4BnuvzWCRU74tkMgIbt462aZUIbgAqu
 yCvfselNp40A3U9Q5zJ/hbgQPar6jGgeh2/7Y7FgPF//NavBDMzu7je+d80Et7wOks
 U23exKEydaXNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BF6HFVCc
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.19.1
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

On 12/08/2025 09:52, Akhilesh Nema wrote:
> Release notes:
> https://github.com/esnet/iperf/releases/tag/3.19.1
> 
> Fixes the following security issues:
> - An off-by-one heap overflow has been fixed in authentication.
>   CVE-2025-54349, ESNET-SECADV-2025-0003)
>   https://github.com/advisories/GHSA-8xx8-qrh3-q8mq
> 
> - An assert in authentication has been removed. (CVE-2025-54350,
>   ESNET-SECADV-2025-0002)
>   https://github.com/advisories/GHSA-r6x8-74x9-5mc9
> 
> - A buffer overflow in the --skip-rx-copy option for zerocopy
>   has been fixed. (CVE-2025-54351, ESNET-SECADV-2025-0001)
>   https://github.com/advisories/GHSA-xjwm-4pfw-49g2
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
