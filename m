Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E56C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66F1B40BEB;
	Tue, 16 Jul 2024 12:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9TfOVEH-1XY; Tue, 16 Jul 2024 12:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E758740C0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E758740C0D;
	Tue, 16 Jul 2024 12:43:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C93601BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B65386074F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiNVauLLsfMR for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BF24600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF24600B8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BF24600B8
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D7F71BF20A;
 Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:43:08 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240716144308.618a1abf@windsurf>
In-Reply-To: <20240716094305.1646641-1-buildroot@bubu1.eu>
References: <20240716094305.1646641-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721133789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBFL+nZwvx986K76G9SBVQ8uHdXY/rI486SyQQ69crk=;
 b=BVEKtVqxmY+EU1oyRK2qRe8aaGjY6MaBVDNNW8VgslFLcB386zp/ZUoGx6K4wt8DcN3wfA
 m7Y2S1wVw2/KIhmRtNp1WLeUq1VGNleGCa/OLv+cc6EEKIUJP05BmVjdT3UyIBF2hNN7xu
 r8+EAj4Agjy41eBaEPJ0FaNhdKBH4prctjFXq1PqbFVzIQDnwhul1Ti9+0e7Uk7qtYnk74
 b9NgdV+Qj7rD9lCQqUypdvyrMrDXXNi0L9JJFAVdHwKHNgZOJm0USAm/cB2kTDKOiAMK4o
 qxV0mg3OAatIYUZFSx95jIaUFT88KFcxmYrMJpVas/Ct0vlQWp2ieCkZz7aU0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BVEKtVqx
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to v20.15.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Daniel Price <daniel.price@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jul 2024 11:43:05 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Release Notes: https://nodejs.org/en/blog/release/v20.15.1
> 
> Fixes the following CVE's:
> 
> CVE-2024-36138 - Bypass incomplete fix of CVE-2024-27980 (High)
> CVE-2024-22020 - Bypass network import restriction via data URL (Medium)
> CVE-2024-22018 - fs.lstat bypasses permission model (Low)
> CVE-2024-36137 - fs.fchown/fchmod bypasses permission model (Low)
> CVE-2024-37372 - Permission model improperly processes UNC paths (Low)
> 
> Also these additional CVE's were fixed in the v20.12.1 and v20.12.2 releases [1][2]:
> 
> CVE-2024-27983 - Assertion failed in node::http2::Http2Session::~Http2Session() leads to HTTP/2 server crash- (High)
> CVE-2024-27982 - HTTP Request Smuggling via Content Length Obfuscation - (Medium)
> CVE-2024-27980 - Command injection via args parameter of child_process.spawn without shell option enabled on Windows
> 
> NodeJS tests are passing:
> $ ./support/testing/run-tests -o ./outputs/ -k tests.package.test_nodejs -d dl
> 12:02:58 TestNodeJSModuleHostSrc                  Starting
> 12:02:58 TestNodeJSModuleHostSrc                  Building
> 13:17:15 TestNodeJSModuleHostSrc                  Building done
> 13:17:23 TestNodeJSModuleHostSrc                  Cleaning up
> .13:17:23 TestNodeJSModuleHostBin                  Starting
> 13:17:23 TestNodeJSModuleHostBin                  Building
> 14:06:15 TestNodeJSModuleHostBin                  Building done
> 14:06:20 TestNodeJSModuleHostBin                  Cleaning up
> .14:06:20 TestNodeJSBasic                          Starting
> 14:06:20 TestNodeJSBasic                          Building
> 14:55:40 TestNodeJSBasic                          Building done
> 14:55:45 TestNodeJSBasic                          Cleaning up
> 
> LICENSE hash changed due to changes in vendored components:
> 
> * copyright year update and adding spdx identifier [1]
> 
> [1] https://nodejs.org/en/blog/release/v20.12.1
> [2] https://nodejs.org/en/blog/release/v20.12.2
> [3] https://github.com/nodejs/node/commit/d5a316f5ea3fade3140c2ae35c144b500fb5d758
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/nodejs/nodejs.hash | 14 +++++++-------
>  package/nodejs/nodejs.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
