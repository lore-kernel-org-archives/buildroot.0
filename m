Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51363C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 779A185980;
	Sat,  1 Feb 2025 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gC9DorfJXyz; Sat,  1 Feb 2025 14:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F0C85984
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F0C85984;
	Sat,  1 Feb 2025 14:51:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5174B17D
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B054044A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGeNALRbpCrb for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 14:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 675B840173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675B840173
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 675B840173
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:37 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5dc5a32c313so541572a12.3
 for <buildroot@buildroot.org>; Sat, 01 Feb 2025 06:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738421495; x=1739026295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LhkdlbjeiLt5YwdXEKygcUi7RrPoXvd0xG6YeIJXfIg=;
 b=srUogm+muAV58PDNybAfoidhjE+r9lAEh5H08P8kw2Ti1lj5LgyQ+YjyGbmn3jNOLL
 LMTmlHXmHmxTBHdt8UNKfVrzwCx5vKbxUQoel1OgUftKLo7GSt9N1a4aQ48rmd4+RkXw
 hZHXOJXPFQzqG1yo6OLda21YXrcGsEefoP58e0hQWH5LtcVnQBqOhWQu9uaWptRGWgEr
 tbrPUazJhiW9o6zau6xm6a0lCXvG/Dv8ra44vco6v2c34RUbj3muUO4sBfXPA/2zYCED
 dcjPJcJ4TdokbUvtR1vH3TtaFFG9NSui03CP3EwUS7CINiuy07u1j6bCOKjj1SDMJJgt
 ghhQ==
X-Gm-Message-State: AOJu0YwKEmNBu+Ujx9/Kblc0XcFSmo0+LxeHwrgkDYWlul4GgcRYgs4d
 EuksPH9/5SbKKL+NURz88LDz5MeYH8rBCjDd+wCkOrSW7cSPmVkYo7jRlcewo90=
X-Gm-Gg: ASbGncuzYwhL9EVsv8gTvIbcM3DnL/drAjI9oNeGodbJ/MEzJDPrbS+OYFCcIRUTAu+
 56c1NRcgCuv90smGdt9Diy2Zj3TQFkTUcHetY/MRdn4QkXq3pQxU8X4q+oGHDV4YE33He76qV6+
 ebU61Ef1M4k+4qUWWpS5K++TALVhiAodEpT5qeAm16+sbR7qZLR2rI7WDYK9ju/PPsl1k9ahT7g
 dfVGP/uxgAB59ypcCkZubxltYGUyGljuPq0IasQIV+Z+ofyB6MNamW3cjOGSXYfKFwtiKQGrmPQ
 v4GuEVWFgOcezfK9Z4M1K0NDHak=
X-Google-Smtp-Source: AGHT+IGYjnbyS0vmlPFMTTi8D6yN2Hx6Xb+sDyfZcx382sf+Z1fWg46rUC9TUfnUDYrgYEcEfn0v1g==
X-Received: by 2002:a17:907:1c8c:b0:aac:619:6411 with SMTP id
 a640c23a62f3a-ab6e0545874mr454999866b.11.1738421494435; 
 Sat, 01 Feb 2025 06:51:34 -0800 (PST)
Received: from archlinux.. ([2001:67c:1810:f055:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47ceb47sm449514266b.42.2025.02.01.06.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 06:51:33 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Feb 2025 15:51:28 +0100
Message-ID: <20250201145129.921266-2-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201145129.921266-1-gael.portay+rtone@gmail.com>
References: <20250201145129.921266-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738421495; x=1739026295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhkdlbjeiLt5YwdXEKygcUi7RrPoXvd0xG6YeIJXfIg=;
 b=mYW9KsFiCMIVCxmTqHaa2jRwvLuTxa46B1JRZsuNbhZ6HzlFocnt6YufI7/HuGxzhS
 Xc69cgMdSQYXjctKT6SSD3VxqzIbhcq+Kn3KU8iadJqIQw2055Jb8GNMCHqidm5Vs//Q
 bcor0401pmhZ/SE1LkIvp4JgbnRf42GPn2uk+DUPTjBSX4TDagpOnDWEir9Mi1b/Nj+R
 ubhsMkhZUtxBEuRtmeZMOG1mBblAsQvOidkJgjihozcl8+0ANWRx8vjWXNRefZs6URi9
 aKWxxX51taIbtLyTpn/KzXh8aXugT7X3gQdWkdVGPV1PeqhEeghuTFroDECZT1wAn7RU
 C9Jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mYW9KsFi
Subject: [Buildroot] [PATCH v3 1/2] DEVELOPERS: add myself as developer for
 raspberrypi
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

U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+
Ci0tLQogREVWRUxPUEVSUyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDMxODE1YjEyNzIu
LjJjZDc3NmQ3NGEgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAt
MTE5NCw2ICsxMTk0LDEwIEBAIE46CUZyYW5rIFZhbmJldmVyIDxmcmFuay52YW5iZXZlckBtaW5k
LmJlPgogRjoJcGFja2FnZS9saWJtb2RzZWN1cml0eS8KIEY6CXBhY2thZ2UvbmdpbngtbW9kc2Vj
dXJpdHkvCiAKK046CUdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgor
RjoJYm9hcmQvcmFzcGJlcnJ5cGkvCitGOgljb25maWdzL3Jhc3BiZXJyeXBpKgorCiBOOglHYW8g
WGlhbmcgPGhzaWFuZ2thb0Bhb2wuY29tPgogRjoJcGFja2FnZS9lcm9mcy11dGlscy8KIAotLSAK
Mi40OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
