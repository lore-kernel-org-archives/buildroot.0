Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21EECA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2B28146A;
	Sat,  3 Oct 2026 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwcH9F2L8gsi; Sat,  3 Oct 2026 21:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7FC9C8148B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061733;
	b=e13gziGFhoU2yYXRJwmON0uKmQm0Vm+ZjdRBDL/Qq7FPsrgIJBjcMWNpjGHv9d3fVCeH
	 BHGvhixSEKm6UePhUL3NHulKH6mgVBkdytvz+czwXFbsUxRg2B4/8kJDA1zAP2S3IvJUK
	 6+ZRhVUKy8apQ0azS2NzQ7k4ilw160sjGh0kJveKwtlpCv5uJou8NFtYMFbkusxn3crHE
	 hFT/vhbYyMSzAWpaBI5pt5MrNAgzJRUqGTQl7ozd7d5yu/jHd3LB2TcjWKA88kf1SNLRP
	 5fvUHB8d1mJARPq53Yf4CxrkGdIZuEVavviw8YdT0+V8QuMkVK6hDLoDJQVfoOr+pIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xvLzm70SoTBkZaKaKPTGavClgryvnYThJt7gouxFED4=;
	b=g9faclzHXQfHw/jdE88IfhjiLv/1IJjbMXwFjt0iriJ/PjjxyMrlvWnBnsJ5CLW5itOx
	 XyqBEsRu1CdmLG41EAYt7Bh9AcKGbdk3xSYnuTLu7Fvo/qfierh0lKYBT7a1g0exSYR2O
	 UdtTOE6mmXXzAwTCmY2m0sdFlAbNJy1ujM9VGwA7XUFRq1clXbULmn5VMs5FORJ91Dpiz
	 Jhjrt9XniPfLVQueofWB1QpX0SBX/2/OOS7oSCERKb4YwZBRgHzZOGfdvv4Sjx6C1kFjM
	 4JgI7sv4QgRSgyGA2svnLap5vQvVYoGdADJcLtVFxAk0bSZJv9/7w9V69brqalAfiog==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061733;
	bh=xvLzm70SoTBkZaKaKPTGavClgryvnYThJt7gouxFED4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=L2o537CKUhAIn5ARRxJ83Laj7OnbcX6fUQNQdxX3r1qqH521VFfL1JX08fyEMCipk
	 8qbm0fYFlQijL3lxFdsXHFr6PpHi+ATxkki3euu+Vro8OvHsEt8uUCnS87C9b1Q1v6
	 u01TcRmdkwZNdKg/gREyb1sXVJ7DONb6ikgr9BqZ3z0U3yLPiqQSG2VSpnQW42wR8q
	 Q2Hz+NPwVCURBYTctUxmo06B1wqAvNIg/EHIcgo79RdLykzCkIy6ita1qcH+nVqBks
	 onH1FVBh5Deyf/uQ/Pyatm+dVPr4FTJk1skOS8VQPE1Qo5m/nlEEl9vIi/QmEmMSiO
	 DooXZ/23WvNEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC9C8148B;
	Sat,  3 Oct 2026 21:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE472E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DAF6400D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-honcUHBqkh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 52BD54007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061729;
 b=N5etq99vsEofPYc+xwOvdUKZRThz5z+pTKOPT+tXldCGkyiFvg0Y2PyfBVXOVEXhb33w
 bpKLQrCgJX1vOFdma37WQDT438tgSE5Hulsauk1IRlGUkuf7DkOWySGCpzuRYBNkgdHdC
 DysaAYAZzNhgnNp95G3Jg/9bv8EFk5jLg45uBRusVIBpOnp9yZT+sq+Xmm+nPv1Suloxq
 nzdOWZa+KvWIyWfTXguK97ow6TXX0bhtFzZeW46HAkmYJKecyvCe1KwnFqP2ZPwBuK+a4
 JkpR2vhST8W/36KEK5RY0IisnnBCCSopXRh7DRvrIFO6yoSFr9rkXu95u6MVvbz8aHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061729;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=S4+GRWxgTmqNk68tZQrA8SbGqWEs0ZK0I3L3tQcZs1w=;
 b=SP8hxaGNC276CBmZq6MGAK8ZKgHVwdmXvkIfUq+EiH7hK9D/9ktHDwLrEobGzCa2EOuI
 TB2zClyStNrfc9nWGcZFcd0aijsPxrjqwWgZbp9sCP4IlBPMZ3vsyxnEchtUy37T+QW6f
 4jeaq6Im5X3+DBHIw3kIRUmsFPtgkxua22NOTldAyfKHO8NPhI4EDD4hHQIYWsuxAo4r8
 a1karav9CWGW4CDagoWMMrHxjhFGVvevBi1tMUr77K7kjrOJW0GhdZz/QpMljXbSMFTxj
 1IsfnxFv99S92p4SWbKz1r2dvw1A4r93EeI0CvW2Tao6nLoysTYDLhUWUeQJ2FbvQ5A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GVEmClf8; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GVEmClf8
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52BD54007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:49 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6c8f6a53fabso645576eaf.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061728; x=1791666528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S4+GRWxgTmqNk68tZQrA8SbGqWEs0ZK0I3L3tQcZs1w=;
 b=GVEmClf8oldITpHIupYMGbHHhgalswy/Vbfx7DtZRglKoaSgwlatEP/fh3gUEay7Oc
 Y06LSA9kqHfNQNL0VVPuXAb62bIKzVbVTSKojWX3pfWxNYdT+dNzy17RfA85NjV49osm
 EZ+H3BgmD/85TIfcXq/Lq3zc9aYMqAp8v3jh146f8ipsc3IIYdv8CyOrnPbnfKqcuOPF
 gC2xwPHRAdL4lIEqhYruyjSsgHZ+MqIv86ryJ6VoXrXd/gbCYqDtRuEkCd+/SR++aRmH
 sWsXs2+thxouWMF2GBaVbwVLHlWHGBlyFDqPwQjjpeptE25l1BCfLBSNZ1rHPXNv9GkF
 8Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061728; x=1791666528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S4+GRWxgTmqNk68tZQrA8SbGqWEs0ZK0I3L3tQcZs1w=;
 b=zvKzTBdJyGySvi22rML156+HrSIYeyjbjFgMHNtHRreAzLoPEb3n+vvo+nAfu2jXO6
 8fTabZfK+sfN4+9vKHfaBQ0GObOxBcu99KwYx7TwbOFROKv8OGc9snRobsP8qYqKdx6S
 vVq2LsDn0n9AzlX1BJhgNTpxOxE9WCJ7FuSOJSVBVASu8lAXqSUL2FDErZBpw3/dSnze
 KzaTu3TDPbhASHX2FV1iOH3fdGk4EMaW+9HjbpbB26XseAABhEKnIzuKTd2nXGqaY1yI
 mxZMOS3YFlJPhd46YRM2DbTS/OTMCfRNZSfrSQEJlKnLBmfmGaE9iu+uy0S/b1Bw+ifB
 vI6w==
