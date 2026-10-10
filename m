Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E64CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622816066F;
	Sat, 10 Oct 2026 07:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRtbxNKwhCCp; Sat, 10 Oct 2026 07:36:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5DBAD6064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617788;
	b=mBy+Au7kHCSzetAz0iUf6/PlGBckx15ElMAqLwo7ls8ezOvFs/0eLsnJZ45V6swtGg+J
	 oJZZ6av2iWFjJ+U3LIWubRplPdZiFZ8um7+aDAJnikKKeiGwBakj/3dQ1a7IgPCNgSCws
	 4bgYm6pixiWGIoRRQSVh0APNFKEtWFo+nAvbGEoCJIlVsk3FLedbpFPCHAl4zYFGKNxtS
	 W3gjc/g/8n45pibJJ22fF+gcl2qR9vwp3MXHvGDW6Ab+rBFXoGn7LLcAbl19xCJnTJo9Y
	 5pye8gDQug97guxV2jp1ulZWVVOXzgNXgBYcC4yBfHxFkdLy7uniGyoZe6+Fv42C+1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EPzPNHKG/RGtdRl1N41EyQyy3wcao12uhyntF2Sq9OU=;
	b=K5FoTRuv2iGazKRzKEHocLusGwMiAMJbXDuMy2v/sgkDRv8GBsFt1LdjWO30Ls5iMEQe
	 aI+YiF50xInwIdqEvBzpGPM+Iw38b67+qtAVgDhKTrIy0+WXy+e/bjbMxs8meSry/GB4e
	 /qCDryb+7hGTJAM1pK5fOe3dScfLc4UVDnsX5YvWvBaaK6vyhwz43vKqRw/Hq3YZk8MFu
	 ifMrOUGw/daqOLU4PjFjOxaK0fAae/Uy7OGacKU5rTLEIxS8GD87/th73DvJWiaQuh0/O
	 52Omypun7UnL3qudLNaGoqM6eomc0z4o+E0WCuSU2PtYxwC826op1a8Sd0NIHHqZT+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617788;
	bh=EPzPNHKG/RGtdRl1N41EyQyy3wcao12uhyntF2Sq9OU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gj/MFCb+3YAZcy7tKMaMq5a9pAPCwuStwJk2uietDe3LmOERLGp9r33z5dVUPQOkF
	 92FxE1X6iQZJYqiMR2gLNgl4d6ZG77QLjWV2Xi/6eyVnBXixxXj5gyeZe26Mf6kEtq
	 hN/lQdjS479LlfAX73Xo+oi2OXdu8wUuXvSw6E/B9w0coLgQF+MmMYCI+yOZbZsk8P
	 qWrOqDJqs0OlPMB97TtkCtegkmHpSOLLS3/l9oT6Ry1e9BRbJLBtOeJgLCISRezTb3
	 j/4TkicXAiRBGXTDLSSXqHHUq+Z0zBgyUzlxm9hwL/arXgqLet8EIhbEMX6eWYEvDa
	 mksR8e1HfUyMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DBAD6064C;
	Sat, 10 Oct 2026 07:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD06F111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7373B6064C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dypf9AwP9ITH for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B41596061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617785;
 b=U4t36Lj4wSk6Iy11wzru0807EZg1XA99xK7IPIu8oi9am99d5YFs9pEztqqq7vyaOaJn
 mubacM3Izmf+6ecpUvcWJ1ku1kX+TtNYh+moJKJYxPHnpKXVBUxJ5pZo3nco8zJoXgVE/
 ZganryPqHLee4GUqBcNagAnSTtNKokLuLVvgNzMepntojV/EfZONpUv0nWIRPAkg7Ows5
 NhVBkX+sy3bA1VzgeG6S/Rd0LWLCXJEkxD3j7/WXhNz0TzrelYKyKFcnHwFCdao0e8o1/
 bc4cGyaof21p5IHT1DTwF9zmjyFHozHN1Bv4/WLBup0DQKcr+MGms2e2GtPFjO7cZTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617785;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ANKo7GFi0v1R1fIEkfTTGcRajHdyROtzDAbx6/ZKGKA=;
 b=et1gj7v+mKL+KSwsPsmi/tQRkkDnrjHiTV95RWsTyAQw65eNW/M3ODbRlXxL0YMgoi0e
 txqrvmxcTp06kekMGaujR29QZ+EyzQBE42rbDghsbu/u7UaMfMOj4IG7W74M6nU/FJp31
 aLFcgLLGB1FgTOSma69idLdmEPTOAerAXiFK8olAtMcFzxrpCDHXvQT4QqSc4wO3Jib9I
 TFHwN7IkiNqJD09VBYVdHc47KWE6nXKp5grQciX2gr3Q/vPk1q50JzXaGdvtIxmTOebTL
 +4reQ2cUHRcFAhgGSAsdDSQzx6wXEVYXsJvSwLg0ufiTkzqyX66Urr8Vfqoq3NNiMmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41596061F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:36:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F128EBC5; Sat, 10 Oct 2026 07:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:36:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fab16d9c25ed5869073e17051f1c1ef8cb028e4
X-Git-Newrev: 213ee34f03d70e0e31c93f29aed0bfe0648c63ed
X-Patchwork-Hint: ignore
Message-Id: <20261010073507.92F128EBC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: fix build with OpenSSL 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/213ee34f03d70e0e31c93f29aed0bfe0648c63ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-to-fix-a-build-failure-with-openssl-4.0.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
