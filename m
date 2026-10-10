Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937EECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E09407C3;
	Sat, 10 Oct 2026 09:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF8mB-336QRV; Sat, 10 Oct 2026 09:58:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A34E4077E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791626298;
	b=cvljy4aNuAKTKoie16ExkyC0XJ0BKPz6XVpuLkDSqK/k0xQ+EJUUhWf5ExdcqchETK3A
	 JbCuxbZfDORoJF6kDnV5DlsB2KXXAnjFzhXb5ycY7Yw8iuhC9IBREDneiVcG/jzwcZGYs
	 2QfQ7oWVPvf5Zj6Xah3xicIb25+FVvC8k0WGQig45SCiBjSZY4IYXqJAyVsNkROe10HCa
	 R2GzMi10rL9tZh7WJI+cQnJsI0kWAwSkOk/TQmr/kAGePqFGfnheCY2rZDGFuE1UEXyUR
	 6Bytg4f6MsDa+ilICAA+GQMUvnAIYL40dDgpKKYZZIsZOO3HMZmqhbPJTyLP9fkWBZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791626298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iSqFe9/h1ut5lppV1pgyZIllj4oqEfAwcVOEA6YASVk=;
	b=kXTmGr2pagnLqShPKGrnZtIUKX0L4Ap1dE/gnY/GnuvOPWvZv2eZ1xy0XSXuYT1vTZPc
	 4ICyUU+dQ3PvXRKuOpk5ICvDRlkeTH2tL2lBzpSGKmzHlnVfrAFyuOTpA1ruUn9m4FuAD
	 cAifNi3pjMuK1ifpH7KCaYgWUFZx9uQ/21CLALf7auMjDkuC18mdXVqPPAtC7RUFXd6el
	 sbD2HHfExlHYA/aimhWcwh0Mx7htR7BcJ9bRFReJRKvocPVLiu0otRpb201hcjtIZHBwa
	 +mqan7C2kD/IoB4Cty6sA3DVw+ZO+dEHkLYAw6tk7IwB0KB6JH2Q5WaTE1N2CySk/Wg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791626298;
	bh=iSqFe9/h1ut5lppV1pgyZIllj4oqEfAwcVOEA6YASVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ctATSV0O609sJo8lCNs459aHo0BK9KoGUlbecQxa/dMYFj+S52gM3zbPTydI/RanZ
	 /Sxq0clDPsLlrXJeGBh6oW0qbUW9uO0tfkdQPfyR5tQ7831jplYTtRYJSMBC2iOr3z
	 BzSyEj+XfiVMhl1DZE5c1fw5E+KYHXnYDNFu9UOGukD7jmQqKWfsfYLWKNsY5t0W/N
	 cMhLZGMIel5hsrXZRrd35a1WAsiwOv+AqBBZdyvMsDODkx4JBgBTcve+iKv+eydFNI
	 4MLNVrufcOur2jr3vhCKJmUDyNa/icbfPNORrqgA7y+Gxl2n58UB4El4xHjtjZRAVf
	 dqt9pdybcQGgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A34E4077E;
	Sat, 10 Oct 2026 09:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 074631A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E133A4077E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlQVZ12DAVk6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 292BC4076A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791626296;
 b=C6hTDRyEpzuggVGWylkPBQIq2sExGRW7Wlq34v3+KDdWLEjj/xrZPsw0U8NLIXNWmMbc
 pSAorie2cQHAvl4+1n8tDxFWabdsA/m/xIDAaz4ZvgGFRrmaXE6/S04+ZI+YNyyC0NdGP
 hsiYKA9kT7wo3KjPHL3VKIiVzh9E9t0zXyPMmjneyGTXUTg7Q/o82yQyl3r9xjdcNZK1W
 Xe8Ep+rdkds285lE6Sw48D/OgR7C/N77s3s58s2lxDLjfPsT4/rgvAcW0JZ70G89eNCf+
 Jmm0t8+qCytrPOJpmJ+VNvz5WMIFUmdEXQPmZhWbhpPnie+pa9t5qzEme3GmocMnskg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791626296;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+Zp1fIxifVzyHr3ydCtkIIno7jRrvsyPGjQX59rPdwA=;
 b=X0V5EgwGqz18Jda2QEL5DZvvwISfwbwCE5zdk4FVUlafBvYLgMWacoq2PC/m0lUy7Nze
 V2k/pFNPHBmC3i3lx2l9Mdr7VXP1JPtQLMtXhB0CdGQcwHAVu9QbBrXruErY/MRk/x2oe
 4raxoWpP58veM3HsBodbz8FP+gOR4VDwnZ0tLdj+M2U7qFgMNB3Bni1QuuFkHYjdW/iA6
 60AhvFv/jgiy1kTiPnXQIapsgpxuA8YJcDzI2gyMzO63fxFR279sK20HnBMwIL2Rqtv2k
 ztm/5L1+xzt3f587eBL5nRgmaci0qSp0b7z5hypWMdV+3ZhqL0HzOf+tf80qZE/yKNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 292BC4076A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:58:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7C768FF10; Sat, 10 Oct 2026 09:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1c4544f1539aeb73da97edee765d6df83248b23
X-Git-Newrev: 08ac0bfaaabed1ad89554c135ce609453d311c7c
X-Patchwork-Hint: ignore
Message-Id: <20261010095657.E7C768FF10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: fix build with OpenSSL
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08ac0bfaaabed1ad89554c135ce609453d311c7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-error-with-OpenSSL-4.0.patch    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4e1b2ad87d
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -0,0 +1,42 @@
+From b21b4cc7d0dd4c3eae1a98a3fa38f4cdb2e5a385 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 17 Jul 2026 16:41:11 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4.0
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/stun/stun.c | 2 +-
+ m4/sac-openssl.m4           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsofia-sip-ua/stun/stun.c b/libsofia-sip-ua/stun/stun.c
+index 22ca7c7..aa4b574 100644
+--- a/libsofia-sip-ua/stun/stun.c
++++ b/libsofia-sip-ua/stun/stun.c
+@@ -1368,7 +1368,7 @@ int stun_tls_callback(su_root_magic_t *m, su_wait_t *w, su_wakeup_arg_t *arg)
+     /* openssl initiation */
+     SSLeay_add_ssl_algorithms();
+     SSL_load_error_strings();
+-    ctx = SSL_CTX_new(TLSv1_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     self->sh_ctx = ctx;
+ 
+     if (ctx == NULL) {
+diff --git a/m4/sac-openssl.m4 b/m4/sac-openssl.m4
+index 289d3e1..76ba9f2 100644
+--- a/m4/sac-openssl.m4
++++ b/m4/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
