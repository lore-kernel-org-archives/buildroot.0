Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5CC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E195141773;
	Wed,  1 May 2024 21:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1uRsCUpwF-T; Wed,  1 May 2024 21:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 949DF40185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 949DF40185;
	Wed,  1 May 2024 21:13:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B78901BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A490760805
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to-imtgHN5Db for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DA9E6078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA9E6078C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DA9E6078C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:13:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so48610765e9.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714598021; x=1715202821;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7a7ad8cHI0vcIAdSYvNwRAJZWveFqDRU1vSZ/rBWqHE=;
 b=ny/ScwPf6SGXXNJFy5LnLyGjya2e7YSA9ywefapsMkDnqJgxYBTHFZeuNxetdBUVGG
 o/dQCtq8aQ2QQEp804RJ11khZhFJUZGEYKeHS8O7XzBoQ22drbZCEJxp3kw0uda9JwP7
 63M0Tac+dXA/mnPBUZaIBj34aMdDBY5deIkShZTyFgVUbOXrs6nRdVwb48NW4B6gHLBa
 X8V7+eKJba3tUtS5hAGHZgbUuVNarEGuSPtIxiF29HVBwlvzFvA7cUaMBEnyNMCA/iy/
 LThZaUFl0OqDyLUoKvLGZS5nVEePUaVnQH2voiDoItp9DZo4EwRPgPmqvRyHJktLEv0Y
 y/fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuL07HEvgdKmZbPhwXV9ED2t/3546BYyufCoH/o5n9WvRwPS2RzmaH6PY6BskGseraJE5pIhzCaNYPm1Yi0RcuHPDzV9Odsg==
X-Gm-Message-State: AOJu0Yy4pA0L1kIa8E8VXTC2ntiQJGwE+XtPxV5WY40v3mbiz5ergM9R
 yajEO8vx5omGG3p19tgdp5hiZ0TF77JihYNjUSU74Poc88qFhiCMSy9AmehOX/g=
X-Google-Smtp-Source: AGHT+IHkhsK6ukFRyv/Ig2WICNroCSxEP2GrhG7DTP4SQC/LGc3lhXhawWRS+Jf6qLgU4brrnsUNIA==
X-Received: by 2002:a05:600c:2294:b0:41c:f64:2f5 with SMTP id
 20-20020a05600c229400b0041c0f6402f5mr2491307wmf.36.1714598021070; 
 Wed, 01 May 2024 14:13:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b0041c130520fbsm3345710wmo.46.2024.05.01.14.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 14:13:40 -0700 (PDT)
Message-ID: <c346128b-2e45-4e71-8adc-6754e1629a5a@mind.be>
Date: Wed, 1 May 2024 23:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1714243078.git.yann.morin.1998@free.fr>
 <fac4dda319388b1d32d2f105ba29d47e68c41f4f.1714243078.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <fac4dda319388b1d32d2f105ba29d47e68c41f4f.1714243078.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714598021; x=1715202821; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7a7ad8cHI0vcIAdSYvNwRAJZWveFqDRU1vSZ/rBWqHE=;
 b=DTmYyUIi9TuucZoT/Zi13jer4tDQlCqJkIu7YrMIsmp+CJYXwrdTX4NtDZx4iL+8dL
 W3A75wYsO+fuEohdl8iTaq3xUKJ7e6saV3x8NFfgsPhxRetsVGUpoRY2rIao+L5DAWc2
 hrA015m6Ajv7ksd1wfyuTPfDmw8hIRAP0p9Ti+mGYvaEjui3QS9xYMjFWwJS2zEHOP7N
 O4jbvXoUPVD17cC+KmHTPRLv+A2MfztZmdBanOSocvF5ih2VV5JPIsQ9AYQxIUrY3p+c
 a97fMh7owVFCU7CKMO1Dksh0uiGq5NRDxpAK++ob4/PEOhfjQTLbR0hJKhfrd7L2djIZ
 x0Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DTmYyUIi
Subject: Re: [Buildroot] [PATCH 07/15 v2] support/testing: add test for
 export-subst support in git-download
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2024 20:37, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   .../package/export-subst/export-subst.hash        |   1 +
>   .../git-hash/package/export-subst/export-subst.mk |  10 ++++++++++
>   .../05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
>   .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
>   .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
>   .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes

  Since the git repo is included as binary, we can't see what is in there. It's 
basically the following commit:

 From 0fdb95cf4f3c5ed4003287649cabb33c5f843e26 Mon Sep 17 00:00:00 2001
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue, 12 Sep 2023 23:25:48 +0200
Subject: [PATCH] file2: test export-subst

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
  .gitattributes | 1 +
  file2          | 1 +
  2 files changed, 2 insertions(+)
  create mode 100644 .gitattributes
  create mode 100644 file2

