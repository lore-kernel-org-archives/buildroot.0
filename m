Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E24DCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAFA40B24;
	Sat,  3 Oct 2026 01:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mQXQgmcgevn; Sat,  3 Oct 2026 01:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0711A40E61
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991239;
	b=n59rC7T3oF112h0PMPUVM1yBKNcDt74Xaaa+pc+eJa7dm0gHq/HpTUezZQlE/JTZxWVR
	 b/Ky68D9xprFmW+at4QDrYLIN5gpZe2IK9fS+hut8fqqJFOnVKzCrt9Bdb6Gg4wTWnt4Z
	 CSa8WFwp/M1AtcZV6P1PxQflnuV4sagkyLvD2h1/bwOXXBHZHlmnCQ8LpXgun3fkg8Z8L
	 ktpPb4Ph9vRKJKvHeKHeauQJbfCa9IrnIXpZkCg0Z9rTSktfRJLfmAOh21KR0YPr0BGPv
	 HpYA8xI6+cw0Rlxh0ze5BmO45pxiNrv8U1MkbUPp3TJMeIWPG/9GhV1nNp6AZ9u2VIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JTJI5clfBaTw0ZS4mPFn9GiSaO4GdTdqm/Xv07sVk0Q=;
	b=aw6rHo0pM3oOjLg82PPkLx85JlhVnqT9aHbLgP20aGTuZA3s+C2bz1kCAq0e1xbFTNXa
	 G9tqfihWuemWJqJb9P4M82TSaCswIDgYQseYKHr1h+yESeJbzUthBRTb2zl88XD7hJ8FD
	 9JOm+fSAfFBPRSWTGPKZz3X6B7J//F5epZUThMEnYvmOqD18ljfi4eGFPAvuKnkFMI6/6
	 +j9aVywpk72Hz+xStyCtFmHoYNasxexiAy5Ib5f/QOlaTTgsEcMn9x5EF59cTQ2XF/pc9
	 YUfJy+yJmyQyxaHdCinoAnc16XxAy5QhrSzcAgO9plqK+cZcrAn5RqxBdH1QVzln4OQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="C8/di++d";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991239;
	bh=JTJI5clfBaTw0ZS4mPFn9GiSaO4GdTdqm/Xv07sVk0Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OHF6GgGzJe6lDysb9Y13gYtZVF4v90xbjhE8O/3XIsSkklfjc/6e38rs6cDvU6+B1
	 I1KAnN/ZRAF8abnQR9PK1cWR3cD3PsA+X8c3vBuBCkUEdhi/LGzGpJtbkh15jI+0qD
	 muG7gk8WY2rvHIk9gVoq8M0Q2uPEo0oIzcWvdlwj4414IZuTiAfFrAd1t0ywTd1VQX
	 x+Ob6F478MR32AastFZ5DT9UT5C39AwnKX8WSnvjGRntKwrqEwgxipwzwIuhdH+7Ac
	 crg5fsp1EWl0DNXMd5mwUqDrHyboWZan+ZBCBjvMKEqWLWOBfGG72d9A0PIgLxSjMl
	 6yKa1RHhbA/mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0711A40E61;
	Sat,  3 Oct 2026 01:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9FF31D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D73C640E60
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmhRJs0qhuMV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B800C40C9C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991235;
 b=SnYE8WqLX8BfJ9LObw/+vyuTBz/XwKk9nmefdU04P9t/biffqF6fEY6h9pUSfJJZVuou
 kHhId0ZTsND7lgkFmt+Dl++4hC5NqBUARN9JmiI3YR5Rh+hfVMXI2uj3oUalHx381RiFK
 r9jyArZxr0I3PGOj82dlKd8vMCU99uk8l9g1wHLbpBUP4rq4WEE7xheHTAR5bC7ggIBbE
 6q/sUFhDhCzpyFcV/1Hxpv37uOUJssoOXlnOw0ZDCOAISuXygon6nBic6MqaXilc8tv3d
 7XE4i7Di3IpcJ6+am2IVCIpbkqp+Pc8xD0x7A0wqF+u9MOBG47c9OiGvPvOx8ilWtyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991235;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=y8gyhVTsHjc9ZTiRzCPlPDacMuBVMKqwULl0eFJ4KX8=;
 b=Uhx4UC7IGKSoiN45a/VYdKZmrgyp29g1hpqLwYDRlEes30PqEPG89raZdVM2hG+TkyCf
 MKxuk1FalCoXAqyVqPFeGTitKqoqflxl2sMgR7ElAz54i1/TWi1ShMbw31B7i7PCNGIMw
 w0k5yE6zvQlBlPOuuz/F0sgEj7rKn3+SRfbm0F7ymeiZrTP5yEV4M31PC26qAvvfRqKDm
 /Mwbd1ERp/gZ0rR6Y/RlE3KrMTh+17aDZkc6sWDouV3aQLQcIFFvsfu75rPkAkbZgFlQf
 stYCRo1ef6PMMFzGurS2mchQEyazwuscGZjjUaS+vUZsQ5SCJilFb0DrSTzdok/SqxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="C8/di++d"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=C8/di++d
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B800C40C9C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:55 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-823b938464fso342317a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991234; x=1791596034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=y8gyhVTsHjc9ZTiRzCPlPDacMuBVMKqwULl0eFJ4KX8=;
 b=C8/di++dfe+FVro6zJU4uvYOwx6wH1yLjh/zdNgulBBhcuI3d5R5t/PIG/E87REbzs
 hRycyX1fWx2tvT0Ci54z6JMzLIvW+8lVScXTK2RzL6AxVYV67P760sivMKo6HGA/PJNW
 MuX9cIxc+wXk0o6svW9Tz31NJSnJVYq/w78gfJxiJlF04En+u+mQ5Btcj7snAm7VjCLu
 /bLtk2AZQe0Ac4S5l1x2GvkL+ppcw9LEiANcWRtyQIqSbOeY5wProHscWxrywOnR6mDf
 fkrAQTZ4C2IoSiYyTvHc4FI7hC6xUOT9Pgq1nULDSItEoaBA8rQxl0uG2u1vx4cZfGtt
 Mjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991234; x=1791596034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y8gyhVTsHjc9ZTiRzCPlPDacMuBVMKqwULl0eFJ4KX8=;
 b=GidrUtZDL3uMxTuvAee06Z0uJhwrlVavcufAUECoNH/hIE1avznBKVb9YD1Fr0L3eX
 eYAyiYLX1PERdrELR+hA0ASOx1TWj7BpsasbdcB+4BJoYMcyknbLaxgkIpyCE8ehxMvn
 8+JmBKbgqvy53k/HCHTN3pGayPC1XKJPIGYolSHmQR7B/o/GflXD1yK3cPWE/L8U1Pp8
 ronj1PbU9kozXgy+L4HSmKXBamyaktJJBwNBFPfqzMptpc+lNq+CAfxA2gRGQDDBM9UD
 nCFBF3VyDNsgDxu6fkVMtRd32gMikVSZinXiY49LUbp8tLlxsmpr3C+RsmyDl9onGdB4
 Iepg==
