Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245F5C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0E5241AB9;
	Fri, 19 Apr 2024 21:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qfq89QV6FE3D; Fri, 19 Apr 2024 21:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710D041ABD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 710D041ABD;
	Fri, 19 Apr 2024 21:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7280B1BF302
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CC8780BF1
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Arznc4gSZixM for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:18:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37A4B80BD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A4B80BD5
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37A4B80BD5
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:18:45 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51abd9fcbf6so2064104e87.1
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713561522; x=1714166322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xr98DQNmLm8rX3W960dXU8G2uoVrSi+Qo7N6gd2P5GA=;
 b=B2kfTfygnhtwotz7SEUvYoEVrO7OAuO0JYN3rB3ixDBQziJpW9y21f/rvGN71ymrto
 c/XXRd05qnNtWwBzlhVa+r27A7KtU5JLzGIZ7TI7sbuSpLaDd4cUWt2aMtp9trxv4KTt
 nAsvQJjLiU8YINRERn2yeKJCHWQg1Th1eAz0MfOB8OMPfCVClcQ2+ta3oRIiNWdd4vti
 0awAITxYjSnn6E5scRUWhabB0mIYkhunMYCFE/i2xuZ9uvpkyWASe3bC4xYZZyAziRpY
 d/JysQwOOVa6K3q1g19eebRRVEr8o0Vs0IpuGbNr0avzqTY6vVtsjBNb14JfnUF3LTpp
 J4aQ==
X-Gm-Message-State: AOJu0YwKhEGS4tmyOYTKtTABtvKeIRGlu9sOM081MVZbYBKdFyOSj353
 DbSd3H7WtPC599GmzHrADaVwGBO5fA+v5eIiUiwdfVm0uVlHki+Hu2PAmA==
X-Google-Smtp-Source: AGHT+IHOuCu6rHq4ZbSbH06YYlSOiR5xZdRs7zuQcfaYh9oingn+ssU/Go79/O2Mh1Gmk7CZ1s341w==
X-Received: by 2002:a05:6512:2158:b0:518:8c8c:db58 with SMTP id
 s24-20020a056512215800b005188c8cdb58mr2678820lfr.65.1713561521733; 
 Fri, 19 Apr 2024 14:18:41 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a170907271700b00a556f2f18d6sm2556934ejk.57.2024.04.19.14.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:18:40 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:18:32 +0200
Message-Id: <20240419211833.498273-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419211833.498273-1-angelo.compagnucci@gmail.com>
References: <20240419211833.498273-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713561522; x=1714166322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xr98DQNmLm8rX3W960dXU8G2uoVrSi+Qo7N6gd2P5GA=;
 b=HyT5tivmh7uZfCE2yfVXTpTmIT74Updy9fdGUXToN6xsAcQWk3M39MYunN0172fBeU
 gHR0jcn7szI0eJ9t/fFBMhGoHYGd0UaSXAUV3I097gQ4tNRKSKW0qWTfAsc6O+o5y0DZ
 JZa/vJWddac8Ia8ANgWiB51ApjRv8pNZn0SSjOV1RHf2ahsngPNKFz8C3y5RFXr4M+Gj
 xiATlWMqCJ2FTmsM3ZALnKaUauDhgeuE9qH+daqbu7irOqytIfFosN+8zIaO3HZwNyb9
 fgsvpnkQG0u8hJ2XXPuoRu/VSplj44Ob1Sa7tCsDi99DPkqWuDwFxMAMJKS3bUL43qzL
 dq7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HyT5tivm
