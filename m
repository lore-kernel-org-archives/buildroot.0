Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2EBC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C656880C0D;
	Sun,  6 Sep 2026 16:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adZQs5aCYUSi; Sun,  6 Sep 2026 16:53:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F2A2080BDF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788713606;
	b=YL/E38GjXJ2VsRlpzEadj8584N38trmaCJ46pWt9/PjJ0oTaDjerXAk6ejbU0GSTN5Wa
	 EWWh7OMgmBDo1sze3d1ZqnmGnhMPu0OKZj436LvFvIoG2frQEUQsCuYUfVqK3gfQGGue7
	 DK7VH7NQSR2df1bEpRXNxTZ4Z+GPHyQ84rkp5bhpNeRKpisbX0qaWDxOxyeN+SV0vtKNX
	 FgvvqY9jYXXTI96LuaklJrovGmZkw8eAFUKuyfk3fVjIBMVfAfV/Zbp14dZAAbP9KMxWa
	 IoqLIZOPn84p6qx8WEFixwAkKBPr1xabktSJHklNWLJOPtHGvtQFq62onpRxOmcUeFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788713606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SfvEgPHeKe7OjZNR3+fO8sJ+aA2xPdrwbDx/ViEp4zg=;
	b=AbaJjBkZme78Fy7E5RYDbdXBTxb7Kc2riYpeHel0/Px/9Onj1xxt5QHeyo8Hx9vOxNcf
	 IlEUSmSKc8l3UWU7ctbr52ynpM6SBGMHwaCa31izFjUyLId47i7XM7RnObK1O1pJElSGZ
	 Pz20BGReIpLKF+QGu8SpF99GvJiV1YOK3x82OYUbQSNjRTaDNI54HBrmf5jG64vdDhhzx
	 6qS2p9ChYrfHWPfOoUL1j2vbQqqZyVmdpiGJLYNOFNucF4zh69qrgEq+UgN2Fv+xN7apK
	 mBRQbJIkjyn+mBGgR2leQ1QhVnFy/0dut61ExvSGJH9f8o9Mf1hfRpgEYkk3keX3VRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788713606;
	bh=SfvEgPHeKe7OjZNR3+fO8sJ+aA2xPdrwbDx/ViEp4zg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wp7Jx1NcBbkQm6otR4PZ0LXGTFPGNCEdj1oNy6RsJj5etAqqxnK/5Chb6biUiCCLu
	 qtmvnoBmXgYWpKgHJklNARYaGRUaAk1fNsOUiEAlrrKpibbuQCkuF2HIsNlVKY3q1y
	 gePhC7GYy5jURo7CZ17TM/+6O2BmItuiEaU73G9fUpYpSEnZXlCk1r1pzWo+ApopYX
	 eFcN7W4INIgVzLm8VvbbdIvD4E0TMDWSWsaXPQAmbPa5cvFQd7wf0ULkuIMwFHek51
	 7Btf0PX280jBkhzRcPkNiyKmr5XnsmSyMWHe7O+JK+RMZm0ru0MU17zCnnpPvUsqlu
	 DYCp4GAmNG6WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A2080BDF;
	Sun,  6 Sep 2026 16:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 511C5970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 431EC405A6
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_jJiibp6vjB for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:53:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EB06405AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788713603;
 b=dVCb0JnWkoAYO+H/oaLYK+0yXzZCMAsR5Ct2tu7mjrTnQ9nhMvEb24tuHQmtQ7tVt2+f
 LI+dqLKOAisewX01Gc3VK8apVPnKS/23vF/ZQS4nKZvGxGqoijyJdMYnHkamSG2jIwSyk
 5XEBMjUWEGb7+Ofn6wCm6wsg9g86feJLO+TA1CDCJESpV9tssfcBy3ZtA96ifwSd410yc
 EF/pojGTpUkTboGObzkUAB1poN5JA+4sr1TiZ1JeeGFBIQTRFUNgJ42iQ82K2laMsA0Mh
 MRzXx1vvBa+6V+oJoFn3cfaPswTYivscydNHoqnnRIkDBiEPrirIYC8w2o2W8c1l2JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788713603;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ky9bbVCzRjvFAliwO4R3i/skBDF9bM8EJHAxGKG/AyE=;
 b=nGVKWLjjrCDz86hlpBJ3AeZoGzfMPXzfybVM61MOVQOrvZxb2zlcP8svXffSnpH4f5o0
 Ioogan6wIyxxdKjuNt59me+QeSmIf62X4v/xm/eW1HUb7jF8UyA9q3Qndv9UuZFNyF+1X
 T5Is67yZPecEDqjIQybrvL4tuGLmhmh4DJsyaS9InBMXIsMxE69I76mqiKE++JlHGHvUO
 rUaB10yrxK2Qbf89AyVMWkluAbXqzxacS0quosoXwjRfDJXRIzFFXQkRxt7F8RJAIOSLw
 /cJQPrUtWV56sWIfbc0ygy2eKqu8p7nArzGTgeTR6abjzd46c/w3wUcMIgYB6uVs0mg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Wb9nutIq; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EB06405AD
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:53:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CA86B2003C3;
 Sun,  6 Sep 2026 18:53:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 18:53:19 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 18:53:19 +0200
To: Torben Voltmer <mail@t-voltmer.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260906135918.63327-1-mail@t-voltmer.net>
References: <20260906135918.63327-1-mail@t-voltmer.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <f1ffc5cff7fb9856c569c4f15fcbbd8b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/espflash: bump to version 4.5.0
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

On 06/09/2026 15:59, Torben Voltmer wrote:
> For release notes, see:
> https://github.com/esp-rs/espflash/releases/tag/v4.1.0
> https://github.com/esp-rs/espflash/releases/tag/v4.2.0
> https://github.com/esp-rs/espflash/releases/tag/v4.3.0
> https://github.com/esp-rs/espflash/releases/tag/v4.4.0
> https://github.com/esp-rs/espflash/releases/tag/v4.5.0
> 
> Update the Config.in help text to match the list of supported
> target devices, since espflash now also supports ESP32-C5 and 
> ESP32-C61.
> 
> Signed-off-by: Torben Voltmer <mail@t-voltmer.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
