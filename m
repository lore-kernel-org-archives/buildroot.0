Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586AFFF8864
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7033042936;
	Sun, 26 Apr 2026 15:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYymkGuTGxT7; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C02AA4290D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217635;
	bh=6iRv726k5KHUNq8373xzWnZsayA5deAc3T7knK5tWuM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bMZYrmQKA+6AalUENacdYFNZWfA/ypY+C/VIaPjIfOG5x09CJhtC00bYEq6w9dsBD
	 1yxMkwWs9kvGQ7+qRd+wsg0tvAMeOga4mKLy15FgmvSls7CKWP/RdFuV1uGX4inV5P
	 4U3vThpu0lA2Ye6mafLcKTN/Jmlon7/uf6+St32Xpt80jlJu18mKWCnL0IDHTfgmwd
	 Lrlno5DolRNKioDQBydOfyyPQTiVUi6rtPFxr24ipftAgKPKj+T+D97yUdw0EZMlPq
	 94KjSzCu/OcYentk85/XfQf0872f5UISk7WYsCcb5AY1pR2fpcDu3Fxhuv3AZsfQNx
	 ABExUHzYzl01Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02AA4290D;
	Sun, 26 Apr 2026 15:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 642EF2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5560961C0A
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiBAkgZH_V61 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A99E61C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A99E61C0B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A99E61C0B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1wF6kE0dxZ-00Dxgt; Sun, 26
 Apr 2026 17:33:47 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:29 +0200
Message-ID: <20260426153334.1026982-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mleC8XVCzHezdw31S6pBn+/azHEZLT+6c/7Hkvb8wEMk14D/D9m
 yhyn0b7wU7N6QFdAEmKMPMSJqEL5PBo4xd5qNWtirHPBJ/edGFio3teVRjxM4GfS6fAiBIW
 PROnxJgtzRbV1RjA5GrMVHZRMbTJZAn3vgxQ5pKKZZHG/n3mckg/q38YjFcXacVGqunSJdG
 nn2I/zOedRCCMkGygQheg==
UI-OutboundReport: notjunk:1;M01:P0:0IVELp7i2TU=;w5rPQydgWPNxRwKqmC1ME3zWt0J
 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
 jG49Rw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217627; x=1777822427; i=fiona.klute@gmx.de;
 bh=WjuuFixtzZHN6fn7XN/kAy3S7kwJXnbBPpmfgK8/G28=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LZBMtlTv7g40mU2pzpAjU2Dvh7pFU1h6vvLdibr8rBcvFNIH/EO/9yj0qhSNnDQG
 e4KDDD/tSzCv2VrFM7+ekrxgBP6qHrM46WMWYWBFRSlpxgaxUDY+KStEJnE6MnYo+
 UoOHp3KO74nL33aoVsdKUsuJKVKPK5lKdhvEze1V7PavzuV0V4vdjtCGF0IPt+VcS
 bKAqc21++mMh74ctyAD4Bl7m3Qf/R52dHGhHl6xqfzKRdlZNXCKPLh0pTROu65FMG
 lB9Kh5cVSnIxYPb85p/EH1FFXn8xGUposahajdQRctSfeNV7wobNTB9DVcDEQlM4T
 h4AgNz8CBGgm3Ov1bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LZBMtlTv
Subject: [Buildroot] [PATCH v2 1/6] support/scripts/pkg-stats: search only
 Config.in{, .host} for URL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous Config.* glob also caught linux/Config.ext.in and
package/php/Config.ext, as well as some backup files created by
editors (e.g. Config.in~ after editing a Config.in file in Emacs),
leading to wrong results depending on directory listing order.

Also use "with" to automatically close the file when the block is
left, even on error.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This cannot solve the problem we have no structured URL information
and don't look at which option the URL is listed under, but at least
it's less wrong.

Changes v1 -> v2:
* Try fixed names instead of globbing all directory entries

 support/scripts/pkg-stats | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 55aa63c861..efb85a7405 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -148,17 +148,17 @@ class Package:
         Fills in the .url field
         """
         self.status['url'] = ("warning", "no Config.in")
-        for filename in os.listdir(self.pkgdir):
-            if fnmatch.fnmatch(filename, 'Config.*'):
-                fp = open(os.path.join(self.pkgdir, filename), "r")
-                for config_line in fp:
-                    if URL_RE.match(config_line):
-                        self.url = config_line.strip()
-                        self.status['url'] = ("ok", "found")
-                        fp.close()
-                        return
-                self.status['url'] = ("error", "missing")
-                fp.close()
+        for filename in ('Config.in', 'Config.in.host'):
+            try:
+                with open(os.path.join(self.pkgdir, filename), "r") as fp:
+                    for config_line in fp:
+                        if URL_RE.match(config_line):
+                            self.url = config_line.strip()
+                            self.status['url'] = ("ok", "found")
+                            return
+                    self.status['url'] = ("error", "missing")
+            except FileNotFoundError:
+                continue
 
     @property
     def patch_count(self):
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
