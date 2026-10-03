Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE4FCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AABE814AB;
	Sat,  3 Oct 2026 15:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfh0oQ1u6UMk; Sat,  3 Oct 2026 15:55:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 73FE3814B1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042932;
	b=P4Suiira6BOZDX1ncnHDvhZJ4UwXFiFQtwgDAYCAEsKRC47uHbr0x4D9CG42WD3+Goy1
	 HSUmwttQz1Kh0eM+ceDyTLE1TkFQ1i54jox6w0kSQzdz47WTD6XjrDyIiqnK1rSSxd2pH
	 3edN2aS4LKJGGXWPof/WU8cIvvCVt1rV8e6fTnccYZwgoebv8iiQ9m5lf6iytLfrvYGbF
	 BTNmhdgcz7J0xIHQJkNCwz3PhSZFqKMMSsijSO2F+nwEdUnR/ybpRP1CSVRDomzRbAlNT
	 r0wteMiHg/Y4kYnBmUKjLYpxVPTH+/VfHCvh/M9sC7LovS2HnaFrbRUkZaj0Kkl9l2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042932;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jkDZVCEfyvcXzX0DdrQEQibtnbofb3vHXu+hO+hFzfE=;
	b=nJdU4j7ORkDqAwRbvs11W1NlGZX4jmFuoPIDa2QyjsBysRnUvnEZaJ05cvZOu8OSh1DL
	 QoVn7qq7nDyNzix8QL2yLFByea5hYbj4N8SSbVBU7FK62mqGGHco0V6/zyO8bYnSFll1/
	 cB3WhhlKt1WQAWudlR7mCq4ZFZW7q7ry4yVtJDoqwpdDcMwi75w3ryxjpKTJhymHGWWgA
	 oBl3UOgsdYEOM2en10A+3w10d+HRxC/3EsojQPb3LdtfZ++G0m4h6k/SnbBzqDuTKm5PW
	 /fW4xjZyQdp1NamNqYtI78uNh7KjOmq8/AoBO+bwkamoyc21rM12gR+EwaZNdmnmk3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042932;
	bh=jkDZVCEfyvcXzX0DdrQEQibtnbofb3vHXu+hO+hFzfE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XeeZqpDDyYwuR0YGVEIiRWPOpAdAuK4js9kdCXFmtAVs3oLehgy0NTauIQbJ0hrJN
	 UgSyA/VnxezxWbLmVGYy3wpQIotfeQF9nhyoYQQpiZgM/4m2GAzOC+nd7SqVV9RgZj
	 AIdr5J54Q9/4OM/4tLCoDujs8DH8PlUfTCG8kR9WzgYIvLckLdLSt5+az39cDkg5Id
	 2M6BZHI2uGByDaGkXlSFJRk8BX4/XxRtZf+rNWnaXH5bTCkSOmwvYHLP3r1z/gkYGM
	 mic11GV40oAgX/fkxXWd4zxcJzI0xxUZnnYsRv49gux+6hpuFHdOHAOV7NOKH/luJs
	 4l2/n3imN/NDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73FE3814B1;
	Sat,  3 Oct 2026 15:55:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4378B1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31D8A400AD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsCBNBgX_20e for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6EE3A40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=VpwkSoSwIu2KQrcgUJmBqrxVNA/Pelo4W1lxIe3QsDh69386fHcX17uS87kCuROOI0BP
 S1z9UDQPrrAjbvtKcfZEx4A1EyM6uDtfd1wfV5uUkmoUnsvRpGwrs2tWMAOaBwRYsc4t/
 FIpTZoZcNOCzLj3eHF2UiHJzLYAVD/jJc3DO9fDVL8L5AvZxZ57fAwWiBfg4rxGEc0zs4
 UY9k7DrymAMxa9v+iTxH0h8FV13iHWnEhzJ4aI2awoflPDGU39LRKeuPUbG3fVXMquZkS
 gU0q/eXeWe50UI/61lHyFY4WkcVwYr9TSkArJ+xz2tmMaN9zb6IKV8deGpASGNsJScw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w2h2Ez9Yn+FR3E4KoVM88otR+Lc/1KrQYrcJpEtZ8JQ=;
 b=RgaoCRu31gLY1b9rplz8sZoUYR5inRL7piTjtp9lxy6ttWJeNDmjHJ+D3b5LPeBuEqrb
 TlWttzVHlaUgbotibbaPZSwjSatjqhd8rFiiVvPbFwo5UFcx2DNZpz30ogURZyHGPYTDj
 AjmckaScIUEmzu8U03WGWKbQVPWG7hOyzdDQ/0HNuvOT5zTOH2/j5l/aXRNR97lCjd+Bm
 Mdt4VN0sJZLdiIdU91+UMfW4ggVdNGkQWCgRL6RWfntpBjzShymdASDoho+W2aQPpd6k8
 zRA2ffDJj7NmWlhIzV+cTG1KRftJRGIEBHeB0kyXyN2bH+pqIieUAPTuYDmzynAqReQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EE3A40049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFFDC8A574; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 612d7ae0a356a8f531cb877451a52c3ca2617d40
X-Git-Newrev: 00acc293f83f924f9d4be5e51bbc6f107f4d1809
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.AFFDC8A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorlog: bump version to
 6.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00acc293f83f924f9d4be5e51bbc6f107f4d1809
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joris Offouga <offougajoris@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 9dd7dd9354..44de81fe3a 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  177e72715015e36226abdcac193dc82a  colorlog-6.10.1.tar.gz
-sha256  eb4ae5cb65fe7fec7773c2306061a8e63e02efc2c72eba9d27b0fa23c94f1321  colorlog-6.10.1.tar.gz
+md5  92c333a72d5d328d3c62a99d40d858c3  colorlog-6.12.0.tar.gz
+sha256  2a7924c1dadf18b22a0eb8b06d1c7b01d5341707ec1641eb6fcc4fde0c3e8e5f  colorlog-6.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 1b03c3eb19..5c5f621a0d 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.10.1
+PYTHON_COLORLOG_VERSION = 6.12.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a2/61/f083b5ac52e505dfc1c624eafbf8c7589a0d7f32daa398d2e7590efa5fda
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/8c/55/ba79756cb90c8d69d599d57785398ac87bba7b19c80e87f4e8a562197c93
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
