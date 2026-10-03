Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9876CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DFA8811ED;
	Sat,  3 Oct 2026 08:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0H9JiumrEIX; Sat,  3 Oct 2026 08:45:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ADFF4811F7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017146;
	b=qQetyfRQUUvJTJkQOmN6gOi84CjEszznn/eqOqdkIHR5f725qf8zb3GciZvSGfrH+ZKB
	 XpLRVrVJ/7xP25xNdWDplsOQZYgG374vs4vnzgNbp8H14zicR/L1nZVE6xb2KMpTdGj4r
	 suAyejnqw6lO8pQXO6b+pM1DSB95DB9WKTHT1O1dGXuiF9EXcerPr++evFn4xUH8AVxif
	 Mi1z3Q+vCbJWRARccvIcs9nUT1a890caQ6VFHwk77sla/DDRxCfWmepvNdZMJLddgPlZk
	 sYoOCp4OnCo8SuxaaD2/BZta0jDjzMUsmyrfe7R/Lxe1Bzzb105lo7j3q5nO6wyqy7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0FSvF6gtL81lWSLE/DBwyvV5c/EAQCzsQMhkZeKdjRY=;
	b=Dp6h8b8bhraKmFPVLa34fy+FbM6gwd8yLtEItXhnQr0Jd9oWGPYZ2RiTVCHzSzzvGU9p
	 Nlr7LRTRgtnOt6HfaM499ewl6RghE81m19fOY5toRNVwzsEKoeFjEoCZ5z4PJ5gFRZlPC
	 CScLaTPhBh5o2ALhR3lntwazPvTZTKeWE4ZfkZR8WEOeifW4c570Pr1DcUT6RhMDYyTa7
	 VDYzWLlAE1it2/dFrW5moK/CV8XeqNyMBxqlmldcFozLtTd28Ouz48OD3BEqXryPWhR6n
	 cdjRIQNkOhvoXcAcRdzsMpVvJjOd8M4+A7jgIl0t79nrjcSZNrWts/p/CzJ9zhKGy8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJo1VDUR;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017146;
	bh=0FSvF6gtL81lWSLE/DBwyvV5c/EAQCzsQMhkZeKdjRY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=V3FAUQuEfjfNQoDNbk6AymDQ3UWIzBSp2nuG9bTuLzVOymDfAcOoJT8/Tuh9BoqiA
	 0FaOZppG/rVf5E76H6bPYEH5Bn3UuJtnieD2c1ordVZIx1eBiFTqEWCrgVd8ECwxza
	 XJz/QZxx44Gv5YH9os8XKgJ+8lvGCFRpfzeCGOCTOO1ppMVNUDd9w2nNioaEhMFwAR
	 zn+MJwaFMYS+iOnjN9TeJcoxWUYYJBVdq7fP/BRYUn0VyjD8G7SV+quaihbU+/KqRn
	 WUrY6W4o5L1anGWfIIc7S73whSlcwx+nCYBOGJsVYYzrO3imHwW1PN7wcvOfwvI7ag
	 CRu3nBYWWb4nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFF4811F7;
	Sat,  3 Oct 2026 08:45:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 559D22E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 476CF812DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9zre76AratQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11D66812AC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017143;
 b=tI4f0Q7wtwZ1nb2mnYyZ6j8tOzifMYSLPbiQfMvB2nmiDdDWv1GsTxcRBzzRqeYjgTxB
 eLtrqqFYiNFNGViytOxBF0PgYzwm2Fpji80y6qDl/6I6qrAeGbSlA3I+XkLJbls0PWfAU
 KTFARwYmTrD/GOjgWR7fRqVHCUQixPzkPbk0XWfHxbq6zsY+LpETvsZlBuGew7YGq3MBZ
 WZPWjAFEePcRzm1HsifGwrlWWAswysDmpwjYkJCRzRCcP2MpbJmSEOCQEbKELY3AjILIJ
 8kK/pZSY6jp9BrGAOnjAnlt5lV9n7fjODQjXnsJ/fU8NM4/TSHPH/egj3e0NSH/BnHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017143;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=YE0udrovG6Tnw8btbJb53eOQKvWkKmkHJvxH5yRyUSk=;
 b=fGRrBwToyLf22Tgb+OGnd5q+YTUQKwvittpTpa8l7beqLy28+JjNwFSxjCcTv+IPHwMi
 OvubQ+jhbAVhfYWvcgJPpRlUHWK6X6xfQZhI6TItNha54qzrEdPfiQ5km44DpLJopX7ig
 JaJpUX79uarVXoDicEWfhVRtqmLtne25FAbVXWsFUX37OpVBEO55KM0pgtem6FOCOc3dD
 39faCMLX9c/NalxD9v7xM65jFpz5s+Q/KYRO62W6m8h8QSLBSNfNARViNdZVby8Z1HdmX
 xmPyFqth8UidfCFRNQ7Yhhk4fLcsYWDwjWc7e6YVuC2DkCJtZM1WrYNnfxri57Veapg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lJo1VDUR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lJo1VDUR
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11D66812AC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:42 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6df93f00f4dso269712eaf.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017142; x=1791621942; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YE0udrovG6Tnw8btbJb53eOQKvWkKmkHJvxH5yRyUSk=;
 b=lJo1VDURpoVnsYS60a4nukhKFqZkf/HZCpMTfLO6/u9cK3RoVCjiTgjb2qVw7h1f20
 y5ntFaTK8qkk/CvnEUVieDUjCx/kvyaKiFTn3+5hRAXnVWwYZICX/Gta6I7vnsZs9PKw
 3MPsh0VC9zbq0diJYYIUZzNiwdRhm40uzglHyieMmzci2W1OV27Yf6SeBxbWMNp2uSgB
 xb6rW9YOSvTqwDgd9olSSWJ27vVro+VJWxhZFbpMa+ZjuXYmGjYavgfsPSvo1FZW/z11
 Mzkf+PAMg91lmuRMlkwFJ+1iFMTgyehYqfOXvdrRl0/fLSvAhkgyIlzfLJ+ZZrEWju98
 AUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017142; x=1791621942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YE0udrovG6Tnw8btbJb53eOQKvWkKmkHJvxH5yRyUSk=;
 b=ltjQVVgpRhUvg8aY1LtGJTwJ4iafaF1Ux+/CxXtdHGsf0wn5BhaV/0pZtJqBb1L/nU
 zJbY0aPLEHxt4HXl3owMNLsgZ5BYUn98LMwS9QqdRXRwmxRqFM4J7kylQGJ4JvOlXuje
 cRUHik2TiKPiMHr2Gq2AdK3dzeSpRGnnKLhTf86KhaBbjtLJfHcVPiwkTrBewM5C8UiI
 rbmHL9EO1vQScla5nHB0rz8ZIe4kq2hZn0c11E3ZAAnP+07DXlTi8j0paR047GSxJtg/
 RJ7MTUPkVrPImk7aEb+yeurdZpFjXEvuM48Tmk00FHsp5dSYYvNB4LdaXvtuFNjZ102o
 k1EA==
