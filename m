Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6751BEDA685
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066696060B;
	Tue,  3 Mar 2026 15:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQp7MZwuNTsE; Tue,  3 Mar 2026 15:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ACBF6079F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551011;
	bh=eOCHRsnL6RFSp89AB9c0D6TibeRtbHJh4JI5A2VitCg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=eXIgyNZKA8d4j749NHR15j5FSVkz6rhLxPE+oqceOmXH3tCZAfAStYCV6Fj2KNeRs
	 58KoQfv+guJ/KFSUVfcsAnE68gW0BFnWeBKGJiHPEdzrFBqdwHy8KbmImr6H6TuAue
	 OEkifZqkkD7ZK6g3SoM/3CAhkStvxxuggEzvDIoONUHv4b5JNaxZhQnqyl/knI10eV
	 KnFllv4qQ1gQKTlNjFmN8rCDMfTajbaC3/R1BhbU056nKf1+HcIoOhRxlFqv6vvgaH
	 DGNGE8mEThzyBdGgwwyjFmUW5kkE0HKcNVMxSEFvv15ZEP5XSNnNfkZj6IhLjQKkW1
	 zZ3V7vybtzvBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ACBF6079F;
	Tue,  3 Mar 2026 15:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FBDB231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D37E6079F
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmpOUKa3Z_H6 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32CA06060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CA06060B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32CA06060B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48372efa020so51083005e9.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551005; x=1773155805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H3JG57PmgEevU9Wv+oHS+57xU73tC1YmFVPz8hWos+U=;
 b=mC3l2wxLPHn3y+21mZaAFbbu3ShxF0She1G+fahasfTMD1JZcERe1dn1uEY7Yq5nYf
 7zL/R47vIwvQWxrC6w/Yfa62hvmtsTKFtI6hJWSz5IfJXA92/Ek72BApr5laTDMcm8KB
 GCR2Pf2CU0SN9Z6uNE3P4QtxwdE+GDZ7gpFCKMn/FcbRCSfhsGcktv7JG1ekVwfu3SIc
 9OwVgjAESW7FUveFzWyBqP4zv0SUdpFgItg/2bBvVIVgz4bQ3piClx2sJOZL3+GMvsb6
 d50xIcer7iEnJc/xbRoYL91srkHXL+JpVgX8F055KaOL2QW2TL7grxcEQ/cb+Zu41O9L
 w35g==
X-Gm-Message-State: AOJu0YymZdFQYVQD9Y0i6qQNb40eUI0mublMAmKt/hXZqDL+htqLzcog
 7IJSMoga1vPKUfRWA7SH927BSEjEd5KPxK4eWusnnysbZqDEknhIKlmDaEf0mdSaZ8yskKGPss7
 lPSh5
X-Gm-Gg: ATEYQzw8G6AiL1HCSve0F9/Rj99R0Bww942g2Da+ekHo1nLmHZElbLMCm/FdfIKHj5m
 b0t0vxFmANQAWdhPX0aVwW6SU0pp3FE1XBIRwTgtpdarTbNfy1sNFYH5kAdpytdSeo8es41As0x
 R2alX7TkgsU9OpzjdP7+GvkTkBnKyHaAwbcvIgebTKxjoo5nRYK1WATtXf4OeVoSrItWDaTG5se
 iqlJUx5lGDvUlxxWr0tmkpXxt5FYT/2adHxdKn8Y2wvg9bvRG4EL2qBbfbCse1LRU0qXv4sGkjL
 TZXj9xkJTxyKjwC9kcWCQx5v08v2UZZl2XE9XifWGBr6lo9bJia4EK1AAihEypD9i+q6QRDhJud
 G5nqHcj2HBTFbkRbISAEcjBMcblLu8FgHW6gh/2tSzlfuofCxdawkDOOzFw9Q1eeh2XDBze1DlG
 +E852enKTNtVfhFJY=
X-Received: by 2002:a05:600c:1f06:b0:47d:586e:2fea with SMTP id
 5b1f17b1804b1-483c9bc557fmr294106515e9.15.1772551005297; 
 Tue, 03 Mar 2026 07:16:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:43 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:33 +0100
Message-ID: <20260303151641.382820-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551005; x=1773155805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3JG57PmgEevU9Wv+oHS+57xU73tC1YmFVPz8hWos+U=;
 b=GSXUSUHzCgqwjyMhZxzne+3OoCUsp/jdJwDv08SDf2Cafd9QFDDIdGO5/i04brHbgk
 MSqHu7S86LBkHdSmBER7Lb2H0WJTJrXFEFlmfaxshO7I868L2hWKsprYdDRm0o8xNQsT
 l3f7K9tA0rQF76OWUN6wnVnJJwqiD3T51woRfFm1E5sve/SuaS9IXyKyHHj7WFWLIKgt
 /anJGxdDcex8m1dE2v8e5aB7YdBxI3rhSroNjY5qgWGBW2hjtb9EioL804WZMWhZqBz3
 JjwsQcDFS25Uy5a0KD2KGAD4lhnF/1cQzTt+hTDY/JhXJuVRC0oMaJTk3mIlHoPReqFL
 kPgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GSXUSUHz
Subject: [Buildroot] [PATCH v4 1/8] utils/generate-cyclonedx: use tuple for
 version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allows to compare different (major, minor) version easily.

In next commit, an optional newer version of CycloneDX will be
introduced and this syntax makes it easy to compare without introducing
a dependency to 'packaging.version'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..eff55bf598 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -20,13 +20,13 @@ import sys
 import re
 
 
-CYCLONEDX_VERSION = "1.6"
-SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
+CYCLONEDX_VERSION = (1, 6)
+SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/spdx.schema.json".format(*CYCLONEDX_VERSION)
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
+SPDX_SCHEMA_PATH = cyclonedxpath / "spdx-{}.{}.schema.json".format(*CYCLONEDX_VERSION)
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -413,8 +413,8 @@ def main():
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-        "specVersion": f"{CYCLONEDX_VERSION}",
+        "$schema": "http://cyclonedx.org/schema/bom-{}.{}.schema.json".format(*CYCLONEDX_VERSION),
+        "specVersion": "{}.{}".format(*CYCLONEDX_VERSION),
         "metadata": {
             "component": {
                 "bom-ref": args.project_name,
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
