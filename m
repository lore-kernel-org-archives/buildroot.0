Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6A6C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B73606F8;
	Tue, 22 Sep 2026 10:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubVTOjzgSIK6; Tue, 22 Sep 2026 10:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 18FD860717
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790073197;
	b=UMzEh/8s6386yw3QlanNdUa+lpTDyPn0hpVqnI23ZL29yhr1mM/BKaVbM1DWxv71wQOm
	 noWH36bfoAkBASpJdr0Rqo1wVM75ltKysQH1m7gkxBd3DUXga7N2UzZdlZt4V5yrwbAPd
	 moyE2prhgqLT2bQO3FV98j6wneC7bbhCyFIf7kNDj/BV/h2N3xspq7p/R22yU8nTqwKmR
	 iaHCpMaDYYkd6vOakyLETFNLV/0A66C9aBHDiGpHZgYvOJUPdRHdvMoWAHbPiXYrpNN0C
	 qiB/qei3NHbTtHSo/EGtzWAhblTRa9zkz4hapta+E4y6fmLFtEmQVABVIxgtFXpZcTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790073197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7i0u2WKU7jQZwwoIw4bPjlBaQgbCtzu8wqR/9lIPkO0=;
	b=nGhnCdAsPYvFu/yiStmC5l7+ejGBryAuIBkzLaBC87AqY7a6D7Y14bgsg27A7gEjPVd4
	 R7ouwDqoZK3yKAGhN8+5ksP4ySLqrb8/LN+WMCgElnT0PpvCY2UdFGnlXIkjzMgH8Bk57
	 REsw/7/JlaY5fVH4kRLHQ6MljwiBGyDjOauj5EcXjJilEofObnu4SrSrhy2CQ39uCkPw6
	 wfm5r/s1lYIiuN2Kvod3yrzXB3pj8Gyqd6Jrl7xQeUtE7+E4JXj3Adiuy0d7CXWmakBzo
	 Xz6+yWaQkZFVeT0jA5LmFUqa6CckULSWziWjv4VymIBC6B9MBHI6oQ4XF0QY7l5MOjw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790073197;
	bh=7i0u2WKU7jQZwwoIw4bPjlBaQgbCtzu8wqR/9lIPkO0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Zsi/EBJYI24ixLj6FOlMmL6K1AvgsrhKXnMY84AYSoapZsO+DnCA/uA/OuAzfysBk
	 o563hEyp/aoGZUuB1mwbr0ZRT4jqgz5R6F387ynhPlZoL2tzJt+RdlTPgvGJNHTU88
	 XdUT7dBl04P29hwcXhdbB2B/Ykvc+CEr1psXqdVyPaVLzarPzxIm8sd9haZtIvplln
	 o5OyIY/nk0S03ZJ7L/4x72B92SG6SsNrKSVf1SRo+vUXlVA3zYWlZPYvTKLLkEYkg7
	 3fjmtUkyfPSYhQjyf9mtCGbCCP6gnOBldEh4qEj28uS0Zaqqcm8Rbo0vpFg4fkyCxA
	 jxg1SgM5FWjjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FD860717;
	Tue, 22 Sep 2026 10:33:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E9D613B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44C07606F8
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgbcSN8mq5Di for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:33:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B7307606ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790073191;
 b=o7G5HhYF+/cTKbvPyjUNPqx+xDBaCSo2ux3riBWYsiAFHgwJKtKF3lKRav6Gruyzdmsi
 LtmOBb6n7JKBgtslNZQq8ug2hQl2tDMH6hoPMzNMuWCvPY2XfoVRTcDsuBsRIGhnd2h9R
 uATz1+VjXPvaJqoC2VwA0oQNanjMyMFSgyQoZkRKlM3T50htZE/mQKpcZibjsmFmh2caq
 WcP8Y57nS8xpCiKd3eN6Pr9WX9eBjWuNkqwPDXvep//t2eIi+aRExHkTure2XccMQ1/2o
 taLV0KZiYH5vbF311rYH1eA0RZt4Z5/tcIHS5at7erAsXgo9bgfqH+WKjfDzSyQXopg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790073191;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yt0leGZKCfIdcQf3yuJzyDHWvT0CgnHuQz4RTZ1zans=;
 b=Etal5d6K7jOmVcxsmt2d09xGIJ0t5ZEsfIJ734odXnZEXVbmCtocsadUeelt0VUzGfnb
 76WYbh9ZLLzb9UvKQORNN3aWuH3iABunz3u4o5FQWp30JGIiZol8Zsq2FDQ2mxRUvrQ2i
 jQU51pdeH6idBUm8eWRXfIUi6o+C9AaLTYIZOXhA3wx10ruWxvlf7MAIE8tNCI13MqvwL
 eAPMhNo2fbBppk2isxsO8wXGpMIkZcDbu1mxtdTRiDEBL0u6Id7TMHqCzZikpnBWlCr+4
 X1p/06AdYqF8HlUwyOPOCru+R+N3JE+z7aXkAPldFm2JpEmgU/Be1l4+0vB80AfZWmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ZQPeMxIg; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7307606ED
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17YY-1wkJQA47GE-00rd1Z; Tue, 22
 Sep 2026 12:32:57 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 12:32:34 +0200
