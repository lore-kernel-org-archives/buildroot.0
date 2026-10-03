Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741DACA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C04B40E60;
	Sat,  3 Oct 2026 01:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jmh-_SPGtWA; Sat,  3 Oct 2026 01:48:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FBC940E58
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992129;
	b=nI5jyhCrtaMmQwE37kjgDB0ARyqi1V9kXIk5qTgWSTPwnfgFXuMbmcKR128HkNB3eni1
	 6yuyOpJ46L+2qnVWlOSsjhluPWJIsc/RTSaLiqb4s8ZpIZeGKYBrMxSXzgVxxpvFw94e0
	 NpWqMkSRliupSZqcWIk9C3IeSMeA5f4Jaorxh0H0ueBjux3aFqT53BFcq1oF+FJqcwrmt
	 o79hjIPYMrC0LhvgMs3m3AXspEQYFRcHvjjEjidpA3WHQ79lpv29Iuy4qxquiMkqNLTbF
	 4aDQoksfaXCSdwKpdz66yTPK8q1MqBJDvPIDq9VKgrYxh5X8KNLIHYW1lwlvmR5LIlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a5NqDlKvv85+vuKxy/iNNe2uToN5pKMfj9XnEo0zxo0=;
	b=A2n2Z09ozmWSZCbxDamtaP7JuJQtfG1xI8xGOHiyPjS5Tcf4CH+KCNUIghQMdIhejTMp
	 csldWgZGof5otro65O0tO5iso/SRUfyjdX5xJs5IclSnn918wn/8+5XYEc/+TBtEWq+dc
	 2NiIOtHTUcyVFGvU7No/jlDtdUK2QAzTQCWJ/ajExAjFukVtyzovwvSByLd6QDJzcUC/B
	 OOE9QmdAScqtU8MollEZCG7wnSV5AwZjxs4O/tF+YLcM5bKBGJKelVFVtwMcbiqvulQjB
	 Gbud3lyTTSwKc9o13Ic8bGjzAOAYtJXrM+ulYc8j/na4yN4dKrsDuImkg4i4gwuWSTA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992129;
	bh=a5NqDlKvv85+vuKxy/iNNe2uToN5pKMfj9XnEo0zxo0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NjDT/b+O7GotKKVogNFIy2ZBCmZrqpgwKIbcECGzZ6r1b5mtoTOV2vx579iieiCcZ
	 8tZiKW+SgsmhYjn1JdVP28Ops/CSU7mbfD6Q1RkdoIw6PDCkrMCR8Tm6nafUDghGWQ
	 dBIX1nHe91sR6d2oOT2xPCtD5Bfgzsxv83Kjy1uo+ij3qtgfpuVWFP8l0uENYIwPJV
	 MuAn7ntunsfr9saPkR7O+M9sLAv3DR+TKiN+govedC3Onm2qxzjJRDT0rqnS32CMA0
	 oznZUg+DXqKGcuVrbtI8dfUSPKDjWIY4VJypRYwq7xeR73d7zNvTf+BQZoBQbu3TTv
	 w4NzrtwgTV5Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBC940E58;
	Sat,  3 Oct 2026 01:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 918651D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7719380FFD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWFXw86F-a97 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8805B81347
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992126;
 b=SyrEztXZEWPNN0guoNa1SJmoDopt1EP7lrvghURSCRcKMwGP+oZ5SJGfWVQvYRtfLO+w
 2VeUPyA+x9qgFSCbAnTsItDv4xyhlZorkipmxCXfTyrRcWyKKvhhFy6sVTAC5vAU6WRkl
 NGyOhR46qdkH2IQ+7lZUw/EJegr5qbdugcQgSuDkMQEIxYMXVG6mf8bxdZoBZ60cTZnpL
 OuQkZkJvfIp1s7fXNWVJ8/Jsa0rLn/iVxbSF92f8IhCJ0ff2TFVH59Iz9AI5vjXr0HX/K
 sFFuIRlZ9FM5k0OBHJgG4fxb9AMYlzUVUSfejO/ybpEoBplJhefny7njR9XOpUpIENQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992126;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oWk0MohjOyyvCtHAFyzyTXrJiot8FeAWf95DKAnGSAs=;
 b=AFP+OoTdKS7hsDwlT36YhN061+vpKy4uqtoHQdUp5mvcgg71d4tl0KGWUskdGDwRQfP1
 OcJBCHP+zUMM6R4xUuA4oRsIlvBQrd19iK7+Y9QBH5Mn09HYx5Br9zS0TFcamIHhQryuu
 bJFWWUcROK9ERd17dlfkBHxspr48hrlayKHcmL81JlsfxMjvk+ECpEoJ7svOfGBJx60Tf
 Hw44E+Pf87V8vEGL5P4TY1AOTcve/awTUqelxv6OzIFDiLXYn3fKB8iGdyDg29ZImmhAz
 trDd1sqie003cuAqFcDw/r6OX1utwzpIFa4Sfd3ru4nOjaNGrYQ1HKK4Fr3Ma4dLqvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gk7D1nTL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::d;
 helo=mail-oo2-x0d.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gk7D1nTL
