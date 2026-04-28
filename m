Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D28EFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B2E40A28;
	Tue, 28 Apr 2026 18:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rl5jrMBCyoMR; Tue, 28 Apr 2026 18:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ECF6407FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401315;
	bh=zhlWnofVeaP9UM6zaIwQYvaWz1KQ63gI0Y1mBu2/uTA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qDRiUqgPM6Hbjgng4r8oR9YICmUH0rxZF87A53WU8e/ArMArKQWUT8OzZooaQ38ut
	 tjn/HdI+NcQjWsA5CcWFCeyXbdqX+r8KDOqu3amEb1PkJA8AEeJ0qrw6yqKmWoJgTw
	 YzSZ7RWOUW3JBl6VwkuhBHoeod2XLUmnatqqmxALsdh53RzMUDOys6ZO8it7QMmv3w
	 2Bduw1byu0y0DUJ30h30xFHXnzezIHj91z/7rKz9uWrfYzCo8GjG+IGR7F2CSagTOl
	 VJigzF9P0Wm6VbZ9F220LXNDUA6cMxM3ksQ/o/ybx7/YWzE7nEOBfR9z6gAMdIte5f
	 8bcgfzdTGH+eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ECF6407FD;
	Tue, 28 Apr 2026 18:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C249231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E02360F2C
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cv7TILPIkJJn for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44E5B60F21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E5B60F21
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44E5B60F21
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:35:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2E54460134;
 Tue, 28 Apr 2026 20:35:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:35:09 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:35:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260426072010.401358-1-bernd@kuhls.net>
References: <20260426072010.401358-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <09034bcf205857df6488ed68c111f7a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777401310;
 bh=JcrdmK/b71uEqsod7hID872i9qTv8Fd4ycT4bO+YHVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jCJMgpjYer8dHNm8PgEfdmuaJX69FGF3OA5o4uzaRGf4evrFNjW1BZcysYIVkf7iX
 uNaCyByJcwQVDJDObnt3acPbZDehc+5GzzQ51BW7/EN6//reNEZUjzc4pkLXhK2UX3
 R1c1NhKQYLkeWQBbQIHZv05+TAG9CWjFiahYLckxKqYrmqF7CPmVen61q0bQWoim2N
 IK6s7Fy+uib+xbvtJB3RO+eqqr2tF8lCTuuVu2eFeuWsE+eQjP3lOa7R3llyrOPmLi
 faxB+7A3j3jcYS8pm/Ln8dtUoxRXUihggAHRCAeG6QzbViMbl9MINe/u4sAb2DSdrW
 BzbWA7NbCtt0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jCJMgpjY
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump
 version to 22.1.1
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

On 26/04/2026 09:20, Bernd Kuhls wrote:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
