Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B09CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02D180F9E;
	Sun, 18 Oct 2026 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCaJbYRB1OgT; Sun, 18 Oct 2026 20:51:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E615680F91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356680;
	b=OT0BjdrAXq7NEk0AlDVAXfja/QVM9owrrOUB8H/EvxFPoibJ71qdNog3UMr4eHo7ynKO
	 XrB9N7gPRtHVNNKxAdHupndYyDDpVaJd+45is3N8EKfEg6lvNS8ZuU574XIYXDCB26Lwl
	 fAIcH3nCBfuv8KEOjSz8i14nTSjApIosqM9jBwXYaT1LB83WLAtVR7tpoJrIemMWTjzVu
	 6v0h2wElVqZgOj+3z3Ri5tO5GcppUBepAUnK48OAnIT1Qk2fkgUzqPKoWOnIiB8aAzbg3
	 N4zZxq6cL6jvAjJ5dsv7R15W3vXIpR21twau18FbzfSbam0MtUGB8t6rXlHgYMXjD+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+6fR46uDJL+dRX+6CMaMRd2SkUzET4p2McqA/Q4K07w=;
	b=r8mVTy3wPR/C6QgnkW8DeOKYTSYsw1pt+YhNdbP4dG7KZW0S6fNvumfI/tidFsz0HhMn
	 1O+z83jJz5D8zl4gZ14bPKyO9nahC23pTp2YDYhZ/FukTUPxxEGlyhRHiDj2Cc42zzez4
	 r4Z2Ym0TnOyexfQmoSubm80m1bahTqyB1ZjCGcCvrOnIEAF4/C0UcP2pxY0lCfUMTsZ9v
	 Ip9dYfn1EcotilMy6vZ2GyiB3v431J4jky5TWVUZI+cslS8uMY2tmdCK7W9l6IPoSwCK6
	 bxLV/taaKTnUXVyIdy7iFIwapJXoJRDebCy+0/N13erfEzoUmyUBiwPAvsWMdoExLfg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356680;
	bh=+6fR46uDJL+dRX+6CMaMRd2SkUzET4p2McqA/Q4K07w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W6upqcx4OBhTOELtXAICdEq082VaxJOdvcuC92R3lGyhmMe4mJQWL0JkQa8MD2KiR
	 2vSkoWF+zYBTLjflPj+SA1YpeBFB4Rpt9NmHqs33JniC1iDMlV2zWPpKldztvu0RSf
	 8LhlS9ibTC8qUWAQF/HX4q0mJ9viNgUjPG6fCaNZHwVQVq8v4+jE/WpPFGCdYE29j9
	 YP7UVz5sqnPvVZzoTh/+oQl3hbcGlMEhmg0RccY5JztUOg/5m95vloPFgfCP86qm8O
	 lEOj2nY6uuAUtUFYvrPRSrg7duesL9zUGKnnwmOuXrAQKpQbmbfzJ6KNXfQ2lviunR
	 qAfDkXY+X6keA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E615680F91;
	Sun, 18 Oct 2026 20:51:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AC962A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C17660732
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7XFZNtbDAxi for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A9DD60730
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356676;
 b=n8JZEGap3gaONRL1TEnGXSDixzQjoH2WLZuX1VgN0hMXI2pz2cMVHWa8xy3rnnP4OkdJ
 1eI1SYHQPWKEujY5j4/FfIj1h0zMtVhlXzajXX7TgfIIYfXYyEmrq2e97oA9/VMHJ+flM
 o70WlcBa8kl8gjbSwaz9emPBXdU14xg/V7MQvR1TkdnR2UnQ48QQQgVKR1t0iHoT9UoZc
 0M3AsdJxeXTL8qwcIircWdc4Kyqm73taupMYxe8+30GHJHgPkhEoWrbWxiKs86HMsdeSB
 omT/MQbWw5HlE3mNTh3IismXu7umM/3yv6BCiGsAo8d+pw6twpEIjifjSdEZm1T3AxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356676;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3EuIUIzXRBG2httBrzXP+Wx2M1/Du0dyg1fM2Z4eyXk=;
 b=gcDNvDF3mxsC4vDZNS2Kei3pvq7E3SshXn0MFfEDQppImYiSxheEM7S43OWl5cyGfHpB
 DMkV9wwxQPSR1TVfxejMKMjDI0Hfk40fN4WO3XtWc4wALMm7u2rMa6rQgFBomcAV/EqHH
 6Ax1+zAimoRmFn6zfL7nZKnk3+4nZv/rwAtkJJPHk0G7ZGNmGymRCQTxem3vhX9NlZgnm
 UUhOqYdivuff/lePqe3xpl3t1JhCmpx0MHwpJYulB6QCI4HciAXHNgAdb4oWJd0ZqG0Yb
 TCXtJ8uOv0LTrcXmQC++uiBVy8SI0w9bCKVWtX/q+eTvnCbvDS5QzwIqapndRByLqTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A9DD60730
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D7D298439; Sun, 18 Oct 2026 20:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f2cab663b9ccd2c3b32a0bbe2c0749a3a82b73c
X-Git-Newrev: a77b6ef16792803505552e01c8210b0f91583f2c
X-Patchwork-Hint: ignore
Message-Id: <20261018204954.1D7D298439@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomlkit: bump to version
 0.15.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a77b6ef16792803505552e01c8210b0f91583f2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index d796a1c53d..8411872c4e 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  8e5245fd4099c9a6f99774b24a4591ae  tomlkit-0.15.1.tar.gz
-sha256  e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97  tomlkit-0.15.1.tar.gz
+md5  65f5e37b20e3b81a5ba29e8149e01c01  tomlkit-0.15.2.tar.gz
+sha256  83e32755ba1d20d9340bd069ee97e9f6232ba2346b63ffcba425de01f7e327a6  tomlkit-0.15.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 1466772fd9..5dc015533a 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.15.1
+PYTHON_TOMLKIT_VERSION = 0.15.2
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/08/72/fc01563df95c189a9f65850096bdc205bc2fe37da6c740cd64afaf18d07e
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
