Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63360FCE093
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D00783D39;
	Thu, 26 Feb 2026 14:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGq82iBpu1_7; Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 607DB83C90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116040;
	bh=GaZRNjLBp0DHYugI2xRCPMoAnmHsVG9912GK/Tql5N8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iy4v61gUEQ0ct8eOdcakiu15RXysimbGhVS+lSBcF2MJ7/JGcaqiIFyw+9Euz7Tjr
	 vXHMwXU2rUrL8mY3bmwM7LXMJiVko8zVeBA0sWadkfT79IeQfNKn82y5auP0PqnjrM
	 yR2L65lYLj+e1Y+31EgXy7BKVKPW7Ca1Av+8IwsRhwVEiK3oCopKVSpTkipSOk8dvd
	 8felWWwq1uIYGxPL6v0s7x6TgJWivPCKVVaTDkUZOECO0F1AY/e/EuY9hHdGhXeZKO
	 9QFFer341Q8fSMtJ5Mis1wV0pN6dpEPSyPTLIRnImzqxjmb5Vl5lkzrP4MHzG/Qw91
	 TNKKMMAEoqCUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607DB83C90;
	Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BCB323D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D57D6122A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDiNcrEK3ady for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B81656120C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B81656120C
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B81656120C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 2322A5A0003;
 Thu, 26 Feb 2026 15:27:15 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AmjNvbV6x1b; Thu, 26 Feb 2026 15:27:14 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 27C855A0004;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:53 +0100
Message-ID: <20260226142700.1064999-3-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=fk4g3flAlTnv+WRCOEB/i1oceR5BdPI/M26Dhd9beGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S/u8gb3+E7oE2WnA0VosT26zALet6DGHPYNJ9mXnoU1veH8qN7CXdtmvaUBTkYFHv
 gU1ZoxJgxnbU8ziunStYtmdmCqRzP2HF6xnv4scEKAb22BikNkdwgdq9Y7NLaKCpk0
 9mC7ejfsf3oj6ocw/Ra40Dtk7x4tcsMYZ1vRlqSidAOoI1ipwb0Ug4+GYRu70+kcx8
 wNpWKBnvEUZnfK9hxktTCHmyuPyG+vzLyFwAXUuEleBiuvl6IqYhP4u+h80aID4jlg
 lHGqQTerHxvORHqJyVFiQ+USoz4ebBg01k5ICMBqurrrMvwDd+8eRb66OxTRAFgBD+
 C3o+zVnjopFnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=S/u8gb3+
Subject: [Buildroot] [PATCH 2/9] utils/generate-cyclonedx: add build-phase
 lifecycle entry to SBOM
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

Generating an SBOM from Buildroot usually means it is produced during the build
phase. Hard-code the lifecycle phase to "build" to reflect this.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 20ffc4a8c909..3b8832cf33b0 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -494,6 +494,11 @@ def main():
                 "version": args.project_version,
                 "type": "firmware",
             },
+            "lifecycles": [
+                {
+                    "phase": "build",
+                }
+            ],
             "tools": {
                 "components": [
                     {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
