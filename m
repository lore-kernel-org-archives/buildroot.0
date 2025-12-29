Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3021EE92FE1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02223406A1;
	Mon, 29 Dec 2025 21:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THkVDhLRmOph; Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C4E407E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043339;
	bh=pk/EiLwgWHXteVT2RRmABLHtiEd2vy+5jPkJzY9JO4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=W7z9d0zZ5N+YAqcjPWeSNv/1U1Ead9jcnj7e5PirBtA0Nb+EDK83REDlOwVN9RhLS
	 uba8ZcVgVjtwCmLfu8yJuzwd8cZyuJSjwdkbp3Sgb7w4tmJ3FBUxJadC8TJVH/LzGS
	 8zzfEIDw7i/kJP/6/aze8Zz7qQfV7GKI4De3d/+KBC90m0/5/7D5YP/LjMVbZaEJKB
	 V0V50XZUWSl/UacLoiZN/Kpwl6am9IutxIPQc3f5hSMAzzISp6ygOZtCEQ2C+kjZpv
	 k0wuM3J4XkRU5iYQbcxB9emutvtvutkofmA3hvDv4/I5yW8Vb26n4zJLuu1+9zjRn4
	 wPJfmuycWpzRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C4E407E2;
	Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C8F1177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5203B80D6C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNds20D9qwOV for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:13 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6840E80D1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6840E80D1F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6840E80D1F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so61697845e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043311; x=1767648111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4D8zyz1HvsWlD2PdyysYLObkEZ+3LZ23gyubnSiw5E=;
 b=ZesTyyEhgReQ+JfUS0CFfUWdCD5hwDeUi6z0zIRicOHYxjqbntyaM3EOfCUfORDmy2
 agPSbXbPQw7Lhsc0wSZWqZbcV8E0XHJ5g7t8xufmmP9DvS7O+/zpjA04zxWEQ38J3cMl
 jfJfA3+08Ym2p16SsoEw8AkFZpxu2UMFSx7ZGNDgA/Soh0P/TN6lxD/bn1SSzFz4Ndsw
 7MkVGrNR8uq6mCy4ewDwonuxaMxIczVlTis+0Hc6ZVPUObrhxjYYqptDtLnmx30khyPn
 LlmR4GcD3wguOu80BfjBUZCgfrFmzPi8Ls8HpKI7x6jSlmuySD6xBBtHFinnRTjL2s4J
 sMig==
X-Gm-Message-State: AOJu0Yw16oBZgbX8dD0qS27p1KF++pG1rUnWrdzUiQWorQgYn5RCh9vw
 zs7TlkBrVWWNECElEhFxDI7AfIMznNQBgtarJRwxWo01hacqXR+1oN0P23NfYhiK9dFPzy+Nref
 a63BGhf4=
X-Gm-Gg: AY/fxX4MZ0mPIThwk70KaTBmoSUY6IpxgUJtZd7e4h+6jdHjl7dKBCKlEWeH0etb/Sw
 0eRQBECrDMS4snVV6eZrn86Pqu71oTpZ+AzRFahL5Wgw4HGwF/JhMB5jXBaPwev0w1TE6RGCi0N
 RZPWCLVMNTT+ZSZqNeBrHoT67ZGldE2RkUItZe9z1FIG/nj4NZVoDp8iNKg26Y2uodORkMctGyI
 f0U94Ydk1zE+G3Ze22ODv7/nqpobh+oqPwUcDL11eK5ceMgHMKNT1BF+QTNc+qAFmdzD94nyYe6
 NtuLg+H/XCKgQ39LeytoAlPAw+k3XYi7rHfBn5ZiOIsyD3NEeaRqEvYXh5UHqbuHxsA2lNc8/2o
 0DEgnCdd10lwhrJIzX8LaDzjcue7BrETC2AD1D5AH93u7NBcGfaVjc7F6Zpzafrmx6EuyVg6hKQ
 CojGCh0TCbJGIbgw==
X-Google-Smtp-Source: AGHT+IFYWJFktAb2yzVcGj1U/9NEc1dDUon0IeUJFlcPM6CIEBn7uNHvwc2JUCJabc+cJsX0pytTCA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id
 5b1f17b1804b1-47d195a425bmr365186255e9.34.1767043310769; 
 Mon, 29 Dec 2025 13:21:50 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:33 +0100
