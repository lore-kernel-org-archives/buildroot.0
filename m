Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB89ECCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 09:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57BF8605B0;
	Mon, 19 Oct 2026 09:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCk33QOwYVb0; Mon, 19 Oct 2026 09:38:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70F7D605D9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792402729;
	b=LdkEMx5zvy6Mzk5Fac4txDisqMrMci/kZXGys5XvBiMGnaeByfoOBxw7nQ/YvXyP0my2
	 TcZbC9iIfXZrCkQExG9Ykqm6aGjteGO7TCO5t2ptVJhmqh7EGETWtyENKUMw+Yt/FGvkp
	 9ZH5i18CH0sK0Kyqi+91lYsvQo4DUprmGA7Z2IJSlTdv7BKmMm3q5Y+QveRntnPfl7RBU
	 mzmUsN+H3GuBlkyjm/bcdQCqq5mwqPKv2Fcp8WhZljUMRwQ3wZhylLXscl9/54iS44kDw
	 Xu9S40aOeHqFuOkFKGq2ndhq9eQ5jF2DbNWdDbTB2TBJapHg+mmgZEz1IyrTabK+MIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792402729;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=21KyIiqdSdxSmpm/T3gPrg8S38eGIr9EkH770zKrZF4=;
	b=YFKVSIb/0c/4jfjdURp2cKJxoJ3giEBTOFILOscjWnYVRtdgEDPLtV3JoMmKI/fa1fJ7
	 egjNC0As7aZ/CCqDOBhOpHhsie1niTlctwtwseDCYi7ipIUl5ZzSLm8IC4kkpX9EzHqA6
	 Ch+9SP4Zkt8M7a3xT4kOIG79ewtQibu+heLsHVC5AiVwlZ5INc04wUUkCiHasMTGkS+55
	 euve9gnicGUqdiPVjoymoBt4odABixZLS6F8Wvtv030SBUiQbog2bpj9MGSTxXtUxcWIQ
	 CczpT9/DgexxiTDUPxS2C2TOvBWgTivVvRIPT+7vgb71Nf68H09Bq5B/0MqJryIqhBA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792402729;
	bh=21KyIiqdSdxSmpm/T3gPrg8S38eGIr9EkH770zKrZF4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZ6rmziSRJZED5+zY21ke87x6cVaSb31JYB+6r8cOfa56GGhMVYMtsLArF0iBKWo2
	 EXx7gPKIAtHz2PSf7bxi4jjn4SpeJU98uyqhmIT0avl2xeAaQ0jz6sapIzzo+cI59p
	 bu4MIXqxxfMtHee6Hl8hiAxv5qOxtXyOW/SK/tDTm14sis1bmn6aQ0yqGDsw3zJXze
	 xO7llVlJSVHnzpikVaIgYXC9rOyTFFvbp2PBy1qGCtXGHovIMIy95vJveZ7g0pLn1g
	 S4QjNwObUVzexgqaT8mEWusDNbw4sRctWEKKOhXETTlyTpGiWpUUrs+D2mQae1oYU1
	 unH+k/4lAkevw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F7D605D9;
	Mon, 19 Oct 2026 09:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3226123F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17FE140586
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wls62PiNjrnQ for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 09:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53F8340574
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792402727;
 b=cLCnObDiXJebEXANE/EdjGA6PKMds7G6/gsGzxS4YqxODoNJNZiSnO33BUGFQXeUxZqU
 fmjo0pyKwGvZjSpq84h4UbkUfl4PO7VFC3Z/pRNkgVyCMXSbRXlXuT3WrUk6GgRgheRKP
 HkZXLmncrHWpzO/bG/OrT0xi1ftDSDLfFAxjVivnnhe5Y9vGZafP228X66152cBMhKeGm
 AljIEO70ewltykniaiW9S+hS2/Fkpl5UVLbCo3U99ghi0qFojfKNdIiLzji1sUXSIcQDl
 LVFibDjBjIk87fdDaTs87XmruK7F7aBy+Z817xwwOH9edNv3CWLwSnr9jMBJQKEwTWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792402727;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=wDTHp0ebjuRKQ7pm2aJClYgaG1/zCQ0KQpKeoffU3N8=;
 b=V+auYrHDIsvrVcvGIr1wm7iGatRtcDAFqLdKXGI3GHhGx7r/5Mww+MzlFbR3sEC6Sbow
 v6nCr+KArp0Rt6Mfg4T6ju9/FUqrhRhTa+VrJL7/kt6juiz2H/vUzuMx8cbUvf03/l60c
 IcmJE/an8uqbKvYri+qOxg5lR2/Oir0Zhk42RuS/CvBCjC8okEu+bXmF5D1PSdqzXXQG5
 xzPPeYWxflW+KRQlrC58BsFDkWbOj9L7xkVslj8hKVaIsW29Eo9r0xu1VWCmlAKNmlqVk
 WXyLEB6ywKtSXzgEYKgJzKBx8LkhiiXPQhHDACdvqxXxDEzNk1rb5amglOauowhzZ9w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jPmiUyqo; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jPmiUyqo
