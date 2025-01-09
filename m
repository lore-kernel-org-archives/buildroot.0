Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E244FE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 08:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A81605E4;
	Thu,  9 Jan 2025 08:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YL5doHfKNIRW; Thu,  9 Jan 2025 08:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B71A5608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71A5608A0;
	Thu,  9 Jan 2025 08:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DF776C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D53A680847
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVYu6-OyBcqq for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 08:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0601C80A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0601C80A52
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0601C80A52
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:59:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1075956673; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 08:59:05 +0000 (UTC)
Message-ID: <5206b6db-b27b-4a6d-81c9-4bea0a11e529@korsgaard.com>
Date: Thu, 9 Jan 2025 09:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Alessandro <alex@0x65c.net>, Jared Bents <jared.bents@rockwellcollins.com>
References: <20240123190902.1285941-1-yann.morin.1998@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240123190902.1285941-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=k/zJ8EsM5cnRob5Cqbb/CSyBV0t4R0Zo+E9sS8HZLmH4pgQ9vo/p8eyZ1l7bjbQtnpp6p0pNpWkPsUPjG4yMzozZv5kJ4gUY1f1QTcdlVQhgToH5JClt1CkSo2dpSxQDHMdltAILbUiMb9fKvYmQ/BemRHs0QzZtabyObmubkpvM5utcyHycNBIWydVMRb6HKv7zn7g62KdDsFXeyRYFUrc/s3yLH9cvDpjfvz+onEUrFka9PyLY38qMDKWb9eVKZUT0S6k3DeG3xXaJOiKnN+240ScU7t8IpsMt4qQR+1DN1FGP6nrgvtFze1RgJRMCzCUXj5T06rxUAsdqLZVKkw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=plNwSJxib5uFWn6BF2RRdZeQ9oRBR9bWjh9VK5DJKL0=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=k/zJ8EsM
Subject: Re: [Buildroot] [PATCH] package/libvirt: do not use 'qemu' user if
 not defined
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

On 1/23/24 20:09, Yann E. MORIN wrote:
> Commit ed12e2fbed3d (package/libvirt: add lxc and qemu options)
> introduced the definition of the 'qemu' user when the libvirt daemon
> is enabled, but unconditionally uses that user in its permissions
> table.
> 
> Move the permissions needing the 'qemu' user under the same condition
> the 'qemu' user is defined under. It means that a few permissions
> needing root must also be moved, as they belong under a directory
> needing the 'qemu' user. It also moves a few qemu-related permissions
> introduced in that same commit. The list of qemu permissions is
> reordered alphabetically (the others are left unchanged).
> 
> Of course, it also requires that the qemu-related directory and symlink
> be moved under the same condition as well.
> 
> Reported-by: Alessandro <alex@0x65c.net>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Jared Bents <jared.bents@rockwellcollins.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
