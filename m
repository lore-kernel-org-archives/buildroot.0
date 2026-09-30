Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21249CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDDCD60E02;
	Thu,  1 Oct 2026 14:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgVJeM7OmoeX; Thu,  1 Oct 2026 14:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DA44460D61
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864623;
	b=OGDjN0LbX3LFEFFKotnmfwkixQqO0QnVJNkJaAIClR+mvF6I1ytAUQ8DmkFnDsVpHrx/
	 iKDVbrESRzaPpVwhv+1MmFwNcanTIoSSzqUE8Hw4kU4L3bAJE2BaF+TZvvAFxwT3/dMCt
	 4yLKEDK+2jLwvaP97m+m6hDfLHvTA1CPAHSrKVoCYFMSifxRoBG0+MQeiCU3yJP1H5uN6
	 A4suyTaF3867ylIBqlKxYU9GpjxZi1WlqmotkkYG5Jts84DcQ6SfKVXHsD9dXk7XxmD4h
	 pgrr8//jDfODIkAOLJabL1xFQnMyyFsG08yZtExoCCPSVZGop8uVJvGWZq5xRBpfQqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864623;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SDfrMayIYJwNJ8dg0UDV2Z5mZRmegXLX3+3a+OubBNM=;
	b=WF8zKcMwQ/6unr3i7J+VQcovFrSDrUHLrtJwVgB5cOuuvyQ0H3/oEaT9njpExgA+5uzC
	 GrI7MJwFuPW9mGsCDowgu6EWxwLngDzc0fcelMsygPE0KLMTvLjVW3Ulm+ips2mTMtl11
	 dUlN0twCYIuc3ZC1Ns8YKzV+mLTf19ObolLpeVkvtjDA0/JJCqg4utQ8wUKF7CE0uANdZ
	 oRVAJSneNHr65GhSfRHGt866UBo5QGwwbMPbYuWWAiROPyPmt4ejxaF9f1JX671107EGe
	 6vaZKgrplzXCUmWvI/oLQVvOtH/fx5vHWef23aw3mH9znXXTF/W++QuQ10XnbZY3DCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864622;
	bh=SDfrMayIYJwNJ8dg0UDV2Z5mZRmegXLX3+3a+OubBNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=moZw4fexDa/K3Eww3SPPJnmsrPPR/sxhGbKMHTEMX1ipfQ5TnlkLbXDAdkI1w4MmF
	 vYPwo6iZKLU338JMO0+GkBuvCvyehNBNJ2fWJIttsvfEAchZCC1tGhOItDssGX3ll6
	 opNlAcO2U0HadQKEx+YRVTrYPXiGYC4U5iQO0mqeTwHQcqP9AhkaRGQYYn1+BbD4GQ
	 +nF3Cj1HWZmEDhuJ2VNOZ3b+C+73y8DJ3tQdlQuwUVxAWutJMlq2/4cyQ1EMA3sZ9R
	 E8DO0ZAen+qFvRnJ+dWa90m6Gv6OIZhXBoYkg4Z1Hfy98mKoJ4hdIznyBOtQkvNRhH
	 Z2DtZQltFaEkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA44460D61;
	Thu,  1 Oct 2026 14:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 025A432A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80BE607F0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTLjHSXwQnMQ for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 168A06070E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=Bc1wAn6Z9aWTaK6lro3derBKe4j8bxBaNhSPB/E4IMSZTBhkGkh3hmeulB4oeWEtPX3g
 9uB6GwwlpnjgJwnw5AujduQNH7rI/MyrQ/16cEFl9hmJ2w1lXLi+aFR/PkMmzcVbBiCEv
 I3tO9+/DQ+d2OPJ6V2caGG8VaPpq5p1Z5z7gTgMYYjREvECIqO0/aB/sJwl0JOgg9fO/Z
 fTkNhRRb13U6/qgiNhlZ/Tt5vrkLyxOX70fs+mpoKMd5TbHcGWO7j3v0juvgYQg73u7u8
 /qPfRGY7uLPdlJMcsAEE2V84jc1rK0Xx3F2HfyYK4L8CDWKA4GDeNyZ5lyihPPkMMmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ewcBm+UdYjWm90d/PpG8bn3QdrlCMasoO4dxLtjghGY=;
 b=HaaCiKotXVLyzTVQj/Weg16M+BGCdB8xWd6MoD1eJZIjiOuQSPtAA4BZIZBxq1Spop4x
 qRy6CejEEW4N4dno3d+oVgA0rAteLBwH5hC9HQHhDg3pyCYvKCU/o88Q9iUuFi/R0IjTh
 tfSzAm8q8vaVfJiQGpXY09HP3DpngoeiP6Ey46WjjHC9+sXdQkf7YJ12uhHmXtkgPNPKd
 WaDxN23eMTrKfbroVOIw4OGWpokL8HPR9U0uBM1YQpxWQTUXNNNFceC0TcyKRlx9u4Txd
 SvYgqkDi8D9XWOEGWJSHwIWDZdFARtllKR6obtPbDoWDMRSaH0uYIRszlvB5eOJ+9Ug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168A06070E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EED59843E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:08:05 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d852986d652f3d7d10ff6dc0f1905e8ba8174574
X-Git-Newrev: cfdd030bfe27c53c6fc9b031fddf882b318e6905
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.5EED59843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tor: security
 bump version to 0.4.9.13
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
Content-Type: multipart/mixed; boundary="===============6900209731853757165=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6900209731853757165==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cfdd030bfe27c53c6fc9b031fddf882b318e6905
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.13/ReleaseNotes

TROVE-2026-012, TROVE-2026-030, TROVE-2026-038, TROVE-2026-041,
TROVE-2026-050, TROVE-2026-051, TROVE-2026-052, TROVE-2026-053,
TROVE-2026-056 & TROVE-2026-058.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc5cb8f02d6e8c24645e5f623e96067f7ad79840)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f0ebf5d909..92e5fd4782 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
-sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
+sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3fb4f52973..8de7ba50f9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.12
+TOR_VERSION = 0.4.9.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============6900209731853757165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6900209731853757165==--
