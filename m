Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D40CA9EC5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC55C40650;
	Mon, 12 Oct 2026 06:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygFV4Qhu8k0O; Mon, 12 Oct 2026 06:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 17DFB406B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786365;
	b=FWX5/6wrUWzdoIO7fTB40vmfl+qZt5oNx/AYD2bVzrPgcpfdfqYUle7sLufGZDp5HkA2
	 xjNcN2ZlWYvOh0pWE0eZ51+tBh2y3xDJxu7cM7ykkEzTn92Owh+bH3qNWGQUa2Y7XEDmM
	 CCNsQr1t4TYtHm5QQJp1nKLuOG15pk4ty5WsmLsT7rW7L6eiszmr5c2W10Sw6XVh+GbW5
	 1jqbmOwMk2lBleR8d4iNJiYfErAOu3qZuJ6mal7WaqNnhbMr4iiD566rRmBT6xNJnlfm8
	 KGkGviPRmCoAfam31Al2NG1vLOU+B4q8imEeBy0OX2FIhhqlQMu3BYP5hzrL2tR/OJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786365;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=j46heMwkwVoxUzMwJxgfJlE6cgU+VZtX3ReX7KaqJBU=;
	b=XUa/+5tK5Pg/Uj0tjSXqlrAX5FVENzcTjzC4ohxr9XVu3MAHz2vx6lPjRCct48mH8VHk
	 hLYkPE3SUILtbmBHAQRXspXRN4cT/+rJ3ptsLH4AqmY3dkEQr0JLg7iyIqwbyxF9CqU+q
	 J3slrAfxq1KVNUgkQcQU8AZvzAjNjA9n7BDNBnxIQuET2oebDbdH1qjqfSgUSW/suOXHj
	 PGe284T2BJMJayKAdVEcNnCJ7Y2/GHpWvvVGp21Jj49d2n60cpdKiQt2hVq9aaEiF0C1W
	 Wc7TkN+W8KGgA3jGxWNlk2v8Zss1VzKVz9iy0ZManOWAhgAJqSi8YwWV8ZxwLj7da8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786365;
	bh=j46heMwkwVoxUzMwJxgfJlE6cgU+VZtX3ReX7KaqJBU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+Lua5uQDYZBFCLAVHjULepzK4vESTTQIbqFeB77flQunq1PPtSANzGSZFrZ9nNQ7
	 o/h3mhIHkdw+fFNWpJxDv+HTFf4Y/0/m39Gje5VXCUH2/DW79SspENmRBXlpKpXVYy
	 pC6C4HbM90H9ryVBXZFE0XX0r4m4CWq5+Xo8PDmgA/6aFe2dMB4ULfTygXQCOc925R
	 b89mG/Me4hWBA4H9EOk1Mzah1q2xVKlRNsOLkFlwKP5KqYfkw4HSjz/+3dL0bJD19N
	 CCeFBTppXBtKhzdYEYUWuD2pnWvurKQLZWnDn9SXsiL2IBc1XW9u6oQyjAP3MWB5/B
	 TSulsYI4VVfDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DFB406B0;
	Mon, 12 Oct 2026 06:26:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37824380
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2882780CEE
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ykh-7rKVHnB for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86F3980CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786351;
 b=bVU6MzpXeV2NLfj8mg5j9KUSt0eW2BYkTKINoqETNMQ0gwfsOEX/3hIhSMRYq3oDGVsk
 ni/nlCxqIPEa5zGArDzJWv6z0oa30QO6fux3tyKmGis5LtNj6NxToHGM2iu0EHvvAGs5D
 pp9Ga9PAQusH6mU4cF6JYrsoPAjrfxDComWSKXy0kwWrPS/MriWPBePw3F9yNtKmiM94J
 hrDbvEByTgCzG4hML7nhk0d5HFP4El6ImoHJEO3jZsGX8ntg7itNPvT5QuWaJZ4pNftNo
 6reXaYL4jxhjKX0ZQLOR4VIHJSpXZ2VRToaXlsnw+Qt+xZjM9qiZy3Z/HM3Ahn65wWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786351;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=g9K8MggtPcF1n4sqG9NnPWyGUZXC/YyWuHy69q1d2fM=;
 b=fgBMOScW95ErRiDQbymuVjO43kT2UbhTLFnhKf6O5ksVXNfoEysMLxTWkiMPJmC4calj
 ivQ2qywM+faN6keXLxrr9jyyPKkWcLF7+ntFZL1v7KpVRMhVdjwFkTuNspAA9+nhbZLVP
 ZSbzPtpdm2uBSJsWbRf3KgARh6TBXizsSBhHRMGMRkotgxbhwG+pvkcXl+2YPQXFs1zgD
 4UTvbNC8Ur1sHn9RT/hMMUYY0CCcZt0NSaifPu5yE+nUBl/PgzbdjWR+Mkimvdz7+eojb
 AfqrOHnN3Bi9WIeYt/ZlKE0AW22kPt0rBET0sdlngdK9MSI10n7e8CtQ+hij6yO5mPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=tFOsa5ZX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=tFOsa5ZX
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86F3980CEC
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso12532655e9.2
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786349; x=1792391149; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g9K8MggtPcF1n4sqG9NnPWyGUZXC/YyWuHy69q1d2fM=;
 b=tFOsa5ZXqaaa/vEmkgDX4H1VaN9XxqmHcXhivGDMRAGRgJSEWBxbmWhHEKRK++dgMH
 oexbqymOf5FryBgBl9J4Apc0a60jxlnuWeNwWc2ve5/sjOwVXfd/kyIyIe8kCynaXAwg
 eV4nmFYyTchgJRu6HdKkYnDu9twY8RtpyYGChu4pkiJknTO/p7eL0lLJyumEPEg+W1dm
 YpCAhf5guJPGFTeSrs1vm9YpuAdr24Z0xYgXHnhQQu0p2Q44xmRTcIWaxZsvVhwPF134
 KUCDn5oIkWi4Zm6F6UflD4ly95F6AmK20iyDKDFBjqY/V+PqzttBena7ir+BsTlcSRsF
 J/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786349; x=1792391149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g9K8MggtPcF1n4sqG9NnPWyGUZXC/YyWuHy69q1d2fM=;
 b=2M4ZdCfcr7qJRHvwJE/MjWJ37Yr/yfWY3wK8w6/vTCz+e5AVQXNBR1D+zwX+SrU51/
 X/tO6bROd6LY2NyZMK10Pyea3sr/IhfqrdUxdNgT6qanlZe0WUrPKJBJtAfNPhPGYEdC
 hJSC4GclA76uIoc6GNqdfE+/JmG4kRMwj3vZMXT4KkZOOqnQGe9/sq2Uw4ZOAGCsP/Si
 Tc2hxSzcXMDwZeGxhh6vCyHyMaB5UTq+p1WnzZzM0uF080qA9fwHhFb8KAu5T60iT35i
 pmK+dlntmufBSzoAdIM7zY0WUa1irOgRs3VYox7SPI/A2LRzCjszBHyFndXXQmCPazBL
 P3XQ==
