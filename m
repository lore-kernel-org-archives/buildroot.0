Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAEBCA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 18:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EB640D06;
	Fri,  2 Oct 2026 18:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY_4gZuHpWke; Fri,  2 Oct 2026 18:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E9D2340BA9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790967252;
	b=n9IotGAWpOy/LUEql0hpPbxNj4gntTxA0ggQ2dwFzmy8dzGe1yZXOqrxNFsL6b+nlOCj
	 8grtHDuZ9RpaeBrT8EqoWLxNk8/yi32+6YNPfxUQVzYVVZ520aGAuf3iiEKFO+/KXvqa6
	 Lc8J13H4fF0Ame/0Ny7dVPiWlJqNzply+dL6d7dD/yPNDSyiMlH2mcpjeEXvEZe/fsz0E
	 n/UlhM602iNNt3SjFmH9DMMXGgQ6R2OPhOZZJotcFO4/i0dVd2xYlP3vGUOQi51J1rqdE
	 F8soRPIvJHuOMAabm37I6G4de6mgA6+a2isetXaXyZNr+tyNWDrrYbNrzxyhQ6JEtdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790967252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IW9iiAROn5uVYqQGDCwyBos5tsI/cn48R6SzoD1A6nQ=;
	b=WxFGIXsMJjUkVVPve26JL8Y262clsMP9erpWZIAn0RNEMjnA6qmnnbI3JYoRmVTEkWLu
	 l5p/Zyv+F0VtQBR9KRj1js3uVKsC0sJIB7/rIygbIQhALMU5lvats1Qj7IOtGUkM9Wffs
	 nWcN+39/u44B/g9TsiGW+Lb8J4kgwlyR2cPe0xmBnDJAlXHm/K9UBQeecp0C47Vc7+cAZ
	 R5QdbxYyy58v9s3kxYN/zfw6Romkz9HEdFVtmdf3YtuZ1A3MEXa0I9Rsgw0AvWK/5pOUC
	 ajNBEun5D1xJmwZ+gbPlG5fBMSgP4IbXfprLrVLo+KEfLfUSrtHH4XRTvAJ0u/6Fhkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790967252;
	bh=IW9iiAROn5uVYqQGDCwyBos5tsI/cn48R6SzoD1A6nQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hspZsBXo6KlvRAUl898Wdo9/e9t0VOTod0iWwvxadgP51ayISTGcTICarj3EHnOO4
	 eLQMI7dKAcMcNlhcU105NPV+pIuiNx5tT4ireC6MBtS7SvPdURKG05HeK2OsNcn6fW
	 c2oBzduKzB/m7jE0MEqPuEvEXD65uSiFOckmVNe0hTWMGTgw7PnFRuOF3LjnKUaZQi
	 0NdQ230xyY7Ln4/1uNmvmnFblUmpfiPciF5Dxyi/E/kQDlb3GALQKvFIFUJRfIscFm
	 yhbzBUxCA1GPikpFQKtHj1LEWb9kgEODIEgFv/grYcBKDUNdZ5YJxoGpaWT5UTRQr9
	 C8opf2XCW7Rvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9D2340BA9;
	Fri,  2 Oct 2026 18:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B56FF282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D99B60BC0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjhbVdmUkx1k for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 18:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CDC0060600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790967243;
 b=cvo6CRUcew5qZka0wSUQ2J9xI0wBvG0C8dAWNLlWqUCvn0MqpqIRcjLePIFIEsocWQx0
 Tz+7nzncI/XGW2uTuKXgWa9DwewHBi1d98b7YLS8mnlGov1dojPxGXYxW5x7lRJHzWAJa
 NFQwlDzamjgyv5usWyLs1LhhwRms3+tAyuaFhTqun9o08kOY03cEHN6vSfnaA/m0WFcs9
 1dGcowks9Awh40BxsLNVgGA7DKlPXVY7Oi0OeiBhp2KP5FQGgvFOJbyjYTmwwUAaomp3M
 o+hpJtlhANdqeWT0hf6mqK9Y0mxE4+BZVMNo85j1/tIzlztcmK5oc90kxhCwXwqKcOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790967243;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hT3PSEi6vlQm7pBs/tLr9ooLaSmXujcmIWbowtKxY/E=;
 b=VgUnSk2Nkwo3GabcqEfG2TGCKF8PNUPNM4E+V8GpgVa8kNmibRInlTUR6rK1wIUvDsYb
 3vumE2nbtr4ESuC3kJiGjjCt+qMT0ibfmTllNrAzhWAGaIVcrO7an2O2GTslXTwm6J7Jk
 bHwBvH4oo8fDlHU9ioxnjRxrsX6aJb0k3JKfCpjyeopNfXHFP5P6p+1v7uuQWAktEHQNd
 Tyf7oRGNbzTHPKWp7tU3uKk6hnKXcI870KpOR1KNrqjEKBjcO0BscTVGRtaG1Zc5NVdsy
 PIqKsh/wqH955EA0ia+cmWp+J+4zaZKjt/lMGIQf7Kr9XI/qeIP4VNVPxHNWUmU9evw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC0060600
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74D3680091; Fri,  2 Oct 2026 18:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 20:46:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddb043b26a4177a98b25ed06c80a4764b7c0fcdb
X-Git-Newrev: cf669d533ad4a0078fc2627b51fa3ed91b0f875c
X-Patchwork-Hint: ignore
Message-Id: <20261002185249.74D3680091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add clock group for PTP
 and RTC devices
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf669d533ad4a0078fc2627b51fa3ed91b0f875c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

systemd upstream added a new udev rule to set the clock group for PTP
and RTC devices, allowing applications like linuxptp to open clocks
without root privileges:
https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Add the corresponding clock group to SYSTEMD_USERS so that the group
exists on the target system.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3223915d40..1f1b5823a2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -699,6 +699,7 @@ endef
 
 define SYSTEMD_USERS
 	# udev user groups
+	- - clock -1 * - - - PTP and RTC device group
 	- - render -1 * - - - DRI rendering nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
