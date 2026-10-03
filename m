Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9501CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 982AF81488;
	Sat,  3 Oct 2026 21:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kEsz_ZxSwIn; Sat,  3 Oct 2026 21:09:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9C1E88148F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061746;
	b=c+DERBcDzjWzE1EBH/k3bKZAuk1C/d2h58wh18t7qsUiOsH2GL9hHAgPDn7zVB6Su3CE
	 8MKCTBFnQ90fxjTG3GeZsmzsevBdCyxIiYTACHpOnl7uLEKyeGsjAfY2PUFtBB8G+xSRu
	 0fZEDj8sajt4D5u9nVu/RUzaOTW9tP6nzkZfRYvlClxF0qhlJ9KLedMI8nB956YhQN0Ty
	 ePsLzyF7XjQrevsScOoRE4HtqLGypyBsB14+mLZI0qBPcgCefL/baN5zcSUw3faALpToP
	 FSJr+OlHOtpnOTNuKkMjL6NiETB9lesdEcSOkfQIv1MWjc2hsnXnltLuR5ze9COAtLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061746;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OCa8rJFDnXt8joNppP0cfEN1dS6XRFhopM+Ac8XNpIk=;
	b=d4LelnUM/5rCVPzQmcFaG8KSnl/UVQd8e524DOpvhkPNSlt+/MWaV84rUmNqXEbAt/0S
	 SUvD0C0JGxZ/cFlZPRYG/UZdpEjYlmYce5IIsS2uHLIAix845Y70CAyJ/AZZ5Nk0T1yOq
	 B5lX29NCPS9l/+0yoyyXXob9PFw3ST12iErq3i2xJO9mgRLk3Kdqay7rD+Rov4O15PT9p
	 kjLLtFxweB0VabMfg6FD8BX01HN4EUXHF7NeoFBmqbiRz7j9TvtXu8ROLASX55glbTnBd
	 LvvGQflg9/PPEbM/FlJgRe/AeNwmW3ZpQuKqZRdEhIppaO2CMaEmFGXT0oj3R6PR8Dw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061746;
	bh=OCa8rJFDnXt8joNppP0cfEN1dS6XRFhopM+Ac8XNpIk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bTPHM4lgzyCDWhG0xM2G5q/wAc0mImsdqjTGXAQoKCv+hZ9RSlw7DldSderatSnQc
	 coXCD7CUpUs7erJH4Z/kZ6Vp04C4+QcYMkWEksiMtuENMgx1DNKKJ+0q4DzxlcHY2E
	 lm8xeo/+exYLIQdcTk6dFtzqQMaU1RrtcAsQfJR6M6NzcfF4N1zKWuRtOdL01R0BQj
	 JAhP1+zTH8m9i7w53FD+ifF+7yIp0wbFtepwryJ27UmPttl5lykjbd8ex8hsIC8b3V
	 /nuUxrlxuAApPtEZHyGWTyI9FkFm7EXdKAGhw4boW8V4fag1Gmr2o83BzqsibfEb4V
	 7EQT3tYE/QCKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1E88148F;
	Sat,  3 Oct 2026 21:09:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D78C1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F041260E4A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9GP4bgQ8CTk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A730B6066E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061741;
 b=rlQZ29QwDiE18B2LqYCj6TGbeT/4ud3ii9ElQBgKA6xYfa01c/IvQbjypsC5R5l/OJZz
 0CELhpaC980yCugBgute3ywEs0wZ+LknFkNYocsZLuSFfXObKOQ3w8xoSBfxQc0JzPY6A
 jP9Ah+Q1GfLmbVzFmXHIjXoBHJ6q0KOhS3FIEJndubS9I694SCCHNzO5kjlmlsobTc3+i
 4EO2DfjMVmQ+/40EpM0C93guyz/9/VnEaEIATU7To6teTi2l/oXcUqvEgZIsbXDcxsIOB
 4tTR6nt6q0WZ9mk6Qr/FpzrPCeIoIdni2uRKqgN8t5j9L3wkwyqfGvAxCLFLKuX0OMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061741;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ykBK6ytHP0NNEN9jxATPzvaUrJkg5M+EYYsymGvOGBQ=;
 b=WpIAts/7/Y8vJBt8ZN3jhtS5HIsrc+mkp1nEURVajYET7BvEWn8DDGJCdweHYR+0iYea
 kdzxWtuJy36wT2o5n4ZqgjucRaDvEKe2eXMdN82XAADBRhi8HD20DouKTXDKW49gf2Uyx
 gXPMxy1CaNrYPcBEoMXUbMg+k0Wzc1JbwPVRaa8eIA4Ne76hGYl8/S2JZ3gfZ9Z5HM/fb
 +gB1OlCh174kujJyZ/4847KdpGAyZvM0aGZD8Jw+8Ix1Dpm3DV3HU5oqH23LhGs4ZTJiQ
 QtJ1JNxDdT4czB+1WjeeeI0SgG+zcj5CYkbNoOGKqI7m6ff/t9SrPhH4Wt06JfKH6Kw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="X/yg8lRU"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::29; helo=mail-oo2-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=X/yg8lRU
