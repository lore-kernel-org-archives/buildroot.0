Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E797FC2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A122080DDA;
	Sun,  4 Jan 2026 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOGbBGhGxOtY; Sun,  4 Jan 2026 17:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F45080D9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767548834;
	bh=yBRvqGrWzBysz3YoMhkWs2jXW63mlDMPP6AU9aMKG+k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EsWPjRaUmwg0nxn+MoW8ygcrHbbPFDXCWW+rCWiM5yj/9rdy6NsrD3cVzP6k+PRlL
	 z5v9ee1oLTt8zuJj1LgaiWKlS16IS+6Dqsx5gMWEjBSYRRY/i03NJ7JJ0NUeaQCyCQ
	 J7Q1dSmtv9hjW/NEqggzmthMK+wilOwEWpvBn1cbj6SHCeF/zwGqEzMxZLqQZ2gGr1
	 UYl7kTH3eyv43uEUSDjkdFl+jbUvCm4NQKg+tiU0j9kd2azx/eRR3/mL2sR77twE5K
	 PST/wHQm+uR8tulrMgBdaeanpTsLBQZTiCYBP9X5Gmxqo0mPbDKu/Fq4AfizCFh4ya
	 Uo8zyLSZxET3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F45080D9E;
	Sun,  4 Jan 2026 17:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3AB82DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C91CE40200
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siBfZjBXZgMS for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 17:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23D83400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D83400E6
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23D83400E6
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:12 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7c75178c05fso4650494a34.0
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 09:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767548831; x=1768153631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=itxPzjVy2ogHn4ha/203ZbTh9O+isRpKVyQv47K10Xo=;
 b=LkSxny14WNLVCU/QyLkLovbi7Snle12WpC8eX7AI+TkZT0KTVdZmkoK/0fCgQ4ihpz
 GTbATOXzemguKoUJ1uikzKpYyzUtEwwWQRL4VS8uTU45pOLzEedwNYOtkYkqej5ocEph
 uz/MyL+FqWdB8jEdKeHCGx7WZ+ENfJbqwiW65TA8gop0nZq/T/EmXdYEwmtmhtLKvZgV
 eoRUsILAXPbr/qpINoj2lb6ZiVONdirOLqt8caU/RYcowV498WuYAYVFNFNfhtZ0Zqmc
 Axme5QhKWVgFp40uMn3TS8CZxLmnn8G7ExylwcdiuiEcUiN12mpjODIu5AlWdoecmREF
 5oXw==
X-Gm-Message-State: AOJu0Ywv/xlsvQxWGf1v1HDMyESc2sqGfQgxk1fT5iSZWsgCS8S5/Jx0
 4yItB0OTt+b4zksAFo+1Prtpg5L/41B7pDwgaB5UqXu1lz9ZwP/m/nP7mzEXVF/kd5t2cA==
X-Gm-Gg: AY/fxX7YNTrDIO0oEweCVYNgaJ+WuWvWkMCMXOaeRtQbErjO+sTEZOIM0m4I7n2TTXp
 qgM2xP+qmsWX8Z02H106L9FvTQrf5I9SfrXJsNmNSC+/j2DBIlY1VrgpWI38DU05GjGjve6lSpO
 BnGIjZ12wtMD7YtqOTtoYTdSvmLqs86VCWYUR9w4u4JfVSa82+SaK16J+5JFLGjU6UZ9x5stl9M
 /kxUrYYvJlhsCZwQCAtg/XqvgPAU5h6zXuux4PzOpby+csLtJW95jV262giEO3OmWgKmcsuelaa
 9e/LHf0M7B7B2aodzeXFLsoVTbCIZxSpZOXnmEkl4+lJ7CfvPNlFE/id+VLDgiHm8MsRLfxFDlf
 hddvXL5jHGpycsLPautQHvP4Mdn7aCUzdTOgyeASJjAK+IuZbIgV5GweNy4JARC4sRY8qTge6CE
 maJGvNeFx7UIVK5Zc86vzQf1BRJyz8NISR8tZQAttQhQCF9d0GjuvojL2V+G2KBLdyaIL3Y5/vE
 VQAUIl0DB+enGw8UflXtCgbzY1Ya6VGjDf5HvTDofRPbBRv386p1Jc=
X-Google-Smtp-Source: AGHT+IGO4VoywR/nK0me1FWFQ6wWv/A3mZcN3cl56TCFaNG6qy84P7AKoontCAozAyfad/QC1eaSvg==
X-Received: by 2002:a05:6830:268c:b0:7c7:6e32:dc7f with SMTP id
 46e09a7af769-7cc668412a9mr23953677a34.0.1767548830821; 
 Sun, 04 Jan 2026 09:47:10 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673bdb6sm32090486a34.11.2026.01.04.09.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 09:47:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 10:47:06 -0700
Message-ID: <20260104174707.3909632-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104174707.3909632-1-james.hilliard1@gmail.com>
References: <20260104174707.3909632-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767548831; x=1768153631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itxPzjVy2ogHn4ha/203ZbTh9O+isRpKVyQv47K10Xo=;
 b=iKHJHYkxVkcSfZ3RMcOsJPbM3GFL5bO1y/+nilwZtUi0eAyDiQoB59AwTUdrQBbs/o
 /c0FgpB7ATNfG2WNwoJB8qm9w5lamFG2cWVwW4iDcyUda6TyjmNjBw+Bh7HZ/zDaoMlm
 wF+wsL5nEQujjpJ7krigHhm4dJzqVgYpao16krZz4FR0kzVogLHmaVRVbuv/SeSHZTgd
 WjnZScM4jMi2Zr8jrN+DMWdXfDHV0sdTk6SqvjDOF5NWgQ2RVP7bBztwzjtlQI+gCI94
 RQxlVsWX4p35QOR53lwn0YegM2c/ZldnctzhFe37vlJnmzYh65xKRq3hHaRgIPZpFAne
 Oekg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iKHJHYkx
Subject: [Buildroot] [PATCH v2 2/3] package/python-charset-normalizer: skip
 dependency check
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-charset-normalizer package specifies an unnecessarily
strict upper version limit for mypy.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 8b9c954bce..f793241a1e 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -11,6 +11,7 @@ PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
 PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
+PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
 PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
