Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916A9CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5324181547;
	Sat,  3 Oct 2026 13:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO9qkYVZvnSx; Sat,  3 Oct 2026 13:57:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4BBE781518
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035845;
	b=lS77vhixhbdTTwuwr/tiVHWaJ5zUFfvHY5lBd9zRydpIlbAMMe0/8o4NhI6eHWouLD/x
	 ocZuBvjG98iDb70XZrB+cr2TJsVIaPGf3s5904j8Os3HUKcBrrsBpQfxjBs8Iaw2vFsYT
	 yz92EbtVE45wu58OZtTmG9WnZ5AfQxd0tKE4y+mCkL+XR9lqeOxGh1wHlX4FL2uy+XOlM
	 GDpTpfS/fivZN+cxGV0eaA8z89x9Mz+ibOwgOrEv3irqfS3YxHoBJmKeIV/YfpsvdURNM
	 AZpolZNnqGAkP5AKNaoz3N6PwpZyUtSM4D2x2NDxR6DY1V9e2f8zvDH+TTcjG9vyvtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ahhF/z+5HMQp4qKNaz82tpvWU6KvYnkvpmI5GbAiz18=;
	b=INR4cg3heNY3N9f50gTyQzfgtzXSJLNXaK3jr5etTnRRXYS3p9L9DealU8AS+hQjIKwu
	 +bAQtZB6F8+fWGf7Q86cqcV+B7DhoB4Imx7B62Z9kG+xw/5hEYIMM8dVeRYW6dMfDRzAK
	 NZKRTfIwh1VbRMA9+QloXu2KQ0guseLJ584UI0tuOFtdlboWdJv8AMXhJpH0KnUEURvJZ
	 JYsPtRCNIgQZHFQwIdyjjbKfONAIkX3f24+GgOB033Nltwx96yK9ITpIMEhBVPf4Eu2OU
	 hsrIL9MIVX9WzKnG5amUcYMml/LH03vnVo1+B/D0Yzss9Zirpu6nveOdHNa55FpBscw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035845;
	bh=ahhF/z+5HMQp4qKNaz82tpvWU6KvYnkvpmI5GbAiz18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d/XBTF0CpOzSWPTiMMMzVIUIHgoD8htikHww3U0Ib+leAEnFatH03WMTeMHY5uNND
	 6NKNnmPjNf2jCWuCsR5MhPSs7e44tivra9Cl81arfCZnH7G1zAEyWnmxzqcXouyoOs
	 iF7oS1fwHxf89DFHCzzlqEQ3xkM27lSyUV7+RLXuxk1O9urapppjQ6/TUneQKgK1s8
	 +GeXCo67SSu/o//KJ1ej4NGo23dU6v8p7/AaMhRQ/9WBFachjr3jEL0eoxdEXc088G
	 cjHzkVEDkTuk7itJ8uJw1O5ZpyZ7IHsTaeVmOMdEf7sEQM2WGjmvBuOsXl01Mag5tO
	 FK0ETGbMefA8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BBE781518;
	Sat,  3 Oct 2026 13:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A59179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4FC414C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nT1jELOgwbEC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A4F69414B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=CWhSw7EqbonCBtT/8RfwYm3NxnEk3liKmcRoYl2PoboNrUh4EX2f7WZ0p3BL8vGRdlby
 x2BFhZ8f9ewMqglymmdGsfFpn8UwUIE7Wt76Zx03uwO8DnhOEYRP3i+i8gHOzWXBGG/xv
 BOjdiPlYfF1HqGzKgqqCEDmEMAkQMYxz3EviI+pfClCyZffux369MwMXSBItr0pJ1JWqQ
 +8VPzP7aQ2FtGx8Mt6unxkizGoIEfBCgoMCoKbT7OTqXvLBR82iwH5mE7KM+bpTkmIU42
 3QCMTs7tOfE0Xnd8rhMz1HPDC2XOyrANchFnI/v5utj27/2MDkrDZCS2ZBrnQ4FORJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MXno8fGZ/cngGJSzU3+OiO0gZuahzHMQImqPmkhkwLI=;
 b=nMldvkEByVLwAfrWYV41/KzwtSb1R0pR+9IF7s4MAAa2ONLPDCDSWmpAgm9MfmefEaZN
 yneiDP3D2kG2vJ9VC4REBqM0YnEKOkTeRMHnu5AWlXhxTmeuBJMxkJuNqW1Cvq+I85x0j
 uEBoZBR8VcLXS2N4pW9ArXhqZjIvhekgirwBp1ED54aRVtGofsKElTrrwTcNoOWbjBxu7
 aHo6qe9yf/hCGxJB903ZZJeTcX3GGi28w8FIbOmKFqlVDDemg6502MZ2dygMWDwpXxfaN
 FbHOT3Ua866z1iw0JjnYEFOz/sNqfs8Sc1NcG+usHjLP8WkQ/rgNz92IhxWnPbJx1vw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F69414B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F07A58A31D; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0b216e6ff696b374416da25bfe20d142fbfb8ee
X-Git-Newrev: 388fbcebe0ca2871e95910ebf139ff8d233ac123
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.F07A58A31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyaml: bump to version
 26.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/388fbcebe0ca2871e95910ebf139ff8d233ac123
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyaml/python-pyaml.hash | 4 ++--
 package/python-pyaml/python-pyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
index d761e088ba..c8a8be241e 100644
--- a/package/python-pyaml/python-pyaml.hash
+++ b/package/python-pyaml/python-pyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaml/json
-md5  c3bf0c6966734fe2283cb4c8f312178a  pyaml-26.2.1.tar.gz
-sha256  489dd82997235d4cfcf76a6287fce2f075487d77a6567c271e8d790583690c68  pyaml-26.2.1.tar.gz
+md5  43c7fbff45613df7e7c5378cd0c96543  pyaml-26.7.0.tar.gz
+sha256  11cda3a796efc6dbce0d56836be56cfd26289dad07bcd78e9904086729929c93  pyaml-26.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index a299bd3618..34a9c12335 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYAML_VERSION = 26.2.1
+PYTHON_PYAML_VERSION = 26.7.0
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/38/fb/2b9590512a9d7763620d87171c7531d5295678ce96e57393614b91da8998
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/15/6a/acfdf17de0d6947b419da8696e02b781b18de2cf49e0472298b50e1f0711
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
