Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A6ACA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CEB60AC8;
	Sat, 10 Oct 2026 09:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BG--OoxXPAlQ; Sat, 10 Oct 2026 09:27:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 589906060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624448;
	b=Bdd2V+hLtsPcLsTzS/mFuZINq1bQ3uRMDMnqVz5u3Kq6gqqmN1qaj0kemfTo4mLGJQgi
	 woOxl3xg0Fy+KnZGF7ugPFpEEAFXN21w+DoycyiwUywdY+UMl6WaV4wjNkjmSzjM+F3RZ
	 tWjoeqxNQR1UCCE99bMfjq9DD6MvGyVarQNRlOJP8XKvx4LhjLeNhpH04LgqkBTT9UBXZ
	 vLpT0kE60fOsbbpdwpKY0HqoInmX28B7pycG0xB73fe0zoLdO7hV2o2xZFG7k8xVMequA
	 GNPVIXKw/eyofHr0DykZ+Q1B/eZhzQG4/PDuvjqnLhLlAYxCG828SS2Qxe+iUxtJRZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=o+QYOw/w61/GjjU+7p58N9IRLh8t+Q7LjyzbSL2HT3Q=;
	b=HlVfORzKTe58L3okE7mRum7dWiGjrN0Rukp6AEkhIXS+gIAzrDz6e0b4djmj6DDsjXUW
	 lQzrE5IHi3a6JPLCQCx4ms/E1ss+DKB44pL+m4A6fzd+16oV2Vbb/o0DTc1VlcFs+6K22
	 Y9wBxTkvD1c8ynzCvx2oTvaAsluj4LEuVKorUoTmq/K3j8ioJ1hFNesXDEqlErY8Y9eg6
	 9AFZx0BWpQAVfw40XzkwvncSl2PF9s3bHh80Vu97EkH/UAFkb6AVixTL7eDHyKtoMfUI8
	 yrj6N4XRUrM0nPuJBYVqrLkbsYuERgoA/pgdMQpcXlSFS1KYEYSqpWPHwy3YAHPRVMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624448;
	bh=o+QYOw/w61/GjjU+7p58N9IRLh8t+Q7LjyzbSL2HT3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LpK5RrgY0VwEf/6FQh3XmdCBXqO3258lzQf4tHRCIkZyxmpQCaode24+54Uz89Q1S
	 2eibi91xD4+/Frj1hmssqvkk0f1XUAwdUX6HH55HxQHiiQsr+UNxi7wf5B3LMzQSSS
	 CY0sF88PKmLQG1upCp7IvT33JJW7j/3f37P8aQtrvslw5ey++W3UJ6tqMMdrzbWmp0
	 /nnvUPyS/wH1IcIXtrGEAhrWYV3re1Ds5Pd6ZGTNRKNPmHcERk+I90ZU/9wxZNPtRi
	 SHQ+Oclg03x5MlPET9rdftPweIFFaaTj0vahfcYZ2EI5xBtbZA09YNJxcDCyxp7Vgm
	 eR7wo2bGY3O5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589906060A;
	Sat, 10 Oct 2026 09:27:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E537DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEEFE811E7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8Il1SyBFn5I for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4588A81126
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=lyGGvaHXrPSESaM++mQLcVk82V+cjTmQqfMwx8itnJeYbYaEPiy/5mPNM4RA4UkaLKsj
 D2EgewhW2E2jpDNMZXqPqjVhnK/K/+MRReoA9/1m6ufESdrWP514xKf3dfM6N82untmTt
 MTdDMPyaPOUCaB3+JFdo1XIDlKWIgMutKuEAI873LVvMVZEnBy1RcaLWKUnAdoPIxbEXx
 kYesf+sEzC059eIQtsYT8nY8eGgZWfEsft6+T0aHriD0Xm5E00QSxOxSGtf5YFCMPA4yY
 YkeDsW2C9OFp1W7uiWng6FvVxl83JpXkI5Y/xzuKGUbn2lFccCepWpE1WYSB2gxD8UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PlsRzzM+BurAq9OlzggMzhAc4cjlRJ2jAnfDY7UyFcE=;
 b=MolaU1aFYsqTXqZPF0iBaKrkEsHKtJA18osHRzExjAASx3cNmSyvwC6IdmzJAwMFc1EU
 vqzT2eZeinae72ylCNavLFFDCgneUhgYy6JWpl559dSy0T1S6tRJ/0icxjcT0bPMR797l
 dT6K3jPyaUIwxHna0R4DfJ1IGZm1JCqfDMwCgDKcENgiI1GYRW2SFMqnCMPx5KvEwJogf
 0RLXEUTyUQjAYllsOHiC2EgX76KIKszl+iWyDDPwCPMth881E3UW7rwvE6Fs/E0jBCrFz
 VYCrJiY2HxCzwpv64ESW6hA6e2Nm+9gUqqSGx9+D2RZZi3jQnX177WKsXGHAE+3vPYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4588A81126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22A5E8F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:47:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f6931bcfd1f987f31e0cdba60c5ae48032c43602
X-Git-Newrev: f56bc5ffed61b597f3137b6e6c9a7bc656c88222
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.22A5E8F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bubblewrap: fix
 build failure if kernel uses localversion
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
Content-Type: multipart/mixed; boundary="===============4726696190698455399=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4726696190698455399==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f56bc5ffed61b597f3137b6e6c9a7bc656c88222
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Bubblewrap expects the value of the assume_kernel option, if set, to
be exactly three numbers separated by dots, nothing else [1]. If that
requirement is not met configuring the build fails.

Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
version bump to 0.12.0. However, the expansion of
LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
CONFIG_LOCALVERSION is set, or localversion* files are present (like
in CIP kernels). So filter the version string to ignore any suffixes.

[1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104

Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8 ("package/bubblewrap: security bump to version 0.12.0")
Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2b5b7371b4ae5460bbaf0ca8c2cfb523f865556)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bubblewrap/bubblewrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index dcc3c23d7c..a58d7fd143 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -18,7 +18,7 @@ define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
 endef
 
 BUBBLEWRAP_CONF_OPTS = \
-	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
+	-Dassume_kernel=$(shell echo $(LINUX_VERSION_PROBED) | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+') \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \

--===============4726696190698455399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4726696190698455399==--
