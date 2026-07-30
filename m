Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83708C54FDF
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 07:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E397406EE;
	Thu, 30 Jul 2026 07:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2wM82IYyA0V; Thu, 30 Jul 2026 07:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28120407C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785398390;
	bh=Kl1qM77s+XqaYfh5aPEiW32vO+LpJGnq++IurysqM/U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=osYMrQamTi/AwDHurIjK01QDswnqrrMee3vCdRSIV9H91QEnmLJNgHgbERqaoQuP+
	 dhygZf4e8pUuRg3NDTj6LRiqoHEe7qxamuhQCwrd8hZRLgaabELgRfRWJ1dneF75PM
	 5HgUC/cI+7/HuCD+wnFxY1KMb8/gpUwQQkbSdP+ekjWUYtojQ76zNuNMH8mGu/QzJU
	 bossrwZOL3nrsodUEK3ljNQ1iHt2nFOC+xwat2JUlIx3GA0YWolKgFBoOy/o5+F4Ou
	 0lNwfCixa+93nQNtNEfn+iRbWKgeuzhwdtptukqVjLwXi2/xuhtw/I+KQ/RtLeialb
	 sO3o/NY1UeRJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28120407C9;
	Thu, 30 Jul 2026 07:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C32350
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E935780D9D
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOfaIT8bD8IR for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 07:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C806A80C68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C806A80C68
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C806A80C68
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so10802875e9.3
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 00:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785398386; x=1786003186;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cg68WdmrNUGbU33K9AtMEdeaY43PpwB9KM9CKEQJ2g4=;
 b=PNMnSZitnD9K/qaa1ymVgLRB/IxdElRa0wyX4xqLSCY99vKzLLiR8nFCr7MIR9whuL
 jH2BR+Tzjh6Z5v42fNQmKtHDMKOTizlM9gBCJpj1QQHyFQZSNEP0s7yQGRrcvB3MRASg
 SxFPLFo1Ib4or7oHn38XI1gwo5DRi8VDbZJ9g/kLhimcVGaplNCqmk+czQI/Lj7rRitK
 /96/Or4kYBW9MGLTmN/8mWs7RbHtHVjP9iAvCKqmOISH3BjAWMBSx39u9QgShg52lmjm
 MC3zumrxTxBv7YevgaszTnNl34S4DlFaW/weYAW/maxwZ7GeKRHVdo+0VcweFziHD4oH
 jztw==
X-Gm-Message-State: AOJu0YwUcjCc7R+4XuZ4Lv3s6I3lj6C/N0N4VgiumSbbg/Bgfa2s2+82
 IpIEoTneYuUS0XJrmYnTOCoyNzitzeL5BOOTE1oTqTwRx8u7AMsu6H9jo6fjKaBfzZI=
X-Gm-Gg: AR+sD13KwCRkkvcNJBX8rCjPaEeAnqUc67+L6i4J1D6iSfONMJcwe0Zti4v+saZ+5Jj
 s3AEBPMk3rCYmFyFsRyJoIQrFE8AQJqQBJdJnHqQ8IVfKhKlvW9Ok5RJCiMHyux2ZC1kwrwAHXv
 srORLxe7eL38p9zmUHBp79aC6uAaSUO9Och6nhJyxT4gwKpar/PF10PZlHSizaozx5x4EXN8Aku
 3fkNZpDVgD+chgHF+PFu9u2sQb1cI2eBHe3uHY7mgoeFeRD8Jzuil51BJaqAwrImk4KrSQ6IJYG
 KC4usAZnu3GP9Au69SGo7T2YyruNWNomDFrvtYhzJt6wb9yTcsszXCCKHC09oDU1ePxF17szO5c
 QZnZji7HaAV51G7tLu2fP2q4OjMgvaNSHW8mSutbb87Tg/biX5Ut1pUPjGx92es59uQOchZFRjw
 VGj1lGYGpJ2/2MX0Ul2uNJrD9fu7qqhI3qK80/Iew/E7g7Ca/Zw+GexLH43r/PWRWg36unSd52J
 5gpKfLfjtoCo3xYVEakLUw19gS3+pxmXc5e7wJ9VDn2slQ=
X-Received: by 2002:a05:600c:548c:b0:495:3eb2:b763 with SMTP id
 5b1f17b1804b1-49800ea023bmr20671505e9.21.1785398385378; 
 Thu, 30 Jul 2026 00:59:45 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980120b42csm39007995e9.10.2026.07.30.00.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 00:59:44 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 10:59:38 +0300
Message-ID: <20260730075941.7679-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785398385; x=1786003185; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cg68WdmrNUGbU33K9AtMEdeaY43PpwB9KM9CKEQJ2g4=;
 b=K3iSjIPtvj2YRbv0FYP3sNp0WG2aMMcUdJVMgn/lyeheY8pOKQxOXOWTqtYIavNu7V
 V/1x4n6skHFfNdkDkr+PpH0TrxB+eJLSZYxPs7lv+oeTX1nJPNxY6XjUjct4HMApntB2
 k+LRQ8QViv5diPqVXM7OO9ePmOFQLwstQuXomi8ksOuBYSroc9ALSqpC+J+de5pOVeCq
 t/Gq7QymEczyqjVllwjVuXTkDeUBhCiImUqz8FKzDmQhZGf2poGUce9cLZEJhgj84eSi
 qMdoh8qQGVcubLQGgNPYdFdgf1ZpwFNcSy9Tvcv4aOKHeVpj/d3OOV792BUxRBsLG7zE
 e8KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=K3iSjIPt
