Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B7D12676
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E3260D74;
	Tue,  2 Dec 2025 21:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjVTT8KSaq4V; Tue,  2 Dec 2025 21:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B7A6132F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764711934;
	bh=g345rjnqhZAf/Fl/iXlFDbYKZNTBlJesLuICh61QyBc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P3IsXAbF4MpqjYNPRcrZjqSKwMdkvWPc1uooOwOgb4rmZYMLrqRLmLhFFAgUnGWjn
	 C+igpvnQojAYEN23hZtkeLiwyKbRXFJUtKuRCV7XQ+k0eaO3b8SjeX5YynCwl7VqXF
	 4I9rGKxLn5/QnuvW+Uz/qi8TzDbOb0qtyNgCefG8OhnRGlvZagGxKgDy4vzF5QVpul
	 v8cUC4zbYpmxmMCdkG56b3RVdgsC6CKO3EDmwoj/osAlqobURROXtqPFeVm/lxFtEz
	 /+nOt1kPScLllHHBkVnv5tYe+0gKf+Nc+O7MpqF/bAM4E8w4xE/5W3P/l+UmE5mUuI
	 xRpjGwoXo/9ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B7A6132F;
	Tue,  2 Dec 2025 21:45:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6439D3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1A140FD6
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC_xHNwkmWpk for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:45:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B5C740F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B5C740F4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B5C740F4F
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:45:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C3CDAB00539;
 Tue,  2 Dec 2025 22:45:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 02 Dec 2025 22:45:27 +0100
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 22:45:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251202063859.497258-1-bernd@kuhls.net>
References: <20251202063859.497258-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <586ef563877fae1b95097b397bc16894@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764711928;
 bh=kdEeib9KfG6Dy2sFWi7qv9hBGHYXyC2OjfuQchXYYio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nELJQMPoJU+Gbg/qazCebTs5KDomlpR5ZXU+YV4oKHqdM76bRImubDuyVKg9goRfL
 J/urHoUHQUCg4I+YyfrpYR8t7De20/HsMtpolXJUrZDvtJicwk488gskww21QeS/ek
 9pCVSiS2C/NCGV9X02ZxDojYQ2A7RWtoZKwUNTfqq18EQouYKtwy2lilTeTE9AU57V
 14pRRGJ1WjkMXmSZExnpZh0mBmZhBP9Zhs38WhP1AFrsmjwDd6pCwDHBHxXOWjOYWm
 RPPOZgvU52fJYBXSdl4GG/DRTLwjm0j8ctas7GfROBOqT2xj7ov2f6VF4s5iZiuCqT
 azZScRPE17nHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nELJQMPo
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/unionfs: bump version
 to 3.7
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

On 02/12/2025 07:38, Bernd Kuhls wrote:
> Release notes:
> https://github.com/rpodgorny/unionfs-fuse/blob/master/NEWS
> 
> Version 3.0 added support for libfuse3.
> 
> Updated license hash due to copyright year bump:
> https://github.com/rpodgorny/unionfs-fuse/commit/3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
