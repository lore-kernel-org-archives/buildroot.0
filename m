Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0794C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD4E40B65;
	Tue, 14 Jun 2022 16:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TY2AUNWPtFGA; Tue, 14 Jun 2022 16:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B513240B73;
	Tue, 14 Jun 2022 16:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 153DE1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 132D8415D5
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHZXkVVeo4ZT for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B881410BB
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:48:07 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b8so12445732edj.11
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dS6Az5GdZwzc+HVwAElEaOUa+iqST3lgg/xrmF2h4pU=;
 b=ePtzmpW5T1vl0u9OHKrz4uQmsRqExJL4jdeZNE2cPKM/q5LP4b5Sliy6PP8i4d/KSm
 xXL4Qqpe4vbFrHDllASN95GNk3TYt+UgBYwx3ddtWszZdNp2WG7kt8V6c4mPjvkXMbm5
 OroGlLvvprGPAkRH8luxFi6+1Jqx8es8AYwZ68G80OEsZnpGTdFWDn84uILE5Wyyyyvy
 Wfba6+Qb636n72G3vkkpTr6tzN5q4uUbhHJbSN4Xd+TpRWNt7jnQB1JlxcDGYAQ/YZth
 xuLGhaxAudKyuFybPVZQI7Dr1S950+/F4hh+Dam2ixMMeOLUfWMP57QS72g+Hr5Dkd6o
 wxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dS6Az5GdZwzc+HVwAElEaOUa+iqST3lgg/xrmF2h4pU=;
 b=22RGH5aP+R9SmZbN0G4QXDcJ0pvuOhW293x+WGb3lkJBu026gYBSuS3kvpDmue+iIC
 MmHizwXKw2Inaiwvwmhmo+Vrs6w07auW0XJ+NCRePYIjJ0LPI8YZld8bAHl5nBi0DSQB
 1lx5VvYd7yhcW4TyQK2mrdv8x9QXx/SZu8jFBU+w69hM+buZPg7aRuWWzX6hZ6iVaq0P
 VZ3EJwCwKA7ATuCKQF1Yh3TvqE6yxs2HF2kTvc7uxj0ZEX677sFj4V1AmRLPPiH7KhN1
 c24st/PIZm5hC4Ezx8bpPvAA8Sk/gc0zLJEB3nFmemOCYgptdKxBZby4SuV5lP1K2Cww
 XCoQ==
X-Gm-Message-State: AOAM533oMf4T3CHuqePUd4HKwR1sBeG+kMX8nsXwMhCZ1yjgxD/ef3J8
 n8fl5Eayn5wi+fjPPCoo1hvUi4Z6C4e/ygg7
X-Google-Smtp-Source: AGRyM1sycY9RSdK3c6tH5TCYoqCA7aYL9wBrZi3kXStuDwc1fKFdfGGObdGreMPvIpPtv2FbSU1Flw==
X-Received: by 2002:aa7:d895:0:b0:42e:985:40f7 with SMTP id
 u21-20020aa7d895000000b0042e098540f7mr7062245edq.351.1655225285536; 
 Tue, 14 Jun 2022 09:48:05 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 o18-20020aa7c7d2000000b004335e08d6c9sm7372305eds.33.2022.06.14.09.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 09:48:05 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 18:47:53 +0200
Message-Id: <20220614164755.716683-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: add new test for
 python-jmespath
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgbmV3IHJ1ZGltZW50YXJ5IHRlc3QgaW5zcGlyZWQgYnkgdGhlIGV4YW1wbGVzIGZyb20g
am1lc3BhdGgncwpSRUFETUUgZmlsZSAoWzFdKS4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL2pt
ZXNwYXRoL2ptZXNwYXRoLnB5L2Jsb2IvZGV2ZWxvcC9SRUFETUUucnN0CgpTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogLi4uL3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ptZXNwYXRoLnB5ICB8ICA0ICsrKysK
IC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fam1lc3BhdGgucHkgICAgfCAx
MiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25f
am1lc3BhdGgucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3B5dGhvbl9qbWVzcGF0aC5weQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fam1lc3BhdGgucHkgYi9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ptZXNwYXRoLnB5Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmFlZmNjZDRmZDgKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ptZXNwYXRoLnB5CkBA
IC0wLDAgKzEsNCBAQAoraW1wb3J0IGptZXNwYXRoCitleHByZXNzaW9uID0gam1lc3BhdGguY29t
cGlsZSgnZm9vLmJhcicpCityZXMgPSBleHByZXNzaW9uLnNlYXJjaCh7J2Zvbyc6IHsnYmFyJzog
J2Jheid9fSkKK2Fzc2VydCByZXMgPT0gImJheiIsICJleHByZXNzaW9uLnNlYXJjaCBmYWlsZWQi
CmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9q
bWVzcGF0aC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2pt
ZXNwYXRoLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjgwZmQwOWZk
ZGUKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3B5dGhvbl9qbWVzcGF0aC5weQpAQCAtMCwwICsxLDEyIEBACitmcm9tIHRlc3RzLnBhY2thZ2Uu
dGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQorCisKK2NsYXNzIFRlc3RQ
eXRob25QeTNKbWVzcGF0aChUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgorICAgIF9fdGVzdF9fID0g
VHJ1ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCisgICAg
ICAgICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAgICAgQlIyX1BBQ0tB
R0VfUFlUSE9OX0pNRVNQQVRIPXkKKyAgICAgICAgIiIiCisgICAgc2FtcGxlX3NjcmlwdHMgPSBb
InRlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9qbWVzcGF0aC5weSJdCisgICAgdGltZW91dCA9
IDEwCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
