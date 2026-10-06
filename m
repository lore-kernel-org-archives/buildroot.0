Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FBCA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6334066A;
	Tue,  6 Oct 2026 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxeONcpkWLRG; Tue,  6 Oct 2026 16:30:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED019406C0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304250;
	b=q7ZFQU533jKfmxK4cuwl6DxJE+hsOSsYEIF7XMNLgMM2eZNnvBFienE/ENrUlP4KhSxI
	 M/nzhQuGx+WBPMM08B3jrh8FKMk+mxbh9HmWLxla056gCGryDc64tUQXAFLWroy5DaI3x
	 N/WiJKVBo5D+i3jMPuil+ICtQ88vRrFadr0ZQP+ztHsfiWgCTepOWOzdC2yQJvxxx0Fox
	 sjnBdtewLYtZCXZtwI/X5Vks4yu7trIAfhCgOb7c+hAHawZPNPMFuJkF7Oie0o7Er0Mnl
	 TVUxNdJEUTaRZaD5k5zO+Cue8/pKzDGi9WeCElx3gfOA+2kS22nufLOEBfEEWj6BGKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0gKOBnadrLUZalBYVHvEuRDRQ5FIkzy76BfrWNwL5rY=;
	b=EI1fDO0hUHv2VRv4jUmRxHm6hY4YCDiaqDQv3j2crSJgwajcgK9PWvDiJa+MxO/Wpl+A
	 eHtcxzsuWrj/rQrQje8TaAIXEr78/ndL1qu+NkvTuSBr4/0bshtCcVIgGMSftP6ROScQq
	 5fb7Z+30pPnrvfLT+HWI6OoEy8NWMu3x2lYfDFEczZ15OF1ABesPXqtB42QvZHuCZX7Qg
	 GHqUiZdY7HKIcYDhD3ZoO5AMejpbNFMAG8QpTopdnUlNRX/vv9V2NYrFIwWg4wdlu7z9/
	 FncOjzmgU4A78CQcpYgmtrWBcBF1l+W+6fZWcPT7CzO+hN//TJ4v1bJsFHNxF7jf0DA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304250;
	bh=0gKOBnadrLUZalBYVHvEuRDRQ5FIkzy76BfrWNwL5rY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LB3pXu397LZL1ffy4VTqiDy8oNFVaogzAvDeQH6yMlPxh7+OnRQ+/XPA7qN238nC+
	 cJ1psf6JcIdfGLkXcTgIaqspBg9DB3+sVpUO+haYhYahHZ/GewBuabumFRGNsjigHT
	 gmQpP/0Dtnd06DJY5/zHbqnIZi4wMmksVqM6ZknSXlaTqQLfJfh5eHnbo9X7HK0pZe
	 GSsP18BpPvKXo8AMScb73xgSlqK55zKpRntw7zjmWDSfFVBnmSIpmhDAKx+rfMopzs
	 ZUh+0ahmXjYcbhRvHG7IvHXDJ9oHKlrPSJKmrXGmKWxWVsiswBI4rH3S25TbbfaXVn
	 oNUGyfPFjsm+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED019406C0;
	Tue,  6 Oct 2026 16:30:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B9A341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 793ED404E0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDoVc-1oTAGj for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A72EC40448
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=jRAUkjHAX9Bm7Sl+oQegYel/ejy5KQijHP6Smi8uB5Ami9DqWkO8VUe586lEHf8OmOTB
 sEcjOvUPl+InROkXH3j41rymJYzQIeIAMafDK+Hdye2DAVhklMk5OE4+yk3L39lPRYvV+
 tLJWJtBENgC/zhkWpu9/JUQ7YpGMnnlfh2GWr5bIVEcyuyzMpAmEsesgyqbmzk4kaikKn
 zE56YeM01l3ILhBJNyPz4wjJ94uWMpnARS18xTHZVRzX/Q/4KVCUOKAzBtLudrg07QPdQ
 qn1+7qSieqccapFMviec1J0HmUvtuREOv7OOvPSO9KMLIfl6fTEVVKnA4p1otmFPhxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s2o7GqMffzCftB1Tm0x4NTmsdNUtv+AwwVnZpOAqiqM=;
 b=WUfR7tl3gGs1fgVPwYsa1ttspzcIvFvam9wyZIAWUz74aOYZtpSyqhAjyaWi7pLFLbwV
 1ca4r0pw25x/WprjthUfxy9fpDm3vl3muRQmw05//vWDs1NASc1iNNTPgYWap38+kSkzx
 X25sxiPTd0LT1dfz3nOdYY+PYYCC+tfeKXRoBcfJreQFAy68ql5YjRaEqCNKkLdG4ERQh
 vcS1n7+URmwLe575mCGf/5Z9bheTkr/CigF+2Lr+YZXmuYscF14rAQ6XSKE+Bkgq5rOGT
 /AQJFc3Cubrh+UDLFIo+2NHZCgH7Z1rbKrNVZGWnZXAJLI0ZZVDDFPpA9wTEiza1hdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72EC40448
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F3CE8DA09; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:54:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1bee371accaf16ec5917bde493ef47498af4341
X-Git-Newrev: 93636456ecb754464f27d4edd335c93932aee09b
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.5F3CE8DA09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncssh: bump to version
 2.24.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93636456ecb754464f27d4edd335c93932aee09b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to whitespace cleanup:
https://github.com/ronf/asyncssh/commit/eed9632700b9983765b1720851c28a7dedd390ce

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asyncssh/python-asyncssh.hash | 6 +++---
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index 03427599d8..7fb836d57d 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  0b1bd9d856dfc1b283ae1cd07d2bbee1  asyncssh-2.22.0.tar.gz
-sha256  c3ce72b01be4f97b40e62844dd384227e5ff5a401a3793007c42f86a5c8eb537  asyncssh-2.22.0.tar.gz
+md5  dbe1d5ffadd6f17a3d59430c9f1dc781  asyncssh-2.24.1.tar.gz
+sha256  efcd36e9b35f79873535b06444a7c9b0a3c61d97081b208c7fdd3fd8a40f1eca  asyncssh-2.24.1.tar.gz
 # Locally computed sha256 checksums
-sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
+sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 5d4a056d32..80d1e46c46 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.22.0
+PYTHON_ASYNCSSH_VERSION = 2.24.1
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/0f/c5/41a0d5477865c48cee65050586092dc3ba3fc1c52e29b47fba08d3a44581
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