X-Gm-Message-State: AFuF++kC1CdBYzFXD5+aAEUfWXj2gOaewtRmCwybJbUznJ2WNFK1mR57
 sekIzf/WtC7LuUAVdIEvydTPqBFyT+RH0C8sSqM0gKo6GtVC6P8YlI0uo5C4Mw==
X-Gm-Gg: AYBFou1v8t22z5By9qyoEkwddzNTNCvxZBaQKvLddY+pKLKvdJnsOKDZNi33FRu7T3H
 kZn+KA3ZiVMdRCkLsvI7wusdmptp6UtUpyuTbivuTsBLXOAmVEgZ6Mp3QY8l/TrVJ0vcN9qbLWN
 rimxSbD45ixnNygnTmWau/2HM/jy2NM1n5n5gJDWqr0yhBD68qrJncpWbOpfoIYSIaDY6S39OQz
 dMtnBtyykQO6lV54+E4Tv7F0Gxh2v0cG/mmq2bNwRVHoiRVekURaXQAoWXRaPjc/M72C7S9Z4Bb
 BlPNogcdnLv/YZwe2JeAJQ6/tkD618EMuGShd6Mag+32haUWNSQlW+jFLhzJe0BAluZXTqKjjpu
 +nfwyArVCcivXnrp/Ijs1s8FDVtA3/mcW0Mpah3mMGTOmHR7iCcRKgjbaDKXy9LK2yXK+VIFbpS
 ckTW44mpbZULwWNRjgTIPKBT0V+n0Txp5E2I/04JPlWx8xaAZ73HcMeC0SBW+TtGH5J2kVkLtaF
 oodUrACD+0MBbrNw1qsn+yobd5q/3M/z4AGhaFNFj9+iBPo1/7/noAg+vLl9pf5h1tbt/GECIQ0
 TaG6gX8M0UMNeCQv0ORuhIPwADnphiYu7DgnWuwNMq43dZpfDkYmcKYFEOibWCSwGQBQBg07zQd
 amGDUtLPxLFFViGMBt1v18B0pNB1u8fho6LLQXUaKqA==
X-Received: by 2002:a05:6820:2004:b0:6dc:8f59:6b97 with SMTP id
 006d021491bc7-6ddbbafadc2mr7772174eaf.38.1791061728098; 
 Sat, 03 Oct 2026 14:08:48 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:57 -0600
Message-ID: <20261003210833.735937-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-context: bump to
 version 6.1.2
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

Update license hash due to the copyright year inserted by
coherent.licensed:
https://github.com/coherent-oss/coherent.licensed/commit/3b3a6b658d63ddde59499f8ff45b505abea3eb9f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
 package/python-jaraco-context/python-jaraco-context.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index 3f65a6275a..8465a76e51 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco-context/json
-md5  b75fd0eeed9134ba598bad534244b984  jaraco_context-6.0.2.tar.gz
-sha256  953ae8dddb57b1d791bf72ea1009b32088840a7dd19b9ba16443f62be919ee57  jaraco_context-6.0.2.tar.gz
+md5  3832a9304c95b6a209bd218411c6d696  jaraco_context-6.1.2.tar.gz
+sha256  f1a6c9d391e661cc5b8d39861ff077a7dc24dc23833ccee564b234b81c82dfe3  jaraco_context-6.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index 27cfd7467c..f812cec8f1 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CONTEXT_VERSION = 6.0.2
+PYTHON_JARACO_CONTEXT_VERSION = 6.1.2
 PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/8d/7d/41acf8e22d791bde812cb6c2c36128bb932ed8ae066bcb5e39cb198e8253
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/af/50/4763cd07e722bb6285316d390a164bc7e479db9d90daa769f22578f698b4
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