Message-ID: <20251229212149.167902-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043311; x=1767648111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V4D8zyz1HvsWlD2PdyysYLObkEZ+3LZ23gyubnSiw5E=;
 b=YkgUSkHxhSSKYEBhCIrJ9UGmStwB9ZpPi50Ad6n8aSEvEdgZNpUfVpili8HR5MGyiW
 F5uxxEr4Q7cawXng8PyKPNMDT0QCtGQNBEAiw0MBhu7jTekNnUXahx+tcQ7UZdiib7tU
 feFy48YIpSlV56ryXxeudEnoAGmRrva1W+Tb4CLQov319BXyIL8/cGz4klM5+PGXGrn/
 tVhm7GAzS8XLRXbH9+9Kw4rWBMJHG2KLYYhQVqZS2pJqH4Alr98la6P/ysqgBgBt8bDP
 9p5Jt41Cp/KX8ywDSbrVX2llwMdyx915Dgb/bh5eFyLypszTNDoC4ALTMI0tn5J4bUbO
 +L6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YkgUSkHx
Subject: [Buildroot] [PATCH 00/15] Remaining CVE_IGNORES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This should cover the remaining patches that didn't have a 'CVE'
trailer.

It remains 54 'IGNORE_CVES' that are not bounded to a patch. From those entries
we have the following:

- `unzip`: 13 entries. All of them are actually fixed by a patch but come from
  Debian tar.
- `sox`: 14 entries. All of them are resolved because we are using a more
  recent commit hash.
- `python-pip`: 1 entry CVE-2018-20225. This CVE is disputed won't be fixed and
  thus ignored.
- `php`: 1 entry CVE-2024-3566. Only affects windows and match on every
  existing versions.
- `openvmtools`: CVE-2021-31693 wrong entry on the mirror we use but fixed on
  NVD website.
- `mupdf`: 2 entries that are solved in another package but the entry still
  match on the mupdf version.
- `luajit`: 5 entries. Fixed upstream but not trackable because we use commit
  hash.
- `linenoise`: 1 entry. Fixed upstream but not trackable because we use commit
  hash.
- `libuci`: 1 entry. Fixed upstream but not trackable because we use commit
  hash.
- `libmad`: 3 entries. Fixed by a patch but come from Debian tar.
- `heirloom-mailx`: 2 entries. Fixed by a patch but come from Debian tar.
- `glibc`: 2 entries. CVE-2025-8058 not enough information on the db.
  CVE-2010-4756 match every possible versions
- `freeradius-server`: 2 entries. False positive the DB is not uptodate.
- `flex`: 1 entry. CVE-2019-6293 that won't be fixed.
- `emlog`: 2 entries. Emlog doesn't have a CPE id and match another project so
  they might be removed.
- `clamav`: 1 entry CVE-2016-1405 that only affects cisco devices but the CPE
  match on every possible versions.

For better trackability the packages that are patched with Debian tar could
actually be imported in the tree (unzip, libmad, heirloom-mailx).

From that point we will have three categories of vulnerabilities the one that
don't affect the package (sox, php, luajit, linenoise, libuci). The false
positives (openvmtools, mupdf, glibc, freeradius, flex, emlog, clamav). And the
others that we ignore such as python-pip.

Thomas Perale (15):
  package/xinetd: add CVE trailer in patch
  package/shellinabox: add CVE trailer in patch
  package/patch: add CVE trailer in patches
  package/tiff: remove stale IGNORE_CVES
  package/rsyslog: remove stale IGNORE_CVES
  package/postgresql: remove stale IGNORE_CVES
  package/pixman: remove stale IGNORE_CVES
  package/libssh: remove stale IGNORE_CVES
  package/libcurl: remove stale IGNORE_CVES
  boot/grub2: remove stale IGNORE_CVES
  package/glibc: remove stale IGNORE_CVES
  package/glibc: remove stale IGNORE_CVES
  package/freerdp: remove stale IGNORE_CVES
  package/dovecot: remove stale IGNORE_CVES
  package/cmake: remove stale IGNORE_CVES

 boot/grub2/grub2.mk                           | 11 -----------
 package/cmake/cmake.mk                        |  2 --
 package/dovecot/dovecot.mk                    |  5 -----
 package/freerdp/freerdp.mk                    |  4 ----
 package/glibc/glibc.mk                        | 19 ++-----------------
 package/libcurl/libcurl.mk                    |  4 ----
 package/libssh/libssh.mk                      |  4 ----
 ...x-segfault-with-mangled-rename-patch.patch |  4 ++--
 ...mmand-execution-in-ed-style-patches-.patch |  4 ++--
 ...-directly-instead-of-using-the-shell.patch |  6 ++++--
 ...nks-unless--follow-symlinks-is-given.patch |  5 +++--
 package/pixman/pixman.mk                      |  6 ------
 package/postgresql/postgresql.mk              |  4 ----
 package/rsyslog/rsyslog.mk                    |  4 ----
 ...9-fix-for-broken-multipart-form-data.patch |  4 +++-
 package/tiff/tiff.mk                          |  3 ---
 ...netd-ignores-user-and-group-directiv.patch |  2 ++
 17 files changed, 18 insertions(+), 73 deletions(-)

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
