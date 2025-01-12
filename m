Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74635E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467DF83A81;
	Sun, 12 Jan 2025 11:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yibm9KgNUFdX; Sun, 12 Jan 2025 11:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6802683A8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6802683A8B;
	Sun, 12 Jan 2025 11:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32EE8942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A6060AF4
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7TWlpHRtqTt for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66A0560A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66A0560A5B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66A0560A5B
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:16:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 75E1E5FFA3;
 Sun, 12 Jan 2025 12:16:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:16:42 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:16:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111173021.2915176-1-james.hilliard1@gmail.com>
References: <20250111173021.2915176-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9546a544adf37c72b50ce45d3b4a1b26@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680603;
 bh=hUnNu4dZzRFAISLWL5h2p91Wnxh19PpDm0nKAqnAlLA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f3TyiJlsrFU5CPb0m9CdgHA1BOzkeDSriFeogt56tOjxEO0lLuwtkock0L4sw1Spm
 xE2oULsrwdc0U0eszyW8QB2UHklo32k8+pr2TzYDXPmgiy5VhkFKsokFWqApOfh4lX
 vrAmruap3GOetcmmih4rXim5o6n5MzGTdU9GRObUh4PbFtUzt1mAmO2KcbOfwyS5or
 RJyTiIRSY5IPnJQrd/HA3ZzNZbuJEqLyVhnRKXww88d3lkR8frizSqIofDBaM1dXMq
 TaT/ilKeoe7XX9y15Vtvp0AjAsco4sEvmEEBcV3ev7S1wbctwx2jkuIiKhZBTZG/Hd
 nvhJVFi8zM2hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f3TyiJls
Subject: Re: [Buildroot] [PATCH 1/1] package/python-socketio: bump to
 version 5.12.1
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

On 11/01/2025 18:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
