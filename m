Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3063C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 11:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC5D82C91;
	Sat, 20 May 2023 11:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC5D82C91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id to8EICwEuhf7; Sat, 20 May 2023 11:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571CC82C5E;
	Sat, 20 May 2023 11:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571CC82C5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 062421BF3F2
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 11:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCAB42489
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 11:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCAB42489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dU7ECOMroHJt for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 11:23:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B9541FC2
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02B9541FC2
 for <buildroot@buildroot.org>; Sat, 20 May 2023 11:22:59 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-3f38c23b06eso20856921cf.3
 for <buildroot@buildroot.org>; Sat, 20 May 2023 04:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684581778; x=1687173778;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ps8yiGG0kNxaTXRinS0b+WRCNTK74TQRVAxFLcZWABA=;
 b=dFO8whjoZUqScOyez71mmVo4uVftN2/zmTOg44ZiJKDRnjKAbyhpF9hYFa1ITd2hAH
 FRbktf8FTQ6yLLRlW2lS7q9qFQ7nRTS/hfg5pRRwcS5pIOPzKn1JDQ5Wh0Pc6zopqa0v
 QHcUwTO2HgCrrJ8xbK5wZnkEkAlRmbOySHS3nWUfkCnaU80qCseMQ3aD+YL4LcRjHEkP
 Gk2N/P4MgGtP79Yfy3Rr6l/XoVDSkZyoVbUhsHadvaw7AOrLUTqyqKDlNZTdJjBrDW/Q
 cUAaGBhNhZMsTWjrw7qVD/16WqGoImMFwADQd2gLG1Bm3r8fWVVx0y0PnBeJc28cB8bi
 3xeg==
X-Gm-Message-State: AC+VfDxP/NcGb1I4jNBRw9ItGBPXgpIqAMrpHLvEa0eRlgaUS/pm6n1z
 4YZmyLthjJoGrNwOa8MAVnQGe0mCGO4=
X-Google-Smtp-Source: ACHHUZ6m5/VOoG1NqvKpunbl/7B8hIoiNXDhYB9/D6kzQggaXHcV0vSzx7Gq1uht+Xl1r40n2xBVbA==
X-Received: by 2002:ac8:4e94:0:b0:3ef:231c:cee7 with SMTP id
 20-20020ac84e94000000b003ef231ccee7mr8730076qtp.7.1684581778328; 
 Sat, 20 May 2023 04:22:58 -0700 (PDT)
Received: from [192.168.1.103] (dyn-192-249-140-40.nexicom.net.
 [192.249.140.40]) by smtp.gmail.com with ESMTPSA id
 r14-20020ac867ce000000b003f532993912sm552939qtp.74.2023.05.20.04.22.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 04:22:57 -0700 (PDT)
Message-ID: <7de40638-e5ee-8e1f-5395-46a468fd2d45@gmail.com>
Date: Sat, 20 May 2023 07:22:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: buildroot@buildroot.org
Content-Language: en-US
From: Timothy Groves <the.tail.kinker@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684581778; x=1687173778;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ps8yiGG0kNxaTXRinS0b+WRCNTK74TQRVAxFLcZWABA=;
 b=hWNFsjpf+LV4ZdcgnVwJP3aBYYSWfY27+1BerrcifkCiermAx6+RAepEZhmDGMb8C8
 s8bnlPSc6VenzM1EhvTNors8+EvQjKxHAPET9tyCEvDu/hwVea+ylvxN8EKxF0EKbMlH
 YyrJrm+MntTs8p7v9Yg/lRTYoYVu2OxcYi6N6u8NPOfdjtQ+6yGNafynAc8rhdtOHSpA
 HXx/ThfF5srL3+maYeGFeVeIwOwzDQXChN1LkbXmISUl8ia6+BYhlJeoyxsKUzeiy9da
 cORQjj25+VAMKTrKuVGOn7iHZhQFDzGqcP8m5nid3pEBKiTJoep1idlgn+ZmiCup4wvY
 R4Sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hWNFsjpf
Subject: [Buildroot] Total newbie in over my head
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBqdXN0IHRyaWVkIGJ1aWxkcm9vdCBmb3IgdGhlIGZpcnN0IHRpbWUuwqAgTXkgdXNlIGNhc2Ug
bG9va3MgbGVzcyB0aGFuIAp1c3VhbDrCoCBJJ20gdHJ5aW5nIHRvIGdldCBhICpyZWFsbHkqIG9s
ZCBsYXB0b3AgZnVuY3Rpb25hbCBhZ2Fpbi7CoCBCdXQgCm15IGF0dGVtcHRzIHRvIGJ1aWxkIGEg
bGl2ZSBjZCBtZWV0IHdpdGggZmFpbHVyZS4KCkkndmUgZW5hYmxlZCBpc29saW51eCwgc2VsZWN0
ZWQgdGhlIGlzbzk2NjAgZmlsZSBzeXN0ZW0sIGFuZCBzZWxlY3RlZCAKaXNvbGludXggYXMgbXkg
Ym9vdCBsb2FkZXIuwqAgKFRoaXMgYmVjYXVzZSBvZiB0aGUgbGFjayBvZiBjZC1yb20gb24gdGhl
IAp0YXJnZXQgbWFjaGluZTvCoCBJIG5lZWRlZCB0byBjcmVhdGUgYSBsaXZlIFVTQiBzdGljay4p
wqAgQnV0IHdoZW4gSSAKYXR0ZW1wdCB0byBib290IHRoZSByZXN1bHRpbmcgaW1hZ2UgdXNpbmcg
cWVtdSwgaXQgaW5zaXN0cyB0aGF0IGl0IApjYW5ub3QgZmluZCBhIGJvb3RhYmxlIGltYWdlLgoK
SSdtIHJ1bm5pbmcgYnVpbGRyb290IDIwMjMuMDIuMSBvbiBVYnVudHUgMjAuMDQuwqAgVGhlIG1h
a2UgY29tcGxldGVkIAp3aXRob3V0IGVycm9ycy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
