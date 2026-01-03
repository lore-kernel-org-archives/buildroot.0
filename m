Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF82FC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E96580C54;
	Sat,  3 Jan 2026 01:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFWIS7ncuzyd; Sat,  3 Jan 2026 01:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D3C80C57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767403664;
	bh=MlIRVJxamls3wLxeeqr/ZG1TQl+d/YMXs8eMb1gD5g8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Bii6TmwaBDDEexECP5/C4ThKhUXsiVBw8495m18RUiOU3Nmo1ByonRiN3fBcePgnd
	 aYjX3JWx0RKTD3SWciQAygNE2IcGbgYCoXo9RRs3oAjXIQZezv/gVgkTKjSnpl667f
	 CyNIU46SdXIQpOonAxkXUui5Sw6rDGIJMhJPo6kLH55opz9ODttMfxQB4hha65T+eA
	 BreV5s4fsK32lUdt1SPJbaKVKzDBeQl7Vwqy8ZcoASndR5C4KSYSqVmsh+jbVzdHcY
	 nfKxkTjY1gvb+nCANvbaIW0BbswlMTQKoL/Ma4MnTkGZ8X9DJsuli1AI1bXDcJOJCp
	 QA/g4ojN+gCeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D3C80C57;
	Sat,  3 Jan 2026 01:27:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4833440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7326406C3
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD1HaHw4M8Tc for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F40AA40649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40AA40649
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F40AA40649
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:27:41 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4557f0e5e60so7286024b6e.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767403661; x=1768008461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vfnt6cBbq1PmZ87//azgUBkhDjrAyBkBFADvFZgUzdw=;
 b=KP+W5K6NbziwBViuug72Ud/sZaF9zBFTcXzGIxFZfRUuzUhK5tL+RjW/y31jP5X8R2
 Ri4Yl1Pd5bTBwzR+cPmPn+MQJtXTFonuTPqHK9UL7xeW4+4oqvQNWomP4FvRRNSOqUtT
 c7TA5/ayt8DUlAWIRy+IdIoitW/PzN2DxqLUPndYQyM9wxAMiWyYjv+lHDDMgPIF5zNY
 RWkgoO1aJ8f6s98T1F9LnUCiZJ9OenQOUlLM5K1izmp9gXgoTWovHXx5a4A63Z/Jqb/V
 kLoOg8+f5rE/zjX7Ph+WdktUaz9KoX67rfpkk7S0+eF54Kf3rgSE1iwthVdei5u2g0xR
 ZYpQ==
X-Gm-Message-State: AOJu0YySMVkWaCtFCXO+AygLUkZwu7mQUhseSUWHRl9aDbJoaj7vxnOJ
 i9+rKVnvN2jHj7rPNqhRyy3oiAmPyGvPihjOq2uWjkBXrkVsFiY9QRdm9V8ORxZN3hA=
X-Gm-Gg: AY/fxX5ZHYNJ97i6eL2+U/wV/aSl4XZmzrU35BizNo7bS0LlQEYrRMMYvaGpu94RKU5
 xFXzmjKmeAZCmeQ7UiNTOQd1bUck0h3KTtIwFvfWStDPKd4+0vLfgYnOq44yqjWiN6PGYhe/gq4
 dHUFWzYyU3Wof5InkGtodyFAAsz2dRvHSPIp17gdf7t4eHjdUlWs5+RfZbwZPB6yWe46l+QLj3q
 3QverJNLov+hsBpU45KuXyLDzEC4akkmihFCOQpGNIxs7VuHL4eFz/42EcPKwirTufhZdzfTWOL
 GInhIEPYN3H88sgzoBNf7ll8RriINy0iBN+UYSDbsxz4tiyq2vr/0sMZgl2s3th0Rn4YQZVWXpQ
 +fusyMudbhP5xUcoTHJ0dKzoKZsauJC4Z468yOQ7JTvSw6UpjbgxZdgdKpK7ywoTOa6WH6CV4lg
 3FaVD200BssKcOLvn0s8wphF6XbgEnrAiy9oNLj1P21QVMx68wT+HN0+rPCf+QJLY0Rp9HWCoRM
 wqHy5p6B3YDSBXBkRs5qmaF+JmSAjcZbBaPAFIryUl+HB6OMbfKJ18=
X-Google-Smtp-Source: AGHT+IGD1TB9XcyuaDzlZ6PaCACxsLkAMe74sVhay+ca1n9KvppR8mlon86DI+6n0MLFRcFd46LA0g==
X-Received: by 2002:a05:6808:3a0f:b0:44f:f612:43e9 with SMTP id
 5614622812f47-457b21788eamr19770493b6e.44.1767403660653; 
 Fri, 02 Jan 2026 17:27:40 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667563ffsm29343871a34.13.2026.01.02.17.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:27:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:27:38 -0700
Message-ID: <20260103012738.765597-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767403661; x=1768008461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vfnt6cBbq1PmZ87//azgUBkhDjrAyBkBFADvFZgUzdw=;
 b=MTpuRmqit4EVB6hJu6wbeNr/so0uDdAsrZcT5j6uaflNlWlRjIG3lq6tc8gSgu01s4
 vvMY+dNwLiffNavWuo2IgDKYVFUe/o81lQbMY1n2WcCTk1nzaBBqWiDJTrZeJATk14wg
 O5mDBbSVfKyhr4Cmb2NaQq3qaT2Adsp+0OmYAEpv/lqRqL+MrGuvDrVSdUf/LfDEdzBc
 jhcIo2gsCeyaEdqpnLJXz3MzQ/3C1RWDasgXa456EDhmVBxOUJfEofbMBY8BGejvpY0w
 Mn8YcY43ZSauPXO3JuOkxtupQHeqLblU47HjMIOXc6MzlrPvX5kKc9ZfvZTXmRC8WJMJ
 oEzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MTpuRmqi
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.42.21
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index ae99b5092c..29d4125fbb 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8abc4bb707739d3ad3e9fe14b42d5234  boto3-1.42.14.tar.gz
-sha256  a5d005667b480c844ed3f814a59f199ce249d0f5669532a17d06200c0a93119c  boto3-1.42.14.tar.gz
+md5  67045728a35f4e764ad826fc31006746  boto3-1.42.21.tar.gz
+sha256  9b92943d253bc837323079fe88460e741cb2eb80abaebcb558b2446bdb4049d6  boto3-1.42.21.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 9ee51b454d..3d7088ddb3 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.14
+PYTHON_BOTO3_VERSION = 1.42.21
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/09/72/e236ca627bc0461710685f5b7438f759ef3b4106e0e08dda08513a6539ab
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/27/36/999f23a821567334ecdfaec31fad556f5569383006543be63fdd1e17193f
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
