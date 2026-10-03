Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5F3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07FB980ED2;
	Sat,  3 Oct 2026 08:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLadEi4N-Mpv; Sat,  3 Oct 2026 08:43:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF4AE80F0A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017006;
	b=U4D9wgYr9xIe/hGM5WLLxPwi2WFYGfnB+Fpt/FWKcFclmgEDgmY2o44Kr/UBA3mViLKd
	 Fs+JReBR/U7XXLWCMpIoKU1lswH3+ohAp1mUgBLXP7iee2xfGK0YoIFQ1ot2PTJl2+/6L
	 DgIrMgB/9KI6GLKv/s8CU1rr+HNXw3LUCttqo1XPlbXjQZI4kvbtlpruKtxW5RzMff/Hg
	 7jLuEwbMwoFj4OE130VPo4kSpYfzfqps7CYI9exnLUZL1AnJ2c4me2kIDErYVOdB1LptF
	 sm8YK3SO2CWJgaYJ0M26f8AQ3FT4frvYXU96rDyCRj3OqKuKEeDfx3X/IHIRRGlJylQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JpTM6riqezJYNP+/qtLh07573R2RafSS64+Fzs+bYys=;
	b=dLIPMiSWHdExYIgZaPAi2QhFV0AiWq4J3SrOkG4bQQLAsi90WHousp8hNHzanKYH8ZKG
	 37e1GH/cC5vRzy5dCyilVN7Qu4OJ00o13cYGu+DH1YrCndBgeDI+VVhNSysLkL255M/fA
	 7KBX2/PQ355nYJqTk0fxbhzsB4NfUG7PT6gGsD3rHnVjIPRpuskVXb9kK7FWbeH1htrMa
	 9BF3mvW+XwvqEnStyFb5zq8mGVekYuX40cVSnTDrHCfH2C5zLgkht6wWcz7CzUCx5Cu+S
	 bPTFoLWizxqzc2DReSVQaoDo1RPkGhLKFddT7MkGtRguaUKcpGXHgMw/eRso2Y9s9iQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017006;
	bh=JpTM6riqezJYNP+/qtLh07573R2RafSS64+Fzs+bYys=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mQn3Sexe7GdxHEkcZvglgEwphtJRx7XyFc5uz+rvdPc1/LU75JYOOskWoyDJvxTOx
	 jRcFz5e0o5qQGpPDVyD+gH4+j6pTXHZo5HoyuyKRfcxkqDF+l/0oV5fTCoYYZ4p6TP
	 8Hv+d6CmFE5cyXY3O+MqgWDqXkU9Q7Sj0+0eIi4rKMNxuXNZB9t0pwWrwAF6PF987X
	 hvg698mhRGt/QMy0MJkMdnB9SJpPFvYNm5vMvA7IM3jNlGtQR7hhc1XmokZrFLNOGm
	 Z3v8KPRa8VjdO9+j5yFYz4awTLQjSSBcx+3JS1tpbJIAjfnZd/hSXlYQhOrh7K3gkG
	 uT1ngc6W6qlIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4AE80F0A;
	Sat,  3 Oct 2026 08:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1112E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 524C36065A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQP1y0U9Wr9I for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:43:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2A29260621
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017004;
 b=l+dFCom8r6+zu9Iml/uhDnakWzqVjxj7E283WAa/XH6pKdt+TAxIPBfaInMnsgMLbhAj
 AR2TQlV9nkT+giTD+BhvoQc8fYv+QxsQQy5XNmpNTqXUOwl3FAhXYs+MykcQTtIiCfBXx
 zflRO9WKrgrFgRSB9EQd9QB2KxiPhwrh0EZk8PhmIS33tMaDJAR778JZfS7Zf4Vllpw3e
 mZ2G9F0GmWj0T9g36Lih2OIfsVPmUGokvLdJ/4tyc7x8iIG3d+0RdDePCm1GM6sI9nj4g
 KO4iLn3XHjuzcs66cxu9N5LMKgUM0q1dVWdlZEvw4GcRW4wAUdH/RrPBzuRrWcXsQMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017004;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=HrKpX7f1AQF3OLiLZFi7kwiqtvcP2z/DDQfLDGFApus=;
 b=IaAO0i4joVESGWYSFQFJYCJPMQc2Gl78SucmiDdthzBjPmlSK0wlBANjXOJPgng7lkcM
 NceRGQ/IUPGXyzEERQ613lph3chWdtz5qiaQHYLfGR7QXa3zcQjOjZcQPLSwx8n/xWjzr
 2g8ylNyvAHZN8Gedx4WGT2wr330BFv4DlXc5Y6ARl42M80JaOVrmc9sCbTLvA4GL1mKvK
 pxfZ5WM+tjyXrSNEH5eugtGhvFQWmAhKQuxh8Y0rj1X97Vzt5Co4c0jQ3gRaIygOIUSdz
 mNpkR1ultN0SY6pNkObZlZgmwRvguoXiSPVbqW3pGlOY8B77xOeDjbxkANKxUsfxxEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=A2cQzV3L; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=A2cQzV3L
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A29260621
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791016997;
 bh=HrKpX7f1AQF3OLiLZFi7kwiqtvcP2z/DDQfLDGFApus=;
 h=From:To:Cc:Subject:Date:From;
 b=A2cQzV3LWa5891zZptPbVMxc5zLVUaWnetK2e9v+/yjjdUP5s3hZJeLx8B8fr9QYh
 j8Rv9KJzErDjjLAnPirpc6O3llrm9njd23lWqlhq3Vcowg2reWPrveUA3QJvX+JpQK
 gZYk5+ccWqmtC6w6F3AlsO4N2eM/01h729iTg+QrbFnQDgWeupVC0mtqPAZKUOFYHJ
 CnzOZQKG+eRpt21wXitZEkHu06k/9j2NjioTdx0VTHWV0sqxYnfHsQaj8qxuowE2/6
 PwQfEYpDkB/X0yGc+w/dM/lxlA1lEPAFP+Cs0lyDe1cE2RASJFgwv8rhkm4A+SDi2F
 pIsxfcNoOE50w==
