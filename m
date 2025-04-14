Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB62C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4322F811C4;
	Mon, 14 Apr 2025 18:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtEVm0Vidlz4; Mon, 14 Apr 2025 18:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF5881016
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF5881016;
	Mon, 14 Apr 2025 18:23:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6AD108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D8CD60BB9
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGiMeeUSwioA for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 752B760B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 752B760B1B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 752B760B1B
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:23:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5343F2003CE;
 Mon, 14 Apr 2025 20:23:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 20:23:25 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 20:23:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, thomas.devoogdt@barco.com
In-Reply-To: <20250414092213.1901858-1-thomas@devoogdt.com>
References: <20250414090347.1895205-1-thomas@devoogdt.com>
 <20250414092213.1901858-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a9718aab474861897862ff7f198d5465@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744655007;
 bh=0L9MPudYbOrfY/Y4Nhxtv5YVbngnGhZYm9oC/04RVwo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OK6V0jCkCQ0+QB4sIo2PL1IZlVSvSRjlFAbm17HDvHu7vCygqMUb9y3nFUqF+oXHy
 +1e75gCZ5421ent5p+yGx/XMEIyrcxFyDu9OVfyMk37F4ag7x8qMxsMaw7LCbrDvXw
 ggEbtYX+g6yMzJy+JOOSoGSnbrDdsNBYbHZREMhaGo8MjE4/ddRl78aK+RU5CHzAcA
 5eq6SNb6f6S9YL5SvVCkB1ch5SUp2qPO053zWAKqFYhkb5CmqEl0XxCqx7aBWZKOI0
 iqW7CpkaBj2IISHfiNp6cTTw9a5LJE7gmNb2PNcWFmBn0jA9fpKjoSMVQrVlD39lGL
 YmObDEU4IHfcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OK6V0jCk
Subject: Re: [Buildroot] [PATCH v3] package/libfcgi: update to 2.4.4
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

On 14/04/2025 11:22, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Announcement:
> - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.3
> - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.4
> 
> Notes:
> - drop 0001-link-against-math.patch as it is upstream [1] (by 
> @ffontaine)
> - drop 0002-disable-examples.patch as it is upstream [2] (by 
> @ffontaine), add --disable-examples now
> - update LICENSE as the name has been changed [3]
> 
> [1] 
> https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e8840a2f595cd99701b19f6
> [2] 
> https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bdee7f8f5a0a6d62c86cad
> [3] 
> https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5935e3ae69ff123da19d
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
For info, I fixed a check-package error. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/76b4fd159bcdba97eefdbc4299a7ae9b0a4cd423

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
