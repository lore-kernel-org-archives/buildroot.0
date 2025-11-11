Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD6DCCFA1A
	for <buildroot@archiver.kernel.org>; Tue, 11 Nov 2025 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0FE681EBE;
	Tue, 11 Nov 2025 10:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHjhNA7--NT0; Tue, 11 Nov 2025 10:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D028680E26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D028680E26;
	Tue, 11 Nov 2025 10:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 349EE31C
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 10:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26BF160B72
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 10:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiGHnuIbJnYE for <buildroot@buildroot.org>;
 Tue, 11 Nov 2025 10:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B66E60B2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B66E60B2C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B66E60B2C
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 10:49:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2A77D780502;
 Tue, 11 Nov 2025 11:49:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Nov 2025 11:49:05 +0100
MIME-Version: 1.0
Date: Tue, 11 Nov 2025 11:49:05 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251110223952.42095-1-nemaakhilesh@gmail.com>
References: <20251110223952.42095-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <86b31014be051e8b51044db290088268@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762858146;
 bh=CZjb/oZImeo85FK3/1q/JrVxDsWIzfIhtvDK6AFyBbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XXD/zR9aKWo53huckRrL+cOBFp4EUA6H+7HZTdpRpEHwoHhg0HOVGuTb6IvgQZbND
 6wloe83vJLbfzWqWczZu63yDa/2+VfmRQx8MoucN+DwZB6rdUc9lMaJvfJfd2zKYzR
 LCoHsTk/MVe6RTd49JRFRrmfRLfGFW4c6zHekfu2y050dYQJJrFs6BmAcuUvbLVDUK
 Tgt8JkRGICs22xxbpo3RhvYXWIwveK+tqjUJqzx9o43vJedlcK9IHJN4RDVSicJ08k
 bvvV6i0239i0AhH8Jq5tl5DhwrPRbgZODoLog1Psxq2Ki5ocFMhOvjpCyXeINp0gM0
 i18sHLpOGdfKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XXD/zR9a
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.26.0
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

On 10/11/2025 23:39, Akhilesh Nema wrote:
> The license has been updated to the GNU General Public License, version 
> 3.
> (see 
> https://sourceware.org/git/?p=valgrind.git;a=commit;h=3392155359822c0d4e8bb371862e92425054d02a)
> 
> Release notes:
> https://sourceware.org/git/?p=valgrind.git;a=blob;f=NEWS;h=fdeebfaead9050b9fd43b6e7ba55d0d674367cb3;hb=218cee2feb2556b6b4b8991cf0977256b801e3e5
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
