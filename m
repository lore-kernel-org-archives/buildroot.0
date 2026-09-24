Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A253C98311
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 09:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B6C140D79;
	Thu, 24 Sep 2026 09:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ri1KQ_7DMnEA; Thu, 24 Sep 2026 09:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11CC040D83
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790243803;
	b=et8qZonIxUPVjLBly8xhHgaXJkg3mRCbP7HQZvkMjnTm1hagKPlU2rersPwgqV+5tJt4
	 tBIyh+K6FjZDE53QyXr1vTH2u40lfDJIqYvW4cTUvU53A6s3p3pA/51C2oD8V3eJc8odR
	 1nbciXnzVdFYGtusgLiLCPvfjpENaw2+QRoFnl781LWr7mJJLnbRbpRvWJSyoq8mj8X/p
	 1Gk6JIGt3EkQeCTWs4yAm4ro35dTvNluwqxIDvySLfTDvCc+oWQAH3mwLQmL7CvdhbTzw
	 1UpHa5eUvbmSKwwXMQSm6MgRiNZPOlkwcIcMLbCHlWSNWvtpH2RlgFaIu7KqkIE/3+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790243803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+PuuU2kIlWuFL4DTIn6OCIPMFKFns6dKODMJd3jSjGs=;
	b=U4eyA99aCNPtB9C6k41FFSWOfgHRqfAPwFi/+UKsDEqTZICZJTLwYKrbltEgqqol1v7c
	 +1mYmHVUtxZrO7M2ngYestzoQ87HgYSi6r0A2JIhD2kufwt+Lo6OtxdOZdDaHLrmNuT9x
	 yXIiW5cQZbUvRnbZuUhfaTEklNjLiJOtduZcNRBecektm6DLtV1yheM/5cv25XsYgioLC
	 i5tTnqGTWMYHKyxiVNBCkZtn5EYxtNmUnEpxSEJ0rdgwvLoWeeq3MIOIv5LOp/91evhgx
	 sW8Ad9YLFueiKxBVVid9BuYHZeK2NSqVuzUfR+U3Nh3n7DYj7f6IgYp5OErsCMTpLzw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Oc5olOSg;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790243803;
	bh=+PuuU2kIlWuFL4DTIn6OCIPMFKFns6dKODMJd3jSjGs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DTnWaFqEihAm+/HwLFjE3eMd3kLnjKKptRtViJeD7xE+eMITJI9ptAvm5477sVzW0
	 I+bYPLwcQVc8IG0DfPZv/UcbkgRqs+axO8htF5cavUux98EUcWxUiyyYtOeAsUSg+d
	 5xyfY0a8gKpyo8HLl6n64WkSCyq9OLQjx4kG5pMSL3S7zWUG+3s6MZNftsp3LnyVhy
	 k3xVQz6y1WOGB1gGyYkiZ4bfeVGsGf2ZnnhHhDgBkBlZe9nkNWrx1hTnBUY17d4nAE
	 uhBzqWr828DjFgPWSI2HNM4Rbd7VHQPrcTIRcZ6sUnz/KU6Rwnbm9myPSJH2WKHnrC
	 s9nD8zuiqMF2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11CC040D83;
	Thu, 24 Sep 2026 09:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3FDA392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E55DF40D83
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRzmxYo7E_2k for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 09:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EF8DD40D79
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:33::14"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790243801;
 b=UveHcBcLlijdH5VYK/MvQ1+0OwdASrH8dsYBMYeU8eE69XQUIlnApQf2OdH1vX5JWOCx
 XAFEYKSC2tnTBya8GV7454eqnc25bupWbcKzS9rXmwPqmQLU0INiK7VGv6Pu2i3jRT0Bo
 0xkf989eP0dEb1/OSB5bXqtiTX4230PvQifIYA/+XSyMHAj4BEWGK9BKUX5DH2jYrHjB0
 5A62Y5E56LfHYtE45xv6eYVEhfj48SSPw++vuADjZHEh19xm634UqhHA/xr5UtzvkZhhO
 rB/n7TSxIbdlViqb9c44v0ozaRSvq/T3lF8e8iNDh7BtqB/MscKSJ59sh0bU2lDsmtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790243801;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=ki7Dgja3u4Ef4d5P/5kp59nZleiIGojYWI1WU/6NFO0=;
 b=avxvs7er6spKYrBTX9rL4KW1JRDSvL6x2VlQ+69k7MF/9zcz/jPyLQGB5x1dbMhk4Z1+
 up+tWUeeqdQCzprsq4HbyhSClzhUhHtlljT0Thzd6x0LITiIWbzkRTzQn711h8Su0OUwj
 dp577iaNSjKLQqklzsQuEpXaGb/SiChZNpSKseH+NdctIIDOnW4c+6MYAJvheosA12fbR
 LWWNa5d9bX0VEb7cyxrTWRGEF5f0EUl8v9S8IqLbou4tp5s0gwfS95FqzjkxDTYhOF4Ez
 QgdhgMYHmv/yrX1PCYw2UIUsEFqKI5CxADIFG4ZPKFiN32BF759+6LJ/WYfolIHgMPw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Oc5olOSg; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::14"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::14; helo=mail-ed2-x14.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Oc5olOSg
