Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503E0CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 04:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BB740A41;
	Sat,  3 Oct 2026 04:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6xHiAzSXsqi; Sat,  3 Oct 2026 04:03:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 19EF140A44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791000184;
	b=pWpCYRW/pkh1qotQb89msk6wtPkwBGM2Frb92QJwk2v4KpwlUeL6xhnZuobMuYpYiCIl
	 kVJ7W/iSbaZu4HpBydht5qq3JtYg2bzoISl5d7H/Qw63Q+YHk+1nzyySQaHoW85fW3tuD
	 51mtQx0Kgiy/ECu7G/VW5NJUFZed6gDOVT3aVPZ3BsbPziy5HZH4HW+dbXTSJ17i/857I
	 umOrEivw4mk0UD8+bNbmuWLx5hKRK8JXrxxtm0y1S4eEZl9e192+alHBs7gCDdJnhyn6O
	 P6krykGtY6ra4BsUFZ9odMDvcen0RdyNR46ckgksXhGUjF9spVWKsDi1MvzGyyQBCVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791000184;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aP67IP6fg8YqULX+lpMhQ9jRl7VEgiDeMo/EjQJ2onM=;
	b=R9KtPM4aKDmTmzL3Bh5tLXrNDN3Hu8+2LPqPwhu2IbhlEWJAP4AVIC6e7U9NqJdL3m29
	 cyY4ItryrIv/ABGKo7qtt/dcG1+H7VBupewVhN1sRmyayqtiM6ddbWVAaNXR4gAPYRIqT
	 TNrLEWgxh6lZONbTY7Bv2DpI5nOLanDJWf/TRfRJjlaLTakvSJHxDJ1ERMeGHr8IVD+1P
	 FpQ0QdTex62fwed5R95xsI52sbQzFT1gYj1nENlbvugS5RLnjsCW9UJmaMXePoB/t4uVv
	 T+4aKNWYH1lIcVr/Pf3UDXZB0FWD9FtWbcuWNyYwvWP4vGfx3mJUjlP8VMHjlUnv7Nw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791000184;
	bh=aP67IP6fg8YqULX+lpMhQ9jRl7VEgiDeMo/EjQJ2onM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SX5b4/jNwn5UmQRRbvD2orhyo2y5rFBBnfQhb3UfxPf76OxdlYp1oCjoCYYT7Pxn2
	 6OrXx80CcmTpgBm4jpyZR84GErVnK5ct/YUmXxzWd79USjLxNO2OmqA/XZDoKIbNkw
	 DMkUBVLLCYc6Vf6R0mwRu66D9Da2Upa3k31rwsw73bDa0PeC6+C6kSDG2jd4UkZoLK
	 f5Zu9GR7IiaS7zbwuzTGIsO4Zia7acErmYhZTseh7QeYppk1pVuVo05ti5Gts/UIPU
	 y/WuCpASKJ+vEPJ6EasxuBne05gdCH4v69uMNMo5frAVyNgJ3S1CQoPss6PcInUwv4
	 5G5ZKpuCINizw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19EF140A44;
	Sat,  3 Oct 2026 04:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4221034E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 04:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34612605D3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 04:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMFEZdviuKLh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 04:03:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5A0006064B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791000182;
 b=YSg/vL7Mqtb2L/0/Y/nnAKC1M5eVbafm/doDS6EMlPUOgm42PS51C9OWh2ORvLZPB5ic
 Djmqu2t2VbRTvhW61rHAz9MfgnzcBlx6D1PA3U7AeqNNScyWVblyL3t9+CyZbtIwS6s6a
 bqDJ6CXi3yXsNeB6vhdoJExAhNlxXdvJ1oI1MLZT7k3Fr7mrk7ZPePsv2L0jUUZ0vcV/5
 9Kf93swcDuBno7iQ7w6L+k2+81TSVpQB6CgKPXUG0AEgtZhRqQDczPXt7qjmShW7ohsrW
 f1yP1F+JccTr0BLWjnBKjV22RTsaISq1SxaSLjxUGKRf91Wqy3Eou+OphhjHTDib7ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791000182;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yoVOqcQeWgqmPEQaPX7Lwm5GUZL2+Wxq+d1NhtkSorw=;
 b=KAOZ2TNpPHJs3Vo90i2fYDt7MGxy4B8Hcs80zsN/JEatOnBebidAwmVoQSUe8wczHxQ7
 +5q2gvXNP6QrygtTgwj0Y2e1feNSnUqqjohmVL3zA6S+YuNi3VMTDxUXcRQCygxmsLkBN
 OS5xnE4XZjiOLsY4ryy1P/otrc/AFCF7FNj3wOxJyYDzj3dp8aUVq8l+HUIEDYIFnL4A2
 6k8OYvi2Yhicx2LZNOuUG7OPgyVf1gHN9UZE48/Yf/D2E++TeTaoNKzAsr+I4hCSwykLe
 Fwr5WxIF+S07OgifpHdUVoqRx2GnUeG6hTemZupuc0NntocbArePSOrBwcDRnReC2jw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=iZ7CHGrh; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=iZ7CHGrh
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A0006064B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 04:03:01 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-81b15bca7dfso422787a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 21:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791000181; x=1791604981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yoVOqcQeWgqmPEQaPX7Lwm5GUZL2+Wxq+d1NhtkSorw=;
 b=iZ7CHGrhEo8PCO+iBqbTwfMw42ddklhXYd/kncqENlyQXQef+bfHnJbDUATV4nEl9I
 UGqBqKGlIq3z/hLKAsUm9JIVA0uCGGEEI/KV0DZ4EywxgwzxZsx7+AuqRjUTLkOeACk2
 CDokFzfdTBTjxsOQxISvypyyIi1zEZDpR+6CU3lFg7DiPr1Rj5vpRyiHBWggbCMjdV3b
 C1h8rnFGg4ml+mP5Hj4+GGRo8Orh0MNkKG4XOisJLlx+/soerjRqrhBmzAjOSCjTDZpZ
 jsMteaKdarooimqqPtLNpEJjDKvdWrWktDmFA+W8H2gY0TU0CZS+gBbecYtqZMggVnJ/
 e9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791000181; x=1791604981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yoVOqcQeWgqmPEQaPX7Lwm5GUZL2+Wxq+d1NhtkSorw=;
 b=sLRuzsRJumj7qvXGaVGYBe5ffuxdMMrdu4kBD2wG36LsTo/wh4zIspHrc9d8nKmkc5
 WiNse0uN/t3DLjtWz4OsMVBzDlU4oWYOEE4QO+JnayAgwic3w6poM15PeFD9f/eNZQYw
 SF9I7CYc8vWOI5l6nSqKSYp5eWNKtyOmeespiK/6ilxcNiiGM8dgR7uk7wtVjjw1cESM
 6nAWpvAYuWGR8hozxLo17lRITB5Sb2bNhhhXhrM8xyTSyzjKOlbrBmHXvuL8O/2kVlSg
 If0HsEPzrEtBXhFQ5fZZI97FiWqCSbe8nsCP8pYC7MmR9gXxBB7AzbwLFG3EARwJrhiB
 /Ldw==
