Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F587CA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388BE4115B;
	Mon, 11 Aug 2025 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhvEC6q76bxJ; Mon, 11 Aug 2025 16:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C36411F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C36411F8;
	Mon, 11 Aug 2025 16:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70AD4154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D55083EB1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJjdwAByEqcL for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 834B683EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834B683EB2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 834B683EB2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:11:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so42180245e9.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928672; x=1755533472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZsrGmasfHJ6qHygtUWvKCOj6W7vxrjKUklYOIMYF5z0=;
 b=NBsuqHuvW2QbZLTyHmqPi698fXb3sL5U53tik2vIrjHaWE9RZ9i1pasyHyDym1yFME
 sCJXKcqC9VEyIFJxg1e+nhNa63kQa7KrGYNxHNNvNp7kyRuWlWzxBDpe3HmtSr5wnX1c
 3+aScYgPvdfnH/xliRDJj72sQtueNgqomSPdcE8v/bckf9Y22+2FEksLiUBITusFnr9v
 djyYQRkR7dvGRNz2PNc33+9sLXjxxx7AdqPvG5dnOw48LZTE1qsDC85JVfDzYQAixcF1
 Xm5UaSQ+fYmblX5ymuPtI0xWgnZwYgQE7OunoePTGpA9KbtQmP+QiSEXsT+ZCcs52T6Q
 gQpA==
X-Gm-Message-State: AOJu0Yz9ob3H9pqpTJFPGB1+hISSYmpRilEb7rBtcJ4NpUw8ZsCTnplX
 Ec785wSSPDAvrsd/zP2gHIpQoc6fW7vjNlmx9KF6c+qtd0KKLOdL8D16VCOEbg==
X-Gm-Gg: ASbGncsAazW0b+CRc6rRZLkO0Ivm5Cc/0HU5oMTtgVkQdIiu5LQ6ZuDg6LcDXTDRcM4
 HZ8WsFyx8yFgaYFPNxLpYSUiC22v2BGcT0szHbjRKSVHTmNUPjxJu9kv5BLb0FX2trIQd3ZCGhg
 m/6WOL9DeaFsNhkc/qG9j0LsG9k73TDk2sw20QAOG1ZWUWQ0N4vrOr660o2VR6te3C2FOIoRzb+
 nLYbYEE2YCXtELJjtpPaUWqqqT0SrjEb0ySPFV+/dvamNrpXR3mMpFXKy5pf541gKVdLBAswtbe
 KBKu7qwveZ/WhRVEDWOZKmH8BNWIXiGdZXSPg4QF1At7T2JCHK0Y9Hz8sj1DqcmqzJ5rnV2RZGv
 u7G4AShUYkR1U1Mk=
X-Google-Smtp-Source: AGHT+IGh2Eq4/wYi94i6VwUfzlz3zadO5++IHZoPtMjduBNB78Lqsbsl9qW7JqyWeL5b9j57KrsS2A==
X-Received: by 2002:a05:600c:350f:b0:456:1560:7c63 with SMTP id
 5b1f17b1804b1-459f4f3dde5mr136011045e9.3.1754928672072; 
 Mon, 11 Aug 2025 09:11:12 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:eb5b:f3f3:bf7b:bb92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5868fd7sm279484855e9.18.2025.08.11.09.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:11:11 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, ju.o@free.fr,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 11 Aug 2025 18:11:05 +0200
Message-ID: <20250811161107.7641-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811140030.1043469-1-maxime@leroys.fr>
References: <20250811140030.1043469-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754928672; x=1755533472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZsrGmasfHJ6qHygtUWvKCOj6W7vxrjKUklYOIMYF5z0=;
 b=ST/GfcbkdIZ+Phz9IW5WzQIXIgJUiAWu7WJoNTRzsgxibNKt71qRrIrPXjWuwUj0Ja
 +Vtvig5ziYsEnps6NbS4/KM3pG3suEKjSIa3evZrLDh58FwIElaC2HAL/+7uiVxqE0HF
 z6BoZ6DsuzKS5K0FmI3rj7GxWw2aA/7j+a/vqBjTZAHjokkXGS2JPYmsEjT3TGluDKRA
 ANT+8BPLYBfYW8kUV+BRp56b4W+7oNvzBVvz4IBzobGc7/ZlSla1cgMDURpxSFA+r8OG
 GKO8JSMjAFJ72kntJrjNIKocoMJKaM2X2MBzGIGTj0GeiEqnoEexBQHpEP4hx7WVc+dq
 QVJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ST/Gfcbk
Subject: [Buildroot] [PATCH v3 0/2] update FRR to version 10.4.1
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

Changes v2 -> v3:
- Add 'Upstream: ' to FRR patch
- fix help text format for multipath-max option
Changes v1 -> v2:
- Fix compilation with uClibc
- Add new option to configure enable-multipath

Maxime Leroy (2):
  package/frr: bump to version 10.4.1
  package/frr: make ECMP max configurable

 ...davg-optional-in-late-timer-warnings.patch | 49 +++++++++++++++++++
 package/frr/Config.in                         | 35 +++++++++----
 package/frr/frr.hash                          |  2 +-
 package/frr/frr.mk                            | 13 +++--
 4 files changed, 86 insertions(+), 13 deletions(-)
 create mode 100644 package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
