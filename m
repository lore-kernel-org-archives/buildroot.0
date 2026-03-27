Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6623C10BA430
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 06:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFB2D61275;
	Fri, 27 Mar 2026 06:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrTHUzv3vg_z; Fri, 27 Mar 2026 06:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7939761269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774593878;
	bh=s+XZtcfC3kmwyMsUJKE6rK3HsxfL9Uf7dlkdsPyvoLs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PJxFdX0NQ1z0iADfgrHkd3DcOpFdDYkM4L+QPYFt+JyMQz/pvKkbiYciaGnOXVA8/
	 azJhcsm8tJYyMNZupa/WMg+LcM62STHk1LI6mvaHpivmGZDA6OBe6pdPWfgDKqvsqz
	 94lYfpboA97hsh70GBj/HrYdpySo6MIDIWMV3rhKoCH2zKrfw4ry1RB1Ybo5Sf3GJ/
	 Skn4o2EEOO2dGfh+QkHukpz0zoeUqwqADM7ATZGv4bdjGY56tPzDY9ca8mIv3TCEL5
	 zFr2SKE75Iv8sjs3uoN6eqsT+F2ob5SDVbkT/HuEJXXH50kiSRsuqnwkJMEjn6R5zF
	 2c4A5fI56PYaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7939761269;
	Fri, 27 Mar 2026 06:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C8A249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 06:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7547F61269
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 06:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dXdNiLi7QJt for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 06:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C5DA61263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C5DA61263
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C5DA61263
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 06:44:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so16312025e9.1
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 23:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774593873; x=1775198673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aThTwvgib7ERQFp+fesznebkqw9Cj3+61RlkiER39Vw=;
 b=WUbLcx4ac6bPZHTK+5qmdcPxeY7alhcaDh1fSGKpHW8eKShjTazOmKb2M8YLcmtWyl
 rnz36aKaqwz+aEXBZSCVzoQpo2j8x2I10+wJw67q3wMfZaKCikmrhtpKAEBd4mDun5y5
 qvB1TgkkdlBu6uesEwYtlZsb7M7UReEMVF3Z735bId2TytMllkJknI1M0xfrziQBIDiM
 YlJeMbhrF0dBvLAR79zuAncmhxvd3hjqS9aw+M4HLpoaMVoEmK5BHXUcqs6U/Bkdbbpf
 /BGksrOfh4s0WYkjcEz5jYYau8eGb29KjomIsYVW9clOIDnDpRzu8wwmrCYuLxjo3oph
 qX6g==
X-Gm-Message-State: AOJu0YzHj33UYmC3E1e6oX+QLUQ1GqTuftJgL3ZfKXntIREVwc5mgJew
 WYopy+uqc/PYmCr+CveVLddFjUc0gz55tsROvfrTnyf6ORiTgv3/FJ/jPzSKyQ==
X-Gm-Gg: ATEYQzzhu4CkFwvh9HYwdpSwR9zusFP4VKlL7BdDCYPheScd5XMZRza1QgYAFioEJCj
 TatnElZLJiTXlY/MXBtd2KZxmqkbjw3h8P7ZgQpF1cXbgxJ7hGKHDc3UfFMHk6t40F2IN2Aifk/
 XkmZyBX9TDZue2lYY/SyyVvXKk60qoSQ04izZXIlAA35LyJ5w9G8qpRJEquhLuQaxDq1UCNlxjc
 JugyasElRWtKGz8J2ROUbSaumjvFPD6sTWoCo5GGDWPoJ1V+YaHErZebbQYAnXTnlf4eG5PoR7D
 SkO/jkBBbr2g+jnRlGi4gcM0vKxd9Xgll7JHOAFnFFAir4g0NYnS7IVqP573hqiY8qTm4I2OKCH
 SmxZdpCW/CL1eR9Qzj3FjafLK36wdjo0t6Na5t3779Xf423ZkRhn9OSKJOFTlm/avdr8gUPVVG8
 rzN3pp9UjAuwqI3+uEVIrR56fLheJ1jc5egZRpuub8M8zQ/QdJ0kjV7YUB9e5Ug66ZYmjOms6w
X-Received: by 2002:a05:600c:6091:b0:487:13d:4e77 with SMTP id
 5b1f17b1804b1-487280a9d07mr18438455e9.27.1774593873215; 
 Thu, 26 Mar 2026 23:44:33 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4872712b268sm9664725e9.16.2026.03.26.23.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 23:44:32 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 08:43:53 +0200
Message-ID: <20260327064354.5892-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774593873; x=1775198673; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aThTwvgib7ERQFp+fesznebkqw9Cj3+61RlkiER39Vw=;
 b=podtHb643W+DXdV+CDhDO+Rs1evTxIKm9wv2Qb98BKorRwSirX4N1T5FZEGVsSjXMN
 ptHFoKUT1NUrFHiaYDnIkotJzmbX1a3/46JEZ1BrPkGLyyLESsga5/ffMUS+y+iRH8iz
 yBSeF5ZX36jR5xBbliztOlUT2RGMLyRll4A45khTgCWGMuib02fUfHGEuNtstHBlbBnk
 EMOrQ/VN8Zc1++lUZy93swXkNvcyjoVWOWwWEBW4g6kwuAiL1WcMsCeT7tBt9WDCeZ1a
 jcyLBNhg+yjOzLwD/XQTHZ02xbgCTaG4jhoRltJfsm04WS4E9jynR9col4UjwChxETqL
 JLBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=podtHb64
Subject: [Buildroot] [PATCH 0/1] utils/scanpypi: workaround for pypi project
 names
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

I want to purpose this patch and hope others find it useful.
While using scanpypi I noticed that for smmap2 package the modified .mk
.hash files where not correct, since smmap2 pypi project is just a
mirror of smmap and has different revision and hashes. I realized why the
problem exist only by reading the commit history of smmap2 and saw Thomas
Petazzoni's remark in commit: 8bc8f4c4161ddfd255615ce0962b570da20c4148.
The same is valid for gitdb2 package. To avoid this issue in the future
for this packages and others (as I'm sure there are similar cases),
I added a dictionary for buildroot packages that have a different
name compared to the pypi project name (e.g. smmap2 -> smmap).
Since there is no intention to change the buildroot package name,
this is a workaround in order to use the scanpypi utility for
this packages and still get correct generated files. 
Other packages can be added in the dictionary as needed.

Flaviu Nistor (1):
  utils/scanpypi: workaround for pypi project names

 utils/scanpypi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
