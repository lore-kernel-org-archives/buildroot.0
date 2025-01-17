Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F68C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 20:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6416FB58;
	Fri, 17 Jan 2025 20:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OwwbPXIEq9y; Fri, 17 Jan 2025 20:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E976FC77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E976FC77;
	Fri, 17 Jan 2025 20:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C510194B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B190C70490
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVXUY6N-Ktkb for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 20:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE0FE6FB58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0FE6FB58
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE0FE6FB58
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:51:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A7ABD780368;
 Fri, 17 Jan 2025 21:51:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38676])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 21:51:19 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 21:51:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz <julien.grossholtz@openest.io>
In-Reply-To: <20250117073412.840238-1-nemaakhilesh@gmail.com>
References: <20250117073412.840238-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3a92a3ed755f1331158dac44b55bbe49@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737147082;
 bh=XEo+e19N+88wcUyszpHIPhrgN21gFDtMHUASuhjKMEM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OZM3UgmEXE6ay7f9aErU2QP+WdRYPAgbr2UAhlhejmX96JvAfcKDOjn17Wf9JLVpI
 Oxp9Qmi1rcklxi8hyi2Rx0zIRAms07WdHL5oporJp0kmtopNZuA7VBzOBCPfYHpXs+
 zOJzcCVI6ZDePk6r/D6xb56H34fs5twb9HfKJd7J9WYWGa+ZBBBkabwWnJFqRNNjnP
 Nhmf38MIFAuD5BG2XRx498OgpBUbZ3xbwNc0QacTrha1AMdeTCr8o1ko3YMqPzK0GO
 u9KPyXuvbL2JvaFxinHee7hsN5094gnwHiMz5ZPJWAsL/+9Nq+HH93DUnTqjUrTspA
 7tY9TRej96pmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OZM3UgmE
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump version to
 1.3.14
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

On 17/01/2025 08:34, Akhilesh Nema wrote:
> Release notes:
> https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.14
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
