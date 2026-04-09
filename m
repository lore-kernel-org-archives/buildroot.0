Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B93F31E31
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 15:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9563C60A74;
	Thu,  9 Apr 2026 15:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQAo3D2L7C2D; Thu,  9 Apr 2026 15:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9086C60A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775749413;
	bh=om5lfC33yJfeM9NPYxjsiVH1rnZGW074lQFxwD23P9Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kokVXwCqjBVn7epHT5yH67JJLwIe04OEF9JVD9lh10PjWjb1jDRc1GnuS4jfpei56
	 SuDLCz96voQJ2629kS54KakMCKK/atAXJsw8nlmZMmtcyuV3wwhSbiswRsilun3iRY
	 kBWxvme8VZINb0g+LJdAZFT/L1tmPz7lCF3l1KNJVZ2t1I2ZnAUdySFQwxLt6t71r3
	 xTlky4v6+quuRnQwgYzEgBS/p3OcplSMBXUerE2tZ5jt6q6qFjXnXQBzdRDF+qWdz+
	 /OPLmH8Xto99kO5iJXp3hceBb5qDFjok1o8tZh2iDqq7OWhBG+xFpwxd0H+UVSiTXp
	 +PCR4X3y+6WSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9086C60A6B;
	Thu,  9 Apr 2026 15:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCCE91D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A99403F0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-kbL3gAyhsb for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 15:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1FD1403ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1FD1403ED
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1FD1403ED
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:43:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so12655885e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 08:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775749409; x=1776354209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHsiyhasjuyKHHmY9osDZelxJIItgpJnw6EBT7FMzAo=;
 b=LK5zujqAOJ+NRJMq2OlF/qOl8MnkT0YozHJrfA0Qxyxky6frhzmHrtkZ+V0IkG34b7
 D8PwVFwHDM3Oskz/Mc0GzSCDLa7QJtoqMZvscbMm0fSD/h1FE3el0tDZJizSg+Mqto++
 ZszeVuFCAHvdTK1mH2Aere99W0O+GTUECZFLttMeJiRwj1ninETSIVqCjlUAihAi53a/
 AvPuYYN644YtOVEh/jmGf2scQSIiQJ1cxFHF9+yna/ti5esXU7OEhRr3W2qmdvvvmL2L
 C5ou1h+T8ftCvi96bu9HAB7nK63SwAJwT9Kvno5D5q/GvnYmmnNUUudhvWmT5e4giN6v
 yioQ==
X-Gm-Message-State: AOJu0YwQ4OwjvENDk3cVHEdGyj8nlTdB9eYUXSrffN+WpbBZa6ScR6zq
 +1k8BhBDO1or/XXThE8htwvDBYASeMQ97CySg9djH/4cZjZQd5wRdDDnmDYDUDpJ
X-Gm-Gg: AeBDiesm2tvoPvW7Clx81s30lIia7+ClihPqhg18nWuNiKqHK36ps32dCOH2HxWjvOL
 Y1w32WwP5Xi5gXI3X8WsPAYG/Tkgg3u3ehhcgO+YeH4G8ukTAVDVENiMO8ezHn3MOH4pvnbM3/g
 QQUvxVHd9yXrzGyGvGSuh8YqZ58eVJ44JkRG8rbu8Pq2mF6rghdDgimkMQlEgManVq/B1rzayN+
 0TMXEln0GCzRmtVi2zenv4QbATYagEh/uxBu9TcJhACH+lI/OUmENQDwJjDmqaGE/JZlN3gzWJm
 bqIrDAVBzDomWN2D9gmB1LImZEDpRjwcF3o76Ajr7y0Hqn8oc5XF4aoImVN/c03CEcQqZhrMvKw
 st1dvuN/OepKvYRK4ZZwGP1O22S/AKyd8Y1gRYiH9OJS4thJeNwQug9TbX2u51/vf7UMQ0NsnZ+
 K2VF+NJdfrgAs27ReXRj81CiYwKUPx8qJ/CQCZNZAZhO28CGesFZQsRlWagp74UCMkPWnE6iUl7
 a1sfDq/MwW+W04=
X-Received: by 2002:a05:600c:8595:b0:488:bfc3:ef3 with SMTP id
 5b1f17b1804b1-488bfc314e5mr117542075e9.0.1775749409401; 
 Thu, 09 Apr 2026 08:43:29 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.173])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d53807d7sm8423225e9.10.2026.04.09.08.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 08:43:28 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 18:43:22 +0300
Message-ID: <20260409154323.6842-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775749409; x=1776354209; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EHsiyhasjuyKHHmY9osDZelxJIItgpJnw6EBT7FMzAo=;
 b=H4jhVAvyZBu2cxJJifFH2FSRZQVzQMIEch6BcxnBZFTDH7oSGuKO75xgjPr6q4vCj3
 iIij+1izNOyA4hPBADzySyB3TW75psQywpcXDAh7EO+LD1CjeuHLfihFPIBp9OfmUiOd
 19v4+y4ugLTpnAxXSOKeK/RYd2VGWSOlqk9tBzblUq5D40nlvmrxSeN1Eu4hIBykZgzs
 +T9VVNWgsyencljb/EJwgx+HAnML1sHkyTL0h/GKDR5sxVm43m1pQWQTzsv3ahhai3nM
 ClA6ZU4AZ/cWCPelUmraztZQNIMWQrErnt2oyc6UN9guT5p19VAmMnCbJ6tSxNhVQs9A
 tlFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=H4jhVAvy
Subject: [Buildroot] [PATCH v2 0/1] utils/scanpypi: workaround for pypi
 project names
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I want to propuse this patch and hope others find it useful.
While using scanpypi I noticed that for smmap2 package the modified .mk
.hash files where not correct, since smmap2 pypi project is just a
mirror of smmap and has different revision and hashes. I realized why the
problem exist just by reading the commit history of smmap2 and saw Thomas
Petazzoni's remark in commit: 8bc8f4c4161ddfd255615ce0962b570da20c4148.
The same is valid for gitdb2 package. To avoid this issue in the future
for this packages and others (as I'm sure there are similar cases),
get the pypi name from the .mk file if it exist for buildroot packages
that have a different name compared to the pypi project name
(e.g. smmap2 -> smmap). Since there is no intention to change the buildroot
package name, this is a solution in order to use the scanpypi utility for
this packages and still get correct generated files. 
Other packages can be added in the dictionary as needed.
This solution implementation was suggested by Arnout Vandecappelle in his
reply to my initial workaround proposal.

Changes in v2:
- Implement solution suggested by Arnout Vandecappelle.
- Link to v1: https://lore.kernel.org/all/20260327064354.5892-2-flaviu.nistor@gmail.com/

Flaviu Nistor (1):
  utils/scanpypi: workaround for pypi project names

 utils/scanpypi | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
