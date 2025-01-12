Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1186E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ACC1833AE;
	Sun, 12 Jan 2025 11:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwEnTcMTmy16; Sun, 12 Jan 2025 11:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 721A3833CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721A3833CB;
	Sun, 12 Jan 2025 11:00:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 604FE942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 585D8404F8
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 978O8bQ0EdJq for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DC0D403ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC0D403ED
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DC0D403ED
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:00:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C23C019F738;
 Sun, 12 Jan 2025 12:00:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36796])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:00:27 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:00:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111184203.2946025-1-james.hilliard1@gmail.com>
References: <20250111184203.2946025-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9212779db8232c17e4999b95c20239d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736679630;
 bh=yQsR+c2g8fTbwZGImAid5B84FU3rxJake8PRycgOyi0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gtaq+AlXiVYMduh8+kkdi9Qu2DJgRAHJhQIr2IV8lZtUw4MscU/GNrZuibzPszgNn
 lZ/hndAfoKwTIX1iJTcuhCJ1Nd5z9mQyPxIJ0v5FetQljxzfCD+540qn44KUKV+8m7
 7WHLLzC6LoQI1RFpM8o+nY65/PJrtaj8Hv+ljFFw1k0XXaDIdUcMVM1aTIsOQMrAwU
 CeLBAA34mUDkRZy6oqNgIWtvHc6G4Ea2YarNe/w1ZVWBqTQgGr2Z2o7fQGNUklezDR
 4kLQUFcP4ZmVDclZvyUrCI2bgtqRD5of0N6hDEw0Ukndx46Rb9ywzDGSroPD1+caKs
 wzyaLjq24sI6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gtaq+AlX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 24.11.0
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

On 11/01/2025 19:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
