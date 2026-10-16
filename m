Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4943CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E17260B9E;
	Fri, 16 Oct 2026 13:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngWICgq8d6YU; Fri, 16 Oct 2026 13:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 756D560FAA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156228;
	b=C0haH50GBQQSg4N8ORow7vwikECsHslVRqRUzqwFW+SQ5NvwW4tAVyZBcsec0YC+cNqW
	 q2tjY0Og6lZShBkkJOi3uJzoGskZOsXho1n/nwKugZ/yRhsI/eNMx3pE5noEZSve5Z6hh
	 4WwkwXMVxNQoRP/EddVBbU3CH3DYE5Bf+vRhLL32jS5YH3sAxx2g2UUurOj1bakHjwVgS
	 t/7nEswBVxWnkTr0FPYWmfc78Dv5HvMqFt/VN9BKLhFsGXuNN9n7o3KSO0QQe0xh1Gh9r
	 Crdgh567sp/5EehmyVzik4V3uHKDvpAy4F1f6yzT0WpHWFEIoXvesV4sE/xu4XkIukQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=G67iLtql4pDsHeB8B7Kqy6tK5SKwjenU6qdeALOy3ec=;
	b=YQBDyJ8bZIG7ok0Ys7r97pIH+ZEtPlHo7Wtiei2/u1RLVr1RMW41HRWef0th0Nv6U+ug
	 w0BFE2hyRdnvnndzOiLc5oxS4jJ6oL0uvvDvrJaZ3QkgPTlTvsch/9wzRNcC+2xdIZv1k
	 K2i9TZNPgg5vXQ9cyupSb5V2wpI6fzLLVLbojHzi5rFDMMLHwQC9/AzfvfbeU5nb7ucvl
	 Gmz3x9IQKxCDQJDPygRGJhY3KvqvGtR6nwMykG1dm0gMZ1hU+U8YGYRL4/kmE6z9tp3+5
	 VUcNnKl6xdKEaPZ8QEySMz0ub/iuP93qJ3H4m0xpDu4EoTdslmLVal1vPxfQmFj7cjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156228;
	bh=G67iLtql4pDsHeB8B7Kqy6tK5SKwjenU6qdeALOy3ec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KsIh5jstBGZfhB2IIu2tBSYciAx6uKAclH5tzKIS36tzqpbM+Yqhi2K50URUnXaXj
	 TSrqoDuScNN5n2ndBKsn6d3EEVQQBHVw8LdrNys0A9v1/bC/LR/7zYdkyYQ5EUd+fG
	 m+UxPBFF+Kms4jG4QnYz8VrEr5/p/ZJaBuK+pokca4Cq/4yGpiG/kHCSQlx+0jmmhz
	 1PRZjui+7a2OsYbNgkGWB3QbvoTQziEPjwtrJQbjpUA7SlNggvnlkw/eVvHucAhl1u
	 glBBP/FqlN1reaSvw8N27m7ywTPEEYSyXbY/yYT+kVDwliaVkDzXH1/C/S4joaLXSH
	 GOXntQBV4xzpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756D560FAA;
	Fri, 16 Oct 2026 13:10:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47CAB769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3960F814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDVl6VQcI9sM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13993814BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=XZGi/Gw+ApR2ahDSQDxaaJCzq0jNaHpJSXXGHaKH+tcsMdaVzDKZayWbEdrtskFROFFa
 Xi3AG6Ji/uwSeFOh+7tqFu4TXD6s4pMD9Smzy9dz5Ahij41U04VTFfJ6HpAYzpvMMy8RQ
 Nu/r544dzcOQPFaE5IhpUTUQ1xL0ShiCP2bv6ih2UzeKV5USabpQ3rxazEKNZsc4lo+DC
 g+Wj50E927KSwPkFHI7Esc4AOiJfiSundMZ/EbPKKQ0oyTP7qfuPJv6eiPBVTLZfQHSPh
 QvT2RYD4bsVolZGnD6xxhlDIon/ElidTtP6QgBRmo/vqLYL39p0AXhEhOed6WXwIliA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=09Kivh3xCqf4bX5jbW/TctSy6wHBtDMndy0h2ehwKXU=;
 b=C3yIxZgXVS7X6onFAoARft+CXYtm5MBBp8nUUa7E2yTyNxkH5MMduOPNNg9S5BMXWzmk
 +4xZ5efee5lZUbnW4ALAkOfiyl+FCXVW+MgsnG6ltp1W8AMW9VWd4rrksQpk2jZmKz+2D
 pR+sIXu77/zVRssTSu8zWDwodSIS+0nasSwwizKh9Y5ANfoe5jfaswGxlqPcyrJ8mJyis
 A3yUzSiePx1jgkcSza5w1wRbhIfliRiTGOvg33Ds99imWkscoKbLONMN6jfXNCTn0F2On
 kr7ym6L0YithZ94OUqS6AtMbJq9JdLsgIJqdQI3lZOMhx3AQGuFhiQDqH1UN0kJL8ag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13993814BA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03E22960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e3f30e19caf112c3afd90cd46a93580fea487a4c
X-Git-Newrev: 33c3f1501ddadb9b118469dee7c8408a1f10e2d4
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.03E22960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/x11r7/xkeyboard-config: add CPE
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2924812179564388603=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2924812179564388603==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33c3f1501ddadb9b118469dee7c8408a1f10e2d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:xkeyboard_config_project:xkeyboard-config:2.38:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2012-0064

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6a625034ca8b8924667246624fe5321c431e4047)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7c9c814d95..9c8461b23e 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,8 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project
+
 XKEYBOARD_CONFIG_DEPENDENCIES = \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
 	host-gettext \

--===============2924812179564388603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2924812179564388603==--
