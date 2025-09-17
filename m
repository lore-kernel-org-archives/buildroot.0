Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C66CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE4A81C2F;
	Wed, 17 Sep 2025 16:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HWPcM0Zchpc; Wed, 17 Sep 2025 16:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C768884308
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C768884308;
	Wed, 17 Sep 2025 16:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F18C5199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7D6F406DF
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOPDGvoukoEz for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 080BE4020A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 080BE4020A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 080BE4020A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:49:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8702819F58A;
 Wed, 17 Sep 2025 18:49:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:49:06 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:49:06 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916001055.2475846-1-james.hilliard1@gmail.com>
References: <20250916001055.2475846-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5deca514644cbd474f2ce710b241b574@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127747;
 bh=Juq34yK2R7OLyK/VBzPpP+nIWlVmdOfrXRAltASyhp0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pXCCW1Doh/KdsNqFKy7PuEwBSrvpfwz/FRmbeqdWNO8Q5+UbY9JCaMse9aHVsdSXf
 LhROQWR/pu5adRUSRB45NPGMFP0cNiTlGWn1bQp5yLYu5eM4iAnFPWbGyzO0AThuum
 JiZ8X9GeKciDBfeEGo0HijP5eElWXDfE8s1YmUDMBDr896lrIWq8bXNW30T0WDTpUg
 Ri2+RHLSZz4QJbv5zZeaDysIK1bIQpSvhzCLDna4nFk8LxZ65hdPgRDlfhPdChz5GO
 hgwCs7eHSBgq1E3aXg0BsuS0JjlnJgyKyPk6WBw4Jgu1KBUw1Wo8MXKLujLeqEVZ5c
 3VHe85YcZMUiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pXCCW1Do
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version
 6.0.1
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

On 16/09/2025 02:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
