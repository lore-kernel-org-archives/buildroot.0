Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60016C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8DD4064B;
	Sun,  6 Sep 2026 10:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbXJ9pMJqy15; Sun,  6 Sep 2026 10:04:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33F6140635
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788689050;
	b=L9EXepG82VIE3I4wBaCiHeF6SunuSGaTNAOAzB6Olj33YFHsSzIyHcVmDJq9qLRAxZHB
	 LoAgHfges7qVi2LsYX14M8FY+OXKD63Q0wdkVEE+Zf96mLmOsko7ACUFcg7rsdrJBTpyA
	 60V+jVBTR6JheEWNcGN2w7XpOY5rtNq6dmotuV4lko2GEpEhXztgK8tdcLBbpQLoTkO4l
	 Fhc4gkhM0aj3MSZ3/JCNmGDfnWBkHLEQPQJjNT0Rtk9BHG08yJ2Msj52yN3G8xT1Du+gP
	 y3++W8cGG3+093b3eWxA88MvVfG3zZk1ZOzFsrBztXfaeOHNO/DtCGZyLdrvW4M3Mvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788689050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g5Kf5E5ve0TIOeXYnKejHal1PlBkSkc2eiCd/tpt95Y=;
	b=UhFf0sVo8Ybyjwy4bZgWfyfW0txKQaaaXsVdDt0pUlwjZWpKUJglCyV2MRpsAVah4koM
	 v2vOpAdg+AZOATUc3ygaWSbzJps6w0xx54D/Qa4aZ4zL5Ygh1gx5lcwEilrj8NWD6Xfwg
	 vcfNUickXIS941itllCliBnWHMQwI0mQUwXFv00bqT+f5wimIL2JFdDi6yDmRMYnXQUfS
	 0B7juB2PHbTMm2m1h0ZsU8pqh9srL/Y0ZGl4W7q5jL7SDZFSOEsXOn7rJzONzZMLzi9dE
	 uSuawzh98c+Adu8a2XgsQVjaaMP7q+7zhqr9tpSJzkyy5M+YnEcgq9qcsltIq6oS4Qw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788689050;
	bh=g5Kf5E5ve0TIOeXYnKejHal1PlBkSkc2eiCd/tpt95Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ClK0dg+izB0jm8tQ85gmyJusdKlf9l2sJPupRLEJVXbkTmTjLRSLSiWLGpAHpBjJf
	 6UV93kuEKsqHE+PnCDpu5j9b6KrAy48gJoNzi8eK3YPwhqQGc/Fj2FxJGvoMk6z+CJ
	 HloveL+W0j5l4/ITo8tC7H2WZCu10BhUVrzBK92EwA/FwuUdj2qg4h6D4MIRwvvYrx
	 VlgwkNZiUzkpXzLGi7WnRh8Uqmd+Hcmgb+3qAImkyLCLLeYQBjaWKQizMVyGLwKzvZ
	 N4QoPx+MPmpw+k0OxVAUuc4uXW0ZfEP7wS/oLMooDXtHwr7e6+nr4zt7CgE5ionBDI
	 zlDoZjJRQWuOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F6140635;
	Sun,  6 Sep 2026 10:04:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9916E372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874ED4008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXVRjxGhkh-E for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:04:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5B85E4007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788689047;
 b=kdshC9kdHSyPjsRev0JmCGiCazZxoEkHKWbvuKmz8WBheHazEium+maVYrrEIs+/kfsg
 LvUB/8xvO1m1Yv0f5vF+AFSqZZetmu+0Kkg7TqhVKL5TKYDr4Am+P5phfYL9biLCQKg0W
 GdawXO8JGvXmzItBcHWh0j7x8DhGK1tfvIXVRX4iNuCx1msG9PuVsFMHGr8qJ+TVkf176
 nMngehUP5xm4/No3+f9svl31K6jsVorCEOlvEvsYxR7G9E5wLwr+djGb5CxodP100+Lsy
 DjCff3IUBWI5A0heMkbTD7jtMT1TWoSDM8ZQmRQZOtfSnsUk+V2OSzmFkIyzeZMjiqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788689047;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dIt4H7Fhh46TcJqh6A6CNydLl4oe5kInFHp7oM76pRk=;
 b=eeBiAMX0acZ82DBHScoD4G/Sw9qw/2Th9nnwYWXjhPq6Sgi/HaVq0URu6qNec2IBuMk7
 mgXvJCNUN2C6tF2jvuAznItqHylt20NgrXmVkrn7U5fOh6W94hZXD9TwurnNqPtJvy8I3
 9iEx6b70ZmCohAeTj+OJNqTsEyiRXoWgDY+ZsiXlW8BpkTQ9jgJdbuF6UaT1roR2SZLSM
 vITz8cWen23G7LbkOoqar/tVZvNQ0LrgsNPt34d+Tk6ez85q+Xn2Z7TDI3P/uxFIdeftX
 cVLbUH0zxljKZ4octxu3nWqkM2RtpOyHHkvpW4SP2ObU6ripjbDffzBIpN7Am4G2chQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B85E4007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDE429532B; Sun,  6 Sep 2026 10:03:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 12:00:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edb18cf3f2df3d55aa216e0b1a6706539354cc76
X-Git-Newrev: 25b8142ef7b9e09ed7d273571ca61aa92888a39c
X-Patchwork-Hint: ignore
Message-Id: <20260906100305.DDE429532B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: security bump version to
 2.7.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25b8142ef7b9e09ed7d273571ca61aa92888a39c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.7/Changes.rst

Fixes CVE-2026-84732, the other CVEs are Windows-only.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 3822b8c5e9..947922f0c8 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74  openvpn-2.7.6.tar.gz
+sha256  3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463  openvpn-2.7.7.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e543610563..d910802da7 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.6
+OPENVPN_VERSION = 2.7.7
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