Received: from mail-oo2-x0d.google.com (mail-oo2-x0d.google.com
 [IPv6:2607:f8b0:4864:31::d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8805B81347
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:46 +0000 (UTC)
Received: by mail-oo2-x0d.google.com with SMTP id
 006d021491bc7-6d33d80855eso335398eaf.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992125; x=1791596925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oWk0MohjOyyvCtHAFyzyTXrJiot8FeAWf95DKAnGSAs=;
 b=gk7D1nTLpE14kXg89gjJhoSNB9W9aLRi5OFb44hfVXfpvO7dVchWjucIiDs1h6paxX
 1LAFd2TWnQfN9ybxlGx3iXlbkPhhl8IeFH1YcLAsIzJzpZWu+QD1JFydyReSBZX6C9JT
 OOv5wNNHsOMDoJXZzgVLm7mQy84wRabUodgZGoV0lf7dfRBhV5LKzyYgxkQyHjZoYihK
 rydL+aFj1sD4EreaTEzvH5W+hTcdEDZ16etus6vKcsVxxJOmxYjrt9tFGJo0L/97uQhA
 d3Pq+7c6Chg8OJmqfongoeX5DMiLapwWnZawBX6J9jzsOOi8B1VgWQHL5SCZx0qWST1v
 WaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992125; x=1791596925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oWk0MohjOyyvCtHAFyzyTXrJiot8FeAWf95DKAnGSAs=;
 b=OA+ueTJ9qyZ9u2YtCC8tC1zxgi5c5crqs9K+ai+VANONA8yk9d7lygYb2ICFjKZ8IM
 joIRRC5IOsMWfw2lnSysfqfgupqZlUG2Ny9+PG74UJDlsB4D7KCH7nCSZpJgfp4Wxcv1
 IGMhszU5YcuIsl/n1Ty/kbq4+t0BhBzEjW6n38PlsjOUQg/zFpOxH3yF2OtV72vkHqum
 p/yw3tl4yFmA1/QB5B7HnQyksh3U0i/E8IvER0FRLaHSbbS9J+Wweme2dALGc0aNbqJY
 iCsMXlbSuy+fBobf+mzLaGTLOoIurBM1zTyA/Yhq3YK1kH6G7StAz9re33NqAWPHA+zI
 bJuA==
X-Gm-Message-State: AFuF++nHWYRuq/zs+ahcljhMYIlbSDHP7SoT74B/f8bXRHnGbm1eYjL8
 To6cix1jVUZJ6tv9LgO2A6FnlyoOASVXTKDR9Wy4TnVfE1kfoJU6tIa+JRfNvQ==
X-Gm-Gg: AYBFou0LbPZSYFg2Dgu7NBm1RbxizXyZ9hA3pwrGYuod+USX7CK6gAaoH3en1rRc57O
 LNIuVR/bxAWtrzcubxRptbrzJf5EARVeTEaqhCoA8LopZGcdZ6F3UvYGYCPnwSYlknP5L1Wxfbv
 fqZ8L8cmOE48U1hVgaEnlQ+ouMyC/5bTIRojFsPgiWwtMuXx5ZCn7i3rbgZU2NU83flV1dT+Kd8
 33tpZjjJ5n+1V7HxnNlBlxHcXqk5KixgGNbMlFt90350pixEI7gTmaqyuCaIrz0sJb+y4K3czZh
 /9EvaxAuYKf57w4sKfw4xz3DueYoGgX3nOa/ykzDe1IDPJk3XIfkoJGJg1IGmSzyMtzy9LT6FyV
 qgfRTsmL20l809DXvD+eJPZuf59E3vrNL3C6xJ/vRXNFHoEdMZBP04xf6r0G0ZYgMV3LZmm/TGX
 Kjr6TThMy5q3L/NYDhwf1nSQ95xWJ29lpfpF+stN9QrSXtWxg5DXeE+CTs+PUODEhFT3covFiQe
 AiQsh5qkrdYMHHtoUF9Zjcd+juEmIb5ay1iUzx82OL9PIgkwYUx7SkLayuE1wvZ5RbOBOSMAWe4
 p0BTSvdl6XDxg756XOsdXwr9NeC9WpyeHIjIuhy5g6OyO0xCS2YYzZEYd4QPKS5+H5sW9Fr4vhs
 C4ddtAL8rsqMv0QhssDWK95h+YzjWWb+5p7IrWW8g/1Y=
X-Received: by 2002:a05:6820:c98:b0:6c9:80d8:a201 with SMTP id
 006d021491bc7-6df35a40875mr3569768eaf.62.1790992125376; 
 Fri, 02 Oct 2026 18:48:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:23 -0600
Message-ID: <20261003014837.403895-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to version
 1.32.4
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

Add new host-python-tomlkit dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 8443d4f412..82a28deb79 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  52ab8110a3a114ddeeb7dd82a624ca53  hatchling-1.29.0.tar.gz
-sha256  793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6  hatchling-1.29.0.tar.gz
+md5  537991c82a1c02b1c5023fec65972966  hatchling-1.32.4.tar.gz
+sha256  c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b79690e970d375f07  hatchling-1.32.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index e82cb8d5b4..4a116d8837 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.29.0
+PYTHON_HATCHLING_VERSION = 1.32.4
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/cf/9c/b4cfe330cd4f49cff17fd771154730555fa4123beb7f292cf0098b4e6c20
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f6/97/b5312f01a8c6daf729a9d272dd442e0c546dbcc630495788786c4b567ed0
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
@@ -14,6 +14,7 @@ HOST_PYTHON_HATCHLING_DEPENDENCIES = \
 	host-python-packaging \
 	host-python-pathspec \
 	host-python-pluggy \
+	host-python-tomlkit \
 	host-python-trove-classifiers
 
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
