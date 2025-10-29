Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B01CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 22:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C956561122;
	Wed, 29 Oct 2025 22:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoOY4l8oNE1I; Wed, 29 Oct 2025 22:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0C9261125
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C9261125;
	Wed, 29 Oct 2025 22:01:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB136708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC40961125
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWeBrULWra8T for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 22:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E29061122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E29061122
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E29061122
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:01:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 62B975FFA3;
 Wed, 29 Oct 2025 23:01:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Oct 2025 23:01:40 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 23:01:40 +0100
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20251027014158.865598-2-jarkko@kernel.org>
References: <20251027014158.865598-1-jarkko@kernel.org>
 <20251027014158.865598-2-jarkko@kernel.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <0a46f6327af1851fe9090896d02d78ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761775301;
 bh=E3r3MbVOOz9FZjLhn6E3pkeeuFAQi8BL89WhcPQAYOs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MMsk3h+XlfsdqZLtN/e27Tj4ixbuGbcxz6v8QlMfx/KjKKYCgy93bs6pydCnSkroL
 mVKtXTg8ImWw288VfGb6h+Phk/83sWlh6qCtmZWuAVbeEbbbhvjx2NdfZ6Vb+AVdk2
 F5lB8kR0wtf4OHbqol8wO9htpgdyBA1EzZIidqxPnwvk50MoVaT+3nnafvA4IL34Qq
 sniZp/FdojJiYEZnUEHAnwqdkmRiTwAuApsPPpZjKaUSrEodN5U4YHK8YXwgguSU8l
 EAE6MmgOyMkfUnhely0zMFOccTUjs/oK9Amna5wNxBnZkZPQcOVLf3zavlD5YMX42l
 XFiGLLsyBTHRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MMsk3h+X
Subject: Re: [Buildroot] [PATCH 1/2] package/libtpms: bump version to 0.10.1
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

On 27/10/2025 02:41, Jarkko Sakkinen via buildroot wrote:
> Release notes:
> https://github.com/stefanberger/swtpm/releases/tag/v0.10.1
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Series applied to master, thanks.

For info, I fixed the release note link in this patch commit log,
and I also removed the old hash entries. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b4c9596dbfd3bbf6ae84aaabc84fec03a7232cb4
https://gitlab.com/buildroot.org/buildroot/-/commit/2b449935c2e8e19a03a8962f49493a76ccca11f9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
