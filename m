Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85414D1CDD1
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F74681003;
	Thu,  4 Dec 2025 04:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJPBjeek4lXc; Thu,  4 Dec 2025 04:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE8280FD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764822615;
	bh=xv+9fn5XS6ePIe47hIE74YzgE0Sc05do+tZstXtbumw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qk4t/QwukoRHNOtTHLA7+g3wLeh+kTWX8kKoa5Hhg77QbBkdZlyXRoarXR1BNG6P2
	 LvjNPy73Is8gy7sDG7Vn7STgpfHmfchXim5778Yx13W6mrHxFhURR7FwtzIwx/AXz1
	 deXTmrAlD+cd67erW5wBqA9Muf4AHot13QEYJA1lcYDN6dtEKWna0z5dZqvy99QlXA
	 ydtWFvuTQtL8/wFSJUjVDuqi9aDu5pfSOCQiBEzkginlhwT4v28wXWUKqEHpofuVc2
	 ApTtXNc38sVkwptYxab8cejtDEjq/osyhDjboO2nAqIzJMbiltKqCIeN4HVScGdpb+
	 PkodZ+nHFMP5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE8280FD8;
	Thu,  4 Dec 2025 04:30:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 730D6E4
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D696401ED
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HReNwr30_11e for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 04:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F834401DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F834401DE
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F834401DE
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:12 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-29568d93e87so5006115ad.2
 for <buildroot@buildroot.org>; Wed, 03 Dec 2025 20:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764822611; x=1765427411;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUHPlW5M0Sp4gvjA2fazXt9vWyz2Ek3gqVqzYEjxwNY=;
 b=FEpn71SLi+O0AN2tHHOZpigPdktYqAvEdg1J6myTlKZWqSKkvjztOo8MFylxbTmS7F
 smiKU9ROfA84x5UJblmlWFo+JOzB1QUXjJON72/xdz0Du3FzQrcJncN414G1H5w+yTZp
 Sgb2UoEZxsLXB60UQpQ5C0tPhzezcV5ebz/XzZnY+uGl9dox5TJirNEmvzkpC0JguVtx
 mh94MhhRy6JZPqeTrPirDTXlIYGnoc2DNLoXW4ZGivGhb1MsVqSyKsE/Hs5nioA0B4TH
 JaMXjbvl+Ym3HMcbGAYrnFCvz55L8hqcDgMetdvlurGNP8Xr6NCeJ1xoe54+MCRo6bXG
 tjuw==
X-Gm-Message-State: AOJu0YzCZ4EESEyArCITnezajEMfbkwhdAFkxOPTbezd5GgWIjTmq64F
 QrLyMErxUjkh02sbYEzbxb0qXSeqdsUl3lUqdkk8hro3c7Zth8ARgOPcCb3u03R4G0g=
X-Gm-Gg: ASbGncu+eY5gRQ7faWraxkXFNtS6cAoCYVMjTCW4EIutxNJUgmkhyAX/CYsxDB+ABz1
 r8BxpTkewplbTpWFVeWyc9Bso/OqCjF9FcOVbtEYERP4OP94dQLpcr+JeiILBhuw8ZmLH3ly9rA
 BNb4PRxsQ/60l7FToob2kLcSHS1YktsDwKXQjTuxzGuX/8wJgzXD2enIkDUdArZjRaBexfnZhNQ
 xvJAO+4/od33W5yAAtGdcb0jOa5BaAAptjrkLWq9iq1aSHRQkZo+S8yGX8lWIlbK43yqnD1E61p
 4q2I/dWmieu5YOPp0W5YLAew43/udIBHiFzzNgdR8hp7QIzfcwxNj7ClOkOr4hUPKXA2dezNC4G
 TTmajOaY79JjUwKj+F4Nl9siyWFhloco7HwiFvy9Lm/gwoRuDoHK/gPO40ukCXburyMJVLoQzlQ
 bLXJxXAK+wKH0=
X-Google-Smtp-Source: AGHT+IFNkfpI9qFGTBQv7wreDRoAudSv7cSYYKdXbrpqZiANoXSBkz1Ah++hpnXUt1gR6Dhmb2ncEA==
X-Received: by 2002:a17:902:f641:b0:29d:6852:b105 with SMTP id
 d9443c01a7336-29da071148amr20090755ad.25.1764822611442; 
 Wed, 03 Dec 2025 20:30:11 -0800 (PST)
