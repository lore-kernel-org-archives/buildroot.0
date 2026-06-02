Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A12CD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 12:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E070C40775;
	Tue,  2 Jun 2026 12:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VZN5EWFrOnp; Tue,  2 Jun 2026 12:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E482340738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780404082;
	bh=r/sITio21Ad1wjSP8qpVpSnbdCod+wHucAktp3n1AEc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=But9jL9xt2K4rYBD7sguVzrYC6tTUtw42eaSSl/qFuYYhL0P4Xmc5SPno/+qciRuX
	 5gdHcCcT0hCUHjZ4jxIiGNPY62SPWZKmjKTGrKZPFQfCF1xomvI5Ct71po78oG6L7X
	 iDoAgeNPzqNAxOMuUhvyvS8I1VPwfGxy1VpsElZTIyWn+cU4rbnaETqmDm6DnOXcod
	 ScBvwmtAkFt9DS0zJimccdvh4J6ALmvnJFAHnUqmuHeoP22+nZiZcLso2ZLTCyTOBV
	 FDMdt7rPhRJU6/HrcqjMPs4x/SIvu4rQLZMu/8iJ9YOCMiNr44G5PT+Xzvw39Ua+bn
	 2FDdNwd/qkR/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E482340738;
	Tue,  2 Jun 2026 12:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E35F233C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D595560D66
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAE4pZxdHw5e for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 12:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8FC560C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FC560C20
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8FC560C20
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:41:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so2629929f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 05:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780404078; x=1781008878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NC3PBXKeKICKrNqVumJbsIPCC1XywQwxe/dshomNGlw=;
 b=kjQx3iU8Kv373dOgsIbyrgqIdLHHjOI2qG2L85pUmMVx/bLnvIdP5lr/oL/+eezsTm
 Ionia+lfB3lmD9qUf7xsK8Z2E+DY9/1YKLdwcVPgsclktWHOcjJ+qm4N+ZLokfSUFzXd
 G/DS9QAwq9/CH0nMpzHC1aN0rTcOX9DPdyS+Y+sAEDgRVhZVlQKzeAwRt8TfA6c7D9n8
 RqrR1OoYs+RKjKY0PQs19Ms0ziojFK0D8q7MEuCAsCaXK+CxelXYJ8y35RnX10L0Q/MY
 sMtvH2dXkpeYCe3dC6TXZOAIm7uNDrQUqbfZs327cIH1u1tE3/auC95C5HlBfCslsK1E
 vYdQ==
X-Gm-Message-State: AOJu0YzJJQCYvs4fYRtIkXUAax0a4udWZJ1GETx5PUfRear/0NuSylRK
 PM+zZ/7PMqQCca0yC+ZV4SthvD4+LrAOQ/RJYZEKauZuEPjwaSGYHRt4KRW3NhpI8Z+lPyJrwCk
 5ssk4
X-Gm-Gg: Acq92OFxSrq/dW50L+0T7FzkBmh3LcjhMrwroFMT3SYOfRMWAa5BIgwOajpsbtlTQX9
 P5g5HUiPP5KP6TcV+KySFdFemxOeyeW6eWLFDKxQqXp8dpE77CCyAgaj0C0o3vC6lRmUignLwzA
 dk9zVy4am1cUErn0XeyN6A+tVtiS+F7VYkE6MujXBL60Fe64RufGdAR8LeLgawFbUPffv4WFTpy
 QRW2Ytqk9/je4q0n8QKe6fjgqh2p7+PyZW1clOPVA9ScqKwAaRzcFHHyrI+kc0ugdqpZEbVzY8r
 tZ+ABYXGstKtoPX454fsFY0CQcB51L5WHHqSFJXNyb9bwxR3zHK6s+EeWl32qStOWxyeGNftMUc
 YN70jUwvBcT3gEZNsJGt6Nblk+KwQCwLuuEAzrC4lf9a91NwKtgdiWmkvnxjhIRJd/yt3V8E6xZ
 MAOiRB2L0e+8OYNJo2e9kL1qfmn2lDJ/Y0uLJry8OA+5/rELo3n+W6PUPh4w==
X-Received: by 2002:a5d:4ec5:0:b0:45e:f631:2c73 with SMTP id
 ffacd0b85a97d-45ef6afd31bmr20794699f8f.9.1780404077668; 
 Tue, 02 Jun 2026 05:41:17 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm31791151f8f.0.2026.06.02.05.41.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 05:41:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 14:41:17 +0200
Message-ID: <20260602124117.288091-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780404078; x=1781008878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=NC3PBXKeKICKrNqVumJbsIPCC1XywQwxe/dshomNGlw=;
 b=ZtUYH10lIB9z1f2BYlElPTAR2+dtuKCr0pnrwfTkW4MZ+f3hK0ejHnAECtpbqIU5MG
 RzPIlp25UkGYD498DnllgoISvA+BGu7ANKwjlFRu6wc7Vh5RgG53c8IwRSfPaOEgh6d+
 pCYHiS0JejVcETPMccXNSOjNz1QvEmYdeo5L/SiL/+9TsKCpxOcuzhTQYgQK05K1pc24
 FOkdSdLBr2wQXKbzKSymsPXbveUWIyHVVGmZwrMiXnpwTrD74Pp1OOuFB/GM4J8kg65a
 dScJ81BlLbc/bi/BPYOQMTGpgceZbWpO5fOmC7EqJgEMef6zIrTpu+6dnc8Gd24aWyFV
 VNdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZtUYH10l
Subject: [Buildroot] [PATCH] package/hplip: update CPE
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

The 'hp:linux_imaging_and_printing_project' hasn't received any new CVE
assignment since 2013, while 'hp:linux_imaging_and_printing' received 4
[1][2][3][4].

See the package vulnerability history at [5].

[1] https://nvd.nist.gov/vuln/detail/CVE-2015-0839
[2] https://nvd.nist.gov/vuln/detail/CVE-2020-6923
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-8631
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-8632
[5] https://security-tracker.debian.org/tracker/source-package/hplip

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hplip/hplip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 59a0f8ace0..54766978de 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -11,7 +11,7 @@ HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
 HPLIP_LICENSE = GPL-2.0, BSD-3-Clause, MIT
 HPLIP_LICENSE_FILES = COPYING
 HPLIP_CPE_ID_VENDOR = hp
-HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing_project
+HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing
 
 HPLIP_CONF_OPTS = \
 	--disable-qt4 \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