X-Gm-Message-State: AFuF++lVoYUUs2MH1fv0WUButifJvJaaeuJ58WQZ/fefXgQQovZFSROm
 ssOZhKYL0KqjZJltgkGyw1obJlwllAqMnrGc9VsOGBpEBYuvzbkp9FElmiFFiQ==
X-Gm-Gg: AYBFou2rPCK/0CAIQleWaDPYNW1v30clWbr0dafAhh3LWHCbOXTqUYpyoblDz9eo9P1
 Kr1KTucxkRD3145rzSF1iyhbsgCm+mXsQgdjF7ze4VEzbMkArYmnCUrdKyKG+A/GscExqtFT46s
 HpgMUhE244HhNCHRpU82BpWuzbXy5tDUZ23GcS0g5rZRVd6NgIhGG+rqdAhxuCE9CQtgZ/+SH8A
 0KD1AqH40/HbnlEcY/nnY5NwpprFX9ZkMUcm0JqAKkxwerHoeK/8/M9nTAV64tjT1RMclb4miRo
 WPrnFF4DexGWm1p4zqbNreHa/azctFMVceUX/92JiqchUqutjg6QEMLqiRJWEFju0tS7qyVztie
 NwkB9QybOcLkQqlMRqR0mVfqAKVAhIuhbre02yGy6hY2OpMDe+gtspw1q9DcrrkYhtAmMqnkxq3
 zJ57/5ITTSvIZAvdn0WSecGRwN7DK070aFwJ7/tcxNHEIGY2HMSjdVxv5ebLuT2hwH2HAkn/Kpz
 f2cCYwiGeuPSIbiZmr7v14QlQHvNAWEVSHWxPVm17fpeYR2kwiUI35tfYSc/uaNtTZe1Yox8mQ1
 2SksxAV/kIc2nuoUy0Hb5/VdtwjEYI5+1VH6+gh6fnSSxWeSqVdcQGjO6Ej9YscyvMACVRab2hW
 unQWSfomVXo9nUxYdt/kVlg7iwUW+Bo8FXPjX4cQ6CpA=
X-Received: by 2002:a05:6830:4411:b0:7f4:eaa0:1d14 with SMTP id
 46e09a7af769-82281c7e9c4mr5097673a34.9.1791000180878; 
 Fri, 02 Oct 2026 21:03:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a06d935sm5227575a34.17.2026.10.02.21.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 21:03:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 22:02:53 -0600
Message-ID: <20261003040254.464487-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-vcs-versioning: new host
 package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-vcs-versioning.hash                    |  5 +++++
 .../python-vcs-versioning.mk                      | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-vcs-versioning/python-vcs-versioning.hash
 create mode 100644 package/python-vcs-versioning/python-vcs-versioning.mk

diff --git a/package/python-vcs-versioning/python-vcs-versioning.hash b/package/python-vcs-versioning/python-vcs-versioning.hash
new file mode 100644
index 0000000000..964a21fb70
--- /dev/null
+++ b/package/python-vcs-versioning/python-vcs-versioning.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/vcs-versioning/json
+md5  bfb201115bc6c78668ed643c9b06503f  vcs_versioning-2.5.0.tar.gz
+sha256  956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55  vcs_versioning-2.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f52f6085a2f4acdb7f425fac78d4bb013b2d723616792fb173a9f8aea191d8f0  LICENSE.txt
diff --git a/package/python-vcs-versioning/python-vcs-versioning.mk b/package/python-vcs-versioning/python-vcs-versioning.mk
new file mode 100644
index 0000000000..78d04b8457
--- /dev/null
+++ b/package/python-vcs-versioning/python-vcs-versioning.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-vcs-versioning
+#
+################################################################################
+
+PYTHON_VCS_VERSIONING_VERSION = 2.5.0
+PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
+PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/6f/a0/6977bb418312ad30f27e522c5040604d4bbf7e40ccd5a11d333afe549354
+PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
+PYTHON_VCS_VERSIONING_LICENSE = MIT
+PYTHON_VCS_VERSIONING_LICENSE_FILES = LICENSE.txt
+HOST_PYTHON_VCS_VERSIONING_DEPENDENCIES = host-python-packaging
+
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
