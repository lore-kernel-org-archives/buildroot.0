Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD744CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 20:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800B882EAD;
	Tue,  2 Jun 2026 20:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSHODlA91adV; Tue,  2 Jun 2026 20:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA71B82EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780431772;
	bh=yttDGnJ9UvJKRaAYX6y5THyMvF39yXe4GhGsTfkITYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fkmRZvQjHCHeife4Dfrne+q1BC31mNl6iI3uYp+aV2n9st0/GxY8JBoERpUMJPeqp
	 VaO1gdmtW3XQJcmK52EiATBsMWU/RSISIqpZIcF/f0g+Nju5TNrq/ICwqBb68LNZon
	 SzzVG4wz3K0qVhrBmY93iCETOVJ/Wj3rL/w+NzFIGM6cOmCtqQr4loBQZXQFTkKLGC
	 MJ/r32teMbQrzCVqeOgZjepjj2lD7EozVm1lrb7yInEVwV5+FvtdjhHAFk8XzD+ONN
	 edakB/7l48G4jjjLv447BS0ZoBIQ4a9M1F9B+YHh8UH1M47loU8HzGIRk/WTn/rHnv
	 CH9EjCYUzByOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA71B82EB4;
	Tue,  2 Jun 2026 20:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCF13381
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2CD140E61
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DstAZqfIIXSs for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 20:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0FEB40E39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FEB40E39
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0FEB40E39
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:22:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so9317995e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 13:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780431767; x=1781036567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z//EGr9h8T4sDJwYJcD0cMS1WnHLEEenJ50eYm0/CZ8=;
 b=q5jhEE8Bb6Rkkrqv6nHgZF+gYgaYwprm5O/ADdQg1ifEUjgRioyWlEqoZX56NSnmNH
 fYGSpV29TRHZ8F7WSMVbpPTgtrBDlell+mI+sXLcVTOPbKiG6xF5+39FmeA9mHU5j2XV
 iFF41gayFhqZoZOQjL7VpDkLqWHwoYmEAjf7lZl6hw+BN25f10h8LLARV499qJ1Mvqz9
 Ui8gyM7jxPxTnazcXKzw921zRbRg/8Je0eBJ/KENLLmHT3pwB3CtI6Ock65aVPBZK/Pv
 QHs1znXwG39s/EBCLjQU7vVMtg4WtON+9WKlQO/sg8M6kK4v2+VFZmr69gsfYO1rt2HZ
 ZJkA==
X-Gm-Message-State: AOJu0YyeSLv+bDYgT4ZOKKrJ7G7kmbKhb0ps486BWyoaMgmC8bF9hd5O
 Nh+VOlWk4Z0WHF+cFfnwEbPvOIEXQMo2AXy/j/AdcdyF0q0EUbPyMItnhIu84HfskWqDy963hhs
 D7g9d
X-Gm-Gg: Acq92OFVwJM7lX5lv74hSoVZZPOMNQELWGaveBT7rnf+D61iHgSxN6ar8EKatcfI1gx
 WIQ5WiXi2QCWP8LF+vB5LEGUO9SSvyLAdtw/O30X4ObPvvr4CGzACCQq3UKt4Q2x9QcqlFxdd3w
 6g4B1gFc7EQLsaZgglkGP5ApLW9lc2Z8SViQFEL7u1iEWBGWoLI1VmgKWXlHDC8mQqymKYKGs3s
 +08qcFYtTIDWKS2PmFykPjFyxsZxPOuvKdriJQDWYKu6VyHXJaO23zIrx5NP6tQBgDuFhwHDI4S
 hmsKzHAvqZqloI2V1AJ8YlVZhOvMctgOIXe+hc+dLbVcUP7jmOodntFSyoYRnpAH+1rKgkvNW7H
 /MIteaUyNHd49sQK1rSMdvR1GW3CRkc5uArQIQMcpjhQkDv52lAyjSph63+fouLT2RcD0OILOLa
 QRNEF8CEeCqI3JxJQe9bag3VMhJmYlVq7JVKjpjTf0ik72CARMEpJl2Yp1Mw==
X-Received: by 2002:a05:600c:3150:b0:490:3b87:be0e with SMTP id
 5b1f17b1804b1-490b5fe7117mr5472505e9.29.1780431767090; 
 Tue, 02 Jun 2026 13:22:47 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b5889de5sm3048615e9.11.2026.06.02.13.22.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 13:22:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 22:22:45 +0200