X-Gm-Message-State: AFuF++lEumSh60L0U0tICKj2b1+K5bfGz+VOfJQ8dNVcTgc2V5/EN17V
 7VL4XwAJ9oBQOHywS/VSdLMt5dzrAzg/VRDuXL/xMITz3iC/rPReXg426FU5Fw==
X-Gm-Gg: AYBFou3VdBK6AZH/fIKQAo3v4NtqoCtprdt/foYVmtz081SQ4iD9Yr1iDEA7Lne1tHa
 9GQhvLCFTJXLYUc37jwBfmvgMzQSK8c3fU6XlcM8UIm97WNODFgG1f/fm+gpqO0KucJ+gwFjnFt
 Hs4NYBz4/ghSfHm5TYiCPUACCBNsoFpH/V3i4PPpQvXfyu+B+6XcGeuROnGAKyCOMQ55rPVoZES
 pLC+amyIk8STGB6Uk6rOho1Rd7hve7Y9/fuczuGjnFuV+hJ+QRaS3VZ14FnGYEMD/9wTmEY9cYj
 zUikAzKiZqVTwMam0QTj4+rXErzfquj/7CUWK0rzXc1uqhcDafgcT09fESmFho7dOGwHWQFIrsU
 d80Y0NIeVDbyPbpfMwt26NIXkkqtdjYU3GkBtpeXZ8pe5Ixrc3iawk80D+DGrUrkAC0oEwYoi8Y
 FLEy1yBNbLXo+JrgMeD1QZAQgSdzPGIXsiP3gtkN4ArA3lfIwbflwbxxSlV43c3uRbYsvepPoZb
 a+fusjfV8BKszv7iibNO0VnCmkgt08oJRA7F2wzJE1JOvzYuSaTTTkGisqvHEBAA/FUpwHia5nx
 B+bRDK/rcDD5SsAEfu0V1/lQ/3pNcf6fOwKyVx9Dl5LX4Z5ddj2Gsk1s7oTfW6/kCKyYKsbX79k
 7T93Ji7kHo1vAuJz0cFQ/e0JKEdcA7vVX7Jp/Y0FEvQ==
X-Received: by 2002:a4a:ee0a:0:b0:6df:baf1:fb10 with SMTP id
 006d021491bc7-6e09e676982mr1461205eaf.61.1791017141788; 
 Sat, 03 Oct 2026 01:45:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:09 -0600
Message-ID: <20261003084453.545653-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.9.13
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index c72759f43f..20c3abc170 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  ea0f76b3d0358db5d8ff84e18c4a7252  psycopg2-2.9.11.tar.gz
-sha256  964d31caf728e217c697ff77ea69c2ba0865fa41ec20bb00f0977e62fdcc52e3  psycopg2-2.9.11.tar.gz
+md5  aea3199952c6dea47c1e2fee7341554a  psycopg2-2.9.13.tar.gz
+sha256  d36784fc2dae69523ba4b79c7d1d1b4d6e83e87836874f111262f4db940b16a6  psycopg2-2.9.13.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 689788c2c0..d597f5dd7e 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.11
+PYTHON_PSYCOPG2_VERSION = 2.9.13
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/8d/9d12bc8677c24dad342ec777529bce705b3e785fa05d85122b5502b9ab55
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/91/81/6ea19b8b28feb9405c8c87a307776614d6e404bdb98467d1ce10a39d2c1d
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
