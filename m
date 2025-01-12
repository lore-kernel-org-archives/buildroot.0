Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96908E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65EE660711;
	Sun, 12 Jan 2025 11:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdjaPSJr8OI3; Sun, 12 Jan 2025 11:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D1A060B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D1A060B49;
	Sun, 12 Jan 2025 11:36:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B2F068
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7923940259
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECS2zP3b6W1l for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B50D14013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B50D14013C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B50D14013C
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BF55CB00571;
 Sun, 12 Jan 2025 12:36:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:36:48 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:36:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111185118.2953073-1-james.hilliard1@gmail.com>
References: <20250111185118.2953073-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0d803a6fe6823e2f8303ff60a1ded896@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681809;
 bh=WIVJ0Zg/h9QF5BiVSUJx0z1OUKrVrCoyO509I7aJtHw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X7fwob78bfUVFjWlxNfg75TcyLlLMk+LirTkQDDO0+N1DG/J+DhgZBTd+sT8MFoNa
 KB74EFsCqUZ0R4/4K14K6GLctIw7rorBboOf+PMdI+norIPAj42W1Jvyo6WCoIRt6Z
 Ow65tlwkWigGAKQtlL26EG6eGeofw06lLpQ2JCFeWIBy6CwKEoLbdxmcLg/rGAMdi1
 ypHm8DwzfjMOp65onIdXH/rj5o5JF+nHeUqg6CFnwxOQMEwKJYpc9ft0Uy6lZMKdHa
 s/U9hQ91l51qjE8xvlbrspOGKMdmrTz0rT43n/hwjFxRy+HQ86v4MYSytz0dEHQqit
 Zy3G99J9TugSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X7fwob78
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.3.0
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

On 11/01/2025 19:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
