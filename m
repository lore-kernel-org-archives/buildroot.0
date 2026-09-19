Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35913C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 09:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFDC811B1;
	Sat, 19 Sep 2026 09:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poLOHoQhJiuh; Sat, 19 Sep 2026 09:53:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 06F0281173
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789811592;
	b=qNPqnrIOIcjqR7tySq9mdfPydXUp0mx8shl7cf6kbrALszJktrGe90zb+CjfLXI3M5MW
	 H7d4xI4w6ssbxwmG+YwbN9V9SsGanRFxEXqBdWdpOjO5qnnJqaeeE2PNgY6wWjWszkkx0
	 spCz3A/dqNhc0npNBOm/52j3ZR5InRHiZVKCWU+As9S6+w5lnRoFX4jvY11bEM888AJDa
	 CHG2J6j468O4KrOymV7xBnvshluNyRl5hLGQZsaTWt/NTEUP+mUcEBjmDjdV8U+8XiDBo
	 jU6l9F3gdDGci7vS+klWQmmBC8w0nLvKmdf6WbbQVP7WCms5vwaODChCmHBff7J1rQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789811592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WSplAqadc29lwlcmqGnF5mX9UdgL1gAfBM9WPwTV0YU=;
	b=EENQtdIeJl9gspowXqOU6x9JQPHQzYv7z8kJjvF7DPpSicBW/yg175tkvMV2B/P6rJni
	 2AMCTkBYVuVpt8KbhjN7VjYY6dyzmjeMl7FWRj4LWRC9Hx+qk6elVrqDTrkC9N39qRKT9
	 cGX94DaVy92nFo03bLcQjnFakXfKexC6/iP0mXCnYw39YHMcW4DNV0bggUT9pE/503Owl
	 ThsSXm6SzKT9Kxi0CzyGAjjwQkQyLZEX6x/R49A30SqcynxnVLU54x0vZq49UKDfuKgkG
	 mX1nc2Mb+mr56JXLGFo507WyC8gZhOGkmA+k2fyqg7QdGbjz5KwqQZgeNJd9+bG8pSg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789811592;
	bh=WSplAqadc29lwlcmqGnF5mX9UdgL1gAfBM9WPwTV0YU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r07M/YjpdTxc+ja4uGAGDouzWMiRSfIGd6tBGcmSG3P4saHtjMBtJHp/Mz5Vqfl8P
	 iXWL9ljXhRqeeinNCaoEiD5rEEJRSP1nMHtyOz6mp0QoETJ7GngUBH0mU5Z6IA/JPd
	 dQf9UBK9GU+gJW+G4kfOYk4oW5WUT+qyO4RIhx2toXfknmP7T8XggDFknH7Q42syYp
	 cHnTBVrLXGdhIMr+UIxi4wOa14WX6U6o7u6/aXSC3voClk4AFz41PfyOT21v+S8Djm
	 ePDYHFCF4NLGJdaiYwM4piQ9dE+Jk5Hw/+24eY4Ib4BtqJ9MWViSAZ2VGdh+o2CVCn
	 HA1YQYRIcTCTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06F0281173;
	Sat, 19 Sep 2026 09:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69773422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F8D40A93
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C547DxcgE2H6 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 09:53:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6783440A72
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789811589;
 b=XXrCdrP5Y707BsvqPw1kX1qg0i3tmlX9ZOqBNJovBUsHJFF4+5L4dqrgHcij8OZG0g3y
 venB5Cd+qQrNNgUPIxXdW0BWGCTcTjvKC1d9IK+AZA/PhL91NOlS+4UkvEvmrPWU/zMYV
 br0AGpGfltM0iiWgB0VnsF5xNkMchuj7+0IwZgAhsMwHCesaIb6ffg/3syWdlDZ5DyxbF
 OePqWSZVUjBdcTC8nrfJHoRHqkNfUXKMyHeXNWxDt5sq6aPRweFPAu+CL5P1w5Bbjqhgx
 wXNKL/S3uQgNKMKxAa7SkwHj7o/sFu/1NivXPZdYLjmVNlu12puLTYFdzKtIgNlIkQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789811589;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cBAxcT66XpqJI/jMFJ8ysjIyFjpLMlYI62W28cnAxbA=;
 b=TeY+Lq8g/J6OHBWwJLENjBLeAeXmTV/goLQ+LivlkBduue/AfAvcSozZXo124BqxhU/y
 qG7rV0Vdrkmhz3WdX4A1iOhA34jeantgaEp1GYZ0l9emefNUUbhlrCQbcFMnAg/F2HOd9
 fjk2S4cUJjMnYxKYZ72pq2mOGPP7VT8sT36knZYFOOF7P3tpeERVrU//RZYPZvu4VCOnD
 2fqkVJ4F3dgJReFpYw5gj88e2QRsfTMxZd6SmKa8Wboc7FhkoLtYThecqYqhxXUw/6B5Z
 8R9ftMzhqZOPBLQM8jq0EWkBlGo9O9pB6VfgGmAtIs1Ofl0uuf/V1axWSEisqcY9xuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6783440A72
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:53:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 956D088CF3; Sat, 19 Sep 2026 09:52:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 11:24:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6acaf91e5310c7d528377986812e958a112e978
X-Git-Newrev: a936a80d9e566234f3060fed521181f3fc7a2120
X-Patchwork-Hint: ignore
Message-Id: <20260919095201.956D088CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/passt: bump to version
 2026_07_28.f8df3f1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a936a80d9e566234f3060fed521181f3fc7a2120
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ation-Include-linux_dep.h-for-close_range.patch | 64 ++++++++++++++++++++++
 package/passt/passt.hash                           |  2 +-
 package/passt/passt.mk                             |  2 +-
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/package/passt/0001-isolation-Include-linux_dep.h-for-close_range.patch b/package/passt/0001-isolation-Include-linux_dep.h-for-close_range.patch
new file mode 100644
index 0000000000..2ccfd9a9c5
--- /dev/null
+++ b/package/passt/0001-isolation-Include-linux_dep.h-for-close_range.patch
@@ -0,0 +1,64 @@
+From defc25b9444c508d21badb6bc9a0b835ddd01126 Mon Sep 17 00:00:00 2001
+From: Huang Jing <rne.kou@icloud.com>
+Date: Sat, 8 Aug 2026 00:10:32 +0800
+Subject: [PATCH] isolation: Include linux_dep.h for close_range()
+
+Include linux_dep.h for close_range() usage in isolation.c. And now
+that the close_open_files() function which makes use of linux_dep.h
+has been moved from util.c to isolation.c, we can safely remove the
+header inclusion from util.c.
+
+Link: https://github.com/gentoo/gentoo/pull/46644
+Fixes: 0a510066e916 ("isolation: Move close_open_files() to isolate_fds()")
+Upstream: https://passt.top/passt/commit/?id=defc25b9444c508d21badb6bc9a0b835ddd01126
+Signed-off-by: Jing Huang <rne.kou@icloud.com>
+Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
+Signed-off-by: Joseph Kogut <joseph@anodize.com>
+---
+ Makefile    | 4 ++--
+ isolation.c | 1 +
+ util.c      | 1 -
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 77474d6..b315242 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,8 +48,8 @@ MANPAGES = passt.1 pasta.1 pesto.1 passt-repair.1
+ 
+ PASST_HEADERS = arch.h arp.h bitmap.h checksum.h conf.h dhcp.h dhcpv6.h \
+ 	epoll_ctl.h flow.h fwd.h fwd_rule.h flow_table.h icmp.h icmp_flow.h \
+-	inany.h iov.h ip.h isolation.h lineread.h log.h migrate.h ndp.h \
+-	netlink.h packet.h parse.h passt.h pasta.h pcap.h pif.h repair.h \
++	inany.h iov.h ip.h isolation.h lineread.h linux_dep.h log.h migrate.h \
++	ndp.h netlink.h packet.h parse.h passt.h pasta.h pcap.h pif.h repair.h \
+ 	serialise.h siphash.h tap.h tcp.h tcp_buf.h tcp_conn.h tcp_internal.h \
+ 	tcp_splice.h tcp_vu.h udp.h udp_flow.h udp_internal.h udp_vu.h util.h \
+ 	vhost_user.h virtio.h vu_common.h
+diff --git a/isolation.c b/isolation.c
+index 94cbe7f..a30b329 100644
+--- a/isolation.c
++++ b/isolation.c
+@@ -89,6 +89,7 @@
+ #include <linux/seccomp.h>
+ 
+ #include "util.h"
++#include "linux_dep.h"
+ #include "seccomp.h"
+ #include "passt.h"
+ #include "log.h"
+diff --git a/util.c b/util.c
+index bd4c6ca..28c32e4 100644
+--- a/util.c
++++ b/util.c
+@@ -27,7 +27,6 @@
+ #include <linux/errqueue.h>
+ #include <linux/in6.h>
+ 
+-#include "linux_dep.h"
+ #include "util.h"
+ #include "iov.h"
+ #include "passt.h"
+-- 
+2.55.0
diff --git a/package/passt/passt.hash b/package/passt/passt.hash
index af55658594..296e2724c4 100644
--- a/package/passt/passt.hash
+++ b/package/passt/passt.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ac2562e4b589c518b6e30101daaa430691da2605ccc2988d0b704079c2aea4f3  passt-2025_06_11.0293c6f-git4.tar.gz
+sha256  2c9e0f3cdb33585edc28b8171d23e0631d718ace8acbad5c58bd415e644008af  passt-2026_07_28.f8df3f1-git4.tar.gz
 sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
index 8f9ab937b1..e34e7e505e 100644
--- a/package/passt/passt.mk
+++ b/package/passt/passt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PASST_VERSION = 2025_06_11.0293c6f
+PASST_VERSION = 2026_07_28.f8df3f1
 PASST_SITE = https://passt.top/passt
 PASST_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
