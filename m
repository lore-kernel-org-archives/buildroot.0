Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA26C87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A3483E2A;
	Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nH8WP7c2uYdu; Fri,  1 Aug 2025 15:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4B183DE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C4B183DE4;
	Fri,  1 Aug 2025 15:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC4213D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4024683DE1
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hthoxLSGNX-6 for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2414A83DB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2414A83DB3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2414A83DB3
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso22721805e9.2
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060849; x=1754665649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJljcnOkuEHJx9cHNZjJ18KsiFmrYx7JGlO/MqvY6yg=;
 b=ZS8phSX9gzbyUwstN6MrGwwuO0TscX/rmmQXlRsP0aP8v6lnkExetOZH9ppvY31fiL
 amGqueWucZ6tze8kCiVn8L7R/cb4iv6sJbXyPaQDitHgRvAsfbAt9X0zkk4tsjejJXfP
 /3TQU2HWQCwt5fGMh3DKwo/I3gzzWhnwYDQ5uDzVdO9QzgYIMRl2W5626StWYqPwG0/0
 pDoYVaX4DfpIxFrkdeUmxboHqAgWkc8PhoQmoI+pydyF0HYT7+9SBHC+BuYhECnj+qBS
 FmHJu0b9XA+tKRleAdCySzqRB403CnbXUjxBZ2TZrLg6rfqUndkExEQQKzxZjaC4EvHV
 1YDw==
X-Gm-Message-State: AOJu0YzVS+Ta13QuaHGmGPMLaIGo0vsSEgXIUPpmqgIVt7jQCEqPIbFf
 iqqHWn8Ha7RwlNIHh8IDCp3MRfyU+5Heb86g+D2htBoXSgkOuiGqy9F7Q2CLk3WDYHd/ivctmxq
 x7kt/
X-Gm-Gg: ASbGncsTa43y6MldrYnmAAjUrq444zRJckOAC3orLa6hCMGHygU64m/VKn9R1NfwLFu
 EvRTD2hF57SHZYbUZX3sK6WDR9QWJSRpW1BowJXOw3fQ8QfjDlOuFcfyWh3Z6WYVn95W44rvHYK
 LUXn4y04y6XSC0QcDqg9M1gzU1S2MmDYZaYmevOl7/P+Rc2pfiW6e93ELONLBq+v3gByfrXUjgk
 1Z9UXqYyr7TGJys9aeRM/t0ftzXMwC79EqGEG6mB6CUzGRMtm9uSUe/ES+iGWrQWoOecvcm1BW/
 w2WfZRybj/9Ad0/JhayqjtLxP/vvbpr8mrh+vnYhP4ab9cNdqMq22KjVYBO8Oi/CBSs0aP5Z8vv
 d+ZU9UxMeC8Tpl8q2eUmSbHgRsC5Xd4LMTTuGd8zFbNDVw2HKKOnAm8lgx5LVNA+WxIIBgD5Jk/
 UfN3rC0ogGGAHMiVxE5fA=
X-Google-Smtp-Source: AGHT+IFUZq257m/6ONs7VzW5grPfaAmi4G86ppx+ipNIX4C9u2a6Nr0fMd92Z2bTkGEmaZPF+KGHaQ==
X-Received: by 2002:a05:600c:c04b:10b0:458:a7b1:7a29 with SMTP id
 5b1f17b1804b1-458a7b17ac9mr42665045e9.31.1754060848635; 
 Fri, 01 Aug 2025 08:07:28 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm66731015e9.27.2025.08.01.08.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  1 Aug 2025 15:07:13 +0000
Message-Id: <20250801150722.4003476-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754060849; x=1754665649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iJljcnOkuEHJx9cHNZjJ18KsiFmrYx7JGlO/MqvY6yg=;
 b=Y445RF23cBwLOTrDcs3aHcdD/hIoO1qjkmyAGYF7v57ZlyYSmmozHttO4kBTzLyWnV
 11Vox5u4MVBFlMAKocP/jMd0BBhDgJ1r3GohTdY57Wz6AgnBFjI7S6S9lsFLVBkuJonD
 sZmpyVvY8C81LNs8YRKnUyd04C2LX2bNv0AFBagwoG2KOBaR7QjVJkbdXxG8oUgyoX3b
 ed3wP/FEqoprp/5dYoJdBo4CPIdrR6Iec2sgqJtCsTjXNrlg21D7tQX4IQWG3ARTVe8T
 ekEkND7CNkxoQuD5dTOHIBCBpM6GgHtGKQbDIoSrgpFk3T3aiB5JN891aOBSz218PWr0
 3xQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y445RF23
