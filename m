Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B9C3ABA3
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B276117D;
	Thu,  1 May 2025 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qr_2FkmrdPPX; Thu,  1 May 2025 13:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE9D161198
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE9D161198;
	Thu,  1 May 2025 13:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E2BF22D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 13:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B58483DC1
 for <buildroot@buildroot.org>; Thu,  1 May 2025 13:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx_M1jKz28XU for <buildroot@buildroot.org>;
 Thu,  1 May 2025 13:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AACBA83DC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AACBA83DC2
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AACBA83DC2
 for <buildroot@buildroot.org>; Thu,  1 May 2025 13:30:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso8381115e9.3
 for <buildroot@buildroot.org>; Thu, 01 May 2025 06:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746106218; x=1746711018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2fZ816QU08vhAda6qASJa49OQoe/A+OVFppmJ2CF3k=;
 b=bhuyV4EJKoclbgY8p8udxqZi7RSnYWmuYPAUnNBkZoi0/qBea1jpHVzHMKu6gKRTzD
 Pv1AjusWybBRrpagS5waUdnv34Xcaw2RDW9Ruxnxld7GxgLFjkk6pHiRNH/DvuzXLLZe
 tPtWMSqCPp+cBlYRRwirD06TQuPlWWT+LaLWGUnql2eY+LtKnrR9OziO+nROMFypZ+li
 fhflhZ8obZrS6mUbGuOPqGP3BsmcUzDyUGHOC2U6RipFo3NcbZLsuBnxArw2xbYGSjxw
 +DoRhA8ACyFQPiU1LuB9XH+Zfh8v98EzhWVGy3HlP2Vz1/pz2cth9Pl3OFwgY3VeDEwU
 aH8w==
X-Gm-Message-State: AOJu0Ywl+s50SgxBEYRoTPYx8WmspJI5CA3kXSQisBLnBxv7KBR03JpE
 u/pkRZ2CTQEaduy5+omzuhY9VPY/EOJLFMCtNmPX32Et6NLFFmHgl1N4qWIcLmP13/FYF3sKM/Y
 hif8=
X-Gm-Gg: ASbGncs/FdmUJojXVE0NawIyzNcXIqvHnv4ldvuwDkl5iLmKuXWoKy+rA6ijsfwFbk6
 /XTu18Cs4ZwTvtrj67PBGA2Ii7fsI9Q+JBuJD/K74j1dE+oYTjvysTHVOeXnmCnII6/InQ26FPr
 iPpjuy7nHp8nWjww6IpHh+0hqaojQe9VQERSc/kF8CE/poS4b964nh1dYJDxWsnq/IukzJYK6qL
 bIBkjPF8wHo4cP8adWdFhwe9dGRWUPfB3vCQxTS14ueuQIkbafYpniG0EQQZV6wFOfoHGTQP0HA
 dQxF8/Ks+ubVlfweal34WwtwHIAy5mF4w6/YvW438BRllBkEUw1ZkwZo1QGEYaL88Ryc0CG1Xtb
 Jjsr6TzmZgGA86eNKPuCi3bukWsI=
X-Google-Smtp-Source: AGHT+IHMbqsNBAOta+JXIM1/pMsEemStW/e6lhMT6iH5RShgVWmCWSwau5aeF7BiJfjtgCLjwxCIAw==
X-Received: by 2002:a05:600c:b86:b0:43c:f63c:babb with SMTP id
 5b1f17b1804b1-441b6feeb89mr18974835e9.1.1746106217691; 
 Thu, 01 May 2025 06:30:17 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2af2922sm57867655e9.17.2025.05.01.06.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 06:30:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu,  1 May 2025 13:29:57 +0000
Message-Id: <20250501133002.1408454-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250501133002.1408454-1-raphael.melotte@mind.be>
References: <20250407103959.2361659-2-raphael.melotte@mind.be>
 <20250501133002.1408454-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746106218; x=1746711018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2fZ816QU08vhAda6qASJa49OQoe/A+OVFppmJ2CF3k=;
 b=cCYqw8PD7tqCl6tOc80AMEsjvjQHONY+ta8L1d7BGjQWLrfN31BOXoZQNGoksT83Lz
 EQt6KcnwL85sJaO7/WGsuphEtuR5uy4S8NZcQF9qwsHVwxgT2hXh1QwonVVPdFSZtkCF
 L1PwSPnK2DW5i/uQF8fjDlPxGmpim1K02WXZUQGH38gSmwObmdGgKcKWb8Fsj5y9XFL4
 eGtwwiT9kFNAauf+9WeYy1SSHXK737MZDDcp3uDlQVRSqFLllwyuoq52VdOc36YMaufH
 xhPK9bGIinin9lOB2XwbVDw1WkIPKCjJog/J4rJBa804PY6tHiU9vIBIyRZ0LhScbrQf
 tWxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cCYqw8PD
Subject: [Buildroot] [PATCH v2 3/3] package/mupdf: skip installing docs to
 the target
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgJ2luc3RhbGwnIHRhcmdldCBjb21wcmlzZXMgJ2luc3RhbGwtbGlicycsICdp
bnN0YWxsLWFwcHMnCmFuZCAnaW5zdGFsbC1kb2NzJy4KCkluIG91ciBjYXNlIHdlIGRvbid0IHdh
bnQgdG8gaW5zdGFsbCBkb2N1bWVudGF0aW9uIHRvIHRoZSB0YXJnZXQsIHNvCmp1c3QgcnVuIHRo
ZSBvdGhlciB0d28uCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5t
ZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9tdXBkZi9tdXBkZi5tayB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbXVwZGYvbXVwZGYubWsgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCmluZGV4IDQ5M2Q0
NmY3N2EuLjYxOWYzOTQ0OTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKKysr
IGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawpAQCAtOTcsNyArOTcsNyBAQCBlbmRlZgogCiBkZWZp
bmUgTVVQREZfSU5TVEFMTF9UQVJHRVRfQ01EUwogCSQoTVVQREZfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChARCkgJChNVVBERl9NQUtFX09QVFMpIFwKLQkJREVTVERJUj0iJChUQVJHRVRfRElSKSIg
aW5zdGFsbAorCQlERVNURElSPSIkKFRBUkdFVF9ESVIpIiBpbnN0YWxsLWxpYnMgaW5zdGFsbC1h
cHBzCiBlbmRlZgogCiAkKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
