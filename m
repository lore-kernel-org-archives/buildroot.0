Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF780C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 21:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C81808D2;
	Tue,  8 Sep 2026 21:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhtRJLxXq-EI; Tue,  8 Sep 2026 21:33:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5D61A8099D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788903187;
	b=J7xsoVHc+mr01gML9ax+uqmDf1W4asW3WwAGtjKHJY/FHzlNdz+OnABfhyWScmaT8Yb4
	 trX04cLGTNvJUQJwIPds+7x18rhjuiDaVMCqNY7AZDePYDGGORhpIYOiQGUSnJpW79QQ8
	 zgszzPx62NujQcztlWqD0WD3N1nwzNJbiNy9+duhji4C8BkK/ktYvTRLQLX5JnvyTsZyj
	 VlxQvHqQfyyyoBYXGofp5l1pPLJu79X9LYFBkLb1yp4BSOwMhtrUMgZgJO/uauwxZNZ/r
	 TPlIt4ZqhLE0UDiZlMOTHI4aiLjQ4aVpvv7qzcLQLaO8k0ln0fYq1eks3Y8QzLk8wcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788903187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9YMwekNs4/w2PpP8fEm6xweQy3abv+HpXdF1M55CSR0=;
	b=Cnykr/FV6SOKQA2y9fc5/sA5i+V3VxVFbfo7HNSrFwsPL7etWz2t6P/bLl+AbwSBoNzF
	 Cy0UOh1jh7An+xbcaGwhLqtpyyolRQtW10qGeiietfgHzmBKB+r9Hb7WkzV1udZkuk+UK
	 6Cn7XfKXuBe8m9xixvJAc+/Fil5MM169yHSeB1z+GEWLTBqPvBCBirPEUHSvxECZeWFTq
	 xnxkUDNYmyx7aCjJIjI1ctCo9fYRxIWjyd0MSk6r5+z6prPFqgKnOlub6ogsv2MR6LwFL
	 AvnDTiEZFv/OpsmQj9Gv0m3OYwmHVHnmwryUE/0PayKz4w0op8M21zkYqJ63vVkggyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BZOHjmc9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788903187;
	bh=9YMwekNs4/w2PpP8fEm6xweQy3abv+HpXdF1M55CSR0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMmt6HpiJFJqQ+O0BGbe6fSqmRZtdDOArnLTafNhOr6Kme/yImBb0YfgTGROCnBLA
	 xUtrobb1njjp3IYH9avnAPpfkRRLW0KaLBGg3iQXOCEOjNZInUU/4jngzTQ4FNWwNa
	 L9cvCgSMEF865aiDpxdWyxqwnsk4hI6aulxDCRg+EylFNeTmx+5yDf9LfOT9wn18Rf
	 /9fiIBCetgKeex2UrtmUpJZGwi8mWb+JnvCDYkas4fUOcdt4jhaiBLmcs80if2DuUF
	 m+HU/HKJiK+a/n2/0wB0O4qz7hIYGkqpnXYgBz2617YYiOBPPCk8plOA6dbsSGrem/
	 Knkin1i3cTYxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D61A8099D;
	Tue,  8 Sep 2026 21:33:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37974769
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D4708099D
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edIIsI1hprIo for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 21:33:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 88EA3808D2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788903185;
 b=NEzWW0E+CgUrx8W8SzSjB2zanmYsfSCqqRs+5q4jXV1OYAtO0FURHohcT25ZULxRHSsm
 C9/heGS+i9HNLBI56GSzyZ8ktaRyHFF4Cz91uLu3OKL5jNVlRxRFEwh+e/7paqkEWN5p1
 5m4IsJBygQaaBgN1RWWIMbrJdUHCo2dH4AnRlvOtB0dCu/MZNEitQFV/nOEaW2YlwuBgp
 +LEUVnqEq4kiFKmcltYiO0LxgOllLG3lSVCmrR6LvmYCPJ+flqeuLykI7qPSP/QVGQVe5
 Rn6M4EXNGUP+FDLr8VdIc+mxfEx5goc7DDMS3WxD7da+hOiKVDrCWCaBTRM66IMId0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788903185;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5iG+NeL5H+WCGqo+0oxjFVxbPxDCILNytKx+7e08+EI=;
 b=GpPuV8pcaiKZ035YEEpGVUaxPue+0RwTXxULkC5U1YO7Imk+5yhdQc4uPbO/Ob6mFIQA
 kfTmHbM2xOdOJTQRXslVt8N5xlAppyg4cY/gRbSCPmunkQTfhf4XFXAlTWjPvCtt9j8bv
 XUezvqbDG7vy0w5mPyJPduySYRJyitbvOs2xgypTRedJoHUZH/HYJ2IFimEQv+TyM1V43
 fB5UHB9JxMFZhYWdD9DiAnwQQZvvaPe3GSrbscv9w/avpSiWxN+jfIqESc/Gz9wBA4kcC
 6JSzT4xeok5/OjmCoQG34N1mRKQxEdvl6XDECvVbmF96/C4G+4ZXkOEmU3K2U8RixRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BZOHjmc9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BZOHjmc9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88EA3808D2
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788903152;
 bh=5iG+NeL5H+WCGqo+0oxjFVxbPxDCILNytKx+7e08+EI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BZOHjmc9WqsVDBER8wEvYLz/RfNY6w0KdhlXkTgDZ0p8ZEViZhHtYnBbe4xYHnAKp
 wxzucSDJYEtk53hAi8sO+1vIbs/TDzjC4Ak8mpn9LdARgawRCdnSo4E8fFucrtfwYt
 9343RZt7QBi8+p77gfKwNSsae4jxkvPk10N/gfSRGCVgfMVokz2oIP1VvqEghkGAch
 GFQUh/eKShlKRhLyIoHi2cm3gulO5zAteaTLp8jzWzE82InwQLkBJPXKaMT9vX5lO7
 JnNDSrjVym6Xxs5n6uGaBc2Rpnw+tFldlzrdYP7ARlw58KI8M2vX0iFV3R+mQxP4wH
 40vD2e703DvPg==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1823FA4C38D9;
 Tue,  8 Sep 2026 23:32:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53342)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x43Qd-000000005r1-47Fr;
 Tue, 08 Sep 2026 21:32:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Sep 2026 23:32:30 +0200
Message-ID: <20260908213231.2542239-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908213231.2542239-1-bernd@kuhls.net>
References: <20260908213231.2542239-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 3/4] package/daq3: bump version to 3.0.27
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

https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/f4cb6546911bbbad6d372ec48f2ea849497f870d

 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 524c0eb868..a81ae595b4 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
+sha256  03fac3da27e3230a7d26262f2480cd65a409cee3596c6758a7f9eacb7f24601c  daq3-3.0.27.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ec3f4ba670..43139ee065 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.25
+DAQ3_VERSION = 3.0.27
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
