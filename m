Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6ECE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266C560AE5;
	Mon, 29 Dec 2025 10:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bi3sMETH9UA9; Mon, 29 Dec 2025 10:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC2160773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767003964;
	bh=kOwFHJoq5IoIffwoFKOPLDRhX7nt4+y5scozAZg8p40=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oaz7VoFPZ+Z2akItYQEW7RsOu7X1Rn6U2w1fHyWZRkl6N7ZMdnHe6SdF32CG9eqxb
	 jKhMxw2ZkrqJxwcoa3LzvB/AIaft7cYy73R10ExY+0kZteIB+yIqzHXq6RTyEVj7eu
	 iaisDXqPnlGdB7O0lxoEMOE/5QcdCF9MPuG3HEQPFLImQLAC2MsghOCVWUUMxULEJ1
	 JqLqAdFq1t1qfT6OfPZF7awQvCdnef4H+iyykigrb2f1vUuwbReogglMjKXQds87/I
	 /G/XzHeNhne/W/YIbu3ksDXfmUQRzw2DbB91A/caLwoDc251/vP3gv90No8gTGBnTc
	 /v0pBgFPSX6kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC2160773;
	Mon, 29 Dec 2025 10:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E282177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1020280A75
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAjUdiOoplgr for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3ED680A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3ED680A5E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3ED680A5E
 for <buildroot@busybox.net>; Mon, 29 Dec 2025 10:26:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D0EAC19F5A5;
 Mon, 29 Dec 2025 11:25:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 11:25:56 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 11:25:56 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250915082335.757689-1-francois.perrad@gadz.org>
References: <20250915082335.757689-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <3a29952cbee70c8b84d7e7afc465a010@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767003958;
 bh=af9DGr7l/nRL9PgOYH5V2xv3rlbX109hXgjUcUUDVyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YX2cUr1UFOfRPUw2H/7CT0fbaRVaKuiKr4CZQQzqA6dVmfoje2F7QwuOGbEovWyjZ
 iiZCFedgNdTyXy0lN4U9XlrUoAyC0MgJEJRMd9niQ6nOpszEA31686/GRIoThmHfxQ
 oJ2Pot3Y332a/ONVKp7St2QMl3bTyqfjBxKMHs/6gVk/elFBWV96BZd3wIpIAkczE1
 tsgYXnJ2uthYvXhPUWTivG5oqK6pFOPWk7IetWKErW3gNMFvlYCY7woni0hmGrPAYM
 cnCXzht7iAwTY5uZy8BxHNqBvAln5cTVrGMSoFi8SoJh2aIXdQwA4MJiyY4obK7x+o
 ar+ulTGbSfRAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YX2cUr1U
Subject: Re: [Buildroot] [PATCH 1/2] package/collectl: switch to GitHub
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

On 15/09/2025 10:23, Francois Perrad via buildroot wrote:
> development no longer on https://sourceforge.net/projects/collectl/
> but documentation still on https://collectl.sourceforge.net/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
