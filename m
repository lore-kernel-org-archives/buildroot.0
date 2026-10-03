Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86EBCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8A86060D;
	Sat,  3 Oct 2026 21:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2B8Z20B4woWK; Sat,  3 Oct 2026 21:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D4E560623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061721;
	b=LVGxGygeiblvhPmDZRAcwr8yC0lN/vxBaUWLhFJqh+GjqP45QZwBmuPppfA9fFJE7lut
	 BlKoeqprVhgWI95/Nnqo6pBkDpwo9g8xRsigXpSrJ9C0n85daJKryVEv5lW76XpA3ChHR
	 sXsJIMRmUct882YRzZImhN7b4fNYyiVsM7qpkW/yUybVFGHep4Ip5FovSY8hMAv0tiPs7
	 C0iAU/8BqUYwuLzW2kuo+BuKRuDCJ50sWv6/Ewe0r6gfyCDfVETD7pu63hAV0cCRx2bb8
	 nC8yJfeiNcMeHjfYHaXeyFxl+ovUeKHlzIMjXximWyecH47fO0/DOPaG2d6jvB3WGgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6Zz7uErb27NPAHaF7rftj0FuMrm1qG12XSKm6txMQSc=;
	b=A57nMSjqk5RcjJjMPxXV+FfymgwfmOKCII+3BbGIXNUXe/eSuq6QvcTtYZK9XFFJOzgR
	 xbHoECIfsCBGRwpOtuFJL+YyS+gBbGN7Iv20RJAuq33zj4zBS+kvXPY986qFCii2gojxb
	 0VN3qvL7SH4SEiTsPnl1fcqPXgt6C9I1DxsKeIC0GIkh8PjPQ+FjDQvdMv5lQuPt8FC1z
	 44fPxiQlYkwWD1iEmCsZ6+pCToXQeYtGGMMSNqhPT1IR0PulRpqKk74aRAOf2vVON/IqF
	 8lSiUtWjJLtS9uUa5vHvc1KpFE8dQPK8+HNEMcearoRzvXsT7y2vlPY+cDCJNWzy1/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061721;
	bh=6Zz7uErb27NPAHaF7rftj0FuMrm1qG12XSKm6txMQSc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QXJ8jcn3hYt5NFT4vdZR9sFF4vFFrfiZ8qKeyr8qzLOL5XtsrcD/7bFtssHzsMJlz
	 tzZ9e1XcJWSYLCwp2GMXC2JLdCnWQemjtftwIKe8lK7WXNHS7+q5vddxXvb4M1x+c6
	 lmtpo0lUp/pFTJMQ8e4rKW/qA7mF4ZKhX/5z0kBoCmeTPvoJtj7pRIygQt+icrcuzG
	 fUv/lBkgrf4sGJEx0RtNHJRRSQVjPGtjFCN0PCg3KPfys5YTfX6D4dpH8YkplvlAqF
	 8BrxKgA6+JjS+WGkE0M99hy6wIKXpC2b9fjV1WslQVzGz0Z+e+BOyKlG41nlIN9Ya4
	 rGEiFZMW0aoBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D4E560623;
	Sat,  3 Oct 2026 21:08:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE1A62E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5D0B8130D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2gAflYoqybG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 13EB281448
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061717;
 b=aTegRrByWQlbZSJSwkvx1R04fZFiFdwrRyx+Fv3HnwE6WVv4JqfVrgh4HKh0gxqDee9M
 jKSUHJGQeTvXjEmvgRsiCbaDRdcEp9/o+P8t1XCBks+Vb1ApFt8HrFE58hIzj0djN/0XO
 SEFH2tjeDNNaugBMxZgLOuSx5Snptf7T068Vuyths1U6XFCJd6VhEifOwyvGF32cuKVe/
 WZUaZ4lPq5hdTZ+9dCia/Du6O0nYjgwhSy7d/4lwOa5kHKrjerDc2QnRrWRUuWE6WZ83F
 KG+VpXk/cfqAEahoX7L02Q74qeEJ/JgzSJOoRxOMHdA5DCGP9C+ECD44pZtQc7Y92Bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061717;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=4aCV8vQ/VzRCcUAGLfAQz4AcrjgDYHiWpoUOMLdlsPU=;
 b=f66m30h+5c1ChWAl/5hgE5BOyVYUQIWHl5ep82YsY2jjs7Sjey4Ee9Jvdqg4eYSzh+BP
 5FOBRQpnTzBzA+aEilcWosFESG/9UZehdXt1+lG2i/Iy0/j5LVLRXNUpC36QM6qWOUBgZ
 i4FZThzHhvv/e3Oe22gN9vbHxvaaomlTH4OLCpLqqiwQL0d6DqG6Rs7KVl668+YWUwaWW
 3Yddru3l5BnFYE9Sy0J6vQkb+KwTWCejsORcRMoc09K7x8gRNOKwsgO3ssYMU+rSx6PeG
 a3XTMBoT2FlWUM5IHeeDOQLcxIijH3FhhZxdlJeG5hodq218TxjK9ButzbM55Gun+2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Bq7DYBVk; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Bq7DYBVk
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13EB281448
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:36 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-823b938464fso816008a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061716; x=1791666516; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4aCV8vQ/VzRCcUAGLfAQz4AcrjgDYHiWpoUOMLdlsPU=;
 b=Bq7DYBVk1iddtTqb6WIXS7UAn77YAda5AVTfWAovTfMY5QhpP3gP6JAqD/yc6wucu0
 WQcIn9NmPF8EseSoPrcywudkTVoNPQtA4qM7x8EjgDGufFMCD8n+N9nn4RpDAh7dK5n7
 rsXHhTlgqyfJJGw1RE5aDf5+K3hBYNK0ThUwT9Itfz4VVu2eIpPBYEcZoVIh777j0Mcc
 vhQ4o3akZbUJ2sFcJv5ZwmF98iA2eD2iWM0SZefpAiv2hjJb8Y4JtsbshyjWgraF5h2s
 n3v9RqIdNvDRd/HYyIkID9tiIYqkaYV+5kkH+P0w7qIuZuhKdbhPh8srenS9l0toNsuq
 ii3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061716; x=1791666516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4aCV8vQ/VzRCcUAGLfAQz4AcrjgDYHiWpoUOMLdlsPU=;
 b=yICUJzt0cWupxuI1ZpeBHVFt1RdELn3p4h4UYy5Bf5Wr/k43Fu8rmEGK/JTdW/LMQA
 IoA/NbknODInhoTGNSwP54wWhIM3SiyIWkmwXxqDK3QU6O8jeH/B2fDd5b/VlhuHMqmS
 OdAUR0gDcb7u08f3mPVQ9wpxMyiclrrJNJxnsIimmFAn9E+YWMicCg4lYH036GQHhBrx
 F3UULWZwwTe4U5dNQRH+EL0B+fA+tJh4v0JraDaQCzQhNZRxub8Z0pKpsVzyF1di9BxH
 E2ajRB1iM/Q914lAkG1arjC8+rE3trjEhxwGcgmAx1ee6ryW9O4R2FMDb4Os93qfYbCv
 28qA==
