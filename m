Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF3EA853C
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 18:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EE841931;
	Sun,  8 Mar 2026 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8PNo_2frMiu; Sun,  8 Mar 2026 18:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B5F540D49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772994057;
	bh=poqIo/TKwj2fUSiWIKe64yo2/Kq8IL1HEcz2ZagqZrE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1OAa37548dsW1ENDZqrOfe15Q0afovG2gIX/HNt/WJ5Y9J4k7YlnvKx9u8MdXFN1
	 gjZAtDEekQBSSBTq/xH6JqK5ObRcn15AcBZw16+RJUciGrAVGNkTOK6Fq9b2jATIFd
	 U5d4t6exFF0vBXA0ULDQgTpaVAp0wTs4EzPwIEFQb7l/MEoJuTg+Z25Wd0JYiLxcVQ
	 zX/w/KY5EIFhvsVwTFDoY4PSecwtuHJjTn89s5N5hFPXuAVR5pLH7mVZne7h3+NZzl
	 g0WgEAkKgZYQtK9jHEZYoGTYD5BRZfkFEC1wtaFZjWCcovIPu0YQnGSd0YpZKhUo9p
	 f2ditB3lUxdKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5F540D49;
	Sun,  8 Mar 2026 18:20:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF7ED223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 18:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4497606E5
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJQFJuw2wAHJ for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 18:20:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28AC06069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28AC06069F
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28AC06069F
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 18:20:54 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-829759ca646so2290999b3a.2
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 11:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772994054; x=1773598854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LIKQxJTAGn5uYfNcEoAYhxE5qZ5hdOMtJ1US8BQKVE4=;
 b=RgwC48BCRNtyMFpQ9TMNoaX0AM8PWh5varlberemoXcnYcitPeTlUN89mb10RgKMJv
 O1bbKogL8S1jHs2rV201/eMNkGgoVP6w9DLXl1Z6wxRi/Ig3SkvEE9EioaGeq+dmtGr2
 JPZzIDdokpGRmOBM6VwgltaVbDRAJmpBflZ/DvpELqsV/Sj9BXUyoQV4DUsuP7TGd1YP
 iaHJ56UuNDpqP6FrEqHuP9aEFazMj3/vDH/5VrrluvHShpG6ZNq6bgymjESywJ203YFk
 94ncwX5FT5901oBVEgvByKBw4iVcL7k4x+2WCE8vochKobEwbv92Lc5lMaoVMpMtjzrE
 jFpA==
X-Gm-Message-State: AOJu0Yza+QDKvlp+t1DLv5tHVDsr0rCYIW+ddu8EoYlb9OAh7ezFls+d
 b03qYIl9jXcXVc9Oqn7JaM/PgCKrak2biT/FvsjOIfUqtmWjLhbajJLhGYAyyw==
X-Gm-Gg: ATEYQzzWtSQ/RWQX1CVKmDCYG1CXY75y+CC+yCsreAaTl91DSuHHpGauAg79CoSEipB
 qBzeINl4g/hesBBk1GO1drjWhTEKSZAjSqp8m54DgqRbRw1HGaH9/9Nnzu1tLYbYWz0/p+WwdeQ
 xkDW2Wjy0g/skO64i0jbqAJt+NhZe9QWQRt5MTvSaGUaR2RJmSNCf0ZVbrFxyirfpWfPPUedRM4
 /jEzgw8+Be7GCD+CeMdXuBqMqeedGuWDr9rW/8A3HiPR3LXmiWVAS2V3FgUf9HvtSBnbD+or2ak
 d5KZsRYwVl2ZClpfobnUqMCWj3IU49fUawr9Qn16lzEwJw9E5E/v14pm0MQoMqlYK1OqyGtibiG
 zXG/XUKqUjTj5EdfU1RkXYU3CFPGniidnPu+dKos36lEtzECy2ZIPMvkXAFI9visBroekI/QTfR
 Tk05ASXbt3YlKui4+tx+ubeSB7fhx7BXGcBg==
X-Received: by 2002:a05:6a00:2ea6:b0:81f:be3c:37e4 with SMTP id
 d2e1a72fcca58-829a2e66a23mr6940910b3a.27.1772994053918; 
 Sun, 08 Mar 2026 11:20:53 -0700 (PDT)
Received: from fedora ([2409:40e5:112b:6fa:d7c9:5875:7089:27fe])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a4635d62sm7896924b3a.5.2026.03.08.11.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 11:20:53 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  8 Mar 2026 23:50:09 +0530
Message-ID: <20260308182009.38009-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308182009.38009-1-chakrabortyshubham66@gmail.com>
References: <20260308182009.38009-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772994054; x=1773598854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIKQxJTAGn5uYfNcEoAYhxE5qZ5hdOMtJ1US8BQKVE4=;
 b=G+gNUvd7eW1jqCsOrWqJoFnOeWn9b0Y5SXD44J2ZI8lto4cxB4s1mUscZHnknf0Lcd
 IV/A8nWxdvSsfBMvZLNZ5wQzj6v1HqZtioi6DRiLAtLBwXNlaBulNAW5iksqczUAhioq
 8GM4gHfEsYJS1nqtuLEPcXortrZFHo8LdKiBA+xMQZ8rQ3945PWKJ99fNlOrrOm5qLLV
 uBzFgCaPi1gPH7S6g8nLI1lYWqlLboAFh4suowLf16IqeRGA6Vj+LRl4g/OK0YlJ6j/B
 RVOWHFFDs05mQim6WgdOqAMDBVCCeLTOeKykMHUTisQdV+ISwF9UeAwNjxfu5dzJXe7M
 5yCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G+gNUvd7
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Shubham Chakraborty for
 ccrypt
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 106510ea84..7cefe094d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3059,6 +3059,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/ccrypt/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
