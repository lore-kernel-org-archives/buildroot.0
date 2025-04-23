Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4676C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 13:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9D7610BE;
	Wed, 23 Apr 2025 13:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqIki61udep7; Wed, 23 Apr 2025 13:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902AC61180
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902AC61180;
	Wed, 23 Apr 2025 13:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 578771A0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C9861180
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLuEB6qoeqqM for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 13:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79EE7610BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79EE7610BE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79EE7610BE
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:26:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso68873065e9.1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 06:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745414765; x=1746019565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H6o6T4jtagfPYFKXrb+ZI02wfYcueHBF/a7TYphV+KQ=;
 b=ff+b8syP4mXjFai62bGrmhsgKSQBoP8SLFvO9Ma3kDZtWVH4LWkjqzBvr0OrqAE6cT
 Wf+Ip5k2LRjxLT8FRb2C1lBBKUs12K5JJIUgcMbV79JuNXc45Hr+kv2e5b2WAGuRMcnA
 ks34/6ylTTUk1bIrGM0nwsOzfwFN6MJC4N2mUW7iKblmJZVqiJQaALrQpas0Z4MRW8a1
 JRxRnMBtNEwCUmLSnHV7IQcOoffR1CwKgJlMY+8cezUslw3AQ0rLzXfLsv0O9AKWXfzf
 adik6e8iKwesBRSPr/Mg7d/ZTnz4srLI9/Q3wRtp2ol1DV5oKU6Jl0WC2AFHWvRP5Rly
 6+qA==
X-Gm-Message-State: AOJu0YxfGEPfNsBlDByaGSIeZ6sjOATpWCvpauA0ThIO/l1dwpbQ0Mzw
 Qu2zAsxzzkXp2sgveEYe2eEzAMz9ZKbF82X11/W+Kje/Y+6i6KrM4FQM1kBsDyyXfrwDaoeGvkL
 y
X-Gm-Gg: ASbGncsixEoOyEPXZN0vd4lq05CyPeS2vQYMXG5J6BjLEWgrU1MiQRh5tea7Jfj3NkW
 /orCjL7y/SEjub7KLF0V+bSfwI47hx5FPhKPNhwi5SmoSksgiE34QPoyQjNEOweYo1QAAqKeIhG
 BC2LoVqmnwLNo/xynnQBMwMbee8c/yYU/eSrgJR8dRW8tPKhl22wfO8XMz6WERC/Iw53AJip1lA
 lYGzQqHrKRYOPOjQaiYHDWqzfpW5mO6zfzDf+a7CYqeUySuur0vxo7e4dhKDSqAVSR7O1gwj5l7
 lE34UKXJIORSPGkeEqfOA1wbd4n+DEdTj7RtV+2ssg77227T/vWB/Fu6J4J6IYgyDZUBNeL2pWP
 Qp5RIcW7OxfrbvgYl7+NmMuUfWz7+PiCWdP0x
X-Google-Smtp-Source: AGHT+IF4aLiAV1vP2dtLjWEfCBaEL1sx7d2lApFpJnNWXc8qA+CARTw5KX4wdCZS3kXlWLdOWBOEBA==
X-Received: by 2002:a05:600c:4fc4:b0:43c:fb95:c752 with SMTP id
 5b1f17b1804b1-44071595942mr163870985e9.3.1745414765337; 
 Wed, 23 Apr 2025 06:26:05 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d17846sm26088715e9.2.2025.04.23.06.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:26:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Wed, 23 Apr 2025 15:25:37 +0200
Message-ID: <20250423132539.836773-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745414765; x=1746019565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H6o6T4jtagfPYFKXrb+ZI02wfYcueHBF/a7TYphV+KQ=;
 b=OXp0tB2m067KIZaBT7S9ci6moPZUQ+Eb+vvFXFkHp8fVSVOxCj16WXZDVEw13QITlx
 v2IGf5nGE6n10O9sO8pTERFOKldD04Rsq0DlciR90UrpEhfPMFaVSGz7CjT2BMD/RGtV
 nJ1dAQrH8JplsN/CD0sJ5YdBeB6X9FUGBvXtx6tSuK5xUawT8BLwfEyNXq0PAnGR9rrT
 bVEyQ9wz4vOBzEr55rXufMBLmQsEqj+r9Xz7z4NtWdmzYIudrRv2CW7mAphLqJd/Tgyj
 U91Fx820kQlBPIGdEjGhSuIb9sjL5kaPUbBU47sEgAnNvc4+5sIqHg4dxdPCzgUFT/aE
 Tn3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OXp0tB2m
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Jugurtha BELKALEM
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

SnVndXJ0aGEncyBlbWFpbCBhZGRyZXNzIGlzIGJvdW5kaW5nOgoKIDU1MCA1LjEuMSBUaGUgZW1h
aWwgYWNjb3VudCB0aGF0IHlvdSB0cmllZCB0byByZWFjaCBkb2VzIG5vdCBleGlzdC4gUGxlYXNl
IHRyeSBkb3VibGUtY2hlY2tpbmcgdGhlIHJlY2lwaWVudCdzIGVtYWlsIGFkZHJlc3MgZm9yIHR5
cG9zIG9yIHVubmVjZXNzYXJ5IHNwYWNlcy4KClJlbW92ZSBpdCBmcm9tIHRoZSBERVZFTE9QRVJT
IGZpbGUgc28gdGhhdCB1dGlscy9nZXQtZGV2ZWxvcGVycwpkb2Vzbid0IHNlbmQgZW1haWxzIHRv
IG5vbi1leGlzdGVudCBhZGRyZXNzZXMuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0
ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogREVWRUxPUEVSUyB8IDkgLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJT
IGIvREVWRUxPUEVSUwppbmRleCA2YzcxYWFjYzVlLi5hNjkyYTk3NzljIDEwMDY0NAotLS0gYS9E
RVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE3NjgsMTUgKzE3NjgsNiBAQCBGOglwYWNr
YWdlL3VuY2x1dHRlci14Zml4ZXMvCiBOOglKb3NodWEgSGVuZGVyc29uIDxqb3NodWEuaGVuZGVy
c29uQG1pY3JvY2hpcC5jb20+CiBGOglwYWNrYWdlL3F0NS9xdDV3YXlsYW5kLwogCi1OOglKdWd1
cnRoYSBCRUxLQUxFTSA8anVndXJ0aGEuYmVsa2FsZW1Ac21pbGUuZnI+Ci1GOglwYWNrYWdlL2Jj
Yy8KLUY6CXBhY2thZ2UvcHl0aG9uLWFpb2ZpbGVzLwotRjoJcGFja2FnZS9weXRob24tY3JheW9u
cy8KLUY6CXBhY2thZ2UvcHl0aG9uLWN5Y2xlci8KLUY6CXBhY2thZ2UvcHl0aG9uLW1hdHBsb3Rs
aWIvCi1GOglwYWNrYWdlL3B5dGhvbi1vcGN1YS1hc3luY2lvLwotRjoJcGFja2FnZS9weXRob24t
cGlleGlmLwotCiBOOglKdWhhIFJhbnRhbmVuIDxqdWhhQGNvZGVyY29kZWQuY29tPgogRjoJcGFj
a2FnZS9hY3NjY2lkLwogCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
