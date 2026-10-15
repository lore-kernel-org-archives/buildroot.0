Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55AACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD3E61333;
	Fri, 16 Oct 2026 13:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7Cxjpth3KjT; Fri, 16 Oct 2026 13:13:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D8A76133B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156397;
	b=dINFvAfQZIaXGtinvMYMfCmq5TuWyTCic93MUlVxqXFyhlBsRTnyBtFCxZJ6Dbt7t0bw
	 K2ErThvwAido9mP4I+l/wkfu5QzrYhrohyQbRWh2qxhO9SG9hclhGTtlOxv0f9a2Jfd7X
	 D6EPsay9Wh7U1GHsKhwNhgpYtA4fNjoqSQ8bmV1xw3uPu3mQafUHxmdnmNZVhuDCmr1Di
	 wc5k+zF2YX/Wv1KxfUNGMMbA+O2kJooLqR381xMZAJ4QVrTtU8ZqhJPLe3tNduc0Pglg7
	 oqlLZH6WB9r/4uMgEjnkw+V4uEzo7Rz1lJhLWudItgMC2INbAMT10PtFI63KmIoNBlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sxZwtMJFp3BrIbCIvWfaBjCsbrYNb5ga3nlvC62uWxs=;
	b=UE/zT0TzJ7XSUAjnB66M5164wsvZrAb1Vk9K4sWSVLNqbsdLqgA0NusCA2NEDBpIPyPE
	 GxKBcCoWZap0EsNWmGzKI0ansjR3MznXdeP5D3bwT4ZfDjKVJCzkl8Qm7Wlc02cLutVst
	 5anvg+0Kitz8pCVZoaVJSvAZgZQe84jiucL8c2sjs8CQw/5PlKreUmafXl84Erjzvkpy8
	 +nkKMEmkIABm6Eb2lBz8jNylwqG6gRwE9Mf1nsYUwShrDwShrXM1cjbjVdxwHJOA51zRF
	 CdCj0yISrFir5n1dENqVTc5B5I7BvUJ5MZMz6Pv7Ih4AAT9WvBmJsIpyruwfCJQOHVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156397;
	bh=sxZwtMJFp3BrIbCIvWfaBjCsbrYNb5ga3nlvC62uWxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SxfcFTzQKuHV2O6r5jWysAmYt7neymjcdSgYWJEAJisbppHp/sRhD7vnzZ+d+8QFl
	 CArwmGzTXON+jsfTf8fvlizs2YDxqhPEMUM3eCNlVt2l8voDeqzwi4cpOaNm28VN4Y
	 5Mc1/nwPqiJXLec3d/CSK8F3SAhTHVRUWT5wWMTzGBNjTucCjpjaNtuWi3nktwIDqM
	 k4/brvwPeWqA/UnGeCBjNtmwwbduceuRf7iGvA5OMIVonTlRE9+Fb0/RRi7BXltQJW
	 wdAxKPyHbiyQM4y5wtxAlLpflSa2FJmnPY/N8wgJ3Uavqu0E9KWPWMXcskYNql0CJY
	 IMhg5H751LMkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8A76133B;
	Fri, 16 Oct 2026 13:13:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20407920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D58760B61
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3WdR6iPcyJN for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF91B60F02
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=WbAKgSZQDBqpYsS5lBvDTEEBULj1RotmCJY/GI1Vi+yr6BGzddriWQaRC98Kak4YBe1a
 lZz+NTu6LpOCGMdI464praC8JT6wjis+Ec7Vz6qhFsnvyUW9840qwvPenDeAdaOobLrWz
 D0+qxCYSoJIbuR1NCfmNsdELJSxlRVkW/BUfpiZK/dKD/I+o0aEmuerlWYlKGSab9Xfhv
 1kdBDgF8uIFfT3Kce9uH3t+CIHMfLvqsXkjD6G54gjmrv/ZvljUKxo8vt0maSnE8JQLXY
 IdB6N+7W/d38/zs4X3dpMMLaPuuhLxqqJEwGWQl/8Tid1BblFCMEZ/uEnoKcqWHpP3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ajmPkkW+0w9hLtrmD8aSLBZK6ViWbpuW9nC9AsuOCFg=;
 b=iTUxLJ/ts5xbChMzhjs4csIw87zPA/150PTiWAkhNzz+8AwY3vYE1ZQ8sC/T3A9sSB5O
 3uCG7siglKYZyhcRbNBdOZjrBEKYTnnlNrRbMY6P15Ox5crrYOv8OrvBBUAUi5QkPPEyI
 5h6MngUeLAtEXLpz0oO2PNt2IhD242wTjCesGIWhkTnf1xSH8OYLDuBISpaphxfYdWg3f
 w/0fY/fL7aiKsxx+3DhJLrKha9FyaqOdVzxNAAxE/ykzcX4KSyu8MsqzmnTyvLKM0/q+4
 WlKMEg71VP1BrnKLDGo+OIr7BefiYecYoCB4VNbnY7WvhiJmUZgfTNR5HzaGENvCIWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF91B60F02
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F43B8F057; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:56 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 30122f7a1295dde3d6780292095f6b6f2dad8984
X-Git-Newrev: af0cac3258101204bc288e7bf52c4efb8fb1cb98
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.9F43B8F057@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/x11r7/xkeyboard-config: add CPE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1995386323095886081=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1995386323095886081==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af0cac3258101204bc288e7bf52c4efb8fb1cb98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:xkeyboard_config_project:xkeyboard-config:2.38:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2012-0064

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6a625034ca8b8924667246624fe5321c431e4047)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7c9c814d95..9c8461b23e 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,8 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project
+
 XKEYBOARD_CONFIG_DEPENDENCIES = \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
 	host-gettext \

--===============1995386323095886081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1995386323095886081==--
