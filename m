Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8858CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A1B80DE8;
	Sat,  3 Oct 2026 15:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjmS9jiggpU2; Sat,  3 Oct 2026 15:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CE6AA81980
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043041;
	b=Gu36w86ubq1GIfKKo8Q/BBMqI4XCiC2rnb5P4QejnVIHIekikPJHpvTk4KDxxIL+8GfD
	 Pj8vQ87kEQQId/KP2uCMUwezV9mM/b5dWCYUfuBGMNY1fLnfZO8zw5pcE+wTGm6ED5wDR
	 t9OuRKQWtijvTIlXCM0nW+3sm7Dr0+AKQxb7NpRrjFB9Zk12u/SPLo0iT7GlKyAtjcUQc
	 Ry6x2rZxMWBAomJYi8xio3MOKTN+qc6C0NceXehXsGObng1snXuFNVgdinej/Hs927f5I
	 rGu7TXlDBPb224L2MQ6E98xFL7fj5NuBKjFIzxCwLZJmWub7N8V6X7VaaD3qP05vVwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gkmtpMiUx8MC2u/0u6lY/bBkF+mmaszQWJDKFQqMybk=;
	b=phYlKr2iIEkbCvWgkE4jsnGNpegQAWSQfGG1dxiiCZsItgUAPeHrqQG6UcJ1yCdcwxM6
	 fN0yu4n1D5OjzCgAxeib67rIxpSbOk1RHE0DfL10x6zQ637vW+aJMcKB9RSGzIH60rRFR
	 7I/do1e/ovJ6TLaf8qbyVIuThz8KujzcWaXrChF0F40X533vHehp9ueCRfA9B9YwEtb2u
	 eGZGkYCZqxazha1CmDy3V/ctsO/4kjrNLqXWggRva9ZAogqYy5FZJpjK3nLANNTYOsAK8
	 AHMupvvTiYi8yqudZk9NBHuBdZBTnDBA3byrQgJWgqdxiEBnSNmxQCqVgvlm7ZrDXQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043041;
	bh=gkmtpMiUx8MC2u/0u6lY/bBkF+mmaszQWJDKFQqMybk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VgQ/hYT090IpF4fK+B2oTyc1+9d7GB+DzSlfh56N557iWFoqeN+Gp0JNpOGOo7uwx
	 3334x/RmkLqtVAMcUTP8nPp3Iu+qfaBHcxgN++nzgbOV6zOX46n5D0/jyy4sRpRTkU
	 +7GEoiLy29GB+SL8UJzgpGOLmDDeMx86Kv2ZfkjwNPLhVaHV0E4w6vHpUR0Hc3bfAu
	 MM1vevQFMgVk/xlLaczUkOUdk3TGkz9m6zkHMLcZ3ccYKZTWUTY/CrxqNXWut0SeCo
	 ISYAvIMinSquKiXkhSVeWVf9wIVt7THJdChMvzR4vTYdsD/0kvKbB05NxEydx0Xqls
	 o2l0va/MdAVsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE6AA81980;
	Sat,  3 Oct 2026 15:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3391D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8B7F400AD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2TbfLFgDPSm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 53F3340049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042958;
 b=YDpLexEGU//nI0C1gdjLmTWP5p5Xwg4X9d+z24OgqNNJwPFAzyCZPaFiIfr4Dtpn5i45
 C1thLyvDO0pvZq+v2a72VuCq9Gb7pBS7QF8CZU9HF/JtivDFrJl+0fpFxR4Li6/TCjAme
 qaG3rgmVSvFjlLZowSBCRz8J57xiX5oI7/hFU3Z04G0hYGGF2vzpLLu+mF281a80Swrq8
 8PgG67j2IFZB97ST0+T4I0bB6RsbPk1MeoG3VtTHyRwzLU6GVU66Vg1GHdxNhmh6lxpUo
 bWGPbN/oiLgxqnOafkVFPHCyGWg8F5wcZf4K3Dq9pkb+RtPVW7yRD5HlPUPDnbOQNrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042958;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fqnurjg+7QXnSGvOcuveTSi/quR+zGd7JiwbsCqKDH0=;
 b=ZKBvJsnoBw90nF/xEPVyHneT+7zCvPNL+wIPELMQWfMtVO+n6tNrSDLkM5NsH/3Mth6W
 VTLJz8QrHCM8xb1bDuIhv5bWzfcJ4ES3GUkV4Te3fq/03yIAoHV9ZQxwl/EyjgCU6muAv
 yjQD7C5Cc5d6kuxCq3+eVFe2EeNGpc0XstNP5cgPQ1tislrZrau/dohkTC1h6u6wPhc/z
 7m5PoDuEmcYtdImJaLgK8RPAP6rGxbjw3AGpvkdfuxeRPHyhzFR7K5buox1TreK1D8fpq
 JIQp1lkKo2p0iNiQgof9rED0TYyvn7YlLTaBe8uyXSHEYWNvq8hXZEhwhNrzyFvPM9g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F3340049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90CA48A5F1; Sat,  3 Oct 2026 15:54:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:55:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba6811487c631aa30d1b293a6a831664d0c26484
X-Git-Newrev: 5d36891dcee1a806c32ed926376aa8ed90855064
X-Patchwork-Hint: ignore
Message-Id: <20261003155443.90CA48A5F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: allow Lua 5.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d36891dcee1a806c32ed926376aa8ed90855064
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

see commit "MEDIUM: lua: Add support for the Lua 5.4"
https://github.com/haproxy/haproxy/commit/08ed98fd7963968de49593304fdd9234812845a4

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index d2fba7f920..de2df549b1 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -40,7 +40,7 @@ HAPROXY_MAKE_OPTS += USE_THREAD=1
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 HAPROXY_DEPENDENCIES += lua
 HAPROXY_MAKE_OPTS += \
 	LUA_LIB_NAME=lua \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
