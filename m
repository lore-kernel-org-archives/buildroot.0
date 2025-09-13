Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D054CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 22:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A10843C7;
	Sat, 13 Sep 2025 22:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mu0nrthDSpLd; Sat, 13 Sep 2025 22:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8556843CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8556843CE;
	Sat, 13 Sep 2025 22:13:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A74D117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30F44843CE
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ekp0eY9T3mq7 for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 22:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D8E7843C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D8E7843C7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D8E7843C7
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:13:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 94533B00548;
 Sun, 14 Sep 2025 00:13:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 00:13:19 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 00:13:19 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aMKgTg4i1I075NZv@waldemar-brodkorb.de>
References: <aMKgTg4i1I075NZv@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <76987fcd23b840997ea71b9001915055@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757801600;
 bh=BhVjw7OSC4RuWkjIHrcNdAnwmvGnb/TgIr8G8fa3ZrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UJsUcIYP/SYGoJ6roDCyxKEZdcY6S95gwmqyyAJrKOUG5E8N4mFOuuCBSm720Srgh
 4au2YL2Z4YTXV3K5/peYsYnuQ7RT+5BYQCfNWHTg/fBt7bu6ufD0o+T1ismi1Adkbr
 7FO7Vs+9TF5QhftGedxK80VLqopI0ZF6PLmXyqynKKyxhbcg2Uf6mK3ROWVX7Bv/9h
 wXWqvjQYSD0EjerquTeCyi6XhZFIomrDSsaekio1JYX7FeSqPEU1t88uDdXHYfv9Jg
 uLghlxtEmoUxl7+QrjPtXG/jwux5duD9VmVlrBhLRjvTrLg3R1PDp0MB76657QHBAx
 CSvWz9TQh0L/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UJsUcIYP
Subject: Re: [Buildroot] [PATCH] package/dillo: bump to 3.2.0
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

On 11/09/2025 12:11, Waldemar Brodkorb wrote:
> See here for Changes:
> https://dillo-browser.github.io/release/3.2.0/
> 
> Patches not required anymore.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
