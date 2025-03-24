Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D8C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 21:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E1960811;
	Mon, 24 Mar 2025 21:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYNjz6S0YBCm; Mon, 24 Mar 2025 21:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB2E60BDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB2E60BDD;
	Mon, 24 Mar 2025 21:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 185E01B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A52760BDD
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_bXHHWmnPJJ for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 21:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37ED460811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37ED460811
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37ED460811
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:17:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0E35B2003C3;
 Mon, 24 Mar 2025 22:17:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51138])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 22:17:04 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 22:17:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190602.3336195-1-bernd@kuhls.net>
References: <20250323190602.3336195-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <d5e37275ddea593f0c016223ae87e417@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742851026;
 bh=nCda1Vin8h+rRvMt9Eq5xrB5XBvFdqKZ1lyTNbmlzx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gjms3rld8xyo434W3dgIGnMWosWlZIpm8FWRmVMsmJaHASa2Q+/TljVNq9nEBA9Bc
 9mCZOXmjwRm5SJdkOkP2pw/gbFwhMp1ESLBzGwkD9mdFE3p2HUUA5aBpE+3SmbT9XO
 2l/fSqX/DA8+Cn/SChMg7p/g3HrgurC/aRJ0PJArcdhCqrEtvZd1nkpil2qc6FY+zh
 GLzy3NiqNHCMNYUoGoDmv131oQ6X4b2RqjDuEY9OSB9sKQvKgqxkVDuALIR6xIhZvc
 88iZfoSDBTJfpctiJ/DZLKosvHkJ8Bo3M4EhLiOuqilj3L1WHpaoBk5QgmlmQb2KbB
 drsCaJuJ1AvQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Gjms3rld
Subject: Re: [Buildroot] [PATCH] package/intel-gmmlib: bump version to 22.7.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/03/2025 20:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