Received: from wash.local ([50.47.123.62]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae49c8absm4968325ad.16.2025.12.03.20.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 20:30:10 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 03 Dec 2025 20:29:53 -0800
Message-Id: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764822610; l=3216;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=9AfRwnNnUfqgqPupnpJOWictX5v8RLkz39Diw+QjbpU=;
 b=0wmICGzeC+f+IrJ08q+YKoumRA2tg7bomNgNUega4SoghD59+B52aml2GYz3O5TY3Jaf/PW0f
 AkVQV7IozcTAaTTtfq++waqKKD9iTTpQMqFQUK97Y5z++940vTuDWPn
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764822611; x=1765427411; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YUHPlW5M0Sp4gvjA2fazXt9vWyz2Ek3gqVqzYEjxwNY=;
 b=Hv0TL9m0V+3A77Jcp0TZNtc/3z/6OCjnJrJaRDs1xn1H8i3mG1rKVgXfNwpbqLDi2r
 caFsA9y5hzp9fhppT1fh26ejlwUcG6myLA/vYUidEg6jWnLW5O8Hv1gVWTzPCJNoTeyN
 ZDfiw0VIov7QQSUlE76mPl8MCi4bUlD/xyrhfi+YPHvOZBQPY9+sgfMW8SaaXfNSPq2o
 2AH4lW6eXQFv28kEN6AzZlG4k6324mheHtFAZOghstyL2D7loC5eKAK/1B03yA2x0X6A
 WvPHF3ndktoOvi5xetNgSuzL75x2FAezmcM6/XoxzI/oxrr+FrkpdGz9XqgeDXWAnZWT
 oTLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hv0TL9m0
Subject: [Buildroot] [PATCH RESEND v2 0/2] package/qemu: add virglrenderer
 support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxkaW5nIHRoZSB2
aXJnbHJlbmRlcmVyIGxpYnJhcnkgaW4KYnVpbGRyb290LgoKVmlyZ2xyZW5kZXJlciBpcyBhIHVz
ZXJzcGFjZSBsaWJyYXJ5IHVzZWQgdG8gaW1wbGVtZW50IDNkIHJlbmRlcmluZwp1c2luZyB0aGUg
dmlydGlvLWdwdSBwcm90b2NvbC4gSXQncyBjb21tb25seSB1c2VkIGluIGNvbmp1bmN0aW9uIHdp
dGgKcWVtdSwgbWVzYSwgYW5kIHRoZSBrZXJuZWwncyBEUk0gc3Vic3lzdGVtIHRvIHByb3ZpZGUg
YWNjZWxlcmF0ZWQKcmVuZGVyaW5nIGZvciB2aXJ0dWFsIG1hY2hpbmVzLiBWaXJnbHJlbmRlcmVy
IGFkZGl0aW9uYWxseSBmYWNpbGl0YXRlcwpWdWxrYW4gcGFzc3Rocm91Z2ggdXNpbmcgdGhlIFZl
bnVzIHByb3RvY29sLgoKVGhlIGZpcnN0IHBhdGNoIGFkZHMgdGhlIG5ldyB2aXJnbHJlbmRlcmVy
IHBhY2thZ2UuCgpUaGUgc2Vjb25kIHBhdGNoIGFkZHMgYW4gT3BlbkdMIGNvbmZpZyBmb3IgcWVt
dSwgYW5kIGEgdmlyZ2xyZW5kZXJlcgpjb25maWcgdGhhdCBzZWxlY3RzIGl0LCBhcyB2aXJnbC92
ZW51cyBjdXJyZW50bHkgcmVxdWlyZSBhIEdMCmFjY2VsZXJhdGVkIGRpc3BsYXkgZnJvbnRlbmQu
IEFuIG9wdGlvbmFsIGNvbmZpZyBmb3IgZW5hYmxpbmcgdmVudXMgb24KdmlyZ2xyZW5kZXJlciBl
bmFibGVzIHZ1bGthbiBwYXNzdGhyb3VnaC4KClRlc3RlZCB3aXRoIGxsYW1hLWJlbmNoIHJ1bm5p
bmcgd2l0aCB0aGUgdnVsa2FuIGJhY2tlbmQgaW4gYSBuZXN0ZWQgVk0uCkFzIHNlZW4gYmVsb3cs
IHRoZSBuZXN0ZWQgZ3Vlc3QgaXMgc2VuZGluZyBjb21tYW5kcyB0byB0aGUgaG9zdCB0aHJvdWdo
CnZpcnRpby1ncHUgdHdpY2UuCgogICAgICAgICMgbGxhbWEtYmVuY2ggLW0gbGxhbWEtMi03Yi5R
NF8wLmdndWYgLW5nbCAxMDAKICAgICAgICBnZ21sX3Z1bGthbjogRm91bmQgMSBWdWxrYW4gZGV2
aWNlczoKICAgICAgICBnZ21sX3Z1bGthbjogMCA9IFZpcnRpby1HUFUgVmVudXMgKFZpcnRpby1H
UFUgVmVudXMgKEFNRCBSYWRlb24gUlggNjkwMCBYVCAoUkFEViBOQVZJMjEpKSkgKHZlbnVzKSB8
IHVtYTogMCB8IGZwMTY6IDEgfCB3YXJwIHNpemU6IDY0IHwgc2hhcmVkIG1lbW9yeTogNjU1MzYg
fCBpbnQgZG90OiAxIHwgbWF0cml4IGNvcmVzOiBub25lCiAgICAgICAgfCBtb2RlbCAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAgICBzaXplIHwgICAgIHBhcmFtcyB8IGJhY2tlbmQgICAg
fCBuZ2wgfCAgICAgICAgICAgIHRlc3QgfCAgICAgICAgICAgICAgICAgIHQvcyB8CiAgICAgICAg
fCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gfCAtLS0tLS0tLS06IHwgLS0tLS0tLS0t
OiB8IC0tLS0tLS0tLS0gfCAtLTogfCAtLS0tLS0tLS0tLS0tLTogfCAtLS0tLS0tLS0tLS0tLS0t
LS0tOiB8CiAgICAgICAgfCBsbGFtYSA3QiBRNF8wICAgICAgICAgICAgICAgICAgfCAgIDMuNTYg
R2lCIHwgICAgIDYuNzQgQiB8IFZ1bGthbiAgICAgfCAxMDAgfCAgICAgICAgICAgcHA1MTIgfCAg
ICAgIDEyMjAuOTkgwrEgMTAuMTIgfAogICAgICAgIHwgbGxhbWEgN0IgUTRfMCAgICAgICAgICAg
ICAgICAgIHwgICAzLjU2IEdpQiB8ICAgICA2Ljc0IEIgfCBWdWxrYW4gICAgIHwgMTAwIHwgICAg
ICAgICAgIHRnMTI4IHwgICAgICAgICA4Mi4yNCDCsSAxLjAwIHwKCiAgICAgICAgYnVpbGQ6IHVu
a25vd24gKDApCgpNb3JlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBiZW5jaG1hcmsgYW5kIHJlc3Vs
dHMgZnJvbSBvdGhlciBoYXJkd2FyZSBvbgp0aGUgbGxhbWEuY3BwIEdpdEh1YiBkaXNjdXNzaW9u
IGhlcmVbMF0uCgpGZWVkYmFjayB3ZWxjb21lLgoKWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9nZ21s
LW9yZy9sbGFtYS5jcHAvZGlzY3Vzc2lvbnMvMTA4NzkKClNpZ25lZC1vZmYtYnk6IEpvc2VwaCBL
b2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNl
IG9udG8gbmV4dCAocHl0aG9uLWdsc2xhbmcgcGF0Y2ggbWVyZ2VkKQotIEJ1bXAgdmVyc2lvbiB0
byB2MS4yLjAKLSBSZW1vdmUgaGlkZGVuIGNvbmZpZ3MgZm9yIHZpcmdscmVuZGVyZXIgdkRSTSBi
YWNrZW5kcyBbUm9tYWluXQotIEZpeGVkIHR5cG8gaW4gcWVtdS9Db25maWcuaW4gW1JvbWFpbl0K
LSBTcGxpdCB1cCBjb25maWdzIGZvciBxZW11IE9wZW5HTCBhbmQgdmlyZ2xyZW5kZXJlciBzdXBw
b3J0IFtSb21haW5dCi0gTW9yZSBkZXRhaWxlZCBxZW11IGNvbmZpZyBoZWxwIG1lc3NhZ2VzCi0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDYxOC12aXJnbHJlbmRl
cmVyLXVwc3RyZWFtLXYxLTAtNTc1MjVhYzg0MDZlQGdtYWlsLmNvbQoKLS0tCkpvc2VwaCBLb2d1
dCAoMik6CiAgICAgIHBhY2thZ2UvdmlyZ2xyZW5kZXJlcjogbmV3IHBhY2thZ2UKICAgICAgcGFj
a2FnZS9xZW11OiBhZGQgdmlyZ2xyZW5kZXJlciBzdXBwb3J0CgogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3FlbXUvQ29uZmlnLmluICAgICAgICAgICAg
ICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3FlbXUvcWVtdS5t
ayAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrLQogcGFja2FnZS92aXJnbHJl
bmRlcmVyL0NvbmZpZy5pbiAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiBwYWNrYWdlL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci5oYXNoIHwgIDUgKysrKysK
IHBhY2thZ2UvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLm1rICAgfCAzNiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQotLS0KYmFzZS1jb21taXQ6IGFhNmI5Yzk3OWRmYjRhM2E1NTEwOWQ4
MTljYWM2NjkyNGNkZTU5MTMKY2hhbmdlLWlkOiAyMDI1MTAyMS12aXJnbHJlbmRlcmVyLXYyLWI0
Mjk2YmVhODExNgoKQmVzdCByZWdhcmRzLAotLSAKSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRA
Z21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
