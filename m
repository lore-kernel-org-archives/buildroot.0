Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02568CCD1A5
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 00:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A960A403D3;
	Wed, 22 Oct 2025 00:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnbHtfMfyrOS; Wed, 22 Oct 2025 00:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF43403D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF43403D4;
	Wed, 22 Oct 2025 00:07:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F56670A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05ECF40DA9
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yv705O03lEl3 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 00:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 027F940DAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027F940DAC
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 027F940DAC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:33 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-290deb0e643so48074465ad.2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761091653; x=1761696453;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YUHPlW5M0Sp4gvjA2fazXt9vWyz2Ek3gqVqzYEjxwNY=;
 b=QeSC6og+qPLRanNeyO/+tibC3KaQKHxbcecKxgklxlsSmsFuCu/OQMz+CgWUaMBsCa
 K3/mHBS7lEc6o/5yyxKd5M5t3Z9/ebBNO7P/PVDc77VhygBeUpby9FaLh1QR1yPNmZrn
 4nye2lobl/1iyxJH7ghErf8JbuxBBlVQSJCOBYP7SrbFiomqox0IKay3qIt26+MWyxqA
 MzNRGajZ21Y9cbLJ/r/3ZAusp/tIpP3y3JOcC67q4yGi9HN9nBh4XEbWMZ3mSJRlRiFt
 VZ92pDgVuKiVstLabvcKsJZXcSHMdNTUJpyYh6GV0Qjajhcm9mN7jJFwYtuAFa5M7Bi9
 kZhw==
X-Gm-Message-State: AOJu0Yw8PjIh6/Jjl1fRIXciUdxJVolSzz0zsy3zvt0z9WwlmpwiD+K8
 R5sgbDvkqtOblrmOMtENImkHQQWF8LtN6cFEXmVTDhwHXZN0E4MkeTToCygROJB1
X-Gm-Gg: ASbGncscsGsWvWvZ2BfuWhnSews9qIb/9yEKQI2OFm2vQEJvPG+I76m+MJa9GSN476t
 UZ3T9pbf5bOgQLtZkxW2E5xlUPxNbzqHO8JGRh0hfCBqEFRGz0kVVNh5SP9od1ALCNLkOkr8St7
 352aDMGV/ezShWezondn08kW5SUgJdO+o7+6IPglaR3KIzMI73qzODOsfwHiP5GFhaMtR6DkjTb
 OOy8iJNHAqVG1tPscD0rM4w3Fq8mH6HvveuMzf8kmIvAsBnfXvkeYN5byCApuuktkyrbbHj1jzo
 p3wX+YCnhVRhZCJObfx7ZlhD2p9V9RYu/0vNvwPreyjq46TgAopDrkfHnb5V9VlTMMUNPqbVep8
 sUILrzjkD4OIWMBX7FpIEZMxly9+HCY9NXg86NCYNE4qH3yPMYkit0mJVskOArjbMtDErUNm4c+
 FM/UTeAkkAnpo=
X-Google-Smtp-Source: AGHT+IG/gvpvsgQgsb/CtRYV2UV1BUAxYpPsEQQ41RJtqFKCgucG67dBlUM9E4HVlUH1F9kPsi2AgQ==
X-Received: by 2002:a17:902:f78b:b0:290:ab61:6a4f with SMTP id
 d9443c01a7336-290c9cb367fmr214856545ad.15.1761091653251; 
 Tue, 21 Oct 2025 17:07:33 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721b6cfsm121350075ad.107.2025.10.21.17.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 17:07:32 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 21 Oct 2025 17:07:31 -0700
Message-Id: <20251021-virglrenderer-v2-v2-0-d3ea6ff07489@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEMg+GgC/12OOw6DMBAFr4JcZyPbwg5JlXtEFLbZwEr8tCZWI
 sTdYygpp5g3bxURmTCKR7EKxkSRpjGDvhQidG5sEajJLLTURkmtIBG3PePYICND0uBLfbceXaW
 UFVmbGd/0PSZfdWbvIoJnN4ZuHzr7u9JRXCb+HSeS2sWjJ62qTr3PHBdGN0BSIMHcjDYuVKW0+
 GwHR/01TIOot237A+44C/fZAAAA
X-Change-ID: 20251021-virglrenderer-v2-b4296bea8116
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761091653; x=1761696453; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YUHPlW5M0Sp4gvjA2fazXt9vWyz2Ek3gqVqzYEjxwNY=;
 b=ESkw9vjx5FEFpNeW6yzgctgVPhJ3P6MrG6A8n00fl1qAfEqcfUE0e2VTVJciP9LHqk
 h2i6eijfTZtXeN6jgV3Rwn5vwtyvKqMk1kf1MOBB8YyGKBMxll2Omjd+WoWXuJQ38SwI
 AVl7Se9FqCXRmccBlVam5KLJRkjjd/FQ/8yBD34NPEEDseiWYLV+2YoO+pyqI7DcRzth
 NAy6k7NYYgyXtP3wXsgqZXxxdwSrewsf/0SJG6opzVImHkaOjjiORzW/DPzCl6zdgzcz
 QSsH5LAswvVcin+fXoZlZva+q8qvmLLlx+LOWE/v8uE+LLc4+tOOroaICEqNAfh5Dd0v
 rblA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ESkw9vjx
Subject: [Buildroot] [PATCH v2 0/2] package/qemu: add virglrenderer support
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
