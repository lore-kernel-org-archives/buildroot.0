Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3080CCA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA92660DE3;
	Sat,  3 Oct 2026 01:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7hrF8FhWQZf; Sat,  3 Oct 2026 01:33:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB9C56061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991228;
	b=Py9hvIY238i7sKAap/qXIXg9b4OuWNYnZe0mQHbT7rnfiZ526eiJ1VfdC4Tc8eWjqKxD
	 TPm1GCeqo87S21VgviE+rGqLOV3nhPqbWyO+5gvMp6LHtY5rP9wPECXmbsV78AbMc40Ow
	 mwTCClQiXtOC0sWFrZqqWVJMooczoTQ73vbRmUSOH/hw4lqz/aCgth6eFwJnyFv2nldfA
	 m1Y3VEyrPapmyFCzF3ibWTBXYppDbj0Ho8TJ6Smb5wFFjxEcywSuwDFmV9dNaPm5sa1eP
	 cI2ZnrzEXsYWNWR/Ut8b1JFhHSZD48CIpcesrTA2+d1434juUrEE4gaAZoCiRuy8cmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2BminlboIjqWLhg0gKOCyg1GEycY5ydWwRQ1Qwe/Q84=;
	b=rSn7bRzpAdY08WaSq+ud5p1AcOBaNxFJ9HPCJ5C9/h+0pjlufu58gg0VizVUVy5S5NVq
	 qis4klq7CWjXuYh2VE4uvMn5/0bxAxFpePc+ibCRVH2fA5M5xNwoYrXyNCR9iz3sZcJIB
	 Pa7+cjer8TJQ284sDzPqZQL8RMp+/SxcMI3Vl8289Xh5ldXHUEzw8BK41Mz05dJ92BUDy
	 suJ8p0xorbX9KnE4A4l52jSrX+AtsLQ921lUkySQEu5xEF5MBLBQ+U5e/4R5GWBfanmno
	 bD3XdkUKR8b2lkfD67GmdtutVAjLXJnfHOI6GecuakSfAfT8bV20YUF+VLIzLbSny4g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991228;
	bh=2BminlboIjqWLhg0gKOCyg1GEycY5ydWwRQ1Qwe/Q84=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IJl+tRf8XnIQ1P1vGsBJkM1mRR0bmtG6nFdKNS+NQpVEdlXc+KtZ3Ifwq0Mc+KP/3
	 PkRPMOiPmWtWMJRJC7MEYTniMoRCikeJpSJ9Yq8glZIVAa2eha2oamFFKo6K1+kJif
	 CYl0F93mpAgIB1oWRPauhjMTMzNSqaYreRa6zDoh/jPKydLVisnn0vGs4JsjwtV1n0
	 UqCOZw1iAiD4CjMWshGQSDjbvt7E48x1ztEhtKwmrPVkgBacFTbdyoR0IMdWaum6vu
	 KXT/SJGUc6omkASEV6IDr76TyFYJj4JN5Clz7FZ2GxcpBSPaJC4LXNVsz3pa4nVuIL
	 yjgzANgbRx7XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9C56061D;
	Sat,  3 Oct 2026 01:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BDA62E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D12681377
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1QahrzoLBTh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6FC708133D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991224;
 b=O3NumWEhWlZtMW6BpcMU2dj7HnI0QBk665IR5OiHX4Jvk50QfwJ89gDClLVotVVfgh3d
 h2UKbkCeIRIEW8fFPxrmQgyG2U8g2oY8PbZ09Bwk58blAOOFAKOuPaL7vIrkzdeoUbuoX
 paxBFv8VsA/n0TvYx1VaAq/r6mbzD9g39RpqjV12vdXSoMW+4m9CpZ1ArjyTMwB+4Ln4s
 4aPbWp6JT7vdgaWxoOCwaHS4YQ2b4jGUhA7/3OtdA3SYX0UKMDVRksX8HRbs1nCIHrHJY
 CybgHZdwuJScvqG9/YsFduIcLptgFSczDZX99oXo6/qfq3FRDR7VDAoi4Ltqf5l1opw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991224;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+DkFtpQE9OcTYCuC/GIIyDvqwNxl9vi4YLRh89up3kg=;
 b=tRDgx5PvNyadbsYVnS/wdnEon2LWLPiKYso6JUjQ3REsA9UeM/AiJWYJM85RdGt/UiWE
 DX9dzgx8mpeKnP8C69AoUct5P8+dIbHWXYhl3s6+4DwvkfGCVUtOVllm1onzQq69q1gce
 rFykh9wNquxlUxIxmvv32pKlVvbpFXXUUszNtpVcWKjD8AP2L3V9iQz7zlVnjigO4tfR3
 cn8iNNTf0SXdOnkXdrZObyCiy0alVc3T9izRvpS5/Zk02utkvTlPm5RMEBRNnhRsfK0qH
 3Bc8RBmYiQy9Lj6IHXQOIkCHhSfURCT6ypsyTCKalRTIQ/fNDifd2GmNZd/34TLLYkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DYqK3jIM; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DYqK3jIM
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FC708133D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:44 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82389b6da4dso435464a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991223; x=1791596023; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+DkFtpQE9OcTYCuC/GIIyDvqwNxl9vi4YLRh89up3kg=;
 b=DYqK3jIMzShU29SEKv4Xeq1RzGnzI1FAKviJBxlPnlsvpFiVOXLuS0qhjK4hd4yT31
 B3biTCf40XLnqzW8kTwXoWRpXQ9ArYO1k8VmnkPXy0I0qS1vg/YMyypELLbZEDbYmPPn
 xtW4MD5oRICt+H9GAsY0bEpw1by3+wbZx/qROBKUhLQ2qp9G2HS7I1fcwQPB9fCkAb9C
 wAEf8nBAHUDERDyqdGpILLKVk1kBxvM/8geIoSPVAk3hlEragKaNhWgKhh7eJ/rgmhUK
 FGDWiuFgohXz70Je/1NHhBDnl4qjfKQSytZZH+F4x4eSgNdFEWYeX0aVwksmTWHHXDev
 FUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991223; x=1791596023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+DkFtpQE9OcTYCuC/GIIyDvqwNxl9vi4YLRh89up3kg=;
 b=k/O6NJubWJm0b1lY6fQMtJ6sFlWjdtQCkyipdasp8l32eESn4dKJ1YcS/u0d2rst0Q
 NWKBb4CIzWVc9SrlV68AixcJC3zaAx2hpb67AKLYJre8SPoc2qdPjobTpZCShP6EvxmU
 y+KagS1K6EtKif1arFQxo0SdcmhUZprsX0e2tTjH49fHyOPi1aqiQTQtQlVi5aX3T0/5
 pvtvG6DlsKFmER78/+5+QLxsExB4VTCOoJDAEidSITR4iRlgWRM4JGX6wK0jxjkInh44
 Va7nGdfhcFg8pdnKOJpZDKbsAja3KCpGjtApNN9aNRttfC5p0MLwoJn890lHLTSiKI9Z
 0APA==
