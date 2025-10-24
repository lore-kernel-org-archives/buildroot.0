Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1870CCCF9E0
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D9D84742;
	Fri, 24 Oct 2025 21:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y91Rf_u1pi7P; Fri, 24 Oct 2025 21:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB374842AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB374842AF;
	Fri, 24 Oct 2025 21:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E5519D
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FB0060E4B
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7L37D60U5c7 for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5C9D60E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C9D60E4A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5C9D60E4A
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:06:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B79D920039E;
 Fri, 24 Oct 2025 23:06:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Oct 2025 23:06:25 +0200
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 23:06:25 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20251022190736.978991-1-ju.o@free.fr>
References: <20251022190736.978991-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <ace535ccacef712b3a06ce4f72e8fd09@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761339987;
 bh=O/c5IX2a4YDUmRsRkYYzN9W/sIhe9PsZ2cV9B5vU9pw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J4wNSMH9XRJ8rTdjqSndPqx7BCRZ8XpbruhOSXvn5TJABAHur3dU+EbyTtKHooo6B
 F8eLJFfOdkqf4LzVaQoG6Gtsh9tdbwKbXw0pfy7EHcUmIxjPi+rJUHXa98CVCJzeg+
 sS+JZGjjyWNBM9jPJN3+E/iLMmDDnHHieDmpA4wJOTm2tUecZWE+TIbpdfDDimeShG
 TSU+GuNhSo+E/PjRSZnFfGPKd5Ol9Q0jQsThzaNg1lSwzINyHwI40jbfoyXb6fC6Th
 jMOzjc3u2E/BMgmSkveo0Ksr7gqzUHqJYPgfJOr4PZpECRlz77+K3QIP4K3Z/Jjnbu
 mGiKFBW/2LnLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=J4wNSMH9
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.32
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

On 22/10/2025 21:07, Julien Olivain via buildroot wrote:
> For release announce, see [1].
> 
> This commit also adds the support for LoongArch64, which was added in
> upstream commit [2], first included in version v2.0.26. Note that
> Buildroot introduced LoongArch64 support in commit [3].
> 
> This commit also updates the COPYING license file hash, after a minor
> update in [4].
> 
> This release was signed with a different pgp key, so this commit
> updates the key ID in comment.
> 
> [1] 
> https://lists.infradead.org/pipermail/kexec/2025-October/034019.html
> [2] 
> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=1c8bf2dc0127b06f97a7973488c7f8cf9a5f7c19
> [3] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/54895db9c10a26283b25a393cb6c872d72c245d1
> [4] 
> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=591ebf60649de53dd7a9c916ef4e831626ab1810
> 
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
