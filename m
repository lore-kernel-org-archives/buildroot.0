Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1896C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CDE401EE;
	Wed, 16 Sep 2026 21:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKN0oM8Et7jK; Wed, 16 Sep 2026 21:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4601C403EB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594938;
	b=UHJPhOdBfte/uvn3a/i6lQVTF/tN/OCfHIqlSuctXyW6864xYuF2zhRORnD2vN7YpWXY
	 cwJnUKF27/CRUffB+EEiEEn6TkIZFMBaZpGa8mfzGJxJAWAD1KEI5d651FJks8951Qebx
	 TiKpHGYYyXARHwuPLg75c2jTCwYI8ybIzKRvpZD3lsUCywDDGGYw12IlXBPatcq3X6oWs
	 udmdmOqJXZTqMzJ1SRKuy61joy1V7GdbjG1kK2ucv47nSAo8gf79rNwJZOlV5Pf1eSb6c
	 o1bne+zI0Hpk6T9rduMNV57UXHswBdeS3DYfV5Qw5nD6QH7s1fpJzGlc0QS5MgpuNyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ig/1Dghl/yM5+l6iOAOo16ePtR33W9NitBQRom0Zjh4=;
	b=JGnHHAqBcP5Y1FiJ2sungXeuZLz4KDxUgL5/PqA/phU5R/UgaXvpchYUGCdzhuZ12wqN
	 Vf5pPUYs98RfpnG17fmO1fYMMjZLm6km2OOlbaQsj9jdOkqdPY5x8TC7KCkT8KOzkwqkd
	 FB+5MAsmzHzf272iFVLv66DalvjxQ20W4VddlGkuWC+MMoTnJGFB9WCo8L6qMeiw+4V/2
	 dj+Wo5JEpOwjSnR7ZmWUIj6NxuoednDTshay9LPNQeHzpzFa00jXTYjwzZqDitRbOmJZu
	 gyg5kc73d721vz+f//xE8uLTjnayaIgK8VvUpv+GpanpxJwEseqtoogDxqvkra8hcOQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594938;
	bh=ig/1Dghl/yM5+l6iOAOo16ePtR33W9NitBQRom0Zjh4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aX9QSGbkz85DaE99r7jlmC9C5btMl4u7Fg4RWwxyaEoZav/ufJ8oyrMKDsHP1aNLM
	 /OGfYY7zt/9oFO6yijWqlFh69j7ZWne+zQbWHhze1teqfO5YX43P4PKR5UwAxSJvlh
	 CL8nHq480V5rmj6soa76Ku++ddobW4Y4edfhCSSA9hFq9QcgV83LbeY6PICL3n5Egi
	 /IlEhRxTJimir7ADIjLPmjzDIOVqV9l5sMApioLjB4yFBiM8IgNKuZ/dSVbNXe3DVA
	 gE7sTf3HiFq5knlziAupnEpfnTq9CNs0L6bFyfM8rveNwythhN+jWcWvZWzGVd4O6g
	 OTHj0c5WY04lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4601C403EB;
	Wed, 16 Sep 2026 21:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A59FA2EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A280A6062D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdYzE5sfXJpJ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:42:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E598460629
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594935;
 b=bofA19/dUjc+VoNxxhQ9Hd+k2ntdTvX5NvZjPUKHfw06vQOkPc3j/0IIrNYgXVM4hw3l
 kX8kTthLfBUtxeGjccvdyJJPpBeKi4cp7IdC4yCuEI2iX7nXK1n2XdCW15HsalFKGKUeR
 HeLLS418nNSLCIP7wrxm5MqG9x9jDCe40xgNiTxD5FBM13dt2Q+ft9dfOZk3iykVs0g+c
 zyroMmPmKMhchmlptXB5fTjmMRlbMsHDtfRxn6ll4Jn8WmbwqAwKAMKKX8ySRutFhCR0/
 2YTWDPzIrDc6rz2YxZ2t//5G5o0aNoM4GoVwuyXIN6A8D7QQNdacpEIaV2KMiyqGMCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594935;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=f1zzQsT7+LE/pD4yY/el+HpujKmWTJx1TkPIkOagAuI=;
 b=jd3/vZ5Xnqoyf7K5dTVoPmczMV0YwvNml1/AfaSYX0tqRuC6qr4Xu9PbSQnBUGVWMbBm
 +R0pjE427FqgC+MtgIRcFMHaHymwaPdNRDOhAbWjnZMJSI4THaPcZOuMA74eyWx/13t0n
 tnar2fUMfSdcD9hY0fkjXpw3VY9ts9y5z2rUoiQq7ERd7YeeLz2M90VEpumm5H85dQtB4
 nQ4ljFwTrODezCJJgPq9kOjE5P2tx9XRT52YZyic1LUHzkbIdrm2n0fNLx+eG07bzSulW
 UZTmEmfvW371SoYID5Fa6O1AkyqogLHZ2tPC6xwWPAtpi9vvYHMR9XclOw2XbvTZaRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E598460629
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:42:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DF2296B39; Wed, 16 Sep 2026 21:41:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a
X-Git-Newrev: a7acedfeeb22007cd919330cda8c324e2e3dac5e
X-Patchwork-Hint: ignore
Message-Id: <20260916214109.5DF2296B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: install D-Bus config file
 cups.conf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7acedfeeb22007cd919330cda8c324e2e3dac5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When CUPS is built with D-Bus enabled,
install cups.conf under /usr/share/dbus-1/system.d
as it already happens in other packages that have D-Bus configs
e.g. dnsmasq, wpa_supplicant etc.

Signed-off-by: Andreas Vida <andreas.vida@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 0df4f411bb..3e85a2eecf 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -45,6 +45,11 @@ endif
 ifeq ($(BR2_PACKAGE_DBUS),y)
 CUPS_CONF_OPTS += --enable-dbus
 CUPS_DEPENDENCIES += dbus
+define CUPS_INSTALL_DBUS
+	$(INSTALL) -m 0644 -D $(@D)/desktop/cups.conf \
+		$(TARGET_DIR)/usr/share/dbus-1/system.d/cups.conf
+endef
+CUPS_POST_INSTALL_TARGET_HOOKS += CUPS_INSTALL_DBUS
 else
 CUPS_CONF_OPTS += --disable-dbus
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
