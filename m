Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5162F013FA
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C0240B73;
	Mon, 16 Mar 2026 21:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qqMxW8RN2qt; Mon, 16 Mar 2026 21:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3296C40B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773697020;
	bh=iZstEE4RyNQNqgFL0FAASkBEqP7Aw8W4o52gbS3mZ1A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oYz0Yyxe6nOPG5osW37YYD08/XJiU3c4JQyinzl5EsyV0Cau43jS5lMELtOvGQjgF
	 xF+YvwwBPUxpxdUKiKeGnth/qQaYxe3IpEVc5ewZM7q2Bs+DLmMR0YacVmHjXle9wm
	 6E0aaFSxZ9j8GYht1mL7UPPleAYoleZA1SRkT85EgT9YSeHUnY9HdxEIuRgFW6OBXj
	 6rfgXePeQv3qYVPPuimsLpUWjnm8E7wpCnYLuEpsYWx3TKgFnZ71Gm3UM8zoE6+shr
	 T5uUgWhlveIEkvcQ48zyOP7NdeCmuq0FqyXhBEyyuFNGKJeldyGcuyuSvOPaY0Lh74
	 I5AGTZU32WCJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3296C40B6C;
	Mon, 16 Mar 2026 21:37:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C8F3C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92E8E407C1
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_fSyATSmpIO for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 868D940840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 868D940840
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 868D940840
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:36:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43b40003d13so1441712f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 14:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773697015; x=1774301815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNJnFafTHGWhashH8rN8kvL3HTW0aS2ynpUBAP64sOQ=;
 b=Gm3/vkzf8jlpDT6qk/WDmRVDhKj2ZtwoZr0sNB9uspJlr9FqQpR1EkgfV6ugD2XmEY
 BHvnuPJMy+wb2BNg3xe97DTHocloGbU+p3hgFb0y1BR6gvVGI1CCchBu8oasTNdt7//T
 JldlZPmozOAChn6GHv+268pBg9MNrs3LJ5yR/PBu0p7tkOZW0NvReBx5DjTK2lmJ50iy
 mgGcLeJPT3vnKXXGdsc0GFsZ2q0wz1sA7wzKxcW4/UfVx4iP6Qqv1MWsQ2mgNkPuWXQA
 TgRMMtijPG+YLk02Xf2GsdaFg7iD+PRhZpmWOTJ1tQyLG8djRsJiH8mPfDvkZ9QcuQuM
 ivAw==
X-Gm-Message-State: AOJu0YxlxM/GgbjTk4VU8ysrPygJzeuf4Hh8roUk5hTmT9pEJ9Ms+Jb5
 lUi0I6zLU9LQBZTeqm8xUKya2QYA8IOdLdjF5aG77rlIqS9/D3cA0adoiwNnQrk2
X-Gm-Gg: ATEYQzx4mo+MBDj7HUkH2uoO874GIEi2C9n1WpokQl9WxsQhW3R/x3ecL5GKTKPTVYj
 wxQkYAZUjEJCfyhTLjqpuMFHBuiJYLcl+eetqwvG1ed8PLA7uTYFfxbF0jDSMhOqQbfLll05SkX
 GrYC5hfMMlf9MsqsE8EPxc0jBPKxIh0NOpA5UjMkiXtcKCA2q2WEykHkMt7QH0c6CAXLqDJD5f5
 DIKZie3BLdwkL5QzeS9E00MAgaPg/pFemQqtInG0Jk4TYDm2gVSLI1EK6A9xlexbw5KQGemOjDn
 sMCJc9ZjuqDoB1MNoqxGgMJla6lCbRMuEyFYRzAmpuvlmFzmyw41jJpm6wfl8AO+cPPhi9s/Fo3
 L7AGGgZckkgqB1jiita1OtU/GZ/uVOQ/CVM6phks3Fc+QJMAuU275ZUB8mapgiQ/7W8HYlRtebx
 Elx1nRLonMHouF1DOkkppEles2zJgaqi98lKLso2PN6koxhQf7Tx46+4rEUseT
X-Received: by 2002:adf:f349:0:b0:43b:3b80:6781 with SMTP id
 ffacd0b85a97d-43b3b8068cfmr12762385f8f.49.1773697015058; 
 Mon, 16 Mar 2026 14:36:55 -0700 (PDT)
Received: from Suzaku ([2a01:e0a:f60:4120:df77:201:2ea:5bbf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe20b899sm44041087f8f.23.2026.03.16.14.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 14:36:54 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Cc: Roberto Medina <robertoxmed@gmail.com>
Date: Mon, 16 Mar 2026 22:36:46 +0100
Message-ID: <20260316213647.6721-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773697015; x=1774301815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iNJnFafTHGWhashH8rN8kvL3HTW0aS2ynpUBAP64sOQ=;
 b=grCHAwjIj5+vA8lvdlQwRX8VyWV0Hn9EHikKLbQJfCRBYogoCmmNNG6/dQkPnhZd+j
 XNSiPZStiFnDVoeYF/vavpiAeWgok91q6OovpGEKRj8Yyr1GmyWqJbtBI1/n3GTpu8ff
 XzGWbGhTUkR0DocUY8wzg8oIDbx32utl55TAWnOIAr/ZMQ99pl8WPRWFC6d+qVvXEpkd
 82RmNKrpFAsiUTbzG48ETfZCppi54Yqwbw+0++K0lyqnB7eozUUqKGk87eqUAcyEMIUT
 FAh0qP0RXw2oUVMzluhSdIvFLwxcifc+KuvUBcMNAN5rD6LCEuu2JsOdsSsFZUIOzFVA
 IBhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=grCHAwjI
Subject: [Buildroot] [PATCH 0/1] config/roc_pc_rk3399: Bump Linux, TF-A,
 U-Boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Taking the opportunity to refresh the configuration of this board.
The CI [1] notified me that U-Boot is no longer building for the version
that was being used for the board.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/13492838038

Roberto Medina (1):
  configs/roc_pc_rk3399: Bump Linux, TF-A, U-Boot

 .../arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash     | 2 +-
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash     | 2 +-
 configs/roc_pc_rk3399_defconfig                          | 9 +++++----
 4 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
