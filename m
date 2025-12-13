Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A36D5B165
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93131408F6;
	Sat, 13 Dec 2025 21:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyYmElS0YW5L; Sat, 13 Dec 2025 21:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC8D408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765661283;
	bh=qbV//7cnVXFAcHDkoWc6r1YDwCftnNDnsFRu5gpFy9k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LjmfZ6UG+hvRnukGjAArcI6SfhE9d8F+7H5zKuTKR1PU5ixIR6tQwvXcYZhiT4eNm
	 le+p1gLIGUcJpzz8GC+127qjmvGwyAJqAVrkTmLUcOwA+F8w0nyWmWTzNng4CO8O0p
	 PH16OxXDzjWLJsh70lKtI/m9SD+DIVqVMwcW+6iY3aJ8Dy/aWsQEq/iFerN7Y0xsO2
	 +NBzydv08N9sRvbnMxfgj5VYgkgffa69YEmY8PTFb0r/GNMqg4XIZGllwXRU4zTg8S
	 yn7w0Q+Ob0saFPz8RCEgHYkUVZTcOJyUQq4N1o/ij7nCyTO+NLqjtscY5hJfqVKBVB
	 7trSWYYg4mYVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC8D408DB;
	Sat, 13 Dec 2025 21:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F9822C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32851606BB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qh91e_Mzpcdm for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62BB8606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62BB8606A5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62BB8606A5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:27:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6BAAE19F5A5;
 Sat, 13 Dec 2025 22:27:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 22:27:52 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 22:27:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213115839.1277318-1-bernd@kuhls.net>
References: <20251213115839.1277318-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e3b8ff4357ad965766b8b55cc42fe2e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765661273;
 bh=hlEL03ij3ib6WEqGyEXl6P+L5AmelLR2Bvpcr7xB/c8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=It9x6w9Rk7/zIdvlqxfWa8t9KUVYjB4c8M8ZkVlEysmmlnW0uLz5a8zNAejNxit49
 qJOlCqxELA/TnGNqASToNzDtSbxDHebpZJllBd7NwEx8N1T6trmC7XQSt+TE4jDtK9
 20OS8bSDgn3aTi5Mz48D0fI0EgBCwDFFi05SkeNDzlW2qcf6FxL5Eck7CIOy1VBHlO
 k/3OPVo31LAqFC8TqvfDX7GcG11uWt/JIyxXMQCrBrbsaypOBUQOGYCPEisaiQlioU
 aHkH4GfQQIQw5dGqGekoG0RaY0QBmsBT3Lq26ZnPf6+gumJ+NcGDkL7GtRDq5rtcNc
 YZQIUC3xNsFHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=It9x6w9R
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.4
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

On 13/12/2025 12:58, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.23.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