Subject: [Buildroot] [PATCH 1/2] package/fail2ban: fix data_files
 installation path
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdlbG9AYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpX
aGVuIHBhY2thZ2luZyBkYXRhX2ZpbGVzIGluIGEgd2hlZWwsIHRob3NlIGZpbGVzIHNoYWxsIGhh
dmUgdGhlIGRlc3RpbmF0aW9uCnBhdGggZXhwcmVzc2VkIGFzIHJlbGF0aXZlIHRvIHRoZSB3aGVl
bCBpbnN0YWxsYXRpb24uClRoZSByZWFzb24gZm9yIHRoYXQgaXMgdGhlIHdoZWVsIGluc3RhbGxh
dGlvbiBzaGFsbCBiZSBjb250YWluZWQgaW5zaWRlIGEKc3BlY2lmaWMgZm9sZGVyIGFuZC9vciBp
biBzaXRlLXBhY2thZ2VzLgpXaGVuIGJ1aWxkaW5nIHRoZSB3aGVlbCBmaWxlIGJ5IHRoZSBiZGlz
dF93aGVlbCBjb21tYW5kLCBweXRob24gd2lsbCBwYWNrYWdlCmZpbGVzIHdpdGggYWJzb2x1dGUg
cGF0cyBhcyBweXRob24gZmlsZXMgZW5kaW5nIHVwIGluc3RhbGxpbmcgdGhlbSBpbgpzaXRlLXBh
Y2thZ2VzLgoKRml4ZXM6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzM2
YWM1Mjc4ZDE5MTk1YTIxYzNkMDJkMDg3OTY1ZTA4ZjQ5MjI4ZWYKClNpZ25lZC1vZmYtYnk6IEFu
Z2VsbyBDb21wYWdudWNjaSA8YW5nZWxvQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIC4uLjAw
MS1zZXR1cC5weS1maXgtZGF0YS1yZWxhdGl2ZS1wYXRocy5wYXRjaCB8IDczICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9mYWlsMmJhbi8wMDAxLXNldHVwLnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBh
dGhzLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mYWlsMmJhbi8wMDAxLXNldHVwLnB5LWZp
eC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoIGIvcGFja2FnZS9mYWlsMmJhbi8wMDAxLXNldHVw
LnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmUxYjViYzQ5MGIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2Zh
aWwyYmFuLzAwMDEtc2V0dXAucHktZml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0Y2gKQEAgLTAs
MCArMSw3MyBAQAorRnJvbSA3YjdmYTNjMDJkNDU3NWMwOTM2MjMzNmJjMzEwODM1YzM3ODU5ZjFh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdl
bG8uY29tcGFnbnVjY2lAZ21haWwuY29tPgorRGF0ZTogRnJpLCAxOSBBcHIgMjAyNCAyMjo0Nzoy
MCArMDIwMAorU3ViamVjdDogW1BBVENIXSBzZXR1cC5weTogZml4IGRhdGEgcmVsYXRpdmUgcGF0
aHMKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworQXMgcGVyIGRpc3R1dGls
cyBkb2N1bWVudGF0aW9uOgorCitUaGUgZGlyZWN0b3J5IHNob3VsZCBiZSBhIHJlbGF0aXZlIHBh
dGguIEl0IGlzIGludGVycHJldGVkIHJlbGF0aXZlIHRvIHRoZQoraW5zdGFsbGF0aW9uIHByZWZp
eCAoUHl0aG9u4oCZcyBzeXMucHJlZml4IGZvciBzeXN0ZW0gaW5zdGFsbGF0aW9uczsKK3NpdGUu
VVNFUl9CQVNFIGZvciB1c2VyIGluc3RhbGxhdGlvbnMpLiBEaXN0dXRpbHMgYWxsb3dzIGRpcmVj
dG9yeSB0byBiZSBhbgorYWJzb2x1dGUgaW5zdGFsbGF0aW9uIHBhdGgsIGJ1dCB0aGlzIGlzIGRp
c2NvdXJhZ2VkIHNpbmNlIGl0IGlzIGluY29tcGF0aWJsZQord2l0aCB0aGUgd2hlZWwgcGFja2Fn
aW5nIGZvcm1hdCBbMV0uCisKK1doZW4gcGFja2FnaW5nIHRvIGEgYmRpc3Rfd2hlZWwgaW5kZWVk
LCB0aGUgZmlsZXMgaW4gdGhlICJkYXRhX2ZpbGVzIiBkaWN0aW9uYXJ5CithcmUgbm90IHBpY2tl
ZCBhdCBhbGwgYXMgZGF0YSBmaWxlcyBpZiB0aGV5IGhhdmUgYW4gYWJzb2x1dGUgcGF0aCwKK2J1
dCB0aGV5IGFyZSBpbnN0ZWFkIGFkZGVkIHRvIHRoZSB3aGVlbCBhcyBweXRob24gZmlsZXMuCitU
aGlzIGhhcyB0aGUgZWZmZWN0IG9mIGluc3RhbGxpbmcgdGhlbSBhcyBwYXJ0IG9mIHB5dGhvbiBm
aWxlcyBpbiB0aGUKK3NpdGUtcGFja2FnZXMgZm9sZGVyIHdoZW4gdGhlIHdoZWVsIGlzIGluc3Rh
bGxlZC4KKworVGhpcyBwYXRjaCBjYW5ub3QgYmUgc2VudCB1cHN0cmVhbSBiZWNhdXNlIGl0IGJy
ZWFrcyB0aGUgbGVnYWN5IHdheSBvZgoraW5zdGFsbGluZyB0aGUgcGFja2FnZSB3aXRoICpweXRo
b24gc2V0dXAucHkgaW5zdGFsbCogYW5kIGl0IGlzIG5lZWRlZCBvbmx5IHRvCitjb21wbHkgd2l0
aCB0aGUgcGVwNTE3IGJ1aWxkcm9vdCBjb21wYXRpYmlsaXR5IGxheWVyLgorCitbMV0gaHR0cHM6
Ly9kb2NzLnB5dGhvbi5vcmcvMy4xMC9kaXN0dXRpbHMvc2V0dXBzY3JpcHQuaHRtbCNpbnN0YWxs
aW5nLWFkZGl0aW9uYWwtZmlsZXMKK1NpZ25lZC1vZmYtYnk6IEFuZ2VsbyBDb21wYWdudWNjaSA8
YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KKy0tLQorIHNldHVwLnB5IHwgMTQgKysrKysr
Ky0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQoraW5kZXggOTFmNzFjZjIuLjk5
YmEyZTMyIDEwMDc1NQorLS0tIGEvc2V0dXAucHkKKysrKyBiL3NldHVwLnB5CitAQCAtMjM4LDI2
ICsyMzgsMjYgQEAgc2V0dXAoCisgCQkJCWZvciBmIGluIHdbMl1dCisgCX0gaWYgd2l0aF90ZXN0
cyBlbHNlIHt9LAorIAlkYXRhX2ZpbGVzID0gWworLQkJKCcvZXRjL2ZhaWwyYmFuJywKKysJCSgn
ZXRjL2ZhaWwyYmFuJywKKyAJCQlnbG9iKCJjb25maWcvKi5jb25mIikKKyAJCSksCistCQkoJy9l
dGMvZmFpbDJiYW4vZmlsdGVyLmQnLAorKwkJKCdldGMvZmFpbDJiYW4vZmlsdGVyLmQnLAorIAkJ
CWdsb2IoImNvbmZpZy9maWx0ZXIuZC8qLmNvbmYiKQorIAkJKSwKKy0JCSgnL2V0Yy9mYWlsMmJh
bi9maWx0ZXIuZC9pZ25vcmVjb21tYW5kcycsCisrCQkoJ2V0Yy9mYWlsMmJhbi9maWx0ZXIuZC9p
Z25vcmVjb21tYW5kcycsCisgCQkJW3AgZm9yIHAgaW4gZ2xvYigiY29uZmlnL2ZpbHRlci5kL2ln
bm9yZWNvbW1hbmRzLyoiKSBpZiBpc2ZpbGUocCldCisgCQkpLAorLQkJKCcvZXRjL2ZhaWwyYmFu
L2FjdGlvbi5kJywKKysJCSgnZXRjL2ZhaWwyYmFuL2FjdGlvbi5kJywKKyAJCQlnbG9iKCJjb25m
aWcvYWN0aW9uLmQvKi5jb25mIikgKworIAkJCWdsb2IoImNvbmZpZy9hY3Rpb24uZC8qLnB5IikK
KyAJCSksCistCQkoJy9ldGMvZmFpbDJiYW4vZmFpbDJiYW4uZCcsCisrCQkoJ2V0Yy9mYWlsMmJh
bi9mYWlsMmJhbi5kJywKKyAJCQknJworIAkJKSwKKy0JCSgnL2V0Yy9mYWlsMmJhbi9qYWlsLmQn
LAorKwkJKCdldGMvZmFpbDJiYW4vamFpbC5kJywKKyAJCQknJworIAkJKSwKKy0JCSgnL3Zhci9s
aWIvZmFpbDJiYW4nLAorKwkJKCd2YXIvbGliL2ZhaWwyYmFuJywKKyAJCQknJworIAkJKSwKKyAJ
XSArIGRhdGFfZmlsZXNfZXh0cmEsCistLSAKKzIuMzQuMQorCi0tIAoyLjM0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