X-Gm-Message-State: AFq9FYJ5s9waEXY2hO8Fx+9iwtIM4qUFGvm0HnPOZQFFi8MKtWdGWmnT
 ztfMqg9Creh+5s7U95jtaBOdKadyxmZgtEVRdy76xP0+GveGhaWAS6AVNjkBrQ==
X-Gm-Gg: AYBFou1kdgzpEiSdJ/p1+lGuttz07fSyml+DwICn8HUR/9YuZmrfgu24I9sRVkJvek0
 2NZlCUMV54GrKe6+IGrwkmJdEZ8d3yE6C97puA2oCE226I5SlxAgKQePNQFZ9YZjT2lMofYdC1g
 ALI/9rCJ2d1eMmb+VVtBZ/d7fdDOoTg0i9RVH+gN9VxLlvfKvLIxoHtGAJhRp8Udhow5h68kUJC
 pmtIZK+OmBW5tBR0V1LUY/eZ58M/NLMgrf4gC8C9Gc4/6jqSpWusxWDWYWYEl9C4WqiL/exkgZv
 GACsMhvqblQFHurOMkllgCE9EW8NKsiqjDxOlg7jXbEYukxjy0Edx2bIvht+R+QGtDE9l5fG05D
 pJ6Msuopz6LoJMbGnaAwdjCNGaqXJhd21pk/RL2FtKzkJAhk6cD13nq1VHNncmi9qt/7Y0kj1qG
 jcqWoUvxDYb+g4BTcw6XIA1lrR20Bil0+UAAQ9pgJdwx13FIN3UEoem1buab//YGW/h/Vf2JTRc
 CXURmel/r51Pt5jCmCIpONDK3vT4rhgGTfcNM0i
X-Received: by 2002:a05:600c:4e89:b0:4a0:22d5:908c with SMTP id
 5b1f17b1804b1-4a18e4a4976mr174119655e9.12.1791786349077; 
 Sun, 11 Oct 2026 23:25:49 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:48 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:35 +0200
Message-ID: <20261012062536.78874-10-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/10] package/perl-sys-mmap: bump to version
 0.21
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-sys-mmap/perl-sys-mmap.hash | 6 +++---
 package/perl-sys-mmap/perl-sys-mmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-sys-mmap/perl-sys-mmap.hash b/package/perl-sys-mmap/perl-sys-mmap.hash
index ac4184b08..d38982983 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.hash
+++ b/package/perl-sys-mmap/perl-sys-mmap.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  57172ce9b33c04de460b4e7ad68d2e9c  Sys-Mmap-0.20.tar.gz
-sha256  1820ce2c89f1ab7357644f8db0f49f142f54526250fb1e235db10aa80f15e2cf  Sys-Mmap-0.20.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  54b46bc153c3fd36dba79b7bab2502d8  Sys-Mmap-0.21.tar.gz
+sha256  fdec18081928b0b3ff688ec8b5d2d9bd1ffc81c2c3eb1fb3c1c56aac48a96f4c  Sys-Mmap-0.21.tar.gz
 
 # computed by scancpan
 sha256  4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c  Artistic
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
index 5e0814526..5f22b9c8c 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.mk
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SYS_MMAP_VERSION = 0.20
+PERL_SYS_MMAP_VERSION = 0.21
 PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
 PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
