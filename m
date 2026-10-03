Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DE8CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D3C60648;
	Sat,  3 Oct 2026 01:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUy7gX8mB2ZJ; Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7207A60649
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991192;
	b=oECU8AuOrM3f5DfgYc3Lxaf3eQRcZzXt+GdId+RqTi7t59RR9ljEwCSYXlD1JGj2qQgv
	 rNFktRYMj0Pk1bo2e401C7P6CY5nbUAyASeMIGyyhmvkW6ecURmPoa7SsYjm3RhTjDZbB
	 xFmVxG1IftzSmhjy1JroZgd2/RFhDFHtql3p91Ad/GgLqFxo3Eg7AX2omMiCYO6YhLIyx
	 McQUfKY77zRgpUpNnr0WcO4NT3Vy6pvUZpQtnL7/Jtek5smT9eeQkZBK1dNRyt2F1r6pb
	 CrVxb1XWxPA6lHH0eY+kEzH3JjgpW9lvmp7kCcw+0wl+hjriAILJHskzgK4B0lfsZLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tKE3cU+BzAh11/6h8ukN4GNjeEYx2ebYaxxBQG5o84I=;
	b=UVfIeVvmlbNryVCzJuaRKqvnhGxkdRnYh9aGSwCYyYjSENy/9WwRmHIgDRbF2aRkixsL
	 0CpYVDOlF9vlot3n8IeaWZFjGWvkE96MjobZdZWq++2ett44cXiuftQTkS7iy3GYtKz45
	 0kNS7EyVuWdLhXYKt1ucrJhB8yuQeKC+IxH/y49cRGm4fSy7e5eT4+/hjF4sKDTq0c2q8
	 dEcnI59dYkmh/YR51+8tiIMStB5IuKg5V6KZIhk62xEW+rimtlVwgXimnC/LKBRUSWAaK
	 UpksqQvhpgzrRiu3a+j3D0XdwkFlYjUutEAZ/ButDNcdDyt3u+ni6+V5jipWX2ygWqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991192;
	bh=tKE3cU+BzAh11/6h8ukN4GNjeEYx2ebYaxxBQG5o84I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hmTAPIGgygHI25x31/KQ2nNx3nJmkPZV++e+latRVD5NhDLZMr9Cw0IialGE5s700
	 76GnwFxCrnQ07D1F6pd5cvnwHgVbNlIclYbzrsU/QYII6vBUZvdghrRGPrpjJl7xpx
	 01/3Rp82L0vm21HjHxAEB52PXhTVqVoOXwWcwM5o/4rBFQ3pv4YTp9HSm2VuoeiXe/
	 2QVFbNOieYwqzjRE7caoHdX3GZyqyc/aEg58OPdvaPZzR9QPIiWu2nuSqyG00/molU
	 8BcqgidA1tlB3luYa1d1Y01O3A5+4htU12xCcUH0DlI0rZBxRijKwq9sR5AFKD1l+5
	 7qtdJNpSyS/Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7207A60649;
	Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A4B7179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE0E811B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Cr_CxPTn7K8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 78A2581094
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991189;
 b=kjhPCRr/KfzEsY20uUzXoihKvUZKcfyTZ/FmBMTy8WU5HWMNA1TMkelNvg7gH/uY9bmB
 Nse1QNmSQvss+/DPNG3yPRdX76hzHVQPqOibnXLgNWYLfPx/pxJ0tAmzzjxhHMEdehfxI
 KModDmHFkW5lNfqLqeklvI4yL6pX7JZoyF5vcb1urI0lUiriEidCXBXTkUNXhc+BtVMaV
 4o7qvVo+3nDpF1lyw9xNB7NNgecPtHfQ4YvbXKxUC1QKu7QHrLANQoWjK4o0xebI8/Wvo
 3KdvsoA2TSl2m5OYtDmyHW1e3tgNcYKSJ9hYz4UFFGxoKH2zvTd8kJ1oiDRce9GlOMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991189;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=U8fLSg2hyA9Jn5/CY/73JmD1aPz7Wj+gUEghKZDV7Ts=;
 b=MLyoo/QaXvYx7n1pYPeB3/MnpKDn//GSUZExzp8MBaSFeP7oRqIz9YeveCsC9xmSAONh
 vrcdBCg8DwzkY1BXOu2jacawWD5lI8+3UILk+2onOUnWzZ67plGXX4Ttzhx/pN5ZmNBTg
 LxMMp9wKFOP2+6aNO7m3A1x9Y+1aWkqFcxIDWRf7aw/jMf/KRrIVSoOs2+5xDzl/Jk54F
 hxjZoNrigmSR52Qm/iMYOP7SJkbO5LMCCK9NWgJO8LUhdlecliZC8NwvlXMVjkBy0+9Y4
 3Q24AMO10jdHvDrXeV3pIKeyUDWjsZq1obr9xaTkXgJ2ccB4Evws6WthZI06bGw88jQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eVurZx5j; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eVurZx5j
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78A2581094
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:08 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822f7e70796so371710a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991188; x=1791595988; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U8fLSg2hyA9Jn5/CY/73JmD1aPz7Wj+gUEghKZDV7Ts=;
 b=eVurZx5jFzyNsyX+NRJa2iLIJthJOtWHp2t8ZiadkelLzvJm5kPZ0WFdbhtKHeCmrP
 lQty4XtfZJwez/OqKO/qh4H48QzrBhYicmqoOPzZGqAhWLmDEgfBwsdZOdrYl2NoVOqQ
 7CIAn3fA6ZYrgTW7drko7gV+rDinNBOyTn3jGN963OgtdzCuqlyhjr4V4oNvFtTfGMfy
 kblAzx9RbZvwKGFLUu/U8ye2Y63DLRGfFrKCiBRTi6wxSKl9F64KAd3rD1NwiOuY4kHS
 F5gP+NQ4j0oYMBcI9mU4B64eu4wBq38ZllXC/Mj+MRzf0jDrhya9cP/tEbb+psoBy8Jk
 op0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991188; x=1791595988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U8fLSg2hyA9Jn5/CY/73JmD1aPz7Wj+gUEghKZDV7Ts=;
 b=THIDH8gnH74TrEpXdQ5TT7XehjaKOhEWbuWPUye/aPjWzilZPM9sOe0DQJpP7p1/3C
 psKnTnGa1FktBWq3DZj9LvhDqyrcRTkNn1DWisq4TrMT6Aajoa9IVmraDqoLZQipqVLx
 K9BamTsc76rT0dygW0cZ3icxLO6uy9DH+DEnArdRNF3HM2GzI2ItVgi65sNmNP0O/oRW
 xxq/TNYzQzPeVsL9BcWvpSLbz3cboP0y6ecrsqZ/mCzItyDISwjrUR7djh1jygH8+2rl
 iwu194rhU2hI67kRLTwDj0WO/FeHLTWU3NAtjST2Kk3wve9ROlKkxg/jFl9VXA4bSk/b
 EFvQ==
