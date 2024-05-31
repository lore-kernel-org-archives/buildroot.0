Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C57CC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 11:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47D7440858;
	Fri, 31 May 2024 11:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmLoTWjs-_sM; Fri, 31 May 2024 11:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F6541DD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27F6541DD9;
	Fri, 31 May 2024 11:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1E0B1D2D06
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB4EE40858
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx1_7n7MCws1 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 11:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=stephan.lukits@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2C3941E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C3941E8A
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2C3941E8A
 for <buildroot@buildroot.org>; Fri, 31 May 2024 11:37:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a66cbe67ce7so57566466b.2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 04:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717155435; x=1717760235;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2sVUf5vmJoBG8dOMhQE24eR6lSoYRbtUvxhl7w+4tgA=;
 b=FH+dKZfBi8k/r+HpOYk0aeueb1tv/LtcLVPIDPRjSWy2jycIW629rNUaQ2vNtyFFGw
 NBqH16tWOXsseq+4Jn3R47GuDgDqT0zdb2ns1M4fzTQ/McTH4xMHT0uywCU69GxIMpbA
 xqmt3YX2MMd0uMEkiA4AiT/Op9CnzZAaF6elQxr3Rs5fVxMx+T4tV5lSen8RrqUohoUf
 6sPIlcLd3Dz/ygKXtDv01YiR0RO6Kdiviu7YblhM3PQYJFxD4DNiEQnqp7Y7NkraMwAp
 +Oyg3j75i6suL6sUKee34yBPBUim/qFgvLGxjo3ZxZ3OCv0Z95xJvzJMqHKA1INLtQfp
 usww==
X-Gm-Message-State: AOJu0YwW4nQXsifdORXrmZRl3gclxPt37iB+DyjqFxeRpwjKQxhg2oNl
 MNoDW+yxwxARTSRn93H2l+GxYoeUTa87U+ii0oj0CATEJNofvtNP50BN8Q==
X-Google-Smtp-Source: AGHT+IEj+EBpF4UqtokwCQkxy5q+w4M6cl4yHQS7oIKvpK+NVuaKUVK5cP1zcXK4t/3znZYCXmt69Q==
X-Received: by 2002:a50:9f61:0:b0:57a:33ff:ff1c with SMTP id
 4fb4d7f45d1cf-57a3638f9dfmr1478802a12.21.1717155434780; 
 Fri, 31 May 2024 04:37:14 -0700 (PDT)
Received: from smtpclient.apple
 (p200300d6f726c2006c81180173a21932.dip0.t-ipconnect.de.
 [2003:d6:f726:c200:6c81:1801:73a2:1932])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31b98de7sm904928a12.10.2024.05.31.04.37.14
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2024 04:37:14 -0700 (PDT)
From: Stephan Lukits <stephan.lukits@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Message-Id: <A5CEAE69-CA07-4771-951C-05D3B4889D05@gmail.com>
Date: Fri, 31 May 2024 13:37:03 +0200
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3774.600.62)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717155435; x=1717760235; darn=buildroot.org;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2sVUf5vmJoBG8dOMhQE24eR6lSoYRbtUvxhl7w+4tgA=;
 b=dmAN1tKhDOzrSYoJqUgD2YKBMBrw6/d1GIbhETpNX3YGMPbUIHZX3zNNpgSryhMW5P
 Sshx9Awr66ip3E0e6mFnZC6EL/qxHHhhcLASSICgk5FPbJ04RxMHkVXN3A5jzblC5dwa
 AqyRfmCJJ4YHspvkPEWRWWk2PSV2ESTWEWwDfjnTI8+C+7zN3Ta79rd60qbxmZYNjG8h
 Sp3zqtZye2LXu0q8HkCToidLyTvFStZ0u4ofKGs6SRp28J7AasBxNy8CvXT6x9ZgKZl5
 myJa55UaSrXGYjAh6jQ/7acrHfpExuUEy9UhCWZeWVK7US6QvuNyexh10smy8NuZM6cN
 8cmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dmAN1tKh
Subject: [Buildroot] [2024.02] make menuconfig fails
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Good afternoon, on fedora 40 `make menuconfig` fails even though ncurses and its devel package is installed.

To fix it I changed support/kconfig/lxdialog/check-lxdialog.sh:51

int main() {}
^^^

Seems that used to be a warning and is on fedora 40 now an error. (I'm not a C programmer).

hth, Stephan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
