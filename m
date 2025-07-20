Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CCC83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 13:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D328427F;
	Sun, 20 Jul 2025 13:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVsAxDIclFFH; Sun, 20 Jul 2025 13:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 587888450C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587888450C;
	Sun, 20 Jul 2025 13:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69E5A117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD3740584
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y5WxAMVC8YI for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 13:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C355F40414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C355F40414
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C355F40414
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F0A1560143;
 Sun, 20 Jul 2025 15:15:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 15:15:35 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 15:15:35 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20250517121410.347705-1-buildroot@bubu1.eu>
References: <20250517121410.347705-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <2d9029589d58ab34f539ed77988f8163@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753017340;
 bh=TrWzRWzRBZMWqX2k9E9kAUeU+wlG80/MGo348Q4goc0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eINGZtEii4A0ahZ5XI2nIXBHeCbqK8Xwxkl4ZZNKtZ4yq5VEIgArOJq4f2gDPu/A4
 rTq7IkidScVGvtJW61tzrn0uPR+TddYekKcBB1SGF8vcGHUuC6C2C9cPFqpkFvYt6q
 LWfP1dODI3LoVbz6BFs28RIZkJPEquMbYmKvxS2JD6ui4PJ8Em2EKLnUHWw+BB/teN
 Tc+esAhZWwDuGztY57PGECZxZsgNdwO6mi1zH9DOmw5Vopa18F/PN2FLVh/zpG2Fex
 /j/+1tPVCu76uv47LMSrri/9uckFsTHRpkq0tbqYSzfPdbCTdg50hXN89v64LYlIEH
 Vg70dYQuzOxBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eINGZtEi
Subject: Re: [Buildroot] [PATCH 1/2] package/python-apscheduler: new package
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

On 17/05/2025 14:14, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
