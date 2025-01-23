Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564CDC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F36B403C9;
	Thu, 23 Jan 2025 21:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oKF3PQojB1K; Thu, 23 Jan 2025 21:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1143E403D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1143E403D0;
	Thu, 23 Jan 2025 21:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F300959
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D01B607C8
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQntkKp9AKEd for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 21:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72F0E6078A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F0E6078A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72F0E6078A
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:20:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8A5CF13F86E;
 Thu, 23 Jan 2025 22:20:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35696])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 22:20:25 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 22:20:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Oli Vogt <oli.vogt.pub01@gmail.com>
In-Reply-To: <20250121222808.3149231-1-james.hilliard1@gmail.com>
References: <20250121222808.3149231-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1a1a0d0588a7340ad40345ff8e44e3be@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737667227;
 bh=tWIMstp7bd+SDqaqoSlaM72S+19zRLhtM6yQ0QDNp84=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M7PFVU/RJfM2W8cNkTtd3EOMPdQ7SILk8/gGqgnK6Y45OTdit1S9RTG2Ld3TWnvAB
 cyLe5iSlkQ5MORPJ8Jn6pLVQoCn8cOQ9HKUf/0AETsAzxUJZH6N+/HW8QNPxwz7ELY
 mKYKQgC4Hm6QDGXZKEn8Ss4t+19hE/Qi5kc8b4ELNkYTSjt7CXClS4bf/V0J4AJYT2
 CYNjMMN/blxO7zFgMaWkyP3jCYK4IL2JaplhDY49EVmIeNt7hyfiujgY8O2cAC9Ceh
 TOdeco01ApfBVIBRhMqaN8y48JWijkpCMY0kwUmvy+FAe91Bs+9It7b91RpnQCnK+q
 nZj1b5Hz87JQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M7PFVU/R
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump to version
 5.1.5
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

On 21/01/2025 23:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