X-Gm-Message-State: AFuF++kJKTmm0kvVebpNORhsf1Czc7RVXsE+VSAmqPThxR+9yrd5Qyg7
 p6ze5N2erhIpUoXoLSM75X1jnXw0ZBk366xT86aDfsUIc6ggFSntFNPSHKnT+w==
X-Gm-Gg: AYBFou3X4FQw6XpqKCuifL+0II9NDJftwxEfKtxBgKzA0Ksl5e7LiM5LrnVUldI5lwl
 lfhvNrx3DVRxMm/p9hWvzF017HTm1za08hx0GEWglFWpyWI7Ls8JUgy4ZnYY22UNyM10UUHs0Nw
 gckPIoHs9OzodQWA3E1fhsNXytUd1XL+2RMEucGoAoRJvtZJTDaMYM7YFk+Ee3ebAQdP4970coS
 iX4tMi5ROIPkdDNp7qse6oA/HCD780sswvnp+J0f40nykxE30yCqVUuT6vWbtrPKBhdMFWH7nbp
 49EM0mo48RKaL8ZtrVoguzJSc4ZWpclPXzlrogkDc/yxaLxGcV9Ui1x+uK4oQfOvswENzeyLckJ
 4jI9AnHoUGxzaWg9GORp7VVYgLyEFs8os687WFEGjPxxXtvo9yYGSCbAGFYB+esLxJkptywLlX0
 ABFuSQn5tADkd9vyEyAdRMO6Cz8yLPSTyyoTHWUoYS/6dqporsbKg+7BdArqaHfZ04LIbZ6O5F/
 ebYKPIO2b+7Albs/dABQ34xAlhwJgoz70bCCpHIUNyttv2ozDIgTAK6/hQjZgBN5bz6uZlPahVd
 rI6PN8OguxDt53H+alnw5SqDc0hWIjPG6OEZoRD0xDTZHc8vYoU9i4aLm0sKH/bfu8iaX4cBXHv
 4aFYnVS7F8adS5InECULK0POQMnzn3Vohzc+FYcNkVA==
X-Received: by 2002:a05:6830:82cb:b0:822:ce5a:4ab with SMTP id
 46e09a7af769-823fd8f8f6fmr3399836a34.26.1791061715814; 
 Sat, 03 Oct 2026 14:08:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:51 -0600
Message-ID: <20261003210833.735937-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 36.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 17d42534a6..fa913949d1 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  dc74fa582f559cbd31614ddfefb4868f43c919d7184bde514bb47f90c6025eb8  protobuf-36.1.tar.gz
+sha256  3d9642a662d10e68ebae5e53f14dcce5105684212d5078f8e0d47d1ab3ae6b64  protobuf-36.2.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index c4ffbe9eca..7f42b40f04 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 36.1
+PROTOBUF_VERSION = 36.2
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 469ca3e6bd..c4b333e629 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  5cef553eb5bceb0d5a57610f1aa3c40c  protobuf-7.36.1.tar.gz
-sha256  d0f6470f0ce2b84e3feaea2d4b816378b37ba4d4aa08a274305373de93e2d524  protobuf-7.36.1.tar.gz
+md5  905e08d5b281bc0255336b03db97f57d  protobuf-7.36.2.tar.gz
+sha256  497d0463ff3316681da6c0b9e8d06cb465d61abce00b613ab42226175644d1bb  protobuf-7.36.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index d73c265302..8903b4629c 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/86/73/f66c748df06e7fe24e658eddd600d19c4b40bad836c97ce2d0ad9851fb6b
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/d9/89/5b8517baa72f84a67b8a307ba953c91057af618bf40bf676f3c03551f8f0
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
