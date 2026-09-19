Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924B7C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 09:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B473810DE;
	Sat, 19 Sep 2026 09:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhOccO30guja; Sat, 19 Sep 2026 09:47:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0EB1381069
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789811273;
	b=S2pxpUoeLaPaf3mIjJtP4HfiI45KSHZgzy9d+qZEOP+ae4DPVTxcvwoiUNWiEOgmcEVd
	 OKiEP6gxiAlWsJDKlap+GxDfMhDMpAZkwbLOBssuG/mzI0NYNnWsB/26EYObyy5tdEACM
	 0YUou9tDJCpAeD1HjJUiihNs1EjvuLX6Ir2uaRv8Q2JW8NkubRG7Is11Bd0K97ppRnKzp
	 4IwtiRiJimkCExtwIdt2e2hQ6LYq7N2Wapr5wMr8pl1UxLdHieHEo3UO1aDP7gInrMpMt
	 QlrOknBZbW6gJDC4ypb8rfs8fLb525zXmZxnLT34FO+OOvUVoqwOzfT5vaYPtdcqIbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789811273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6fSWEMYpV062WHwAs+kY4w04MuDmu9S/G9/SPbV5Zok=;
	b=StTQjFtfMP8FX2oBAirwjKPVojRCBhKyuBg7iZgalxsm76uuuRQe0M2EFlQvh+K9W47+
	 9LEKltstHknQo3pp8sv8h9K9Ezb5OVKUTH1LFcWzLYer48ocN6ZtUb9KX52d9580PC2Y5
	 KF6q/1qwAJ5YnSAAXYDtjvjsEspYHPUGFK+Ltp5L4ROsq3cTKZL63GfkyFw/U+5wC2JrH
	 OoMzd9BzKbtpnbHF6mp0Yv43frQ8T34SfOzK0En5EXcGdQQtEcgzQMKdUFAt00Xa74xWh
	 d7M3a6aoaUyqpPcJKohj0fEOd4+WJbZJfH3oYu3pZQ+wGnhoZ+EzriSyZ5Pye7bEa0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789811273;
	bh=6fSWEMYpV062WHwAs+kY4w04MuDmu9S/G9/SPbV5Zok=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JiZT870h/I4CXdcm/qhVPptY1qF4VzM8XzsGDCCy19+AcoA0IEjb55Fd1wQHvFStj
	 zuO40NPSujopqQH9+VB7AZ6pbUHLMesWAgpHx7pGCP2PH7P//SMph0ts8+h9agCfOD
	 TUaDgU+Ck21PmXvynMm0VIXtHyOdYTPmsSkgPvuFzFRTK2YvSNSWrTEG+Au+6eDVV2
	 Zk/9MCw+ftBpH38lnt5FvJ4U3M9sMpHGuCyqndgKrE38UTE5AxzxHJ9zC8gSers2YJ
	 kwNQdpBVZMzNXkW1unB8VqnqJwLBr0P9lyCZXF7ZE6PQePl2yuWa0P2rKgXECisZck
	 LdUXDSTt9w0VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB1381069;
	Sat, 19 Sep 2026 09:47:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB276333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD06D60680
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gji3116jA97 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 09:47:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5124A6067D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789811270;
 b=GdozTNgArTvZy8M9rgKPO45P4omWyG22XvrWngtbciQuFSmJ9Kuo/5AuNmmBzF31qEnx
 yJ6BDXGml0+uGnFg85CfhFWw9XzQvjSyUANHZDRyEOIgXjwZ4hfPWVckXvtg55aaqPknA
 iGwEKbszCGsE83/pup19EKghAiOHJuQgxTvAeHoc/uyseUWR2KeWDBN3eRIeXOkTWk0ej
 XBiPdK8pO+K0NVJ8242f/vtSx5no5fPp4lMywOAwUepks2M/UYnkxBixM9GmntPY1TIp/
 TysdbKoIR1MygHxhmIQcth6IgnkOGLUZsg6HpZULjUsiJrgi2bEKbpMH/Mkr59oMtXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789811270;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9QWRR2+QJs2dUJ+OnfKPgGQ8RNSzzJIXt9Qb22V8zGc=;
 b=c6g5vvJwatCLCpMu3PRob2OwApIfNtUyP06OH9x5+5hrCr4a+kJs8N6yG4ou0iCn31bv
 6o4xiTDyN9IGfecSqgQDIRuRnYfONQ00DhBMfVHzeWx7heGk771vZqrA4x2ALfvkEqhEM
 oNuOnUQ5LV8cQsqkxFZZz3vVL3c1gehsUI7s5N4nM2+Z4FlRMpGiQ4OV82rzjsuuO7qy2
 3FZukkC20NkuvA54jgUFTjqp7l28bi5zKDRXQcM5eJqUlRGqaPHHPHQ5AE+5SxTWvzU4c
 ZmAo5ZSjZvoG55PQBgnTHTXOdYQlJZ2MCc+wYsAfvqGlMkp73jU4FKN+Om/2EGG0wcg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q0qutbrm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q0qutbrm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5124A6067D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789811265;
 bh=9QWRR2+QJs2dUJ+OnfKPgGQ8RNSzzJIXt9Qb22V8zGc=;
 h=From:To:Subject:Date:From;
 b=q0qutbrm0WOLxCUyk2S8H6/mf2l2gGkf3QKCwOIU711dfNpT0cu+UMhVKqcUo9cZm
 Z0Xj+8Uvi4nOR4GTnIZigUDD/B9eN3aJa8PN9Xi/iQku2BsZ9+3pkdhcCleixeoNrc
 +aslzUeY1QzfCNYfSy6FmAhUFoT1268QHnUX+2JgWrVcNl7XevMN71QE3m3E1CAaUZ
 WlGB3kX7EmebyNxS5ypZIcvclLnYyaf7KUkP0F6rYxnwHIz5lvxgIeszYqwwE5x3Wd
 rC/2fTsp5RYCol/hXNR8ol5Sgr/zLWYRPS3s8b7QMlkdVQEYL8u5RSdX6uITBx8ar6
 0oLOXkyVl3mgw==
