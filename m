Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813ADC98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45148410B3;
	Thu, 24 Sep 2026 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIpa8N1GlDYC; Thu, 24 Sep 2026 18:59:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC174410B5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276339;
	b=H7s4LQ6T0uMxLVmw6SPdarGnM17/c0GADVvjPtLwvn4rChFbGUfny9H6tO2IrfnP7vOj
	 TPH40ujgt2Ig2XMkcRJiyWYTlQBQz7f5joc2kWtmSagYLVH+6pPSl0flluBvzE3Urcb87
	 Li/4XExCiumHOwDoF6mgQyuSiAQH3q8wfU6PXnMH2FlSiGoqP0U3Wr+sPs4hLbCeUd2f7
	 gAowJQr7SB8PrXoHbhdlt5wPHAxYGxCK7nZRNniVs1PELwil/x1NDVycWfi4n/IN5fAPi
	 9MfyTMqVltwlEdUr1L1E5QL/DHXqZ2q0E9DbbAnA+0ZlrioHjWsOfRJ9uSQ7i2hWnKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=CGmCdsvkwLFux2v4R6NlV+T8Hsjn+14yW02G5rVAza4=;
	b=MVZcKWB1xx4477s0ZhGVhMs+slgHyhteBgsF4ydHf60QskSh9KXKBGY0xLQmR+oNiOXv
	 jSAcztOap525LxzsTcX1NmB5qNxyS0VWSzlA0ivYGwmd8l+GxWPge09UMpZR9ASf47Mde
	 2cUFRy5sPbtvkuwl6wXKAtw66uJ1FKXK5pGq3U04LofZhtKVhhBSOKCBgtmyOqLz4t0M+
	 46tIxjtyYjAru50PKnquLM6j4NAM/L8OinkF0R2X6OoTUm3Gq54VauKvKrZ3sr05mYcsu
	 hCpP7wJPoq9aRoy5awC/sfQz/bhP+pM2q9IeQyKH+OCziyI1wCQkP53Rmt4YRzA0CRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276339;
	bh=CGmCdsvkwLFux2v4R6NlV+T8Hsjn+14yW02G5rVAza4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ipDK9hzW/jLIMihaYSGF5i+a9CRBndnkZn6FIhg9Z8ddwS0QxcAEVGC/W9BfHxY3z
	 lbU/aGpbKKKO22lqZdjmltGGXTuCvNSGNJ4giX9YUnuaMC1FJpV0UEXz3q5SB733An
	 U7aAqHbNU8bBKrFVnFEjUjBGOebZTKj//OAH/CEyxzmjZlVVhVOQtUTmkFTzkEyQ6K
	 CK9FiZ7RlH1fbWxkCswYDz+PxCr6t+u6NAYRMou41KXtBp/JQbsBAwOKPJdUJ0T3Zl
	 2euEc9PkWwdgBpKSGps8zh5frP7MZ2wRggFNZDuTYC1L+Kls/0EIKt7eWEn9PBDxcU
	 ws1rlJ4nF1oSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC174410B5;
	Thu, 24 Sep 2026 18:58:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A374C328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B0E8123E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT5GkkLKWbq6 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A484D8122C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=NR6Xz7fXwJgWZhgt47PcQ0QObaDlgV9gXM/HyGu32nCiiq377JUtH5EOpnHdVV3ZaotL
 okZbuBgDGkhdvze65eJIkA6ASdky6wV+pMjzSlWR8DLR/qjgMD7RMa9Jk6GhlqsxHFx1v
 OgFx3UfWiFjiUpnSZ8aVZowQkZJ4gYHEAIn4gDq0UtXIZkb3Ks89vQkKgOvvjXGMxFjFG
 k3XxwmxUUWMXA36+zSD1OrkHCg8+IvOkFh4urqwqs9afilVJUJbjz2gBgtzB8Q9zokq3h
 7kZammB5qSYIknVZVEifYTycFZTPnyrQBfLi58WiLA8AyeSi2k5IMC4WVxqxnF6W88Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uYj9VVQtVMeNKjNnIFLLYeVgSp+YhyL499ubYNDggZE=;
 b=RKwfhilGLJr/aYvVeDGcODD/wPwz79YOFgn6FLAOXfit1ux/6CpzmcDL8uzTDT3km8a/
 1ZzK9VrI1uO7vY5AeXnTP5EGjXwfdfeq0azLnD/DnZWoOI1GGGkLDdLrnFaLUIRLAv/My
 1njL+RzEK0I5SnomOehvwyGEqdc8/2Lh1qUJO3B6XJMB85RV+DYAOCV6ZM5dW6fOtdwMh
 rz5Oxwne3uboq6twsB00TzylJI+TrQUBd+lLqBh0ipxbjyqH30teXeLwuhhnCxjTuc91a
 jHuVFPD5vXjq7vP8Fhy43i337Fd8t6z0PzsnAMMH5f0OHtEMS+00QIC8F6/bvej/UrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A484D8122C
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4876894AA9; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:05:46 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 52446419346fb5c1557aa7543bf674f616ae286a
X-Git-Newrev: 9149362ba8c8bbfdf8e7987c6b869a83d459e3d7
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.4876894AA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libest: fix build
 with gcc >= 14.x
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
Content-Type: multipart/mixed; boundary="===============6373006659781916592=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6373006659781916592==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9149362ba8c8bbfdf8e7987c6b869a83d459e3d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Renumbered remaining patches.

Fixes:
https://autobuild.buildroot.net/results/149/149aad6f98163faab14232a9d3013c197579cbb4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2e1e3b5e09dfed6909e9de870ffb277862ca5110)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-jni-client.c-include-est-est_ossl_util.h.patch | 27 ++++++++++++++++++++++
 ...-remove-duplicate-invocation-of-AM_INIT_.patch} |  0
 ...locl.h-add-missing-extern-on-e_ctx_ssl_e.patch} |  0
 3 files changed, 27 insertions(+)

diff --git a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
new file mode 100644
index 0000000000..d027d8012f
--- /dev/null
+++ b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
@@ -0,0 +1,27 @@
+From b49542dea03c4b895a860c393453ab8497dabfce Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 12:52:02 +0200
+Subject: [PATCH] java/jni/client.c: include est/est_ossl_util.h
+
+Upstream: https://github.com/cisco/libest/pull/132#issuecomment-4749526125
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ java/jni/client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/java/jni/client.c b/java/jni/client.c
+index c5bc28e..2c4663e 100644
+--- a/java/jni/client.c
++++ b/java/jni/client.c
+@@ -12,6 +12,7 @@
+ #include <stdint.h>
+ #include "jest.h"
+ #include <est/est.h>
++#include "est/est_ossl_util.h"
+ #include <openssl/x509v3.h>
+ #include <openssl/bio.h>
+ #include "safe_mem_lib.h"
+-- 
+2.47.3
+
diff --git a/package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch b/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
similarity index 100%
rename from package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
rename to package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
diff --git a/package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
similarity index 100%
rename from package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
rename to package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch

--===============6373006659781916592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6373006659781916592==--
