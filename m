Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46EC88E75
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118F640639;
	Mon, 14 Sep 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8otfMBHoc4_U; Mon, 14 Sep 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 285CB4062C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789401244;
	b=sKyqmqKA6PPV48EEYfItWhtLVSIWZOFXMIdtBBoJ0x8wKz61f01wtfkckiyI89JWc4wi
	 MwMrSujqvzjuA5a3Sg/nBMoPjVvw2mCc0MBpnPXsP7hZS8P0YahF/lsBeeU/zSA6WC3xR
	 wsu0SPKUDJ9MOu0GhlV8ajJGW84DgUDIh3WqpvQc8plsRN6arEWwpfWwr95z15LV5H2DL
	 NbFXjKx6/LuUL/k6/weuMeaLnIoLVDl25X9lFdfBmJIREj6/mL3zSFQNIvPCxxncaS/51
	 aNrMeRuCQCl3HHwOTYdQL+ETB9nHfJfs/poVrUNt5qPPafWiq3F2PoI254MVnzhESXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789401244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QnRMNLpKCq9Cd2bDOzMaAb6Rs3rfefY0hf3wKSUqqAc=;
	b=C93hV+yB4GFIRFy76523JHrjNGwpKhYa1qwJ4p2c5ydD3z6vfxltia0tZZ3DcjEWuFWB
	 NI0JKXuTg1e78yAHUivZoCjH8j/aNuDa8XK2XWnzrQjRP8p+YCnIbVQAS414vKGeIQ89X
	 xe8UlU6MPGnA/bTqxynAopPCBgFD7RzgJ32TV0BV3hCecqg2VHuDgv8Bi78nuxjEuSuS6
	 EDhakQTT9Jn9sMkc6No4lpVuP2avPf7AFT5ZH/a/S3N+XJLWsIr9WHIwW+3Gnlw/jbe0a
	 88QNMfCalT/lBaxYQDmuz3XDoXVbS7CgokUsXGfdskqQnwE4Dp5fO4DmUbaYByrPf3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789401244;
	bh=QnRMNLpKCq9Cd2bDOzMaAb6Rs3rfefY0hf3wKSUqqAc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nosGMSx6ztiwCeAilNdXbcMnOVaSQuQubZ6rqpqf/y0VCqHaS8LlQw+KbZgIVkc8q
	 05jzMJjYIJ2xXJnHKJuq/HAaC392DWawxi0E2FssOHXBun1xbOfQCyWgJUyYCILpcJ
	 JrxRFokvJDVa4YMt2Nf7W9xU8cJ5mvBTni+G7lNRS5WOB0fekc745K5NXgsHZ/DDzP
	 28nhDuoQ0ei1aJmTpLwTs9x3uqMt20LULY8NSfsj26gJ45LHH4A6mC7nWXY7zYK9s9
	 92j7XrT3I84fDSsgcK5w+yljYP2Swex60cAtlq4r9++OMPUa7tbq5qWE6K5WNFQ4C9
	 HTg5gnXkESe8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285CB4062C;
	Mon, 14 Sep 2026 15:54:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3CAC465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA9CC40144
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQxadk3wZKdN for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 15:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9963640121
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789401242;
 b=YWXaJXlq3sIvtb+xwzFVwzhS4G+VZ4MrwBobBrkGzFG3oMAWHyOzYA5Afc/QHzR0z26A
 a5SuObH/W2UnqnSdHtdNeP0DMaLAQYtOIx8D33z9jGeouZ1wBLDFiU4VOkM3GBY4ZZyoP
 x3feN7XQoya93OTf5h2z1vdF83A9LzHII38XkCybrXhOzv7FtIyKTd/NTerktQ4EkMMBm
 TrZFX6m5vqBa+Ri3JCzKatNC12vg2cclvThDW1rbAB3Kn/OAf94fcwaRXsa3st7BbQyDp
 SPtuzuITlMnU0oxiOlHhWjIsSB8yQYzP7QVAQeZdXjAyyHb9Jg+KugPgy2znZhsV/eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789401242;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=RgIRXP0U8q/B9IIkkuULGMNFRlSMuNhuUhbwR0NANec=;
 b=XKGCztm7oDj097ltGFQrJondtpICozN7FC4wIMpvxtNNGCPKFGOK4mhnrfm+ZrUZfUC1
 E98Kk/MMClouK9mv5qIihgku0AHhTGN/l5kA3JjU3TO+LToHGuTe9xV7VaR+UHDyD9wXP
 GPWClsN1yOL+h02R6dDrYr73qCKPuzhDSMD/AJqf8AHCrtPdSKpWz0nNS5pBxJcLJIZJi
 KqNh7aEvolIA0XgUA0QXYaYGnibv4sV9N/fHLmjfk2JX28eCC7KdeCXhxda9E3b2JrNFG
 NIeHPoPUHK0l5Rx9sVDPUqKNkXAy6JgCw7sb+EWtMqIzFoBl3ZIB8vntMeB0jqMzJoQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Sslmnmqz; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Sslmnmqz
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9963640121
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:00 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c2940ef15d3so309697266b.2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789401239; x=1790006039; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RgIRXP0U8q/B9IIkkuULGMNFRlSMuNhuUhbwR0NANec=;
 b=SslmnmqzrKQKskFQMPArXFlS2eHKakmW+DA61ZPabypUwoE9CBhK3SRXlQzG8MWcnA
 EvBrBnE1t9+SGhIqbpWw8o/CrSVLgHEBjl/lMazgJTkN463WadA2ZHY8JjkP0HIVfhS9
 Xj8YAom5X95ckHX001DY7wIPlh6tNTI08qF6PbFMvccCcZTlO9ti5DZGT0pUWC55x/db
 gMXZMh7XP8tLTlFd9GPCmVj7Ffrf426JGatdRmYSlLAeNQEGoAqYMiqqwCCKoymBm8go
 HMO4rY39hsWRsILo/FxDBNU2sWCiqvKlX6SXIAwpA21MRFJQQjmv8yDixOpBJCx5h/Vf
 l8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401239; x=1790006039;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RgIRXP0U8q/B9IIkkuULGMNFRlSMuNhuUhbwR0NANec=;
 b=ADWIvsUxmVjgAuP/pCGJS6VfQKoyk9k4qJp2hyy9p6i4aCYE8oPQcIZgW/JRMBxcUh
 B0j8bP+0bYYpbiPZe05Oov4l/+Z2JzSpmXlXGc++9IsmJ3/F8uBkdTLXfoSmOgK+iRNj
 q/U/Ka1NhGEBUyms08BHUS7O99gZeSRqYa0jGiHvuFIR61yNTH1yW2LJuSIG18Rgu6XS
 7Mno5zlYnn6kdQe5ojsvXKFfgOI8MTAPx8WnAAKgpXDg51ejDhJhOR2cs/G8safsMzGm
 j4mKODGytjOb9X3rz+lV3EEGQCIxAEso4kNC52WRVaaKsgjSd+z6t5Pqjw8Af8o6JDky
 Pw6g==
