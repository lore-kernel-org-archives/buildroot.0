Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C20C61CE7
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 22:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07ADB406B0;
	Sat,  7 Jun 2025 22:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IklbC5U0vem6; Sat,  7 Jun 2025 22:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BC5407D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BC5407D1;
	Sat,  7 Jun 2025 22:10:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE0AC8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01BD080FFD
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eF0l5ENRgqvw for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 22:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5085810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5085810E8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5085810E8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 22:10:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1C1E62003CA;
 Sun,  8 Jun 2025 00:10:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 00:10:13 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 00:10:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Gilles Talis
 <gilles.talis@gmail.com>, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250606070152.396438-2-elmehdi.younes@smile.fr>
References: <20250606070152.396438-1-elmehdi.younes@smile.fr>
 <20250606070152.396438-2-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <4c18396723de648f7adc81ef1d93579f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749334219;
 bh=6zhiWWz44AGr5giO7BEYgfu9Io4ImcEUkLD9kIbhQn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qVw+v1OOAjYt/ddxKqiZQ0Q8axRI5E8o0Z2sGK8QJR6o4n3mkAZuyiywZ0tEGK810
 B1liUhwN0MORsj+mn7a9KpC7flPWcoiS63iVMNCV6IE4JwqVF3wvxa0miRSieyrhq4
 2MJv8hl2RKKb4uvplVvYkxvHhp2E8XpsfOW7Z0HgYXJdv8dNZJvqBbr0w1TVRHn7X9
 1cpR2lt9nWAKa2J1ToOMVL2TCBZiZBBacmA2HtHjygH9g5kOwnMXwd7Csb3ol5yOtN
 GUuPT48UTN+X58j5TDgrqo+h9SiQ1BUzWSG8IPh0g7QOXGGD7V9/PujeR49gn0dBav
 i8zBKbQCxmpXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qVw+v1OO
Subject: Re: [Buildroot] [PATCH 1/5] package/opencl-clhpp: bump version to
 latest
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

Hi Mehdi,

On 06/06/2025 09:01, El Mehdi YOUNES via buildroot wrote:
> Bump opencl-clhpp to the latest version "v2024.10.24".
> 
> https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2024.10.24
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Thanks for this series!

I applied it to the branch next, with some minor changes.

For the new packages and runtime test you introduced, I added an
entry for you in DEVELOPERS. Please add yourself to other packages
of interest (for example mesa3d, opencl-clhpp, ...). See:
https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

Also, I renamed the test_rusticl.py file to test_mesa3d.py, because
the actual package being tested is mesa3d (and there is no rusticl
package). I also changed the test name to TestMesa3DRusticl. This way
the full test name becomes:
tests.package.test_mesa3d.TestMesa3DRusticl
This reflects that "Rusticl" is a test case for a configuration of the
mesa3d package.

Since Mesa3D is one of the most complex package in Buildroot, due
to the number of configurations, this test_mesa3d.py could be improved
to include many more configurations.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