Subject: [Buildroot] [PATCH 0/6] package/mupdf,
 python-pymupdf: bump to version 1.24.9, 1.24.10
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

VGhpcyBpcyBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhlIHNlcmllcyBhdDoKPGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQ1NDk4OD4K
ClRoaXMgbmV3IHNlcmllcyB1cGRhdGVzIG11cGRmIGFuZCBweXRob24tbXVwZGYgdG8gdGhlaXIg
Y3VycmVudCBsYXRlc3QKdmVyc2lvbnMsIGFuZCBpcyByZWJhc2VkIG9uIHRvcCBvZiB0aGUgY3Vy
cmVudCBtYXN0ZXIgYnJhbmNoLgoKT25lIG9mIHRoZSBtYWpvciBjaGFuZ2VzIGNvbXBhcmVkIHRv
IHRoZSBwcmV2aW91cyBzZXJpZXMgaXMgdGhhdCB3ZQpub3cgYnVpbGQgY2xhbmcncyBweXRob24g
YmluZGluZ3MgdW5jb25kaXRpb25hbGx5LiBBcyBwb2ludGVkIG91dCBieQpFbCBNZWhkaSBZT1VO
RVMgYnkgZW1haWwsIHdpdGggdGhlIHJlY2VudCB1cGdyYWRlIG9mIExMVk0gaW4gQnVpbGRyb290
Cmhvc3QtcHl0aG9uMyBpcyBub3cgYSBwZXJtYW5lbnQgZGVwZW5kZW5jeSBvZiBjbGFuZy4KCnN3
aWcgbmVlZGVkIHRvIGJlIHVwZGF0ZWQsIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJy
b3Igd2hlbgpidWlsZGluZyBweXRob24tcHltdXBkZjoKCi9ob21lL3JtZS9wcm9qZWN0cy9idWls
ZHJvb3QvYnIyLXRlc3QtcGtnLXB5dGhvbi1weW11cGRmL2Jvb3RsaW4tYXJtdjUtdWNsaWJjL2J1
aWxkL3B5dGhvbi1weW11cGRmLTEuMjYuMy9zcmMvYnVpbGQvZXh0cmEuaS5jcHA6ODE2OjE4OiBl
cnJvcjog4oCYUHlVbmljb2RlX0FzVVRGOOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2Nv
cGU7IGRpZCB5b3UgbWVhbiDigJhQeVVuaWNvZGVfQXNVQ1M04oCZPwogIDgxNiB8ICAgcmV0dXJu
IChjaGFyICopUHlVbmljb2RlX0FzVVRGOChzdHIpOwogICAgICB8ICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAgUHlVbmljb2RlX0FzVUNT
NAoJICAgICAgLS0tCgpQbGVhc2Ugbm90ZSB0aGF0IHdoaWxlIEkgcmFuIHBrZy10ZXN0IGFzIHdl
bGwgYXMgdGhlIHJ1bnRpbWUgdGVzdCBmb3IKcHl0aG9uLXB5bXVwZGYsIEkgZGlkIE5PVCB0ZXN0
IGFueSBvdGhlciBwYWNrYWdlIHRoYXQgZGVwZW5kcyBvbiBzd2lnLgoKbXVwZGYgbm93IGhhcyBi
cm90bGkgYXMgYSBuZXcgb3B0aW9uYWwgZGVwZW5kZW5jeS4KClJhcGhhw6tsIE3DqWxvdHRlICg2
KToKICBwYWNrYWdlL2xsdm0tcHJvamVjdDogZW5hYmxlIGNsYW5nIHB5dGhvbiBiaW5kaW5ncwog
IHBhY2thZ2UvcHl0aG9uLXB5bXVwZGY6IGFkZCBtaXNzaW5nIGRlcGVuZHMgb24gcHl0aG9uMwog
IHBhY2thZ2UvbXVwZGY6IHNraXAgaW5zdGFsbGluZyBkb2NzIHRvIHRoZSB0YXJnZXQKICBwYWNr
YWdlL211cGRmOiB1cGRhdGUgcmVsZWFzZSBoYXNoZXMgY29tbWVudAogIHBhY2thZ2Uvc3dpZzog
YnVtcCB0byB2ZXJzaW9uIDQuMy4xCiAgcGFja2FnZS9tdXBkZixweXRob24tcHltdXBkZjogYnVt
cCB0byB2ZXJzaW9uIDEuMjQuOSwxLjI0LjEwCgogcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcv
Y2xhbmcubWsgICAgICAgICAgIHwgICA0ICsKIC4uLi1qbGliLWZpeC1zZXR0aW5nLWZpbGVuYW1l
LWxvZy1sZXZlbC5wYXRjaCB8ICA0OCArKysrKysrCiAuLi55LXRvLXByb3ZpZGUtbGliY2xhbmct
aW5jbHVkZS1kaXJzLWUucGF0Y2ggfCAgNTMgKysrKysrKysKIC4uLmUtbm9uLXZlcnNpb25lZC1z
eW1saW5rLXRvLXRoZS1idWlsZC5wYXRjaCB8ICAzNSArKysrKwogLi4uLWxvZy1sZXZlbC10aHJv
dWdoLWVudmlyb25lbWVudC12YXJpLnBhdGNoIHwgIDUzICsrKysrKysrCiAuLi5ydGVkLW9wZXJh
bmQtdHlwZS13aGVuLXNldHRpbmctbG9nLWwucGF0Y2ggfCAgNDQgKysrKysrCiBwYWNrYWdlL211
cGRmL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKysKIHBhY2thZ2UvbXVw
ZGYvbXVwZGYuaGFzaCAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogcGFja2FnZS9tdXBk
Zi9tdXBkZi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ2ICsrKysrKy0KIC4uLnctcHJv
dmlkaW5nLXB5dGhvbi1jb25maWctZXh0ZXJuYWxseS5wYXRjaCB8IDEyNSAtLS0tLS0tLS0tLS0t
LS0tLS0KIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluICAgICAgICAgICAgICB8ICAg
NCArLQogcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24tcHltdXBkZi5oYXNoICAgIHwgICA0
ICstCiBwYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLm1rICAgICAgfCAgIDkg
Ky0KIHBhY2thZ2Uvc3dpZy9zd2lnLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQogcGFja2FnZS9zd2lnL3N3aWcubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICst
CiAuLi4vdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3B5bXVwZGYucHkgICAgfCAgIDIgKy0K
IC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3B5bXVwZGYucHkgICAgICB8ICAgMiArLQog
MTcgZmlsZXMgY2hhbmdlZCwgMzA1IGluc2VydGlvbnMoKyksIDE0MiBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDEtamxpYi1maXgtc2V0dGluZy1maWxl
bmFtZS1sb2ctbGV2ZWwucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAw
MDEtc2NyaXB0cy1hZGQtYS13YXktdG8tcHJvdmlkZS1saWJjbGFuZy1pbmNsdWRlLWRpcnMtZS5w
YXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbXVwZGYvMDAwMS1zZXR1cC5weS1hZGQt
dGhlLW5vbi12ZXJzaW9uZWQtc3ltbGluay10by10aGUtYnVpbGQucGF0Y2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDItamxpYi1maXgtc2V0dGluZy1sb2ctbGV2ZWwtdGhy
b3VnaC1lbnZpcm9uZW1lbnQtdmFyaS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
bXVwZGYvMDAwMy1qbGliLWZpeC11bnN1cHBvcnRlZC1vcGVyYW5kLXR5cGUtd2hlbi1zZXR0aW5n
LWxvZy1sLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcHltdXBkZi8w
MDAxLXBpcGNsLnB5LWFsbG93LXByb3ZpZGluZy1weXRob24tY29uZmlnLWV4dGVybmFsbHkucGF0
Y2gKCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