Message-ID: <20260602202245.51928-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780431767; x=1781036567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z//EGr9h8T4sDJwYJcD0cMS1WnHLEEenJ50eYm0/CZ8=;
 b=gUL7HvAkyf1ZOzV/B4IWonyL9XrQnhSIwutoKYq11b6whtb1vPK+y24Mn0Sb5MUdAE
 UYYmNsxQn8UPX8hd4zH4sLdADwlmJS1VTfxnPHs1L2urMznzq9/R9/Dxa+deszH6EBqk
 iu4Ak0nlNZB2qhg+iUdVP5QblYczZzZHlZ/8spw3BEmuO+gJgmiktbckamlyCszIadTQ
 TOwF067/sqNjlqe3/h7w0jEvO2Aj3RNlg5zXjAXslfbNF56USkw80xtnsn7KSNlQpz+e
 aBbacVe5K8somzQWsez0Dpq2H/DxTp/ZxvgcDKzB4ndk1026HabAuTGGoXqf/z5oA9FE
 RY7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gUL7HvAk
Subject: [Buildroot] [PATCH] package/libssh2: patch CVE-2026-7598
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit fixes the following vulnerability:

- CVE-2026-7598:
    A security vulnerability has been detected in libssh2 up to 1.11.1.
    The impacted element is the function userauth_password of the file
    src/userauth.c. Such manipulation of the argument
    username_len/password_len leads to integer overflow. The attack may be
    launched remotely. The name of the patch is
    256d04b60d80bf1190e96b0ad1e91b2174d744b1. A patch should be applied to
    remediate this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-7598
  - https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-username-len-bound-checking.patch    | 57 +++++++++++++++++++
 package/libssh2/libssh2.mk                    |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 package/libssh2/0001-username-len-bound-checking.patch

diff --git a/package/libssh2/0001-username-len-bound-checking.patch b/package/libssh2/0001-username-len-bound-checking.patch
new file mode 100644
index 0000000000..f398260309
--- /dev/null
+++ b/package/libssh2/0001-username-len-bound-checking.patch
@@ -0,0 +1,57 @@
+From 256d04b60d80bf1190e96b0ad1e91b2174d744b1 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 13 Apr 2026 11:18:25 -0700
+Subject: [PATCH] userauth.c: username_len bounds checking (#1858)
+
+Return errors when username_len will exceed bounds, fix existing bounds
+check.
+
+Credit:
+[dapickle](https://github.com/dapickle)
+
+CVE: CVE-2026-7598
+Upstream: https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/userauth.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+ 
+diff --git a/src/userauth.c b/src/userauth.c
+index f8e02651..43d9ab9b 100644
+--- a/src/userauth.c
++++ b/src/userauth.c
+@@ -80,6 +80,12 @@ static char *userauth_list(LIBSSH2_SESSION *session, const char *username,
+         memset(&session->userauth_list_packet_requirev_state, 0,
+                sizeof(session->userauth_list_packet_requirev_state));
+ 
++        if(username_len > UINT32_MAX - 27) {
++            _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                           "username_len out of bounds");
++            return NULL;
++        }
++
+         session->userauth_list_data_len = username_len + 27;
+ 
+         s = session->userauth_list_data =
+@@ -307,6 +313,11 @@ userauth_password(LIBSSH2_SESSION *session,
+          * 40 = packet_type(1) + username_len(4) + service_len(4) +
+          * service(14)"ssh-connection" + method_len(4) + method(8)"password" +
+          * chgpwdbool(1) + password_len(4) */
++        if(username_len > UINT32_MAX - 40) {
++            return _libssh2_error(session, LIBSSH2_ERROR_PROTO,
++                                  "username_len out of bounds");
++        }
++
+         session->userauth_pswd_data_len = username_len + 40;
+ 
+         session->userauth_pswd_data0 =
+@@ -447,7 +458,7 @@ password_response:
+                         }
+ 
+                         /* basic data_len + newpw_len(4) */
+-                        if(username_len + password_len + 44 <= UINT_MAX) {
++                        if(username_len <= UINT32_MAX - password_len - 44) {
+                             session->userauth_pswd_data_len =
+                                 username_len + password_len + 44;
+                             s = session->userauth_pswd_data =
+ 
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 1702d94c79..1843d25051 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -13,6 +13,9 @@ LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 
+# 0001-username-len-bound-checking.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-7598
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