Received: from mail-dy1-x132c.google.com (mail-dy1-x132c.google.com
 [IPv6:2607:f8b0:4864:20::132c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53F8340574
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:46 +0000 (UTC)
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-35f1f76ea84so3510567eec.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792402726; x=1793007526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wDTHp0ebjuRKQ7pm2aJClYgaG1/zCQ0KQpKeoffU3N8=;
 b=jPmiUyqo/B8flHpSXhvs/dyyiIZpgccF0QQ3F0qyYGJUbE2ojF2ksN7RO/TeVX1yCl
 ahrb+4yzhVeaUFqh3wu1EHKm0BYxjjlH76GVcxSYsJWvDJ3HIUvtYIIXRBIotTMh6qOZ
 GRGkDo9SDXUJs/4p0WqQeSU77YAwZDaJQc5sLieb7+mOk06oMFYlo/YFD63LDCrsYwbo
 hZgQdDFv6Uuq6Vai9wODtiLjYYHmk92ZuzJmbeiLwTtNqzyFklDcZ/ASAWAzUsinrU01
 d0N4wrgEa3GgLnkOneARm1pJCBFeEbBeJlPAuJPu9jkvYHgVo7pvhGI7ERHLK7DluXP2
 J5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792402726; x=1793007526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wDTHp0ebjuRKQ7pm2aJClYgaG1/zCQ0KQpKeoffU3N8=;
 b=1tVxh+H0H3NS9+qbAhMc2Jyxou5d5OFE5siFlBh8HRF7Vz+3VJLh6RuBMwOFAZAOpr
 DIBohgi7OPqNIC+wPkKeUmf8OIxAqviqj5v8mnMy0STBrgpniJhU+JIfpdFiU2SC/AKp
 vFqFC6GulIAeakBmzX3JcbBQkdrPudtDhW67lCwwX69VlKcRZR/M/z4mduumagTw2W4E
 3qQoSUbPTU7C8IjV2MRGth4vSiAJg/VnUu5pp0Qxe3gQT3FcZoYspYZxJrYnfiZZzqDr
 aytcWW53HWQGXc7RMip6N7Iv8/+Vjz3iati+GDAsEjQK7RHsCkYYBF+B+VnhyeupBH5u
 IgQw==
X-Gm-Message-State: AFq9FYLhjFFvte4QPUmB0fLpWXoOpagnWi0RsxnixHJKIl1r45i4hF2r
 r01LjKLeQMYX9Z0TDje01bQo5f+tHFtFzS9qEowLdXs4hd/KjGh6H4nHI2UM6Za8U7g=
X-Gm-Gg: AYBFou3B/jnHeskjQ0HjQNX+ThhsI/4/qnCKJyqbwa9sRzb0TtF7PpASA5xGemgqxkg
 qTu/MpIA9Cijbl2fwOi8UvY0KN8hPXJxSGz7HByAw7Xo5VLIvYD+oQ2bsGxtycgoKFahMf99hz5
 8C/WoHYe6/ufr06wgYsuIFagJl3pDIt5HEGjMJBXgNWLiO/SjATFew21f+rKU4XD0azcQURqYWc
 RHrwj9c++/z/lP7/NtWmx8KfI0m/RQfI7Tj6+X9lzcJwVA+Z3urAAoXeNU/rcyw5SPotdr/U/Qk
 xcbMXgBm/VGzNh99Ss5rgrvtIkcaxBq34aGczRl1Jv3E8LIRj+upFDZF1O4wGadw9a3DKjBNi6w
 tGM6Y9Y5/fzwEHQ2NSk4vac6p2azsIbnau2n86DCTymI0Gi6UKJlW1L4tp2A+Dwdow5jiPETKqq
 BRqkzN1gF3nLyiv0PFD1QTFrT4RK46O9taflFQ9fa7OpPqKJId65hX9XeuCzH6qoWugUUhm4Tc3
 WZKmjaL9QuWFTS4EzCYt4az85dqNjos
X-Received: by 2002:a05:693c:409c:b0:351:515b:4e85 with SMTP id
 5a478bee46e88-361a136abeemr12091472eec.16.1792402725514; 
 Mon, 19 Oct 2026 02:38:45 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2405:201:9008:10c1:dea5:be99:85df:68ae])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36082a7b33bsm56489599eec.24.2026.10.19.02.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 02:38:44 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 19 Oct 2026 15:08:36 +0530
Message-ID: <20261019093840.104537-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
References: <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/2] package/tcl: bump to version 9.0.3
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

This series bumps tcl to version 9.0.3 and addresses review comments from
Thomas Petazzoni on the v2 submission:

1. package/tcllib: bump to version 2.0
   - Tcllib 1.21 does not support Tcl 9.0. Tcllib 2.0 adds Tcl 9.0 support
     while maintaining compatibility with Tcl 8.5+.
   - In 2.0, upstream set "all: install" in its Makefile, which attempted to
     install into host /usr when DESTDIR was empty during the build stage.
     Overriding TCLLIB_BUILD_CMDS to a no-op resolves this cleanly.

2. package/tcl: bump to version 9.0.3
   - Add host-zlib to HOST_TCL_DEPENDENCIES because <zlib.h> is required
     by host-tcl in minimal container environments.
   - Remove redundant HOST_TCL_SYMLINK_TCLSH hook as no packages in
     Buildroot rely on an unversioned host tclsh symlink.
   - Drop TCLSH_PROG from TCL_MAKE_OPTS, keeping only TCLSH= to avoid
     polluting LD_LIBRARY_PATH with target architecture directories when
     bundled pkgs/thread generates its zipfs archive.

Tested using:
 utils/test-pkg -a -c /tmp/tcl.config -p tcl
 (Result: 32 builds, 4 skipped, 0 build failed)
 utils/test-pkg -c tcllib.config -p tcllib
 (Result: 6 builds, 2 skipped, 0 build failed)
 utils/check-package package/tcl/* package/tcllib/*
 (Result: 168 lines processed, 0 warnings)

Shubham Chakraborty (2):
  package/tcllib: bump to version 2.0
  package/tcl: bump to version 9.0.3

 package/tcl/tcl.hash       |  2 +-
 package/tcl/tcl.mk         |  9 +++++++--
 package/tcllib/tcllib.hash |  4 ++--
 package/tcllib/tcllib.mk   | 11 +++++++++--
 4 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
