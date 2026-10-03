Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A34CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E5F41129;
	Sat,  3 Oct 2026 10:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IStANroBTMjM; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E9A0E41110
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022032;
	b=VXe5L2hgdUPdKDAGfHlXtIxHOfS6NVI+AnE1fKwi+vuJF1PWVA6i5FyaAAR8f55dOE2U
	 F1dNyDUALBdnmTnZOEz1GAwkqshq3FrJEwAdEnH09UYK2hQJWTgJvOMRBAN3csYKCAo55
	 UP88F1Jp37ARM7Mw9DV4r6/QB5YwbjABMPstcl+D7rkqbnybWyVaVrB6mIb9i7RwBl+Ok
	 0uht5muVucsmzsY8N8GGk1T+Uglwdc3od7DvnFJEdUFoX45ntsOxvcbwBCFn4Bg2vhbFl
	 Z0+a23WQAuNAfg4wlUpCYKPk9NcuwlNV6dkwNbFC3G+cnZLaMoReHCYo6olnQt8NXfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TlEc9bQFqQZyO3J9KctRjVxO/TVjtmJ2ChhOpbHi0ts=;
	b=MXr8F474wxC9lWS5D6DHXkjSs0iN4IDWJs2DH9ZY10vOue/70BUTxWCwrcVqSdgULGkG
	 yasr7MwUumkWpj7v2rTerpjloXqZDDx2Xr7EHmVvzMiwx9ouK6NpRdAFZm89o9YIjd96J
	 Kjbi1LdbKyjExBiu9VujcWH9HBINXBtz8OD2tnllcsqkiizC9oCkEyLP+Y6xtaxAu8YPl
	 /8kBYZLl4BVWGdXqEZ872C16VvwzxCLMDAt/MVeeZWVbbQxpYhuRsceGJSkXiS4/9/W+F
	 UgPE4N+UtAzx35FQancq55haekkkGgderWyk0Key70gL3xybZUONhCb2AKhkBrYdyTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022032;
	bh=TlEc9bQFqQZyO3J9KctRjVxO/TVjtmJ2ChhOpbHi0ts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DrA2zC22A7Etk7yaHC0APpr8uNYj9dLgwEE8wi9mvledH/tdPII4FNMEUOxNmKp6L
	 c6I24PNzH6iUALsFg+d0Bt18zRx4DzjEe62ycRmfhTbT5SxJEZN1lEGcmGpOCaRy27
	 DkgHjSfjqeGL2T1jX2Xj2rSreGp8q7XAFGgINnDOqjsct0vnH9tKvcI21jnBz7sv6R
	 KFZY00UVO+H+1dIAm7cBwCS3xAESTvN5raxHWbgt2GLyki9Tl7NohyslkT+UdVnkD3
	 z9G2ECMQ87wlV0NXup1ZZi9DUkLtLkOUxOufK259dkP3qu2xnNq9f6saEsCgi8R/zp
	 BZmp7ewMAyNxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A0E41110;
	Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41652179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278B1400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEbRi8H1_AGd for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3C07C4007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=THBkrCfOBq/K8KxD7YrCj+XMqI6IIMkcXrNJQzYRXkkKWmQ5SFu4tic5Xcs7/8sTAcPU
 h8/Nz3KxfbrsFcLaupyL3o9GoyvhRDp31Y6ijpRudlcDLQEAxhOPDemK/v2GW1wxq285s
 7QLMSR2O1M74LJTe0SPXv4WFD4FIh3ZI2W+5cM4bapok+eZBQTgKiEco9acyqLOYyYunb
 BvxpSKZbKBdAXb/Dk3DmWR+yyct7Uw1u+3GiCD+t/CrE1Z8Ev7GXHIIfVONhfxlp7SeNU
 lpjwPhsKYA6BFdxdUa3qYlEw8PIKCakczHa0lOcz+1l0xTQWB7qAB1mzU0AqtU88wJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vYEHFWBPW4ejM0lsb5JUWVpXytFnaO24RnfI8k1HlAw=;
 b=abaSynu0Jt41LHjywXZGUuSCjFPxdKQzW0KPFngXrexrawX2lVMYAV09y57stAtiO5A4
 JoyEv/6AZy7jB+mDisLj0UqGB7muxVLMsujIIUSydhbhe7LcSmk93mqkR14pWQL/nz0m8
 hj2F949Vo//Lnn0CNQQoPMywN9ez3cxFzb3PaSCi2GcmIxpYhU/k5yaQ5GghNst4bfPId
 yR1dp9BdXqWk/Dv2DFSSJoznGuqNbpBLu35BMLcUUVXys/tNcQd007o+m8/3M7T4NwYgi
 5yaD9cpS0wcH/W5Qxi/l2kdKKtfAUT3ydJJieqdLPcT9mnyX0F7rmE6NzS0iU7N9BUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C07C4007C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 941DA8191C; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bb353814c1ed765ec4d634fe47201bd93d60dc2
