Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25605C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12BD60763;
	Tue, 15 Sep 2026 17:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YR-nZ-h8jdCz; Tue, 15 Sep 2026 17:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EFE276075E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493247;
	b=TZcz1miZSobmSQcl0Ei9lyUXgvGrS/0/qtLrTrI9b1nl1ZN2s0mEL5YsJflK9kWdZI1h
	 wSFpKel5MrtmhWZxpY3kBNVvhpFiv3rPDcgPK9w24OXIRUXGqmoXRzoftW+ESuKQ45TKu
	 +M25VQKxi9jpqPo50ERsdrew8BEXwKHJudC38mFYE2ve/FyWY9USFXfX1d326HwkV6xSf
	 /6lP6+TjLo1tIIIexnLGQLLxSnCObQwIJoVcItUTc/n0n2H4ChZSiQbgVIOVZWNyjiGZ/
	 8ElsbghfNgzCYJKGqAAMulFjjc2YnI2PWZsPOdsGfoXXyZf0p7Hui0xaRNxLhi2Kixg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U1QvY3yA3+/vrZD8cB0PTgulEnANehibtz5Bgb99KQA=;
	b=QWXpasFTVmco8GSiOvXZcl3YKaqgVp2loXCywJ2LFJo8XuhMFXCiMvxJdavF4fLsHdli
	 hfRexnRlBf3ODXLKgqY2rQDSu4GhOnmjuLAM1KN5lxqkO7N2XkSBjI+3pOwntd3vN0+JC
	 lWmM7hJbxy6lqjnk4+TgXePlRF5O3qwM/WMXMTYsPvMN0KrGOIBlqAHZ4a/J3l2+L3Yw4
	 CDhGV4ZKq6lS59eWBN0+Rt/mrMMBwRhDEo4Gh50JAroGuE37Kgyn95JZeiLNmgI+y5Msq
	 BNwjrPF1zHW1Z/VNxRsP6H69p39iKzlCj1xiODwMb9NCQffE6+YKUVZoWxIyrFpftfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493247;
	bh=U1QvY3yA3+/vrZD8cB0PTgulEnANehibtz5Bgb99KQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=owwaHv1r1xkOidou46kHT/fU8s+mtWPQQ6+i1NYBptTdOzKlc/bzM3ByWY5OUbh6S
	 YcK+1lACYbMc/LrqCyoGLxnPPcPUPjrnQahjqktulW+IiUOdH8yOkVYphZnkZbKnJf
	 2KZuS2Amdk+KZgi2tBfzGJjU7vV3UWrF4eLqWGL2KPXy3nvGvHmog9ORY15+Nmz7ix
	 AsbCUG2B/gPkA3m9NME0jNyIGRQJdNKOWNRcJmh22aZWhClHDbbNU7wMREd7zhgVWT
	 Bc8V0lB6wDunjP2fetoETHE9gxm0tpKjkfR9xl6S85niWpbOJ2r28S95QiN5zkNb7h
	 dgDNlIXYdbCaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE276075E;
	Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E77123F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA0040535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EZXC7ucTiRq for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F174640400
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493246;
 b=V6pvzhJZcIqxCE2RsOgMpgRAEAblj7rxlEbQL0tkpSXIs76ryM8MSjy/4ITh95+sjtuL
 hayXlYfYBXW8TtjXwCOk3aSpReagq+C52P/xlptQ131wlrDJfgV0UWclVzA/PuRz9Wy92
 49IzGaG0kf2fbIFrwVYdIUtOh4dgQK0a7mAyj/E5HljbHWq9lyrNwMzHgrTzJpeueSjfG
 nu5rE9K33xaY0bXAvCMVNdT/U0Q1zIDNdetzuH3LzFa0e9U45gX6xZaLPVX/G7dRdGA7t
 gox7chYSCUaX8JKJ9T+AhXXTxIGB9E3SUQm48lNx/DPSsxP2e8F6sYWrn5NA7Xwcwsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493246;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hD1s3vLV5KQ+0Q7xaV51dg/J0vVKqP0uE8Lbx2WmKYU=;
 b=pUJM31bDHSbSHcB0kt5XNC2ve0MCD+R98DlPbibOVVQR9RMPCWyHL/wOt/xNBpzPHqX+
 M9H1TTNwloZPyqKlnit9KSIInEvJwM9fubN8q7aGxbnc3zrygf5UuzJoIHz9D8eFhDjEJ
 KqjmG9161Jzs6SqW+5Mb9PNkHWNJbj3xv8ELQ1ZYGdBO9aNtlwLFn3HTVVuMM4WxW58dv
 pynuTfomibOGaTooI/BHXR6pr52en3F4yhkKAyiGdaHAqDNWq9rFKpUkvMlJ3qlqU4/oq
 ABdz2aXpEM9wvqF0TFyrQMpViP8NJc1nVLUD022gcfOxXDk6yDXK3LLgszmxzc6I8EQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F174640400
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04F0395DA3; Tue, 15 Sep 2026 17:26:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:24:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd5eab10fef0835dd04841c315c03c45d916bd67
X-Git-Newrev: e91ffb1afbfab37a6fab61d01619c8759ccf8162
X-Patchwork-Hint: ignore
Message-Id: <20260915172620.04F0395DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: propagate gcc version
 dependency of protobuf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e91ffb1afbfab37a6fab61d01619c8759ccf8162
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump of libabseil-cpp in commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
of this commit, the protobuf package was updated, but not its reverse
dependency netdata. This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/netdata/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 527d4d39af..2c7d456528 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -23,14 +23,14 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
