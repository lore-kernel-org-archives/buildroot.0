Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8D0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F26840CF6;
	Wed, 22 Jun 2022 20:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F26840CF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKXsv-hrjy_d; Wed, 22 Jun 2022 20:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CF0E40C96;
	Wed, 22 Jun 2022 20:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF0E40C96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05D6A1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4F4883FA9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F4883FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeL5gN6coDVf for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:48:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7852844D5
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7852844D5
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:48:27 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id g186so17180791pgc.1
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=bQHuGf28ivcQCqfVLlKCPRNrqEssjDWRVrVVV4m9/H0=;
 b=bMQrBzuUI7AuPIf63anKkYeV+mlz9Fa36kbGY/gjUah/NCuSwWNs9Kez3ZGYWliL+d
 msj3gKKm7KSFaUjQW62b8aM+mrx8lfqZOqQuh7hx/hsEkcvCu53PDf+1O2L5o3BQXgIM
 ds6LM4tDLRx+wErwYvkJbb8xeUXxTiSQvQgafb93N4C+vEyvASo1wJgkamx9cPXuJH56
 j4wRznyoFS9ZX/+FC+i2HFKI4CPrvMxRPRmtnZA0dscF7wDaZijQOLbSXhAJqJxEILJI
 LL0y1I91ku73LVKBT9a6AoDbq9C2OzXtvfM4Mcr4aTMT11qkveS0AG81ExlpWmqfJJIz
 XYzg==
X-Gm-Message-State: AJIora/9v2htNfTk8/ZIYxG3fPGpC3HB4ha40qqmmM8MLAcXtx+ijyB/
 sO9kJLcJv0h4tR71+/TxtSQYRXfNvp++O7D7OzA=
X-Google-Smtp-Source: AGRyM1tqum+OkTC/sSWt9chVQ+3fz87W736ctjWGZNs0bOxp3+5Xoo7wQrWS8yq8MjOIVypM1j0dD5LE7YpT0c6eqzY=
X-Received: by 2002:a63:385c:0:b0:40c:bd3a:1506 with SMTP id
 h28-20020a63385c000000b0040cbd3a1506mr4483704pgn.366.1655930906955; Wed, 22
 Jun 2022 13:48:26 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 22 Jun 2022 17:48:15 -0300
Message-ID: <CAOMZO5A-+OUqu+gkG_xfH22qkO4XiGqkzf4qosFB_FJKu3F4iQ@mail.gmail.com>
To: fontaine.fabrice@gmail.com, Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=bQHuGf28ivcQCqfVLlKCPRNrqEssjDWRVrVVV4m9/H0=;
 b=kDaIDxr5bfKhDzPGuCm7GKuW8nNw3seMgu3KzqgcgITeAcGKmb8z43Ac9zEaGrlGP/
 8D8upAGzS2gO9MQSC8DFacc12QuWKTBRN7VFd7ccekvuVup5SnHqxk0M5Me7xDVoDb4t
 bY/DxmRa89Tng2BdoRQevtLz9MTRpqxg0EdCky18iQnMitBFZL5bKgxgBbnjQTxgfMI8
 zotMr2KpIKSa+jbPtltT00k18o9ioHhYVUId2AAPEBDortkzhrRideJdYZElFb/XojAz
 lQqa+PTedZ8bPwt2XqmkR7XKp644lNpGUUxAoPKLFqp1cRIdXLvU6UFXwptlTbRyqeNu
 mp2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kDaIDxr5
Subject: [Buildroot] kmscube build failure
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIGFtIHNlZWluZyBrbXNjdWJlIGVycm9yIHdoZW4gYnVpbGRpbmcgaW14Ni1zYWJyZXNk
X3F0NV9kZWZjb25maWc6CgouLi9jdWJlLXNoYWRlcnRveS5jOiBJbiBmdW5jdGlvbiDigJhkcmF3
X3NoYWRlcnRveeKAmToKLi4vY3ViZS1zaGFkZXJ0b3kuYzozMTI6Mjogd2FybmluZzogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24K4oCYZ2xEcmF3QnVmZmVyc+KAmTsgZGlkIHlvdSBt
ZWFuIOKAmGVnbFN3YXBCdWZmZXJz4oCZPwpbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KICAzMTIgfCAgZ2xEcmF3QnVmZmVycygxLCBtcnRfYnVmcyk7CiAgICAgIHwgIF5+fn5+fn5+
fn5+fn4KICAgICAgfCAgZWdsU3dhcEJ1ZmZlcnMKLi4vY3ViZS1zaGFkZXJ0b3kuYzogSW4gZnVu
Y3Rpb24g4oCYZHJhd19jdWJlX3NoYWRlcnRveeKAmToKLi4vY3ViZS1zaGFkZXJ0b3kuYzozODQ6
MzM6IGVycm9yOiDigJhHTF9URVhUVVJFX1dSQVBfUuKAmSB1bmRlY2xhcmVkCihmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhHTF9URVhUVVJFX1dSQVBfU+KAmT8K
ICAzODQgfCAgZ2xUZXhQYXJhbWV0ZXJpKEdMX1RFWFRVUkVfMkQsIEdMX1RFWFRVUkVfV1JBUF9S
LCBHTF9SRVBFQVQpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdM
X1RFWFRVUkVfV1JBUF9TCi4uL2N1YmUtc2hhZGVydG95LmM6Mzg0OjMzOiBub3RlOiBlYWNoIHVu
ZGVjbGFyZWQgaWRlbnRpZmllciBpcwpyZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rp
b24gaXQgYXBwZWFycyBpbgpbMTQvMjFdIENvbXBpbGluZyBDIG9iamVjdCBrbXNjdWJlLnAvZnJh
bWUtNTEyeDUxMi1SR0JBLmMubwpuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBmYWls
ZWQuCm1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyOTM6Ci9ob21lL2ZhYmlv
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQva21zY3ViZS00NjYwYTdkY2E2NTEyYjZlNjU4NzU5ZDAw
Y2ZmN2Q0YWQyYTIwNTlkLy5zdGFtcF9idWlsdF0KRXJyb3IgMQptYWtlOiAqKiogW01ha2VmaWxl
Ojg0OiBfYWxsXSBFcnJvciAyCgpBbHNvLCB0aGUgYXV0b2J1aWxkZXIgcmVwb3J0cyBhbiBlcnJv
cjoKCmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzg5YzQxODJkYTQwZGUz
MDgxOGNkMTRlOGU0OGM1YmU2MzMwMjQ5MDUvYnVpbGQtZW5kLmxvZwoKQW55IHN1Z2dlc3Rpb25z
PwoKVGhhbmtzLAoKRmFiaW8gRXN0ZXZhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
