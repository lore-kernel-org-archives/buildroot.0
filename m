Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1188FC021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BCF40C69;
	Sun, 16 Feb 2025 17:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPOoPdf-OLnx; Sun, 16 Feb 2025 17:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9891340C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9891340C6B;
	Sun, 16 Feb 2025 17:09:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 654B072
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 600EA607FC
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrqhZJFwXOhX for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DE81606C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE81606C8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DE81606C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:09:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 478B760128;
 Sun, 16 Feb 2025 18:09:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:09:11 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:09:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-2-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
 <20250216153441.2706067-2-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f1b448aab064b71914972fcb2ac19bfa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739725752;
 bh=83MZ4hMugTbXCX/js7oxgvDKQg27eWO8U3Yg9V1q1jg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g20T1csd7alqs2HRGKHctLSz4RqHeMOzQzZ4KHQLULmuE6lM4IhyQjL9GPmo/vx/e
 w2kBXMnUZ+GRDDAfF0JYoYw0o88FFsIUEK3Y/0G4EmDuDdqbKcc1CNE5h9byRhKX8o
 PLWHOYIphAh7JV7yp9UOfjWMslw6j4BSsznVFAD75NlzB8oNbPwgjrWHoUbUWq+wMt
 mdp8O8e0hMvre1JDDsVQkPF/MU+L481hnh/NUary4hUMBZi6fqadEiw1V2et+b7NJp
 omFgbp4adgxBUYdHPb94lVDF8nqeBOSl57Zl2jcmswnElw0YxSCCyWkpdPC5R16vKT
 s3tjG/f6LZZPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g20T1csd
Subject: Re: [Buildroot] [PATCH] leptonica: bump to version 1.85.0
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

On 16/02/2025 16:34, Gilles Talis wrote:
> Change log:
> http://www.leptonica.org/source/version-notes.html
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
