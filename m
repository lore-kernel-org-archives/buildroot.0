Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC00CD37B5
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66CC66082B;
	Sun, 10 May 2026 19:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMBz1Zk4ZK5c; Sun, 10 May 2026 19:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DEA0605E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441921;
	bh=FVT/dgeW7dP6mWRmZP2gVgNl4pQX32fjd1eGl80JZgc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJl4CVMLbDchr61jMm9w6ZQCRrwI6hKjEclhc0AYyrq+tfWBMtHI4xqxOR2wPy71Z
	 NJOHXrKb21fs3NJLzOhKVjTxUfo1jamx/558KiLi6E0f7ozeMi6+5GiGuKkpGmE0ey
	 utg9P8Wa8Uq9leTljPzTfG5z4OmN6DESXNjsuJwv7MImFWtiFTV7MW5cDwkKfcWVTu
	 gKwb+rKDP3wd8SQDK6Y+dSPcMuMdu6bcoS7IN3gMOsYXr86goQDhgfTU9QJZWEn7Xs
	 pUw3Kk82BYDzufbNun/lrfPJT4a0gNiKLWtBKhu00ddaNQ9n/Pqkvlz8EGkd29zEeA
	 ZchK6XdH82t4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DEA0605E7;
	Sun, 10 May 2026 19:38:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41AF3223
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331E44029F
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4e4rl-nwq14 for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:39 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 015E640237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 015E640237
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 015E640237
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5a8721851e2so3770702e87.0
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441916; x=1779046716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KxPr3cEfVmjGOGcsJTL2/xWK1Ny1xaOMiqmUQewKGj4=;
 b=Pcevgv7iTInTMA7+XI9xFxDQNketBgBJbpn7pc9n02yJRp1w399nmyXYXGc27+6j/b
 D6mlDyDu6adyyMPmxCzy83gGs7vrcIQOktJCNXMn6o9yKmbzi94tDiQSjOB230RjKxpN
 2tWAsj4jB0pQObWr9JXMaIqTKC3lXznZj2lkLG2pxFfFBHjwcRk8MledrIT/JTjG4oPc
 f6yyi94/7ypTuqJMXeAsLs8ARjqCsOk4Wdey+cxTDfYyTznDR3ES/xE52zhQBeFwqZC6
 SxsVtwEOB+owcOzJs07CEXKnOzlZeWaw3EEtNeiBDoIY98pKMJXFhsNTLkxKHZrNTkxp
 1JWg==
X-Gm-Message-State: AOJu0YwL6P7sJBLpGpkpuPRN93fyQ2wn5mxNp6+2qltim+JvxH/DUJ9r
 xsxeUj/seo2J8i+IROWFMHJ6PoMIOy3GkCyR52jr5yJ4ezJceoyj2mAZrf7fcxt6TUS4YY/Kwim
 JfjAylqqEaQ==
X-Gm-Gg: Acq92OE4KvbbVvZEi4quzCeYFGKJOp8ncmsFSOhgLfFekjs8J44qw88IWTuwLoXKOY3
 KiXPKpCUsgqWn78QTmaWFNKdAC+QsKaQSAVEL8wcorXkMKfatndI85IhYNmCLntzx6AYMyqoRW9
 DqD+AGYh6rhS+WlTmGqe0RiOnI7WmFCWf2StYL+uy8BNmMFW48pWxq0jui5O4HLsAsMXZ1rM8Gj
 McB02znIoSMs1vu0wMlYGOR3gYkpdU9Xyx9MpKQ5ksToPJDpHbbYrlC4dzd8xbj8FWeF5PsE8Ca
 tr2zzXrlQYINH5w9vn0eSdrPRVa5lq74wGd5nWhjFvCvPc0aDqBB5ffT174S+KH06H6aTstzwCY
 K+qLn6fVfYgeQUaTbresEHNl3P6Y282PYXtAgxnmlSssZRLFgGgaU+dl3vyidFCaSFaUXeC3YvQ
 3S3kEvF71PXZaTvEee3KM+8Qdqzca29+KQxsDxOsrh2FLZgeFdRew1+30BH0K0tyQaFXSW0Phb
X-Received: by 2002:a05:6512:681:b0:5a8:704d:c20b with SMTP id
 2adb3069b0e04-5a887ce98c6mr7533880e87.27.1778441916502; 
 Sun, 10 May 2026 12:38:36 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8a951552dsm2052876e87.6.2026.05.10.12.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:35 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se, John Ernberg <j@j-ernberg.se>,
 Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 10 May 2026 21:38:21 +0200
Message-ID: <20260510193826.2846038-4-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441916; x=1779046716;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxPr3cEfVmjGOGcsJTL2/xWK1Ny1xaOMiqmUQewKGj4=;
 b=ok4OL7oq98fVIHW8f8yEuwgpyC6Hwgu0S68TpDnBJ0GdlBQ6qjYKCby2f+nOHCl6g8
 IYu4tAg/Dp2WrvfaBZUFN05hycbb4belhJWVUjMf60zXUa1/MoHDDgo4H4cYRtH28vRT
 Xft5EiYAhhWQ57N5N9GzevB0DlJEnUcTmGYjyscKzpA7RzdoFL/Oy0bP2WJVpxgidd02
 h3bZZtuZUYHyoNxWmlqD8gjhMGS8gm3cLaNk22cqgP/cBH9/14/5v6K6Zr+2ZW6rYudz
 70y6AxMwpYe6HexjeClJE/Uk2cxubQ1AKwO8pBz7ioYOLJr8ksSbNIOcdV577VQT4Q3C
 XdYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=ok4OL7oq
Subject: [Buildroot] [RESEND PATCH 3/8] package/libselinux: Adjust fstab
 during TARGET_FINALIZE
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

Doing so in the INSTALL_CMD makes the fstab adjustment subject to
overwrites by other packages during a per-package build.

Currently since per-package directories are populated using hardlinks
this adjustment propagates backwards into the skeleton package, but this
should not be relied upon.

Cc: Antoine Tenart <atenart@kernel.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 package/libselinux/libselinux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index a77ee7659a..49fcd13851 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -72,9 +72,13 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
 		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
+endef
+
+define LIBSELINUX_TARGET_ADD_FSTAB_ENTRY
 	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
 		echo "none /sys/fs/selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
 endef
+LIBSELINUX_TARGET_FINALIZE_HOOKS += LIBSELINUX_TARGET_ADD_FSTAB_ENTRY
 
 HOST_LIBSELINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
