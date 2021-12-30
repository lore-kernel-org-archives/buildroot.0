Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B551260C31;
	Thu, 30 Dec 2021 17:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jf7MhUrJKmEw; Thu, 30 Dec 2021 17:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266C660C23;
	Thu, 30 Dec 2021 17:25:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 196BA1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08AB260C0B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6PqWTnuDIum for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:25:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C682760C2A
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640885145;
 bh=rWruIAn/EIa5lBZJnxJqGHPooJ1J9zm9RF/xWUEGK24=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=QNNvQKkV0lB37i9Tdn/pwHZx4PzogQHo7GhS/LuOLAj9cAjg0FC0M9p3+gG1u/Szd
 NS5XiSyqAOipSLczQEW+ObXYPopT8RzV7Y1tDc6JcZjcfyLxDdh+RmlvEe44LHhWOB
 3NI1b/D8ic+EDhRvUJhS+DX2s29jFoUvLiz7h67c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.96]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1mM8Gs1K75-018JyX
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 18:25:45 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:25:44 +0100
Message-Id: <20211230172544.30558-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:+/Fs+ZHTTeQlbVblq0THtVoZwEbHRVeT1F0kHgcNSwPkwwnDQL/
 s41PrmI8CQM+VLzzpYWBWqxlHkSZTY8L7/za1aSFILxWpM+XG4osxAflqmoWzNo/58UqI3M
 evz87DxmCDTuaaPPUPDj/JT1oCi/H6ThSySb8hilxJ3YYeTDfzDR8eokA8+YFgz705RMEx0
 MNc12xQrLzCT9qLS0jv/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SXhSy8q9tGI=:+yDAl3p0tm0XJ84nraoZmP
 4FZzXHDbsA63itpxBVYnBD0/nnPjR9XJUvVqeBt1z62OxmmBHXEIX4pna1OqMBwKjZI1Kiy89
 kknL0whRZv/k0KwwZhSoP6Hz5hnqleWv9Z0sxYlRYqwgG/6uFQGqEe/pvL5fGuoL7riwWNXve
 sZt2QdbXNoYj81yoQjgVnIrqepa5IpfpektsamaIl17EtSWjwiQSSEaaoh0VNpqes19yVT9q/
 gaP0OkLa3KZOrjY3c6ndmAEZsyMNJEuEnVtxXTGc/x72MZwjUcbH9tXtEpdhUcweA4B3qt2U2
 PfJBhfgXfQ86rDPMisoXBcHHh+L7pmTucc5BQeuVrqNtK4UxZWfa+BM1/955ZnpyFKfkpFIGo
 oTmnX2nseW9r9D3YVJYgRA4GPzcFpwQSQrWolvjhuIyFNnMj7vT1uniWz9PnQviQlh77oJY1b
 7+yscuW40ZhGbPF8PpGioeoi2lgYxhhU5DI7R903mT9xi0LzuUtCNaWqlTnkpHfs0jRoBTvfi
 z0Mv79Q9LcYA4FwYEgLFim/1TQyYxP2SnpyK7clTnQmewgkZevfPGSLSeeFfaikIzMC15JBkb
 FB/j8d/pwHx2fYz+mtT+FlHMKvu4vN0WoE4S7w8birjCtZwU0S7cfqi2fFELTqPoHoZ8sTfJK
 s1KJl+IcgpbX+vlUGFVxobB/yRXop/jb8VNyUgHHgTNeLtThYOh3o+TBZCUmKQgK2KZ/c0DdM
 iK7wuHuxES+r3Q72jnxF57+m/W3OlsYGz82Y8bM4dmUVlkhI2QhR8QFqpZBXnzIARkPZZWasB
 Q7H+Odij01jNdCNqtH6vwKFepZUArU5dji12s6YVQDZW/r+6k/3qfHKRqjHHwzJBYi2UHGUwr
 teUvDTvPzQfcWcZmIHTnz6m9OfyK9qvPVFh9MnuCdEg/9QAlnbWxoeY0U938Rzmwe8wsUedIu
 f5UQizjXL1hHHv5UGvsXNUO0UdVPZJshEKRpMkjBm2uqrCl2rTKzI4uDOiOwrEVnf4zhHsTZa
 3hLBHPmCCB/jHqN2waCvJwPAVkBB3lcZ+cHDAsEMZtNEsQ/eeohk03tefSz7gxU6Ht2h7Drzs
 jkeBsFChForAYs=
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.1.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/assimp/assimp/releases/tag/v5.1.4

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 2f4a308c3d..89b8d168c2 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  50a7bd2c8009945e1833c591d16f4f7c491a3c6190f69d9d007167aadb175c35  assimp-5.1.3.tar.gz
+sha256  bd32cdc27e1f8b7ac09d914ab92dd81d799c97e9e47315c1f40dcb7c6f7938c6  assimp-5.1.4.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 90a617e0c6..ead5d73bca 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.3
+ASSIMP_VERSION = 5.1.4
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