X-Gm-Message-State: AFuF++mQZAx/xaXuISs6eLA3bu2xlRsmc2eYAt7lqAgVUJIHblqtYf/B
 CpjTb1aOa+krK7mqmaL/CE8q2/f3/ZJmpUfHRUsxeRqDdTaCysA04IrD3UuW+w==
X-Gm-Gg: AYBFou1s8nA4AGdQ26sF4W5AuWUpjo3W+QfpnBXfCLe15Wx4YqEd2nevhte6JEBcKnT
 pFhcDzn4dHfJM/7njbXsytBDhj4aqNObNe8hSYNMjVnTKlaQIaCa77VDsqTj9ECj9ZYQd0Mb5yJ
 Ue0DGxCyQWQw0UD/Z8uWHhbEANJLlHV1+1TD9uiYIxQVq0asrhRJ0tKP8gqOX6mB8yR8BrMUdix
 UJuZsiKP2M3HqO1vcr6V9z1v2mttOjHi9+F3ySMh7W3LnND2twiXvYsqj9jhEKKtJlXPl3kqSkh
 l6WiiMMlPezsmQoeMXSXYDXqViJIEC9+NBgSDTQuANFTJOWV32nAQTiXGDKTKkbQxYzfT+MlJQF
 3YEsfL5FU1zNhjZJA7xAJ965I/XS9RuYSR4ITGl1i/011raXx9dX1g0HEWQXg9eZtXV4esVjY+h
 cOnvDvI8+x8p5DqSIpW5mz3oYhYBd5ZlBYC4oA3ejuTead1fcOhNLQ/8ZdXqzpmgD/aSZvZIexP
 62OPd0rc8QlN4pppTI+i84ptEQbdVoWmVQcHinmvNvqxhnwEOOTfly5qIwqCX5I+BoP6qLz6+sc
 TimnW3jnMU3oImKtX8LZ2YHYyLT1LqV5+RFQ6SD+2pAdHHftBWm2EoqJ7jqZsU/4YdiLuiVf5QA
 wqzU5OVRIvBEFg8rzuhOK030rf0jqeC9FVNj2mFxH+osf+h+pa6hD
X-Received: by 2002:a05:6830:700d:b0:7f8:4ebe:2854 with SMTP id
 46e09a7af769-8227f994594mr5186621a34.4.1790991223220; 
 Fri, 02 Oct 2026 18:33:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:22 -0600
Message-ID: <20261003013304.400979-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 1.6.1
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
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index a259fd2d5e..0cb3baeea1 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  48f7fbc11051430eab3c1abe216bed7a  build-1.3.0.tar.gz
-sha256  698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397  build-1.3.0.tar.gz
+md5  56f61c2663493ebe4916b8acf40bb039  build-1.6.1.tar.gz
+sha256  51cc11666391ab6f092070437ac747002ff46f3e4113a3622177ee6b488bfc53  build-1.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 45ae7818c4..85ac4704c8 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.3.0
+PYTHON_PYPA_BUILD_VERSION = 1.6.1
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/25/1c/23e33405a7c9eac261dff640926b8b5adaed6a6eb3e1767d441ed611d0c0
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/bd/67/4898a44ea4f3f8e213b0954ec0aa0a16971d62a6212d6ea3931e97115b99
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