X-KAS-Sym: v3:f51bdf72230551df:TsSkjka74s0TUQ73/Ca2XJk0wHXjXFRK5QPQMNPZF1UQgM7B6a95oqDcmaGLhgs6aYh3Jr0/IAh4PgrlcwNcs1T1M7VgXEwm5/dFHBA4y776B7UH8sSvS/1sgmxRnSmEBsPuS0H7M+yewycJfdaWSeM3HgA/VOTZsj7VlMd60ljMcTF4nmHKDXiI5yNK0J9F/9qDYwxEgikBeX8JmQTbdKeKQSYLrAcNo1H480xU3aqVaCgsx7comkODWZb8+W6Uoa3JR/NzfGQ4Ex9/DHxhT/Lf7H3InVvFxxIoe+YSmX52WEjQzgx/KDtIJZaDjsMjedShz7kxAmns+SwU+VNgmQ==:JJpHUv5r9umoY8jOxa5GEgKS8lItTGZDj9q/z3+4avIirx7u8r6SwAHI2LnSXwwgke/WeIfkJyzL3YTfw2uzgWl3puXJsdUDEnsND9rgg7G5/qqdUIGItgSZN1zFjUgV1eAMkXINnr6I7TD8ahPnNt4kKvC7KGta/AEX0hvB8ScOUOOS62uxDM0jpKberUd0NFIs4YxR/kFAZHgSV8xqVZuBiIuwTzXzgxuQ7+JDGVPrZzeH2IWeVbD1LOen4JYccv7Y/Jt1T2z+ay5XGqAMfGM4KxNct7EraeeucPasQWPvYVNh4zC3W6ZsiX2I8+22UJGCyzIV0FxuyI3c54ySEAcWmySdUyLZjCLC5NHWaG1MIX5X5L5BBhEz2WyQ3NZZHF0paBlljofC6xvdrnzsAoJw/d3LyMb0XLh2/ke0DIOqoTLDR6C+D3KBUuBbfvVepDL5ywJ4vLJWt9M8+fPkDF8RDUhQZf/CQlXvfpoLEZ5iD7uGZKBPruYQvf76FVG3ECdnt2Qpec7QLaBDL6AabW60RA69ciGGOwuwmeSzp8wNzSbHBltf9E16QhFro/IX3uLjlc0raFFy4vPfFCY30H47KCc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DAE2A4C120A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 11:47:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7rfc-000000007KE-2m1j
 for buildroot@buildroot.org; Sat, 19 Sep 2026 09:47:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 11:47:44 +0200
Message-ID: <20260919094744.898099-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: update download URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to git mirror, the project repo at https://git.ffmpeg.org/gitweb
was removed.

Fixes:
https://autobuild.buildroot.net/results/70c/70c54f0627d59fc5516b2917958056ce0d822db3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rtmpdump/rtmpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 4dfacb594a..9b367f3d37 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTMPDUMP_VERSION = 6f6bb1353fc84f4cc37138baa99f586750028a01
-RTMPDUMP_SITE = https://git.ffmpeg.org/rtmpdump
+RTMPDUMP_SITE = https://repo.or.cz/rtmpdump.git
 RTMPDUMP_SITE_METHOD = git
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPL-2.0 but librtmp has its own license and since we only
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