X-Git-Newrev: 77e4be3ed6002e0c9e36d9d32aa26261b52d6c40
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.941DA8191C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-python: bump to version 1.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77e4be3ed6002e0c9e36d9d32aa26261b52d6c40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.freedesktop.org/dbus/dbus-python/-/blob/dbus-python-1.5.0/NEWS

Migrate from autotools to meson build system.

Update the license file list for upstream's REUSE conversion. Keep the
full set of split license texts in DBUS_PYTHON_LICENSE_FILES so
legal-info can hash them, but leave DBUS_PYTHON_LICENSE unchanged: the
GPL-3.0+ with exception text applies to the unused Autoconf macro, and
the extra dbus-gmain MIT files are not installed.

COPYING hash changed due to REUSE formatting:
https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/f83a62c27203553c04c375ff663d9d99273670c9

subprojects/dbus-gmain/COPYING hash changed due to REUSE formatting:
https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/ab33ebefc5ca34486509e3a87591ad2e883b9549

Removed autoconf-related license files due to upstream commit
https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/b286e65d1e4c88db16876e31e6b1b63eaefab2f8

Switched back to gz tarball as provided by upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Bernd:
 - bumped to 1.5.0
 - updated license files and tarball URL]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-python/dbus-python.hash | 10 +++++++---
 package/dbus-python/dbus-python.mk   | 29 ++++++++++++++---------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 8d1609dec7..ce04474291 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,6 +1,10 @@
 # Locally calculated after checking pgp signature
-sha256  92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260  dbus-python-1.2.18.tar.gz
+sha256  ac94ce330879108e5d37105164cc14b595bdf9326d2ce4a5acad6c1ab2bf6476  dbus_python-1.5.0.tar.gz
 
 # Locally calculated
-sha256  1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0  COPYING
-sha256  064523e3ab64d6f03904132b2cc4a1bd8500586edb4cd050c2ff2b96aed4c33b  dbus-gmain/COPYING
+sha256  c5324f0629698cbe01dde8e3b802c3331601ebf98c3c65918520ba5eca66c930  COPYING
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  118fdd408a78866c5b776864650f4a6006616b5bd0793a63924c91febba0b2b8  subprojects/dbus-gmain/COPYING
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  subprojects/dbus-gmain/LICENSES/AFL-2.1.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  subprojects/dbus-gmain/LICENSES/GPL-2.0-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  subprojects/dbus-gmain/LICENSES/MIT.txt
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 16b22d4821..1a69de0215 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,25 +4,24 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.18
-DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
+DBUS_PYTHON_VERSION = 1.5.0
+DBUS_PYTHON_SOURCE = dbus_python-$(DBUS_PYTHON_VERSION).tar.gz
+DBUS_PYTHON_SITE = https://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
-DBUS_PYTHON_LICENSE_FILES = COPYING dbus-gmain/COPYING
+DBUS_PYTHON_LICENSE_FILES = \
+	COPYING \
+	LICENSES/MIT.txt \
+	subprojects/dbus-gmain/COPYING \
+	subprojects/dbus-gmain/LICENSES/AFL-2.1.txt \
+	subprojects/dbus-gmain/LICENSES/GPL-2.0-or-later.txt \
+	subprojects/dbus-gmain/LICENSES/MIT.txt
 DBUS_PYTHON_DEPENDENCIES = dbus libglib2 python3 host-python3
 HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2 host-python3
 
 DBUS_PYTHON_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/bin/python3 \
-	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
-	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
-HOST_DBUS_PYTHON_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/bin/python3 \
-	PYTHON_INCLUDES="`$(HOST_DIR)/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/bin/python3-config --ldflags`" \
-	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/bin/python3-config --libs --embed`"
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
