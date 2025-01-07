Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BEAE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 20:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDE96059A;
	Tue,  7 Jan 2025 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80wwacx1iHfp; Tue,  7 Jan 2025 20:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 678876059E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 678876059E;
	Tue,  7 Jan 2025 20:46:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 319FD6B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CF1340290
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8Qz-E-4FRPG for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 20:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 195284019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 195284019A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 195284019A
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:46:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 28F78B00571;
 Tue,  7 Jan 2025 21:46:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52064])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 21:46:53 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 21:46:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250106043927.154476-1-nemaakhilesh@gmail.com>
References: <20250106043927.154476-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6fa0e6bd179cc220c18c391ebed6756f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736282815;
 bh=8u3q1eeRZo8pepjLbRFKisavUVZKG0QzQEvwD7xEm8M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HeLYKS7B+IsTisJkJMiHS8BYcZnhRGgrWVO4s9mP6xRBzfjqEedxtB1x+q8GeOEwN
 zkMd3zNCuQzb2E41M1Z8kIMQX3KDQWt10+UI3GRQNDINznKYUcOnCgiiKWWAugRZrH
 fg8UocRZAunQW7K4zpMzgG4BQdoUXWMSVfUAProNCaeUYbXuEQ+wT9U2X4l0tr/Rmg
 a170HIGLPPPwuuKCI6QFNpidsSi0R3O2LEqiFuHkuFK46P72vd6VCRNSR8D6KFsrzo
 DARR6RaHU7jr4qHM2sk6FR0Et6IuL8w2gwewFXFNz9yAd758eVGvLp56dfSN8aO0/B
 IvFPzW59iMJxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HeLYKS7B
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.27
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

On 06/01/2025 05:39, Akhilesh Nema wrote:
> Release notes - https://marlam.de/msmtp/news/msmtp-1-8-27/
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