Received: from mail-ed2-x14.google.com (mail-ed2-x14.google.com
 [IPv6:2a00:1450:4864:33::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF8DD40D79
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:56:40 +0000 (UTC)
Received: by mail-ed2-x14.google.com with SMTP id
 4fb4d7f45d1cf-6aa0ee64afdso2251524a12.0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 02:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790243798; x=1790848598; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ki7Dgja3u4Ef4d5P/5kp59nZleiIGojYWI1WU/6NFO0=;
 b=Oc5olOSg3UFPqQjoSrzKodQ8Lv+X31GkhjyKpK3n448h2eht9YxvEWRVqggSHOITgI
 Dhm2MxsRB2uh4vaVWbE9hMupfvSHxloVF1T0j2x7EAUlhVgcAupOOmyrF7sgKhsqb177
 sJqL9KcO8b3UL3bnQeXxAbbOXbi/sNg05nADduqGRHgA42NSUFuAMzprqjn1GlL0+uM0
 AlSinrSh1qNFj8qnk4cMSTZo9U2/RPVOWDikzYpvRrhaPJUG8Mw1lXGSRH6wZPJRPFZq
 +qYqpQ0KKEnCsfX7nAIGfsYj/Z6+E96fWkY9xmcZz/MhQI5cFOvAwZ8HBqPWPW2xyqbx
 Tl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790243798; x=1790848598;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ki7Dgja3u4Ef4d5P/5kp59nZleiIGojYWI1WU/6NFO0=;
 b=W9NDeX7C1Pg9Bz1BVxXkM9ftNgShX18GLCCkKa0Du0zlNh/HWghGh/Pz6amZ59AFa4
 CcS/UiC4hyEB8PNsQS9QuSAW6AMBEXZxl7LhnFE89WVRwO86CKB33GZvhxEGdXTrNlI4
 zBo09q3YEsFadddt3Dhv19juSd3YNUV4xfva5EYodR0Lgd1UFu9nDE0PbIczr56/IiXv
 oRcdtGhwF+WbW0JMvWyOQhoStXAeYFEzxbfKpIdl1VwT48jERcTZQ9LApXOYM3dGho9Q
 sFkJ5Zo8m64gGXUQxdtHkGnd/IuY8ftcS01xKuxo1Vv5aEn+hFPQKqfgVHjcBlrrVrBb
 xsAw==
X-Gm-Message-State: AFuF++k0+oRk68bEIwnDjfAIczdRMMC2HfqfmTMUF0ylWBfyjsl2NYJ3
 KbCpIAE6Ty+1cKxePcgDpsYoM13FHhOcL0lDaTdwm2heNt8bA9RJcAPDaM1hfQ==
X-Gm-Gg: AYBFou0a8mPNAMHsw8uGFkwyX2NjqJmZMLzV9BFwlKmM6Zgq/Z9NGh1KjKfMh80hRwu
 gPSOsgk9E/rIQX+SAMLBwzcDz81iw5jFOpYJg3V3hSH9Gykd/fTbZumMd19sne4NGvhROoxSJeF
 xNnX6NKo1oXf/cKoaaf7sb/tinRtG+ulHRxaSwzw3qkRqwPI1F6SZTvOQqKGPhNDpGcKJPyZpiO
 UB248jk/iY+WOQe+/m7hIM0t6R9lJWXRqSqWNJASvzVWPFVNUjEtorhMo6BewPa8tP2gn31pytk
 ADnYIkALxafBOmyj0B7Hi2I8ba8iUYMwpLIjb0jVGuJAO6v9YHUY5wwcxYKNRJoAmMFsxrW0Bs4
 DAIN6lwdV9upyYK0B0wz9cJ//ViQwEODdDV5xhKFIarh572wmywO51hdibgHl5iM/QjOLQW4Zbd
 bG4GAGyfkV2IAJ6fqE9M1SLS4WGxrGnmoYz1nb3WSnk9DuB3XiTwAgXgcChoZppT6QljNEbDc/9
 +yA6Sw1UhsjPcKebH5oYU/lb6/cc364iP/dcQ==
X-Received: by 2002:a05:6402:518d:b0:6aa:734b:1a2b with SMTP id
 4fb4d7f45d1cf-6aac8f846dcmr1691020a12.37.1790243798179; 
 Thu, 24 Sep 2026 02:56:38 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aab386e5b9sm3512525a12.8.2026.09.24.02.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 02:56:37 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Thu, 24 Sep 2026 11:56:34 +0200
Message-ID: <20260924095634.1298401-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: add option for a read-only
 agent
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

net-snmp can be built with --enable-read-only, which removes all SET
support from the agent.  For a device that is only ever polled this is
a stronger guarantee than withholding write access through VACM, since
a mistake in the access control configuration can no longer result in a
writable agent.

The client applications are unaffected.  Default off, so existing
configurations build as before.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/netsnmp/Config.in  | 12 ++++++++++++
 package/netsnmp/netsnmp.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index dff0f18bee..9a740c2db2 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -43,6 +43,18 @@ config BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES
 	help
 	  Specify which MIB modules to exclude.
 
+config BR2_PACKAGE_NETSNMP_ENABLE_READ_ONLY
+	bool "Read-only agent"
+	depends on BR2_PACKAGE_NETSNMP_SERVER
+	help
+	  Remove all SET support from the agent, so it can be queried
+	  but never written to. Access control still needs to be
+	  configured, but a mistake there can no longer result in a
+	  writable agent.
+
+	  The client applications are unaffected, snmpset is still
+	  built when clients are enabled.
+
 config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 	bool "Enable debugging code"
 	help
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 55e5997734..18b5ac36e1 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -96,6 +96,10 @@ NETSNMP_CONF_OPTS += --disable-mib-loading
 NETSNMP_CONF_OPTS += --disable-mibs
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP_ENABLE_READ_ONLY),y)
+NETSNMP_CONF_OPTS += --enable-read-only
+endif
+
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 NETSNMP_CONF_OPTS += --disable-debugging
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
