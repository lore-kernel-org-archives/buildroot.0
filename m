Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293D8C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C296A80E37;
	Sun, 20 Sep 2026 12:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HttuZzq8qiwb; Sun, 20 Sep 2026 12:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0604D80F5D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906134;
	b=lqJl9OpysRfQhlVwfSt4cYqDAXb9Q0YgE7HaVSSJWp1VLO02KqoZpUFaLISxV8zTLMlt
	 04Pe0451IZW9cS+5rdn3QO5w0y1rld6AkDtfOKrVn359c+LLyQrqIMOBORZKH1lgNeSpt
	 cTMtq2Q3L4HaFVwS/+hjNifo83zuTWvjlDMrYBCMj+Zk1z/jmG/dd591D8d4ej1hhrM7k
	 VbFW/mISqHTxqmx+0JonWQml9uSNZ47X6R0GxQ0dDGGjdS1f2obKevKMufdL35rhWmjAN
	 Wg6Ny/SswJME3KL2Vhc2dAzs65OvSTqLaTzENdLVxFl/xIsoY6ogMmxfu0fvRGVyrzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=twywEFexCsg0/NWMh3hgtZG3MeU4+SGgkpaZmpPjzzE=;
	b=alvA3RU4JyUjjo1KzXOzTegJ7sOZTVt1wr5blxDnuRmCjOvJdaDgPp/6wikINvmp5xyQ
	 owUy+xBNh24G9cDVfygUvXWV56YiO2dEJ3DZk8z35Trd5NMSOmxMUjusblIb9aopdqjjA
	 GlpD8Sld5iLmHyhuSvUUP3A/qKt8ZlSULztL36EZzOTXhhgAUqV/NW7Ey8InOJzSOZ3el
	 vhoHPQQljbRNb8M9fHHmOLica9estB4HgNDO4Lr0OtVnJUFAzu/TQmUbtdiVMX7UMWz5x
	 scApb5hvprQoBpGrbiuPGGXDl1ZK+4+fpqDIxtR8iTO3rGzmcg/O9h1BwpeYzaOdv+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906134;
	bh=twywEFexCsg0/NWMh3hgtZG3MeU4+SGgkpaZmpPjzzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ejyi22dLvKHEbDiHTDfGIPFvm7DKl2uTPe1L0U9u8lDw2I8zYzPuJE5dnwIELcQBd
	 1WloDU+50yLNdtoiQA+5aEPXQjfKszI8iVgRXS6YfiMSO47T5RqRbnIaX2UU5BkpcJ
	 1ZGcXUsHrGLjL4/cRbIFNww1DpOuCPHDjV/tygQ09FmDrQN0Ba1BaFHqiYxvOoTNsF
	 +P6AawdrAUwuzR5Bpr9o/eDDjw/oXVojGVAZKgQpiWg6X6aa8uvy+eOO5sj4l+TY/q
	 1ZnEmV5t5VqJmrjzxMaBk5ONFfK83RKlJGc7AFi+BBJtWH/8M2+Gc72nq+nDwmx8B9
	 KJWrpsYGTv8NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0604D80F5D;
	Sun, 20 Sep 2026 12:08:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDAAC37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF77F40A95
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1ak3TUoNztF for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2DC4940810
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906132;
 b=VpGmDvpIBVWYwG5b5nX5sD5f0OBGKmkCFcBB8efjfPONq3wFnIOTht05WSFoa5Aqschg
 mSo/gLhFxSwjPbDqrkSE1Kad/tHr3dywEHCcXvx1P77eC1tZ/tFCfP/y5VeTHr2n0KAkk
 OGa1dcTJ8ASJcUpTzwr9jIqU6nhnoohk0N6hVLCcWrh3p4OqtB9qE+iWR/Mtk5qvMl62W
 brGfHJYDp59zAla3s+xUWrRIF5lxZQFMbmWBKgPugMrO7+MpvcDdG1E6yjf+zUakcbcRN
 W50Ag1aesv+8Fq1F0f1pKWCNCU0uLxVHRbiJofyBWy9B3eBSXD3O38jkMeedKKu9lSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tm+JYPL2Fynnk3s/7B/B5WWwE9MyfXsrjL0/qr/GxW4=;
 b=H7VBofdO1rg0fHuD1bWy/8does0JaloEYG6QIFAciqw7ygLUzjbptuOdFezhgxF8W6qL
 DvT+1kbm45AlmJIt1Jjj3jyKDiKszdRf+2CIvJfbrtksellT/9ryWdzx5klGqZPzcxdE5
 y5Ad5T73BNoW/6Q8FomvsoSq/K2GNlF4m4K6cNHSQg30L0b7k2gkD4H7MtLaTGqOE7ilP
 +1UU93mla1HXKPJfdN2kwW0BRfGrfzj6USl79wrv+mCs0Mjxa06MqWkUrApDBc87GCQCu
 OzwpZcomSK1Sm0vbPQjIAN1qwpDnQPU4DYFx01veWM0WDkRVApTd/e8pmEDP+jRTLHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DC4940810
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6468D764; Sun, 20 Sep 2026 12:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 13:45:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2dc2d0c8eb84f015b53f3f29104b451e689d4e9
X-Git-Newrev: 8a224bc363f70831f5d73b560a6466a3a5a789a0
X-Patchwork-Hint: ignore
Message-Id: <20260920120743.DF6468D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sscep: fix build with OpenSSL 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a224bc363f70831f5d73b560a6466a3a5a789a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../sscep/0003-Fix-build-with-OpenSSL-4.x.patch    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch b/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..61fdc692d4
--- /dev/null
+++ b/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,33 @@
+From 813ebb01ee32c35474ec8eb65464f698ccd6495f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 10 Sep 2026 00:00:21 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: https://github.com/certnanny/sscep/pull/192
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/fileutils.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/fileutils.c b/src/fileutils.c
+index 7b846b7..27608f0 100644
+--- a/src/fileutils.c
++++ b/src/fileutils.c
+@@ -447,10 +447,10 @@ guess_ca_certs(const char* filename, X509_NAME *issuer_name,
+ 		if (!is_issuer) {
+ 			/* X509_get_key_usage(cert[i]) is not in older openssl */
+ 			ASN1_BIT_STRING *usage = X509_get_ext_d2i(cert[i], NID_key_usage, NULL, NULL);
+-			if (usage && (usage->length > 0)) {
+-				if (usage->data[0] & KU_DIGITAL_SIGNATURE)
++			if (usage && (ASN1_STRING_length(usage) > 0)) {
++				if (ASN1_STRING_get0_data(usage)[0] & KU_DIGITAL_SIGNATURE)
+ 					*sigc = cert[i];
+-				if (usage->data[0] & KU_KEY_ENCIPHERMENT)
++				if (ASN1_STRING_get0_data(usage)[0] & KU_KEY_ENCIPHERMENT)
+ 					*encc = cert[i];
+ 			} else {
+ 				/* no usability constraints */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
