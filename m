Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CEEE94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF10810C8;
	Tue, 30 Dec 2025 08:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8syg8hY2znmG; Tue, 30 Dec 2025 08:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1283481153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082766;
	bh=6I2xriO6aiBxcF2Zu+c7USsjtNRAz9rGeLCXA+NQOck=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GiTFo19KysY6mFRsGy5p7tg/Pb9oAHMZaRemEZ8pjaIfl8/IdpbCXUjEdq+CA2/Ye
	 /+IXB/PjDuZa56MT3Yp4wodZeSrUe8y96kfvURa98iNTrhwIWZ0b7Hr/7ZsnpKTTeA
	 UVR0VHXUSAYW4/BINGVf1wT1xkOEahFEQx/c6Cn/kB7ENZavsS8y5x9NNWwuUtTDaR
	 lngXv517j7+xR7c4rdgVHXvu0kwkIF16zwvu16qGtIWb3nfhvsoN7krzTlJjzQLlMg
	 Rw6OvNrc3QhQeJyiWFGgxESTfCHyWY+Smvvq3bOwBr7aJpGenZ4YQm5FxkmUUV/Pmm
	 mvP6ilKocvePg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1283481153;
	Tue, 30 Dec 2025 08:19:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 345A6D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AD7D6073F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCzjKWqme9JP for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18D21606AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D21606AE
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18D21606AE
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42e2e3c0dccso5879127f8f.2
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082760; x=1767687560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VCEEnrfKhoupIPwI8CHpJ7RfjgVLP+c+oaq193w4tAs=;
 b=ClXg2crCf8CQwjIRsAQ1IGScz0tUhKR7A/d1jOiCf34e7PHo9aBUxXV36aDTn9CkSB
 zgZzraStnpzlkkfHR4rYMFO2khQwO3LfyKVk49rw4F1rJh5XM7KZnAsgu2u22xAeEHhg
 HKZ+w67MbEdPr8UrBC0syFIBg7uN/X4pKbjJHmmHFrERmzVfAIlgYhFXczqrpUn5kL2n
 /S9bUc0wLbCjNadO2ewcSs2YEED/zk7Fnfp0lRtc5HOPMUzZtqGsQXmDrMdXHIAWEg1Q
 psHZld9zZjze5sDkPYkUmZBz/HHu8qpMDkN3UnpnC7Rz0WCfWbE8qMaWQSXdAIsKqPss
 dldw==
X-Gm-Message-State: AOJu0YzJPsnBk1RtQFD5acVOtrr+OzNE7N133ejUlKIwLqC+koxqP4SF
 v21nYuem+UHfk1HLpXRZR7AFRiJQ8tAfgUKrsK1Oxed8H8hk+o0anbrH1BnKN8wDl4GLkEsoZdP
 9enTxXD0=
X-Gm-Gg: AY/fxX73f2TXemPZHVnylrixl5nFFezAgbJeq704reuvfTEummv7UW06qut+DW3mpZU
 rY3/urexGRpQlxOYtIfkpdg7L4Tx12Cyvq6CxT5DJe6QQM/5ciDal2mLc0coRLbDggPg1JuOj2N
 BsveN54lQZ3HWEDvd/ufcvhL1J+Aud/9fSEeahlFVrqXgsaE1lpajB0qSyGoWfCYJ5KxuKMfM6i
 Xy0CTb8W5Vd0496/SgVCAMqhwJFCkEu//okFLuQAdcnpCris9lFJHC/IVFvBq2Lp9D1FGfKX8XL
 YN3jujRZ3K/gyOp/G7YS/cIJ69Ma9AmdMHc/YUiNnzVsIEil4Er+BM0kQ/cdQNOVcef1oR4e+7m
 ubUQZpa/O0T7IGvINjNk2NYkBncH1jUzwhtnTTO8vs3ig+Zis4R9rfwFFhyUHcEJLn4a34WhdIM
 c7j0I=
X-Google-Smtp-Source: AGHT+IEZOhYFI7ZijQNTXj4RFLLsWTrTPLqO8fBQzmPRtx6Q+347MpnPdw7k1cjb0q8iGEIRJFdNKQ==
X-Received: by 2002:a5d:5442:0:b0:432:7068:18a with SMTP id
 ffacd0b85a97d-43270680252mr18475179f8f.20.1767082759735; 
 Tue, 30 Dec 2025 00:19:19 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:18 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:03 +0100
Message-ID: <20251230081917.18676-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082760; x=1767687560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCEEnrfKhoupIPwI8CHpJ7RfjgVLP+c+oaq193w4tAs=;
 b=ay5A2g74MKLGq/eeF0f/iaJtQUmDINCpHDNoedULPPEAR+vyB/LEUC8HMg8tGXN5sH
 vvSno/aEAKsVYVxVcD6G3qT9XtiN+6vEr+LX5/3eS4TreuJvt5vLyWSttXogVoHWXW3g
 wIUjDqEEP6HhJGvm+qgyhuH9yCRWy+8ZXTCtDvK7SuEZVxmu85niNsvht8L2IjnhN407
 b/+UMZC9+9sympkRUL+67wsRsbIDaa4bu/8YWtl/aLzntk+JPY/PsaLvXOPX+tYCTBNX
 kdzpeF0Z4Zcp9fj529ZH3Y9V9RwkgFlB8tzIyzwd7vTOmg0NWrIoJcaYj0z++3dNJEiT
 kz4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ay5A2g74
Subject: [Buildroot] [PATCH v2 01/15] package/xinetd: add CVE trailer in
 patch
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                             | 1 -
 ...5-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3e274f391f..4df0438291 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1124,7 +1124,6 @@ package/xinetd/0001-ar.patch lib_patch.Upstream
 package/xinetd/0002-destdir.patch lib_patch.Upstream
 package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
 package/xinetd/0004-configure-rlim_t.patch lib_patch.Upstream
-package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
index bb2ee1fc9a..c99879b478 100644
--- a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+++ b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
 
 Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
 
+CVE: CVE-2013-4342
+Upstream: https://github.com/xinetd-org/xinetd/commit/e7c1ba41f4f86b436fb82b0d55cd5d387bd4ecc4
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  xinetd/builtins.c | 2 +-
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
