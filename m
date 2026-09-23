Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F2C98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C4E40AD0;
	Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pjls6jpj-NwR; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A076340AD1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276209;
	b=WYPPzATCE89LlFmgtYbaXWMEi7j5hJ0AhsuxNqRapERLUZX2P7364ECptVeQKr6qo6Yw
	 lvaKHyrifXKQ4AtaHApeRfaVMAXI9eNpZJygs1iGnl6Iru95IsnCmi+9JxJwqiy6lkxkz
	 rtzDxqaaqG2p8x0YO9QWHCOFmxFpCDVUfyZsJ89PyXAYQzEs8qimSsGAKHeWKWVgPKdk1
	 Q9fJQ3vjcoqlkeAyf4qI0LT1k1m24kzljBVnwENV6PHGpawnJHKH28e0M5zGZgkBd4cnJ
	 w8tVYKGrKCljZ0Yg84tgiLi7Wkug3q4ojnX6oAYpxeyYzp6Z3pZmznlUUAdt5L51kMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0evlzTku1xj8BBMRSXDrfoAwYRSSC03j99uSR6aWrWI=;
	b=eWr0/e2xdCE2HOxw4DBlFxzuqFoysEIzO7aOxFMjJcbHx0hJr+RhoxS0ycMOo2Y97kaS
	 N0Erx6KRgHH87uG8oUTIJFECUAZsQoXF68TPoR5Vl/ZXJZKYd0ztLRJtoZxAbyjcmx2n8
	 V2KWqN7iwGKIWogqS03zjYJnPF2ht4aZwDedFdOyb1vy/dGwZHnrmhjY8HAJoryF5Yjhq
	 8DY5qg+PkllYfgZS7FBhp7DUcABPeHPv+qmJVbSwpDdJk77Jv9aW0lBMh4fm7ubb6+ByX
	 4krfKkBHppR9NUtevlT/41rsAEzRMIsbtpyDDJhxC2KeVA7nPhxAVu4TedpuibN6VoA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276209;
	bh=0evlzTku1xj8BBMRSXDrfoAwYRSSC03j99uSR6aWrWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fyoFzv1L5PXKCGmxwo0sp+RVDhpvbaj5LGywXyUGRWWxEHOvVYveP/OSz3dXVapNj
	 dUyceXnEVezt4oNjBBluShm9yGLmJJ3UX7txn5aoBxdZ2jYYJGFVH7kWawmyuF0IbM
	 KnC7m9ULkU13KkMK+EBUcgKoNtCQiTp+MZa88uWI/ne2zXQgDegKFevxEnybNBnzzR
	 O3eWuk3K3f1G0gOMhSQ3Cnl/w3LM3a476iPPUY+ygQbGui6OMSSIT4d/eb7jqSHLRh
	 +DGuxgFyC2DklFMOK02flqT0fAtfBYPfUjK19FK0b4Cc1/dkhnjI5fMVcsDVAX0T4J
	 +5jxjQm3be7Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A076340AD1;
	Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A711328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 114AB40AA7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3mL_536z0-R for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2712040AB3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=N1fJoZytmFhV3bd+0hbXPsOPjV54C2HSxfIiMilPxn5zZK/bf2gOD7029P+ed1TQI6Um
 KeUmbaW0SFuzeC0te6f7a7gA8ZQw4heWAp1yZhpf0eDyYcyfA1MS+mAejrBjsClmJuo4w
 grA3Xtx2uE3DL+VOhMoOKADzsAW59ao/5IjVhno8JkgQG5YQvBCUnPtMb/I1/E3sWckUM
 kcmrycek8MEug1699IcBq8Y4shfoIZwfJBoHiBErh5vhyjiw9fxP46eHq9UN/V5YEfArc
 3ybYXJmM9+ehS5GlZhz4mR25A1V457wWLPhGnSjZP6fzX68iqk74izBpmw0mlWTGEtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lbBfNsABPN0e89gao1iJUmk+ozefF0EvNP/OSdaGlIU=;
 b=Bajlj3edmbyb7hNA1m5p1V97NBQ4+snTqci/ZSMYnkvA3msv33V43j15OEmONkW4KrLJ
 soht+hgkSqeViZmKeQ3+V+1IFh4rQP0kCJ1m+PYuhQB4KUy9CoR5i+/DEXmCuIH8L18bW
 pgi+LNbgTryDIY0+TNUxOVSPRZihg4g15/uakxahvzSO/YHCsxdJwmMRMO+BUetqeafFy
 KZNMPm2L0hDR4M7CruNA9RN1eSbY0hoHImGoqOGF8G7J292qahyvZQtAzre+m1xzjm03x
 +cmUl1HfgtNRAfFIvhEudEoHKxQrkauWIM3u1A+21CHW8m4Vu6IDOyu9JoaDsIOmFtA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2712040AB3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF9FC98385; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fe4475f19ccaf34744bc0ec0521059f6851afbf5
X-Git-Newrev: fc4bfe4a15c96afae68b55683665a4b425d65633
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.BF9FC98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zabbix: security
 bump to v7.2.15
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
Content-Type: multipart/mixed; boundary="===============2072787375063602056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2072787375063602056==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc4bfe4a15c96afae68b55683665a4b425d65633
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Zabbix 7.2 is EOL since December 2025 [1]

For more info on the version bump, see:
 - https://www.zabbix.com/rn/rn7.2.14
 - https://www.zabbix.com/rn/rn7.2.15

This fixes the following vulnerabilties:

- CVE-2026-23920:
    Host and event action script input is validated with a regex (set by
    the administrator), but the validation runs in multiline mode. If ^
    and $ anchors are used in user input validation, an injected newline
    lets authenticated users bypass the check and inject shell commands.
    https://www.cve.org/CVERecord?id=CVE-2026-23920

- CVE-2026-23921:
    A low privilege Zabbix user with API access can exploit a blind SQL
    injection vulnerability in include/classes/api/CApiService.php to
    execute arbitrary SQL selects via the sortfield parameter. Although
    query results are not returned directly, an attacker can exfiltrate
    arbitrary database data through time-based techniques, potentially
    leading to session identifier disclosure and administrator account
    compromise.
    https://www.cve.org/CVERecord?id=CVE-2026-23921

[1] https://endoflife.date/zabbix

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 055a1e249c8d15dbee3a3c10dc7d0acde03e0c91)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/zabbix/zabbix.hash | 4 ++--
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 787a0acfe9..f312dd4a49 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
+# https://cdn.zabbix.com/zabbix/sources/oldstable/7.2/zabbix-7.2.15.tar.gz.sha256
+sha256  b7013063b9c6256a185f6e6001eff7d43b831b183aa39133d6ee524d0570e85c  zabbix-7.2.15.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 50bdfed609..09673d43c9 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).15
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0

--===============2072787375063602056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2072787375063602056==--