Subject: [Buildroot] [PATCH v4 1/3] package/python-cramjam: new package
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGNyYW1qYW0sIGEgcHl0aG9uIGJpbmRpbmdzIHRvIGRlL2NvbXByZXNzaW9uIGFsZ29yaXRo
bXMuCkl0IGlzIG5lZWRlZCBieSBweXRob24tc25hcHB5IHBhY2thZ2UgaW4gb3JkZXIgdG8gYnVt
cCB0aGUgdmVyc2lvbi4KClNpZ25lZC1vZmYtYnk6IEZsYXZpdSBOaXN0b3IgPGZsYXZpdS5uaXN0
b3JAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBVcGRhdGUgYWxzbyBERVZFTE9QRVJT
IGZpbGUgYXMgc3VnZ2VzdGVkIGJ5IEZpb25hIEtsdXRlLgotIExpbmsgdG8gdjM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyNDA2NTAwNC4yMTc0MTEtMS1mbGF2aXUubmlzdG9y
QGdtYWlsLmNvbS8KCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMyArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluICAgICAgICAgICB8ICA5ICsrKysr
KysrKwogcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5oYXNoIHwgIDQgKysr
KwogcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tayAgIHwgMTQgKysrKysr
KysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5oYXNoCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawoKZGlmZiAt
LWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGYyNzEzYzcyMzkuLjkzNTE5NTc0
YzkgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTEzNCw2ICsx
MTM0LDkgQEAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy5w
eQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fbmV0d29ya21h
bmFnZXJfZ29pLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhv
bl9weXJvdXRlMi5weQogCitOOglGbGF2aXUgTmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNv
bT4KK0Y6CXBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vCisKIE46CUZsw6F2aW8gVGFwYWrDs3MgPGZs
YXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgogRjoJY29uZmlncy9hc3VzX3Rpbmtlci1zX3Jr
MzI4OF9kZWZjb25maWcKIEY6CWJvYXJkL2FzdXMvdGlua2VyLXMvCmRpZmYgLS1naXQgYS9wYWNr
YWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IGZjMWU1N2QzMGQuLmQ0ZTNj
MmZlNTggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmln
LmluCkBAIC0xMDYxLDYgKzEwNjEsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIK
IAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNvbnN0cnVjdC9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL3B5dGhvbi1jb250b3VycHkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRo
b24tY291Y2hkYi9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3B5dGhvbi1jcmFtamFtL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNyYXlvbnMvQ29uZmlnLmluIgogCXNv
dXJjZSAicGFja2FnZS9weXRob24tY3JjL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWNyYzE2L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0v
Q29uZmlnLmluIGIvcGFja2FnZS9weXRob24tY3JhbWphbS9Db25maWcuaW4KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uODQxMTljYTk2OAotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluCkBAIC0wLDAgKzEsOSBAQAorY29uZmln
IEJSMl9QQUNLQUdFX1BZVEhPTl9DUkFNSkFNCisJYm9vbCAicHl0aG9uLWNyYW1qYW0iCisJZGVw
ZW5kcyBvbiAhQlIyX0FSTV9DUFVfQVJNVjUKKwloZWxwCisJICBQeXRob24gYmluZGluZ3MgdG8g
ZGUvY29tcHJlc3Npb24gYWxnb3JpdGhtcyBpbiBSdXN0LgorCSAgQWxsb3dzIGZvciB1c2luZyBh
bGdvcml0aG1zIHN1Y2ggYXMgU25hcHB5LCB3aXRob3V0IGFueQorCSAgc3lzdGVtIG9yIG90aGVy
IHB5dGhvbiBkZXBlbmRlbmNpZXMuCisKKwkgIGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9jcmFt
amFtCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLmhh
c2ggYi9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLmhhc2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjA0MmJiNjI4MQotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0vcHl0aG9uLWNyYW1qYW0uaGFzaApAQCAtMCwwICsx
LDQgQEAKKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCitzaGEyNTYgIDU0MmVh
MzQ5YTc1MjhkODg5MzU4NTZkM2ViNTYyY2QxN2JmZjcxM2Q3YTQxZWFiOGQ2ODEyZDc4YTNjYjAw
YmEgIGNyYW1qYW0tMi4xMS4wLnRhci5negorc2hhMjU2ICAxMDg5MmYyNzk5NDhmZTlhMmRkNWYy
YzU1OWVmNzhhYWUxZWJmNGI1ZDU4MjVlMWVhZjY4YjAzNzg3ZmRlNDAyICBweXRob24tY3JhbWph
bS0yLjExLjAtY2FyZ282LnRhci5negorc2hhMjU2ICBiNGY4ODJiZmM4MGQyN2EzNzMyNzg5YmQ4
ODNhOGMxZDM0MmU4ZmZlYTdmNjIyYTcxYjNkZmRlZDgzNDIwNWZmICBMSUNFTlNFCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLm1rIGIvcGFja2FnZS9w
eXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi5lMWUwNjBiZmJhCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRo
b24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawpAQCAtMCwwICsxLDE0IEBACisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworIworIyBweXRob24tY3JhbWphbQorIworIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKKworUFlUSE9OX0NSQU1KQU1fVkVSU0lPTiA9IDIuMTEuMAorUFlUSE9OX0NSQU1KQU1f
U0lURSA9ICQoY2FsbCBnaXRodWIsbWlsZXNncmFuZ2VyLGNyYW1qYW0sdiQoUFlUSE9OX0NSQU1K
QU1fVkVSU0lPTikpCitQWVRIT05fQ1JBTUpBTV9TRVRVUF9UWVBFID0gbWF0dXJpbgorUFlUSE9O
X0NSQU1KQU1fTElDRU5TRSA9IE1JVAorUFlUSE9OX0NSQU1KQU1fTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQorJChldmFsICQoaG9zdC1weXRob24t
cGFja2FnZSkpCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
