Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3DAFF8864
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E76429E2;
	Sun, 26 Apr 2026 15:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf9fMzCDuXEf; Sun, 26 Apr 2026 15:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921C9429DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217645;
	bh=AFojKL+j0EY4QDdywd8DZ+xE0wwKvxnysOS6MfJ+hPs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CIWNzRAS8d2Ow2cw0X3w/dXDWcNLlZ8UEh/9J+LbV8mJ+PbhGvY8X9FjEMBjUoLG6
	 G2ph3XxHT8t5Vd2sNazVRzmQR/2ykAKwI8NuULjvVN0jgC28CODWtsctz9Nit8XhvU
	 LcHa0ibpbOuDRei4zDgBH13cdVDnYBtKayHtlJAv93jHk4DdgU9oHrY7xpbLov3cas
	 ZkS5xc5sUfCcn3JLPNeHKBwHMedWzAghIBvOWeHy2041OVHw5MQXRdARFTJL3EXe4A
	 j535hWNjftwnL5lKaegyG4iQta1wsQHDNu5mm6VsthqQ+SkBm20LsX3Y2/3eGqp1y7
	 hd/4gv7vZHAVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 921C9429DD;
	Sun, 26 Apr 2026 15:34:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3CBD231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E188C401FF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqbI41cMk5pb for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A4A24018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A4A24018E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A4A24018E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:34:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1vFxJ73IZy-00yoXY; Sun, 26
 Apr 2026 17:33:55 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:34 +0200
Message-ID: <20260426153334.1026982-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YhhQV71LtCoEiIw6W87+xIUSTCtViv0Iu8iEr1EoNNiHaDn9aSt
 zq1c8AwCpmZ8M9D3Cv3VCEoGQU5lk6J5jBUOOOk8Hz8NySNpFOo6xYyNL/LyEKOIJ80tr0Y
 w0j+FEwgs6ezG34cRjIpLzMDVXJBGZyNeahV5/QEoeK4uRVJtEMapSLguxUSlyzWoIKbrPQ
 HqQne6tvi/7EUsO3gCiRA==
UI-OutboundReport: notjunk:1;M01:P0:tZiGcKLP0yQ=;HuZHZziLBomBupRYx9jekOgJzny
 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
 zL8+O2/PbzQE4nQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217636; x=1777822436; i=fiona.klute@gmx.de;
 bh=Yw1ykM28Qr7GqjZfJiUDNOqv9vKsLsU6B6m5VXGnmEo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GooYT3hunxzEbMNunGxrXi9JwBNVY7/FNxL22D9kjAf75FuS35x8Da2oOvN+kjmO
 5+E/mOxiyZSfvSZuNoqRpKVLqXn6YapRaAfQrNcVLh0yYeCemjqdjnXVXoj7Ik4hR
 0H04BcO57DEGB/XH93c0myPI9PsDZE3LLu1TClg8FQOBpjVdcSaRVKnaykNS6k40g
 A86HTlLjiDWOwolTG4KQjpEJ7eV+SNuXIvzleAHm/H9GCoZX4DuFIMm0ZXLqkZCjE
 GMTMm7lkXovDCzf1zUuLXGkyyKIh9xIB9vT6+yPUBfaCdYMsynw3JOcbE1n8x7fYX
 rvPUoGnaNrZxDgmCcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=GooYT3hu
Subject: [Buildroot] [PATCH v2 6/6] support/scripts/pkg-stats: run main
 function only if called as script
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

The __name__ == '__main__' guard allows importing pkg-stats as a
module using importlib, circumventing the normal module filename
requirements. This in turn makes it possible to test/debug individual
functions.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5dcc812e2b..2b2194b9a5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1334,7 +1334,7 @@ def is_newer_version_available(pkg):
     )
 
 
-def __main__():
+def main():
     global cvecheck
 
     args = parse_args()
@@ -1403,4 +1403,5 @@ def __main__():
         dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
-__main__()
+if __name__ == '__main__':
+    main()
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