X-Gm-Message-State: AFuF++lS+RHbewPfVmSoy+aZeDupQE1LM3xj4mRBF/Rzy071UCWsnt0L
 NRcy5HZfs4FJLWjd8tCa7ClxMbPUmdMW4C2dSANLdnREh08qDK6VAO+J7XoeHA==
X-Gm-Gg: AYBFou06sOWntlWBFUlm95WxAn8cSWZ8cMAcBJTEdGMKccQrd7FEg4wvk1yQUuu0lHU
 ggxGJ6RpzjHgD+3wvHF8gwKeNegDW2FoivVSUKSaAbTDj1B1ODYk0HT7ITPKBR50+yY0UjR2s6i
 yC9G00fSGAxXkGZrZbKB+7UUSd2VlxxvfgJEfK/+bhycH45qEQzdR/HOEx4/DdVfOcguxngL8ca
 MkD6k2vx8mEcWtRN73HlnYSXJ5+PebRdZBnSGjDIRgb/6T8TR2Q2DqrfihTtBp0WruxxUuoLpIK
 gxZDireSAlafhfHIbkp7a/wHMytuVgOMK+2aUVJo0mTlR7QQ6lDT0jjpmnC+0WnnTfIPyfCSNxQ
 tHlqaJqjhMT28RBJECoTcVLlHd60iO4UiHJxlvhukx2qMhTFyA8WxnAwCxomh91QbRl5iakIjby
 939oQTRUpcglqgJgspvtkBCZNZRgxYuQgcpYQpizDYxtXWyljDVNrI6yzoIWuDqtuMBhfjshNnL
 CFOdDu52kEhXTb5vlrvvXjqyvo=
X-Received: by 2002:a17:907:1c01:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c29b83c228cmr417840666b.6.1789401238834; 
 Mon, 14 Sep 2026 08:53:58 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c296611f417sm450611166b.53.2026.09.14.08.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 08:53:58 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Sep 2026 17:53:51 +0200
Message-ID: <20260914155352.1331991-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155352.1331991-1-troglobit@gmail.com>
References: <20260914155352.1331991-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/2] package/lldpd: security bump to version
 1.0.22
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

https://github.com/lldpd/lldpd/releases/tag/1.0.22
https://github.com/lldpd/lldpd/releases/tag/1.0.21

Fixes CVE-2026-46433, an out-of-bound read access when removing the
VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
file deletion in the privileged process.

GPG signature verified with key AEF2348766F371C689A7360095A42FE8353525F9,
LICENSE hash unchanged.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index f3cefe7b73..46f2b9b476 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
-sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
+# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
+sha256  9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03  lldpd-1.0.22.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index a3015e9e7d..f0cbc7e436 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.20
+LLDPD_VERSION = 1.0.22
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
