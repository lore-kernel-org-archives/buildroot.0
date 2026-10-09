Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903CBCA9EC1
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAAE7814A1;
	Fri,  9 Oct 2026 21:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ9_z7L0YUJk; Fri,  9 Oct 2026 21:13:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DDE5A8149A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791580425;
	b=afL4/MqtmbnxFWSYe/fM3lHdF2f44/oq2HgQ0Q+yP6CK0YGBOMr9M0ZPzxJXGhGuFVvD
	 mthwIL/XBi9BpHAUUEWGH5H7b1yRScpntHRpUMlap7NL2ErtdQQajjoi2baYeJvrqY5mu
	 czhtXmmhLdE2mgPzeQ+Zan6Tea52OdHUyn2SD07Nlfm7FxK597/cOPVHqpG39vOstYPPk
	 x7121DB2D71NQ08E6vCcYtXCziZHhIdV3kj8lrYQ1RpGMy5d2urPxQhIN5oqiQh+71Z4T
	 usFHVHMmjQFuzEA/XZT5MsnFI6W1iD0xY6cpDVB+eNqUnED35kBQ3C26J0TV75toR/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791580425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VnFfOpSMkUFqVNAspkXvumX6dix4NJe/cA5N3gYacpI=;
	b=N12f/ayjILQ5ICDtHbghyTdrEE1vNXoMSK6M7BPFb79eLsmGUuBvcBeH8W8PIAyR4Rvi
	 NbsD9YB5KmK8cbT15VjDd76J6N1CuVW2po1/qU7gKPKYGGMW8Enj1VCZovb/+34zzJjx6
	 iEWJzYGhnTNiKP3G77Ukj9fdp7slGFBkIm100u/7qpmJ7xqR9r8x3ghGD7A3lF5a904yF
	 tikDEP2hWDO1Vhz2x+yAvLmJ0acDrQZo0We2oRq9NRG80j5z7OwbTkGWJ/GEURk9plj3M
	 LnoVnYFDmx2yxwxdGC+mnZY0VB+AL15PRWFXPKQQG/KQxe+SdEDIAq+Gw/jqYUfajOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791580425;
	bh=VnFfOpSMkUFqVNAspkXvumX6dix4NJe/cA5N3gYacpI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aag7MEzqoe0/CZGASGZhl177VjrD1zjHB/aFe7nOuCnR/wdlfzX5CdFcxUsI8Adm+
	 MeJb2VkLpTZQqxmxDXe8ZWQvtzWv4Gt06CLAPSuCeI0sVOYiie0GsDaUct3JgKE3+u
	 9Cvv5cSetzMTB+PHa6ltIzOPx7GRBUB4TxkHNjCncfdSOEenxjFDtGDn2/YBWFGK+6
	 /tRIKbSs8BU61GaeO0ACr5AGcW0YANzsXTmnjvt1nVWBhzV/Z0NFwZR+7l8bdBNFoL
	 ayyYGXta+HimOZPCID9oEErhEzRe+IZ4a9LUqfMbe4gXIR1FObk1RjcKF0AhOe+ubz
	 fUhNkZXOAo8kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE5A8149A;
	Fri,  9 Oct 2026 21:13:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7949B14
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B69A40080
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJvktjEeL2UA for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 21:13:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BB3DD40053
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791580419;
 b=BYKBfavW9jWy43ekEDVd8iW5p0dtcbyjx0TQ+RW9zkGvt2x9u/HFOhBKSrh5Ywx5DuXY
 ukX4wmSn97/8FI/vr2dXz/3VvMjvS6h+bploTPibjLei021v+DJpARJNa/VwDaeXp6cKy
 su7Ux3XTp5OhC09U/gYPI2PaYEyknr4nkDz3PMBzJq/9IrslxfeI0RjwLT66J31ALaO9U
 q2PpEiQUzE2lU6j/CQEvvHHhWXKu7ZEUSTlcvFNZ/9WOv2/k4TQItkglhrhxZPCzqTYwt
 a1bGbDwZI+H9yTzZvPFKY5DyK2YDpGJGesivrJmXfvAX3toqYr+hyX2O2BokHpH5HAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791580419;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s5tT/7Fm53u8lcYBKwIR69Bvnte8qQx8GPyyR13grns=;
 b=jNpW/2wcDbScQmYaXd/Hg8JPKnKTntPxl682sZtcP8QAC/C0RW1DRvsff55/nDc0SnjI
 hs+oBr8BTW4d66ySy6MePY8aYAhw+ZUWF1UX7v4aiM5UBRYA996Oypa3TJjMn8S5RH5Lj
 W5z19Yq7aB1EDAdsTSSAGAVVeWU6xCV33n6cIPIOe+2d4zBUFh7rRPRmgh5Vjc6Z+ZBky
 CpoGOCewObzI4BfpQZPnE7LO7J6seyaKWX+oZ3i6BjJu9OPL64wKUnb9CBxY2yiomKff/
 A/5jNy9pl+p/C8/sKyYgQCB6CmXr4t4AbXohjjHW1kFSI1icT2L8cOHnwYJTg9rgzcg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB3DD40053
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D39588E22D; Fri,  9 Oct 2026 21:12:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 22:21:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67905e82827c32b452f7e4ea34cd8139c7aa0096
X-Git-Newrev: e34594a75228ce545098c82746d717b970f9395e
X-Patchwork-Hint: ignore
Message-Id: <20261009211221.D39588E22D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: minor cleanup
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e34594a75228ce545098c82746d717b970f9395e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The iptables-less configure option was spelled -without-iptables, with
a single dash.  Autoconf accepts it, but it stands out from the other
options as a typo.  The Config.in comment also listed BR2_STATIC_LIBS
twice.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/firewalld/Config.in    | 2 +-
 package/firewalld/firewalld.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
index 407f57c604..6e460910cf 100644
--- a/package/firewalld/Config.in
+++ b/package/firewalld/Config.in
@@ -38,4 +38,4 @@ comment "firewalld needs a glibc toolchain w/ wchar, dynamic library, headers >=
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_8 || BR2_STATIC_LIBS
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 8a390c0fe6..ad1c21b970 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -50,7 +50,7 @@ FIREWALLD_CONF_OPTS += \
 	--with-iptables-restore=/usr/sbin/iptables-restore \
 	--with-iptables=/usr/sbin/iptables
 else
-FIREWALLD_CONF_OPTS += -without-iptables
+FIREWALLD_CONF_OPTS += --without-iptables
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