X-Gm-Message-State: AFuF++kf0+0DthmK/Grtx1ri99FeOd6H4iUE6AKyMWh0tK/LCZDMUeLr
 Thz8bCLx6lNFzJkKrpg3i96wqVoSR34QBPeZWqcCxN8koxuN0ts4XvflPcvXZA==
X-Gm-Gg: AYBFou3XF3+rNTkN9L5vgAByZdi3J7yTM/v/i/qAO+5VXGHfb6k0dlcve0LtwxEbOxx
 5YWwWy3Ynj1ktZs8yIoHhKtwptzD5VjYhnpVcNh2KzTZbxajzKHhUWTeu7IYLTNqv6M64qymuc6
 h4zd0t2R56Rt/qNRUMZMyPA/qMmeT8v+ziUTR8g5Gl4dSbwZlwoJ/ALRJJ1IiX70oafYNG7Zu7R
 DmwUoyrH3gVXzix4JPEtzuxTWfWZ9oC7DTbdnNi+fdLTEFUEpq09nXn+SQWij/M2fRzl3Vfyipr
 xLfjXfoQW9m7/1DZE4nOqvgFOggmJsOPbIP6o+Al+wH7Pq7yOzLXhb6icNjWmXVK5hu7s2xIs3N
 61AzLwNErt1wOXKmwRAPfMkGZ17jyjgCQyVmaNosj9uv1bYQs48M9L7PO1Zr5BhE6W2ChGrKnGI
 L+Wl5PKaWObpOVfYSkigPuqD9LRI6hwFMAwfVQBkAW9ZjmkwkTqf40v1Rvi73L2TGrShHlsO1nb
 DigBbsGGP4hpIdnIn2zvqIScEmLz5umNz/DP/jFoHnwZJT3KKxBAZ1VbMvOJvKdGWaleD3UY26d
 bpKPYFEYVlaWcdj/ZCX6D1jF7OnZloRoFppmfbZXWc+zoIh9UekptKsxbFbscPkWIaxwve7VWGe
 UN2iSZ0k5qZzxCP+WOe7Wuv6lX+rB0b1UQPCZMiFq2A==
X-Received: by 2002:a05:6830:4882:b0:816:a9dc:6d0f with SMTP id
 46e09a7af769-82282a7335amr4552063a34.20.1790991187678; 
 Fri, 02 Oct 2026 18:33:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:02 -0600
Message-ID: <20261003013304.400979-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump to
 version 2.7.1
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
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
index 10d3d5cadc..fe41296d66 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  2fa845a1ce2f7730045fa763aa9987f8  aiohappyeyeballs-2.6.1.tar.gz
-sha256  c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558  aiohappyeyeballs-2.6.1.tar.gz
+md5  0f2e6f584d94d4d21d7d6911f584fb2c  aiohappyeyeballs-2.7.1.tar.gz
+sha256  065665c041c42a5938ed220bdcd7230f22527fbec085e1853d2402c8a3615d9d  aiohappyeyeballs-2.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 8dcc59a77b..6b2140c39d 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.6.1
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.7.1
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/26/30/f84a107a9c4331c14b2b586036f40965c128aa4fee4dda5d3d51cb14ad54
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/ce/f4/eec0465c2f67b2664688d0240b3212d5196fd89e741df67ddb81f8d35658
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