Received: from mail-oo2-x29.google.com (mail-oo2-x29.google.com
 [IPv6:2607:f8b0:4864:31::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A730B6066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:01 +0000 (UTC)
Received: by mail-oo2-x29.google.com with SMTP id
 46e09a7af769-7fcb425fc2bso696483a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061740; x=1791666540; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ykBK6ytHP0NNEN9jxATPzvaUrJkg5M+EYYsymGvOGBQ=;
 b=X/yg8lRUKIdO5OVh538No++yLWAl7DYD6EkS4NCPe2qxD/P+NegkJI6YB0rnWvtiJG
 PKzAhgz1yojRW09K3jWKuvtUAI8qtKRB4lCUtuNjck76jgoz1G9I9H1Xd7Iz9eFKjfJa
 Rlh3JtOokPXf24sQwDN3rbHXZ23JV7m8E3pxM0tMUlBjmwpGyK5+WS9U01MT25oMJUfj
 oKfecKEfVbJM1eD1ex5JM77nXEZp+gN8emo2vNgihXw8ninxEudnho1ufH0w5UfT0IKc
 +FJrQndrhvMsVeg4CTCSghYpHb+ZT2fZgUfbvRkwk4IiRgTBByFpM7iuJCngO7W/6c8P
 ruGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061740; x=1791666540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ykBK6ytHP0NNEN9jxATPzvaUrJkg5M+EYYsymGvOGBQ=;
 b=xnBXd0jvY9B/tYXp9467rdRvQG6CiAPUV5562Zkc8WOqRqUEIC8eKmkVRXr5z61xNi
 Z5qKsNPqhO0sOTy96KXYi2dGJwrD1KwH25+UOinlDERuB8sqh1Kc39luzX+VHj63I6hU
 /bRYTeAZ67biD6VGEACiKBWxnhwHv/HK9Di1jTNhdniETcmDUJ38Z9hGPbTzGPKQMrp0
 ZapPzwC8Gacp5+ulNhfMAriuMHeCih8paQ0eENgMVvj1/SobkZs0isVJlgDr4uBjcHyi
 u2p0rmA57MDwu51hJGGee5iCFtEQSXzk1Hjq0Xk6LOpZj8Q6x6tE+9s9W8b0mpGxcOb+
 Typg==
X-Gm-Message-State: AFuF++mME+2MRjh4A24fAUazzKq/t1Vyb1ZQJRU1bpAF6/FfOxCwLQNq
 pyXOjxCO6vVehwFwIUGldcWFo0Mo3tPqgEf9w64c2RuzKOdlkwpFgPaKcdWUJw==
X-Gm-Gg: AYBFou0UJXWEQHPgbBumDD3xAs3MGFuDfZ3Ve0CddVqhP4rcZK7LFn3TLSQaSdqhRmd
 +/eXyX7IooZgOXdu6qpt0pbjrrN8U5vZz4nh5sAe3sWFHfNTve08XH6BQWXY7rgJQ6tv8wE4r/5
 GpT2a1bXrf0gSebkDgbw3ymE+io8akdU5gnra2dDJLAf5/ihD/IgKK00SnkI5db669LdwbGIVwe
 MZpwBkvN06N0eG6sALfboZl3LNiLAI005kYNtyP0dM1xgSvsbJz8CsWol6YnrWKAoi8rKE7Wypp
 89ozQH9eCTkM7kV+Y0tQd4zheRSIMoV/Bd0kQFKcHAtebFaJF6Tfstm9fd6be9rxClsI6+Dk+N2
 rPa6HJYsrvcDRIDyUqmxU9t4jXMracnRB212rJKanK0kdh/G+sBlUIddKtRa5zrAc5rx7qIgsy4
 5D75n9i0Ehg/Xw3ickAObsNN2/XLQJ2IR1wE6lgPyxCDPJgUQdezXYKnKo1knv8Jm+cXDFFwyUB
 HtqTl3ARUryZfNHQK6XiEBNDALcdwDtb3XqcoHFoJKadY7SUQBe9PIrysjrBPzrcQ4MnyHpuVIt
 /FatlxZP4a5PpuDlvotWngAzmkAoBvZK3UNXQ7srf9nzXD1RiekInwMZcP6mLNZWzfLvlLqcmYz
 Ao+EuDIAHa0VTsKlPQ6p1NdD8lfqvhuB+2sTiRzZkyQ==
X-Received: by 2002:a05:6820:4b17:b0:6dc:e1c3:b2a7 with SMTP id
 006d021491bc7-6df350599f3mr5587800eaf.74.1791061740467; 
 Sat, 03 Oct 2026 14:09:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:03 -0600
Message-ID: <20261003210833.735937-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to version
 1.29.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index 0f43e2e266..03f8b4d45f 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  53f43e79ef6085de9931338147283228  proto_plus-1.28.4.tar.gz
-sha256  5ff7ecad828e032a491fcb86947801768e32237f99dd049b649965b892ae9a63  proto_plus-1.28.4.tar.gz
+md5  8592a7cce4c385c5a6c098da6fc4961d  proto_plus-1.29.0.tar.gz
+sha256  cfb4e62ad7e13dd18f346cabbda00cab39930d36a05791fd81ddb074d6ee884f  proto_plus-1.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 6999d0a2b1..f57c1a23c5 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.28.4
+PYTHON_PROTO_PLUS_VERSION = 1.29.0
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/40/a6/4fbadcc2044034449b3f8f0ce82dcf3005d53f37c136642103fd4836a31c
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/46/70/783e33ffbb4466cc154a94f79b869b92a451e2bd45605054e68ff68b7af6
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
