Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08176E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8E12409FB;
	Sat, 11 Jan 2025 17:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmk1OfGxtWtj; Sat, 11 Jan 2025 17:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22E440DB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22E440DB3;
	Sat, 11 Jan 2025 17:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9EF950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B73A608D2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tSRZC_wBfI1 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE8F6606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8F6606ED
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE8F6606ED
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:29:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 022E413F8CE;
 Sat, 11 Jan 2025 18:29:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39466])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:29:20 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:29:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Esben Haabendal <esben@haabendal.dk>
In-Reply-To: <20250111125216.2449244-1-james.hilliard1@gmail.com>
References: <20250111125216.2449244-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <834181a411b7c1d695a2e93027151990@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616563;
 bh=mhjcabs3Z0z43sNRf8On/hixaequ6w4FCqoAkBnAuY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cl7CBRQa6PS0Rej+RbsS8Hzv76QdHRy2GZH/Rx9YQ+UXws/PO3aLTbbwx+SIm9NWE
 PTyJJD5cGr53YEiGxIU/4ZqQ/dEi4EVQKdjlyzKKOzupGOuj+FURzx3iHhq4ndfW7j
 Iwq1gYHOJItDxpZNqm/N7belKv9DkayXlF1qOHJzE2ZG8lKFUpUXquskMwdq38nXy9
 I8ckcyxvvClFWayUueI1LCjIkMSJmpZCflEsmRr7sn7YFcllsjeAkm4UhVFJcPXvi6
 jRE++LdGNjUjAbtqDL7KvllLSkdU7NKxAHh/i1C3twM/AL7R3r7dHd5NfNrY7C2cj7
 QKSPx8ofWIqRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cl7CBRQa
Subject: Re: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to
 version 1.4.8
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

On 11/01/2025 13:52, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
