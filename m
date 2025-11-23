Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64301CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 12:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19AA081117;
	Sun, 23 Nov 2025 12:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo48gHnj22_m; Sun, 23 Nov 2025 12:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F9881121
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40F9881121;
	Sun, 23 Nov 2025 12:11:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E394E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 12:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 304F4407CF
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 12:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2bDFsH4XCvI for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 12:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6D39407CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D39407CE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6D39407CE
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 12:11:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 07BC613F89A;
 Sun, 23 Nov 2025 13:10:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Nov 2025 13:10:58 +0100
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 13:10:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122171557.2260286-1-bernd@kuhls.net>
References: <20251122171557.2260286-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <488fd3467aeaa06dd69b9deb9146e522@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763899860;
 bh=z40G+PPw6zeoRAIkjBAlrpFC75+eXIip6j6mjebvlAs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CnTwyaQ4ZoS7i9Oq4VXulZ6gzTcjnushKRtyJGezcgG1tVGPQ4Na9Ui9ZwdXHEQqy
 QQDJcOtlN10lGQyKmpbsa0ypzVm7QFa2I2rURnzp2QGV5GwctYULC+fzCRjfbHHU2+
 FFnjHc0rabl8QLPWcwAnykX0WCCO91dVrm52JLyCaze8XAqWQBwBq0gObS0/4YW0r4
 z9hGmtAJXZngy7lIIOpUpab48JhrzKn6ZKBySgjJH0rBQzBYREM+xJ24z4Ny5N+kA7
 ThC9Ti4yk3m04CMIXIf5t1W9qQwSujVizb7KQ8VzD8Eg4Lb3N1Bj201tb7qjoevk8y
 jH7SvletiXXEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CnTwyaQ4
Subject: Re: [Buildroot] [PATCH/next] package/icu: bump version to 78.1
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

Hi Bernd,

Thanks for the patch.

On 22/11/2025 18:15, Bernd Kuhls wrote:
> Release notes:
> https://github.com/unicode-org/icu/releases/tag/release-78.1

While testing, I saw this icu bump is introducing a build failures
with python-pyicu. It might need to be update to include commit:
https://gitlab.pyicu.org/main/pyicu/-/commit/ab9bb6686b6490db099482d7e8239747f808ca3a

I also saw that xfsprogs was broken since at least Buildroot commit
dcee99507c6767230fd1faeeefe95f5662eb03a3
most likely introduced by icu v76 but Buildroot bumped directly
from 73 to 77.

xfsprogs might need to be updated to include commit:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b

You can reproduce the issues with this patch applied on branch next
at commit 6a73f71, with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_PYICU=y
BR2_PACKAGE_XFSPROGS=y
EOF
make olddefconfig
make

While this patch is correct as such, I would like to merge it when
those issues will be fixed. I think it can be as simple as sending
a bump of xfsprogs and pyicu to their latest versions.

Could you have a look, please?

> Updated license hash due to upstream commit:
> https://github.com/unicode-org/icu/commit/4b444321f255076d6576e6d435ffe2589bde6f18
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
