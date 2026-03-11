Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1A51125825
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E183F422EA;
	Wed, 11 Mar 2026 14:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GV_O3GJIdWwP; Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84574422D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237905;
	bh=eOCHRsnL6RFSp89AB9c0D6TibeRtbHJh4JI5A2VitCg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nhoqzE0yFFKMvzKqPdj3zuCva4U48H7LcGOPAdBwNSNN+NvXP7LK5C0cNAbn212Ha
	 KfecblGQhTFrrdId73MbZYv0xOFmwh2q3pEKj609KWkrGRC86TwC+uuxMI3ZtauPOr
	 rQaiFD2GG+tTZ7zGN0E8lT4Rf3uTkXRJVG7yfc8J6Q16EAz1bL3BjIz7Viu4hG08QN
	 DAMqop9eJ6TLEkuhlHhk1os/ocCbHsz2ftivdcpwoRfP/66xg0znQkaYVsMMRcHJF2
	 ggjVLO4LEzcG0qfR4+H9iU7LkDKA39BF+zyOGh7048ZXAcMT1XSDMzsnlZu0KBVqcl
	 b5vrI+vYC3LDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84574422D8;
	Wed, 11 Mar 2026 14:05:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F5D228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D82422D4
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRC5QgQX7x2u for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E49D422D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E49D422D0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E49D422D0
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439af00d33cso11406586f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237899; x=1773842699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H3JG57PmgEevU9Wv+oHS+57xU73tC1YmFVPz8hWos+U=;
 b=ijBPQYvpYAyNs+yJa5VzUNttbARcbdMfeFeVLOF97jcMiksWYUd4C8W4B/uRAk4iVx
 g4yrO889x7ipk5YRG/A9y5CvlCiHDUG+TkF/3kWDM3URPul5yNBgUA7ROrUiEL/ikNrh
 sNgz+7bFjwIOxGeUzK3EZ7SjqsztTRQ0I7bDmEpIOS7OKD8EURjFBRLjrKDkJeNfmcI0
 Kz8z6ajuNQAyj/lPazvIE6hm+KNMHgUgWHAj5YsJrpZ1K18WNdIo5k12xlo0z9JWErKm
 Mx/0xxgXpQxPWE/2qy+m4XeCGH5d5Hxk3YRSdkasdGNpGUUC5KrxVYEMqvF4zN7Z+r1P
 idLA==
X-Gm-Message-State: AOJu0YzDsxM8rheUkMc/n8rOKiKaVKJ4Ow2Jalb1tx8xbG38HYwiYPL8
 XXAoDrfBIpYlQFqeU2I7mya03b4mFELrAPbFkLIuz6eSdXFns5v6AYOWU892Dq+ruI6iy4EH7v7
 KlE0g
X-Gm-Gg: ATEYQzzXLB5z0Te4i2YakkzabL5kFFTIDI0FsPM2tJV8MqFn3S8zUHlVugaNRgl8OZZ
 SLPpZzVLIQF9LuNFcqb9aKjSSLQuTMc+e1iSlJi6CxpzA7MsM1LvseBDMQGmjPv9q+P7J0S+JU5
 ve3PD2e3jXuhOWqp7U4miHB2AeJqo1nJie8VtXBmtg7BZLuHt0YNj6Fo6Ds6F/L1f4cElHKU1Qf
 vwBF4EyJVl4Gp2+84CcpjqeukWgcRVgtIM0urVbYmm1VMxMpjBSKYqp0oAZPw36hIAQx5jiqwxT
 +1RUYbCOUuB3cARk7uaoOL/YM8TMY3BQPhoV0H2uW0SAJfGmt+PWlTVeA/gslJpxtil89OpxZzM
 Bfb01aeI6ku+8kzVt22gCLWXvj4GEHAfV3htusBnb8ez4dYMg098WQOSChAOFYyE7eAloA+6hil
 lHP/vxdcak6nOnPmc=
X-Received: by 2002:a05:6000:2207:b0:439:b114:60c2 with SMTP id
 ffacd0b85a97d-439f8206d01mr5117508f8f.34.1773237899401; 
 Wed, 11 Mar 2026 07:04:59 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:04:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:50 +0100
Message-ID: <20260311140457.140041-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237899; x=1773842699; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H3JG57PmgEevU9Wv+oHS+57xU73tC1YmFVPz8hWos+U=;
 b=Q4zbhV+tuT2fPvqv/z3B6iXlrCO1wlM6YNxCdFdjD3aXWoUkzuJrc2KFbK8yU1IMfu
 gceqR66OIYooPpnCl7YpU/pNyRx5AWxcgYHnbIc0AFjN3JCSW8QMnslKyurh3au+BcjC
 4SGl5rfXrsoKaFdZr27NVGZttNUrkGGGO6GKJ8thj7eFnzeJV5yx3A4ucMHYqUhJ+nu0
 K5KneL2zLPkl3eTQep1RZpgjBfZQKGmKchRbH20b/cyyuBuLJioDKvobiHBXepzVRtRD
 IrgIhgCNAn3y+HGQ/6WKIULV9UKzMYZezpsOtCK4jLJGOpXQF5h8JqcvD5CLm/B5IsDh
 UGZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Q4zbhV+t
Subject: [Buildroot] [PATCH v5 1/8] utils/generate-cyclonedx: use tuple for
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