Message-ID: <20260922103237.712596-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:D4f+cp4GQA5WZ+zVrkkRX0xNC3DbEgZISmYRyVsVrJ6Dt6Ta9cH
 EsnmtD79w70QpTES1vPj2792Uzj99Ngi3VfUB9/4we6h708mIpa6TDn/ZUCRhBeaQT3ZoTL
 We/91moOQ2q1OHQqz3pRAlIVtJe3XEl7nflgSUsuME1lg9J6YkYnql2BEELoFLljL9q5xYD
 164kJuqBDYk6R507qeBHA==
UI-OutboundReport: notjunk:1;M01:P0:Hh2FCovOWMI=;0ptRtoDNIF+9zjLeIj7llDC0wDD
 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
Subject: [Buildroot] [PATCH v2 1/4] package/systemd: add ukify fix to find
 systemd-keyutil using --tools
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The ukify command from host-systemd needs to be told where to search
for systemd-internal tools using the --tools option, because they are
installed in $(HOST_DIR)/lib/systemd/, not the default
/usr/lib/systemd/ location. Without that it will use tools from the
host system if available, or fail. However, ukify ignores options when
searching for systemd-keyutil, which is needed to create signed PCR
policies, e.g. with "ukify --pcr-private-key=...". Add an upstream
patch that fixes the issue.

The issue already existed in systemd when ukify was enabled for the
host build in 9668821a48d176d9b3373b7edd70846255a6c8a4, with systemd
version v257.10 [1].

[1] https://github.com/systemd/systemd/blob/v257.10/src/ukify/ukify.py#L1166

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
This is technically a standalone bugfix, and could be applied without
the rest of the series. I've included it here because without it the
expected PCR values provided by systemd-measure can't be signed.

Changes v1 -> v2:
* patch added

 ...001-ukify-systemd-keyutil-tools-path.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/systemd/0001-ukify-systemd-keyutil-tools-path.patch

diff --git a/package/systemd/0001-ukify-systemd-keyutil-tools-path.patch b/package/systemd/0001-ukify-systemd-keyutil-tools-path.patch
new file mode 100644
index 0000000000..f90aeff247
--- /dev/null
+++ b/package/systemd/0001-ukify-systemd-keyutil-tools-path.patch
@@ -0,0 +1,27 @@
+From 9d02f0d9a7cdf8bd7f05e2303f7b7784485ebee3 Mon Sep 17 00:00:00 2001
+From: xiahualiu <49677912+xiahualiu@users.noreply.github.com>
+Date: Tue, 14 Jul 2026 08:07:29 -0700
+Subject: [PATCH] Honor options when searching systemd-keyutil
+
+Options includes --tools, the directory in which to search internal tools.
+
+Upstream: https://github.com/systemd/systemd/commit/9d02f0d9a7cdf8bd7f05e2303f7b7784485ebee3
+[Fiona: rewrite commit message for clarity]
+Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
+---
+ src/ukify/ukify.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ukify/ukify.py b/src/ukify/ukify.py
+index da156d31b3a9..e6f35ee86bab 100755
+--- a/src/ukify/ukify.py
++++ b/src/ukify/ukify.py
+@@ -1374,7 +1374,7 @@ def make_uki(opts: UkifyConfig) -> None:
+ 
+     pcrpkey: Union[bytes, Path, None] = opts.pcrpkey
+     if pcrpkey is None:
+-        keyutil_tool = find_tool('systemd-keyutil', '/usr/lib/systemd/systemd-keyutil')
++        keyutil_tool = find_tool('systemd-keyutil', '/usr/lib/systemd/systemd-keyutil', opts=opts)
+         cmd = [keyutil_tool, 'extract-public']
+ 
+         if opts.pcr_public_keys and len(opts.pcr_public_keys) == 1:
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
