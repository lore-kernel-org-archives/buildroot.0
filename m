Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C1AE94120
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F53960791;
	Tue, 30 Dec 2025 08:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QrdPJz7digE; Tue, 30 Dec 2025 08:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66BA4607A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082776;
	bh=Hzy2mZB3TBe4mvD5vmtQHpXCmnsVYqaZhcr+QLzOVjU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mw4RMpyxnY+2Zr+tW4uawEVQBF8zSz+mYrb7ig4okC9zB07iSZfKXox+sgAzY039o
	 a/AUc85SF8vsyT15wlhDa+X9x92Of18/Llte4eZfKsiOgujaddCpHtI3FoyNakUIc9
	 eU2OsOQoVrQF1O4nk33hpExg8McYCVikO2KLIOWmWjsd218VMDaeGCh/7/CO6xwsPL
	 hAGlKot6CDLlPP9S+uWdO9MzCxHKyXV0/sFsmCvrzug+K2aPtKRKtFqQZEebpDPt+C
	 7iTypci2VAYUVkNKnOMWN8xicOMoFRbEYfqNO5P4wkSjH2DyaWhooiunOxVkH70DiP
	 ZPqtMuxFdXlIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66BA4607A5;
	Tue, 30 Dec 2025 08:19:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3EF6D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB7C24076E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrsYiNtvqu-R for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2CCB40408
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CCB40408
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2CCB40408
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so52071065e9.1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082769; x=1767687569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V0N306Q5j0BN8YTyvCjRdNCOsZVJ4XtAUUPQAdbvHog=;
 b=Ue/BaCcHx9zihvGmR5vtNckLbKerozoITdIWhXZfIyBMo9qrLgvr6qYtg0z0uJBdfB
 cC5RDzv/P+pfAaMT5nTgH+3G18RCndG81qMQIyViuz0Q5UmfgGdqBZZXNaC/HHVC23M0
 +PmDntODaKKUWwjb+/UtMdzloc65GjabckhBEdMITqgFWQBGSey+8L5iiTsVYmFCNetb
 enc9aEAWL3cOXLYRXxJniY1MDuypFYYXxkhrkZ78XpGHS3wEKwC19M3jbiyXdM6PK5J/
 mwRw3hbNsvh1tA77S7xUdAHO96ZL0h2+p/U8ObO7WZ2qnwpFm0biBsf0clkVNtQng3VD
 RQIw==
X-Gm-Message-State: AOJu0YxwtxdI0eHQ4xBW5T664LUKWVgHOltBw6c1kOlNVcwacYmNnZ9E
 yh3XtOH4fSmz/JNVkDAZYmtQ6zzsXtmsvbUPWmD6UX4rJxt4ujQ+EfLTQUiCAZ3eCcLjrHt0xq0
 hKxDT+uk=
X-Gm-Gg: AY/fxX61UbXNZYsCmR18bS0d/Gwhu8WnppnmmGb/gYX342Zivwuskscd0oAGDf484eh
 vEyVYDfC7QuGlFEFF8+QytDrLRArHx8BxC0j+n39+2BLSUA147fGZGr5Sg3lzPe5ReqNaBUg3oU
 y74uS+HzXIJqu25CCYEKSs0DFf6B2CG83syCYx8/HXPgnrCZMLhRzne+KOJhbfAhaDWHCI8y/YY
 OYS6EPNv+pN03ob5EMaS46XVEQ50rtwlhzSzi1e86/VTPiaQ0utcK9IEFpQ+yWiEfsoHHfsBcct
 vPZUg9ijj9J2oznrheGiwJk/VY/DuDQ3vNbmduEKkw3vGRlQ1NEmgvO8Thz6lmQOZj4Bgwvjg6f
 bxUdK+KZmvTNw/jdyJvEJGg67HE/HjxN/eIZsrVaMN5rpMKnd6b8w7u0flnxS/Qoi8IECmmpSwS
 B84Cg=
X-Google-Smtp-Source: AGHT+IHhZ4mFXtiisWNqoX99Wq4ZZIdFVcqVatoAVdHTtIyaIOSrTlLIW0pj2f1II2HLdk0ydZyXGw==
X-Received: by 2002:a05:600c:46cb:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-47d1953b78cmr408592895e9.1.1767082769524; 
 Tue, 30 Dec 2025 00:19:29 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:28 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:09 +0100
Message-ID: <20251230081917.18676-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082769; x=1767687569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0N306Q5j0BN8YTyvCjRdNCOsZVJ4XtAUUPQAdbvHog=;
 b=O0hU3BqoKrXXi7ErGmLWjjfSxE7rqVn1hom1gcWswWh++hV/baAbR4iXHgcBFQqsVY
 JOHhbmiKoBklmLXLJJBa8MZ32hlYN9PEgXmtg/irGZugp5a5JyPIgYw3tXVpIyXA3mQa
 xHQWYacbKRqypwfFJNvVPQVZ563bth5YWCV8pjpiXHEaAY9fksZ/rLiet3ZN6asE01Nk
 byrYf66b/OVoMBjF9/e8HkIpUDnAXv4yyOREP2Mc+SddLOkGydeFQU0xDhmOeV1HFrN3
 v16bzMsZGJIYwjYHsrLvxSeifZSIdAjwErEUQlHcsXRmKhJEw++2951N1RFhecyRB4oF
 ggjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O0hU3Bqo
Subject: [Buildroot] [PATCH v2 07/15] package/pixman: remove stale
 IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2023-37769 is then no longer matched to the pixman package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 63d9ccd10b..d02bb0a260 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,12 +26,6 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests.
-# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a test
-# executable".
-PIXMAN_IGNORE_CVES += CVE-2023-37769
-
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 PIXMAN_CONF_OPTS += -Dmmx=enabled
 else
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
