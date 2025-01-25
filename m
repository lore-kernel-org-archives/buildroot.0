Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B0C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690B660011;
	Sat, 25 Jan 2025 15:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dI7CgcoYE3OV; Sat, 25 Jan 2025 15:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B12460591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B12460591;
	Sat, 25 Jan 2025 15:12:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B162941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4932A406C8
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozGYp_sVCmsD for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BA8F406FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA8F406FE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BA8F406FE
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:12:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D12B260129;
 Sat, 25 Jan 2025 16:12:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:12:32 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:12:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124200551.3841757-1-james.hilliard1@gmail.com>
References: <20250124200551.3841757-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <267ab8e165caa6953037f1c6ca6dcdba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737817954;
 bh=NhIQbRqZU6P0jp+G1c7Y5afjZOnEJ5Gb6R9jWbwG6zQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Imlad1bEcc/ZGNbrXCZ1K8rDtJFliaVDPqKEIAMlj1oVy4pH9navPio5i/3hmcp4I
 scZsVjBx+FaVQOkBKZ4hcVeM13YyrqBAnpEbENlTEc3nyT7nhSdZBKzu+eFZXMuKon
 rfq1iLQS237A+F0ut3UHVxcUSNLXnfKzgzbHlMoJuqqSysQ+KrHpej/FZyasrRFz80
 xx0/hD50E/LndZ1ZW98J9kv5YaE2NJ/BiI6YHzdYFJa9em0wMLMsgDyxmzkM5cQEWn
 TlfeOSrSMxv4c79HOELBg6tLWCR+xtLNrv7hAuNo1bXjMV6TemHfDY7P0i+MYhhlNv
 M5Au1/a0QGJuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Imlad1bE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.50
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

On 24/01/2025 21:05, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