diff --git a/.gitattributes b/.gitattributes
new file mode 100644
index 0000000..05482df
--- /dev/null
+++ b/.gitattributes
@@ -0,0 +1 @@
+file2 export-subst
diff --git a/file2 b/file2
new file mode 100644
index 0000000..6828f88
--- /dev/null
+++ b/file2
@@ -0,0 +1 @@
+$Format:%H$
-- 
2.44.0


  I think it would be worth to change is in order to test that no recursive 
expansion takes place. I.e., use this as the commit message:

Subject: [PATCH] file2: test export-subst

Test that strings like $Format:%H$ are expanded when the export-subst attribute 
is set on a file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>


And in the file, put this:

$Format:%B$


  I haven't made this change though.


  (BTW, another nice change would be to generate the git repository on the fly 
from the test infrastructure, based on a series of patches that are git-am'ed 
and with GIT_COMMITTER_NAME, GIT_COMMITER_EMAIL and GIT_COMMITTER_DATE values 
set to fixed values.)

  Regards,
  Arnout
>   .../git-remote/repo.git/refs/heads/master         |   2 +-
>   support/testing/tests/download/test_git.py        |   4 ++++
>   8 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
>   create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
>   create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
>   create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
>   create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
>   create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
> 
> diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
> new file mode 100644
> index 0000000000..1926236993
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
> @@ -0,0 +1 @@
> +sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-br2.tar.gz
> diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
> new file mode 100644
> index 0000000000..8d7d3ff970
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
> @@ -0,0 +1,10 @@
> +################################################################################
> +#
> +# export-subst
> +#
> +################################################################################
> +
> +EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
> +EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
> new file mode 100644
> index 0000000000000000000000000000000000000000..404bb1397cf8ec58f5e21a86e311e3b3884a55d5
> GIT binary patch
> literal 35
> rcmb<m^geacKgeK9ipS|Qo~A(_Yc)>jYhBdU^VQOO$iz_nm{Sb^1FsEl
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
> new file mode 100644
> index 0000000000000000000000000000000000000000..3a4cc4ead6ce5a7e90a38e025896bc66da85a242
> GIT binary patch
> literal 197
> zcmV;$06PD80j18pN(3<!Kw;}V#qDK=<mP`7v9YjFK`YBl?#(*jBugd>?%TWg1cK#h
> z4qtBDwhqwJ-;B--j*`L!t!LwllOZ~Vg`-cw8%Ibno17#|aY~)*fP^|Mib|${mW-#M
> zO)5HDL~WGM!6-#hl1S(A**birTH$eq=hwHV7r47zbKY8C>#Sl759Ml@OTP!@qOn#-
> z6W~^&lp_B^2mfOs%KF84fWi9!{yw!nrv1F^Lx}hFSed3)%CuY#e^rVfqgY-S2z_Jg
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
> new file mode 100644
> index 0000000000000000000000000000000000000000..fdc4a37651a4ad195f8f106f3496d5df0b3bb6a5
> GIT binary patch
> literal 28
> kcmb<m^geacKghr&DWLGQ{wZIbjX_@n9x^f5#jv&l0Hs3<3;+NC
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
> new file mode 100644
> index 0000000000000000000000000000000000000000..932f73602f5927ae985829cdd301b1ed40350137
> GIT binary patch
> literal 112
> zcmV-$0FVE80V^p=O;s>7FlR6{FfcPQQP4}zEJ-XWDauSLElDkAVD-@bZnC*Bx@F#%
> z#UfR+rR950SwK~$W#*(ZJf9QSKh0&bCYQsEj;oGV#dUqLSCQn67&0_|^q%JH*m1VF
> S>l%yCbKk02!Y2Svbu0l+hckcx
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
> index b6bccc1c17..b6e37260fb 100644
> --- a/support/testing/tests/download/git-remote/repo.git/refs/heads/master
> +++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
> @@ -1 +1 @@
> -a238b1dfcd825d47d834af3c5223417c8411d90d
> +0fdb95cf4f3c5ed4003287649cabb33c5f843e26
> diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
> index ec5b8f3fdd..ba52e03ef5 100644
> --- a/support/testing/tests/download/test_git.py
> +++ b/support/testing/tests/download/test_git.py
> @@ -56,6 +56,10 @@ class TestGitHash(GitTestBase):
>               self.check_hash("bad")
>           self.check_hash("good")
>           self.check_hash("nohash")
> +        self.check_hash("export-subst")
> +        with open(os.path.join(self.builddir, "dl", "export-subst", "git", "file2"), "r") as f:
> +            blob = f.read()
> +        self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
>   
>   
>   class TestGitRefs(GitTestBase):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