X-Gm-Message-State: AFuF++nC16FA9pjIgV4ioNDDC/YNDlbpSrGK1bCTWADG0k3rJuZShZM9
 nrg6mC2DsfEzIlug8dWMhkQ2LEOgiBle0i6haCh4nR9CS47Y0h0jYOYVjKW7Sg==
X-Gm-Gg: AYBFou0cHVpms3bdlsCGl3kEUC2+vYz8CGiiZEYnuSfypnBhh+pW7VA9QYZOhLrMiRI
 9Q+F70z9WH5Yuv+VLD8zX4EyrQFyFz6iRtOciNwW8BW8LzUySz9Tiq/iwVe+dJqGNdmT7xljK7K
 EMfymOuUaqupdQdBwCFP2EFSpeblzRJFLuhtRnzkg/Jnmr5zMj9VsInH2h8HE1IGxllAADGQy9W
 fb1H41jWzJ8SuMNAqBCakB07p1cHu6PHhWUOBl8E8CG/Vuy5ES48e0cFyIXMFnlpG5kD4YY8Nkz
 JJSIME0xV5x8sKHZKR5oFi95tiMo3Q4rv6j4R8eZNP/dltrJ3V26MaWdyvr5fUu7VWhekcE/o7u
 Zb5wWzsyjnQWk9Nia5qGRHB5wYA+ZWNKD/W8w5uRJFjN4Qk9ws8v7NUeQbLIadj4ghOYsUdTflM
 KUNFB0CL17ag7O0Z3TYpMnrE06/LxpKRiLHmEvjwpGdhkvCLGAEVUDwzztsYe4CADbYtbB9PT7d
 PnduZeTYUquFkufCwrS7Lgvrz2LmxVkuqLmBVquIwLWFdLZo+wjoQvDDUrm1AedylvObzKDnDgp
 CYAsYyy0vVZ12wEzteroIQ+n3DAWiyk3y6xHToEwPuzsFVQoZsSHB4IYR2Q0VaLyJcl+x9kN4Ex
 Q+kXHyDUsql+colbW+SP5rzWDiM+nxPw7zlRGPQAbxQ==
X-Received: by 2002:a05:6830:81f0:b0:806:e047:cd7d with SMTP id
 46e09a7af769-823fc53544amr1204135a34.7.1790991234456; 
 Fri, 02 Oct 2026 18:33:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:29 -0600
Message-ID: <20261003013304.400979-29-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2026.9.21.13
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
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index c29f05b40d..d9ba083cb5 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  693310e0edde305e2086b7b4cff5fedc  trove_classifiers-2026.4.28.13.tar.gz
-sha256  c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676  trove_classifiers-2026.4.28.13.tar.gz
+md5  4149c5d52f727c8d75fbc843f965953d  trove_classifiers-2026.9.21.13.tar.gz
+sha256  0a9ebc8d4e2f3e8a22848c5258033035bec17a3012ac3fea16dbaa764489eb71  trove_classifiers-2026.9.21.13.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 645f57af33..fc7d2a2afd 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.4.28.13
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.9.21.13
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/04/af/88fdebf242bc7bc4957c96c5358a2b2b0f07e5001401906783a521ea9f54
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/bf/93/af436dfaa845cab5d96f0adbc1e4f3730532d37fa249e4eb796fb1d7fc82
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
