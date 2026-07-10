Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BD3C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8233E8102A;
	Fri, 10 Jul 2026 20:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DK1G__60XeqO; Fri, 10 Jul 2026 20:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B591181013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783714049;
	bh=pvY8RV5quIZlr51tfUu+QceDAgFDILwEwxUwgQ34ijs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q+HsJKOrgcZlA55jA2KmTdq3hM8GXEh/MvWajvKLSEKpcyOlJjEJyZ5SN6coiHQKR
	 0Hd64r/QBoG4X1onCQsFXF3K6AR3WY6pDL5Jg6nkm0cegp0pFemWnhnQcEjyCAYfon
	 xWuOqGcm7edhqQljNzftBoOtx0jyOfEH/5JTXPvRyG0H1t5ABhfPLIM8VxR6671JDw
	 Zjy+wVhpJ2k6PhYVUmOMevyt1Ujl5YuIZhnvsFgd1QoxA4UOdN+G4/XQAcJjqK6DuI
	 yL2lFHbxoTVHyErBGJfG5k+XT8zQQUuBNseEtxsOAZoYXDJH1HPtYoHDyrdn8sltWE
	 MkbGgvw+0Gvbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B591181013;
	Fri, 10 Jul 2026 20:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF9C372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A7D80FFE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCp9d1gnn37u for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2968980FF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2968980FF8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2968980FF8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:07:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 46BA613F854;
 Fri, 10 Jul 2026 22:07:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 22:07:23 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 22:07:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20260705174115.3252273-1-bernd@kuhls.net>
References: <20260705174115.3252273-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <cb8f31327210d1dadeaa126019714d23@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783714045;
 bh=wPvhyf1XHjEIYaTSlF8A9kmBcmzAlyv5rXe2FeQqyGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bPNNonL/G9MzBIGDJhMbs9H12bBZyzWzGESdiE4LDqT7Z/r5mSsZeZ7JconssEKHP
 u1lzNh4rIe4otoZRKaDPcY4STv3n4ZNymNOa88cpK9MMDAZR9iYYA9BCHaP6xZdeAY
 TmvJYQsCinT6X0XCM47T4WK4XMOSBMLe8pbgRsFWfLBHhF8cJNhg0px01owwDoRBVj
 SV/dN2msR7uwEkTg81TtudGfKf49jIgYVmWBmNUTAoWyfagZnCFn3SVLUKNyoavxYv
 MdgE/psSlp4arrYnXmJVh1ZWmDuUe+0CIuJAL1xYRg7OV3Jfe+PbRjNBpkwKTBUeLR
 MaUG/srwh7WwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bPNNonL/
Subject: Re: [Buildroot] [PATCH 1/1] package/jansson: bump version to 2.15.1
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

On 05/07/2026 19:41, Bernd Kuhls wrote:
> https://github.com/akheron/jansson/blob/v2.15.1/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
