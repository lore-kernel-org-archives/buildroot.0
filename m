Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84743CA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 22:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5722360819;
	Wed,  7 Oct 2026 22:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8ag6-bzIQxA; Wed,  7 Oct 2026 22:17:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3382760BDF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791411419;
	b=JtJN0OhIaxqbreBw5b0HckYBMWXGzFxsyvPGAPlyp2z+DvytOY2TLmz4Cur3dqZw7foD
	 CdFLufUHIzHZVd4KZOpK9WX8EkqQubrs5YR6sonFovDVG6vtQWM2lFqeWHc6BQyHIKeJX
	 kklpHnk75U0haCPaIr3i6ubSrMKYZnKtaAhhIdS4ZByV+0Pxtk9wgq2T/V+LSDisy8/hs
	 0LIfIganvovJdzQoSIWcHK+kTHnE/SlKDozX1YFssieRyMwZaOFQqA/qZEZsIyw/QWyLj
	 JLb9lNbh8ra5dXE6Kv/kznTQWKwgSrGpvsZsMoSuLZzlDxf9aEgGb/k4ZNHN+wxc9VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791411419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=VqrIxhlZbQTuL1OcGfNWrrhf/coPzephx4Rz89zcyyI=;
	b=NrWNOXtXk6Z3/MdwS9YCNKjrtDtj09uThyvD74o2kIgCBBm5GD9EZ5IDowh6my+zVQil
	 AbCLk70Z1m4uk36W2T0TNXrVLk+qfhVty7RKY62Z68jQ0O95b9JqG4VqpHTpt/gTfL9Fl
	 eDbtoQf3731216ejhwBESyNy/hrGTf6IGlwCj1Ot7/Th68x1hn1fIUAyqMOT+vFDJL0da
	 fPUfNTQdPucDTPweIe74u1if8XrXje1DLBcYKUwnOb4aNbGPZ5fnu359Sp9bXkxOcM5Xf
	 Xv+CU9bKR3sw2UyHRac1w7MfOKQvmyauLc8OtYsqKH3kEuuqW8W2oJJOcdOPJDjbxtw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791411419;
	bh=VqrIxhlZbQTuL1OcGfNWrrhf/coPzephx4Rz89zcyyI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nZ8D7DP2daDtiqIH0HLOnz3qHuocYchPJYrRtj7A79IobVPOgQsoTFFXAIBlo01Mb
	 gw/lP6EXSCyoBCK9XOIpnGpXlnCFMu8WkFlvyoQzBv5NBxsbKvrprDHYEjm4RVKzkQ
	 AY4W67bSPd4SzN5gEXaASaa/WVJwkd3P0x3ZboHgslBvECpTEiEe72KBBwX3NHZp0s
	 XIoaD6g3Mu3JVRWQ5Hc8iZv6MU9uqZopn5q2Mgx3CLiHFQVmw/aq+VV5QQBP2CvS24
	 8JpxzJdGF4SLhiFYmVd4N1WVefmnuTuRyMTaw47OvWpkiEgUaTgiOexvYk+xcZxzP2
	 t3K5lTdkq20Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3382760BDF;
	Wed,  7 Oct 2026 22:16:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 009E875
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E646540A7B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K7R-Tf2fart for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 22:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3C76D40A73
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791411101;
 b=MAh553qv5E/NErbs5IhioDLv5i1W59LMqAv+T2q28xTNqVDPzHzXqGP2YoijERmuFYBX
 S5NrQCOV7I7/HSqUSVNNz6m2FpCHVDzqkO8yaPvl+4ciDGGQw9fQ2bAsIfZ+VYcVuej2h
 ekucV6O4agNq/oo7GObDFUG2Zc/H5PEHXivuOPFTcJeV8NZrHcbqhgmIZH5N9pvMbCSxk
 B+zYkHfojN81Pye+Ht4D9wzKmwMqfoNEYZsmc2dWia3liF5dlcWcZGfS3c+sKwgrzHMGu
 cL+1k1iOyEadizZAz8aw6UId11t+G9IReTKdmhJFUrlwPSg/RlJWccY5WArfUzZCXqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791411101;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wEp2MUBiABJbjyWr09kR5ZXa9M812YhHP4zkff4VUOw=;
 b=SuECFDHoKYROjWR3ARhs+ccK9KTKbk3CsTcT2kTSGiDz4j6vWNGUJu7m8IpeVsoeh0mS
 ejpMmnCYb/LEfk3Qr1OE3m4enBUcF1k6ZTwtsqJFgBwSGk8TJp9ZKACI2FMpq9F86mE2A
 awQSDM3b7hz9Ye/L8Cl5FgUv7GL1EnJgcmsEurjcsDUPNbWp5wDmx2QAlEgM/L5kjkqei
 +6D3Gm24gEKAc6OyePebqpP2JnwzO78yeigB7ThzZeu1VsDXexWYEsFc8DE/tqb8fd640
 ybsGVf58gztmMteKTlQ7AEARKMFfzF02idg6j0g+IzDls7GMY9qe7+w4iT3yAQM+n2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C76D40A73
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 422178DB6E; Wed,  7 Oct 2026 22:10:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 00:10:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ab8f8ef5af5a170a1ecbea3209ca39afd49194c
X-Git-Newrev: 43d55a6d9ccd9cbf62b0aca9fb179bd07758b99b
X-Patchwork-Hint: ignore
Message-Id: <20261007221024.422178DB6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: security bump version to
 2.7.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43d55a6d9ccd9cbf62b0aca9fb179bd07758b99b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.8/Changes.rst

Fixes CVE-2026-84790 & CVE-2026-88964.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 947922f0c8..9274a853f1 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463  openvpn-2.7.7.tar.gz
+sha256  c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36  openvpn-2.7.8.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index d910802da7..01c049cd05 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.7
+OPENVPN_VERSION = 2.7.8
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