X-KAS-Sym: v3:f51bdf72230551df:ovjtVWi/4YQWIzAORb+3fcoyG8FQpBhWNV7oAw9NtEbMd
 wg35e3TSUqmSXtrtB2Nug8L3nK3h+2wDnWaGdT3QdcvZmsHSa/Sh+dXK5qu9I+1sdE1HLrIwdMc
 DX2wOZdLu+yfWxEOnB/kZNFBGLZoNAX+5qRbTUeyyMsAtJ7phNaj+bNW3Ulm+eI3B6a6wBle6oH
 TFJjWZRzAdUCyOzofK8mBuHorvC6HjesIVO8n6v5aQA7kX/k0hmkIGOnebyxiUuM9BDCyIKYTov
 1SBvVPWLMepqgaxQUXcX/PBn7fV6l2PRGMIzVG+bDqusGGWwckWNt2Pcw+8HSMJY+RRu5apw==:
 pO8cQ3ZOquI7ROe+gbSpDiZuzSXl5FskOe7E9AjW2aGzHIznL5+ShtZV0A23itbHQZFe1LCvXUE
 ij1dcqaboHjmyV2LVQ+kqc8+G5fx3UtFEwrBXLLLgKVcl4/+FcksrWcfXfbLdVEtxhFrtc35o6m
 SBRKs1SpSejmcFblsZgHoNyKuBfMDug9weW5ziZGx2jMmbEXw2e1255vGyTbVXNAUVGjVbwsG4n
 pE/PJBkVZlPeJ4CGnNN/I51HLOVNS0Y3ognxOJAt5sqdbj8KNZThkQfm+wnl6KiMjz0VgdXZih7
 4105AiA2ypYbeJSpiaQ9kMEmZjDTbxoxMnjYVtfOGdRT0/w3h5CsLPvBiU2AH9a8NQHoRon/6UG
 iJNXiN85nbWgBzyM857W7UQqs7IxlF90I/q/89o2jfIyMsj6AnFeEdJpLpIJtyHG+G7kjy3CtHy
 ToAdGZ5l/gaXziqmO+7t7phsbEuhd6QYD65r3ebpL0bv0/7uXU2RCs37qvbhMtVKB1K25wUmj5W
 iLFd23DEF9mJ91jrsKtkGehYcg65WCCovUt3OS+5v7VqP0QbhPkXtOr8C1nDujNYksFhGBVLNJf
 zJUVsWQNXo8UdKrw/5mmx+fu8Th0jVAAv0O3lTTa5ohE2wUz858sFx7ykuO6WAM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D6C8FA4C26F7;
 Sat,  3 Oct 2026 10:43:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51270)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCvKv-000000000Fm-3EF0;
 Sat, 03 Oct 2026 08:43:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  3 Oct 2026 10:43:16 +0200
Message-ID: <20261003084316.2457542-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 1/1] package/dbus-python: bump to version
 1.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

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
---
v2: bumped to 1.5.0, updated license files and tarball URL

 package/dbus-python/dbus-python.hash | 10 +++++++---
 package/dbus-python/dbus-python.mk   | 29 ++++++++++++++--------------
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
