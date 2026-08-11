Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F846C5CFC1
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC8260828;
	Tue, 11 Aug 2026 11:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1dkmLAhaiI8; Tue, 11 Aug 2026 11:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D5760806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448583;
	bh=E1hMzsqMeyPN1N8oMOjilZ8G8sZPFqs4YZXiueniK2Q=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=jkOGgi4f4R14f5ciPeRiKfcw/wenlna5dYiSTKuiOgfLp/8DeN/qTtEKYv/eUM2U4
	 bI66kRi+HVeYgr0bSNV5ZQVnILBS4MwzjBJqbEaJRyi0SKDmLHF7as2k4RLq4Mzmzz
	 jxgyHvLJDFAh8LvBVIqV7eZH5c8t1vTcBMLE+SjZrfZbXHdu4nCEyiOZzGuCIOZj4h
	 BXXRdXKeiAkE0Pbi+o8nATgMx6UXk50V/psaOiePq7bLz1IhHACkAlkFwB64KTqBsp
	 I8q+TNxMZFACX/mn5rJh0wmIe1xvhvEmxpxNFs0be+DQbb0S2txPh21o4kkMZTFce4
	 tyYtJsPwo+8zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D5760806;
	Tue, 11 Aug 2026 11:43:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C0A259
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C214400FF
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ss31n1cFAkoH for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF2D540063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF2D540063
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF2D540063
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49978908b35so3426925e9.0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448573; x=1787053373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=PyyBQRELkAftZOub+0kYf1vcXtBribY/VGIQL8rmxi4=;
 b=a/hGilTBciwMHmiZek7FInvGS5qMVeYz4dd29nA/lV7W813IrcZAzdKzkFXnUbYQGT
 4lBPrFnK9+Tu/oiLlY+WvIefX+nRWXryAr4aELzfKdBfP/Hj4SKt7iyvm5pDzaK5n2x0
 zFUO4Mlwy6xGqRWTSHDUS6yeB7SiRFTTUewLeDF1KFCwlxHW8HSa+7M4MjiN+HCE9LZH
 Jl5dSZtPUtry6+wVQx2IcOkTvL07YZHifcuJ4t0EnlcvarAwvZca4MTcMc9ymj3WAc0Y
 IP5qZbmIu/bh3JKY/BeVPPHNtk4GgAeW8FUGoA/TRnKVnYdDMFxwXe8oBKYd6aY3FBxQ
 4PWA==
X-Gm-Message-State: AOJu0YzK2bUAxOVJoNwcS7LV1ufqq4G0meBeei2AYDLSTxmMeKpBbsPg
 UWGUrYeioiVhiKBB8Uq1KCC5FasR9xHAiLso5vAK2y4vT0R0796j7P2fdJtm/672WyI8cgfACxH
 iar7e
X-Gm-Gg: AR+sD10opliVfFXvM1iQLXp1gnZVqeIdj2RmxjV3RthOFZgj+/QaaGSi/73oDs+qJkN
 +pVRWUK9JZ7KtWMJjTfdmm6dcEJQfH1aZg+KYd8ITaHWJtyDkMAdePdFfe9r1J91wLqBkCN6wPa
 hCt+B5KT5slFeT2z5XpKZS/v+b2w3iaHXNY0EpIE9EKK3adVqG9drGgXPvCUndL6ZUsjE4DTYFz
 MW0nNtxcE1YszpkJyfXk8IPIcAJV87uvH5IjPpU8Mrd+gx4taB2p15Ac6Hbi8g5q44pTngV8+/h
 INwf3HEeV/j0ObVnNt+rA0U7ZVWCG6ba7YHJik66/BQNE7THDLdrKZyogmFa3o/bcMgWIG1lWrB
 7XvGXpEWEIW710qS0x7pq0pZciCqKBET2vXYjgMs0TkQmv/1mBWRCr6hxnobXIxme6avC+KKl5h
 2qKbuPLO01V7Lt22Ou6x67Gi53KfKvbRtqSC0Xrk2YUfWZfcDqpwgzAw==
X-Received: by 2002:a05:600c:8595:b0:499:4d4d:822a with SMTP id
 5b1f17b1804b1-4997847d2dcmr45021355e9.17.1786448572656; 
 Tue, 11 Aug 2026 04:42:52 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740a6f4esm57122455e9.2.2026.08.11.04.42.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:42:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:42:49 +0200
Message-ID: <20260811114250.116254-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811114250.116254-1-thomas.perale@mind.be>
References: <20260811114250.116254-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448573; x=1787053373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=PyyBQRELkAftZOub+0kYf1vcXtBribY/VGIQL8rmxi4=;
 b=PJNN0L8enbc3B4GZ6Y6ZRvZmw9RkW59ncIq4H6ryuvYI0pHuvbsJRVhoMV2+IpsdMh
 7h4zyJJTAtTm3mW2kW3RimAZo1Dtj6bIAJdOuTjWUcBfS1uQmDlUFLQGwKBSk7Vnv6c+
 JjXnkytc3m9O3D6BUzFrNhnd7idWaB2/5TqJzFaiREQwI8K9WDQtvgsoM2+PpH/CobGv
 XgH9pVS34XvzZcRXGQf/8VbHPTtAMJHDiYGP9zDrntA0jbQ5eZBiHgBdjilDNlAhlXlU
 G+Rc4A6t22BNIHXM4UERgKEqvnUEz73dL+GP6p2LrMUfkO83oCBImmqw2YGzbFfVY5GS
 UxYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PJNN0L8e
Subject: [Buildroot] [PATCH 2025.02.x RESEND 4/5] package/busybox: patch
 CVE-2026-2615{7, 8}
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Based on the work of the OpenEmbedded community. This commit patches the
following vulnerabilities:

- CVE-2026-26157:
    A flaw was found in BusyBox. Incomplete path sanitization in its
    archive extraction utilities allows an attacker to craft malicious
    archives that when extracted, and under specific conditions, may write
    to files outside the intended directory. This can lead to arbitrary
    file overwrite, potentially enabling code execution through the
    modification of sensitive system files.

    https://www.cve.org/CVERecord?id=CVE-2026-26157

- CVE-2026-26158:
    A flaw was found in BusyBox. This vulnerability allows an attacker to
    modify files outside of the intended extraction directory by crafting
    a malicious tar archive containing unvalidated hardlink or symlink
    entries. If the tar archive is extracted with elevated privileges,
    this flaw can lead to privilege escalation, enabling an attacker to
    gain unauthorized access to critical system files.

    https://www.cve.org/CVERecord?id=CVE-2026-26158

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...tar-strip-unsafe-hardlink-components.patch | 198 ++++++++++++++++++
 ...rip-unsafe-components-from-hardlinks.patch |  38 ++++
 package/busybox/busybox.mk                    |   4 +
 3 files changed, 240 insertions(+)
 create mode 100644 package/busybox/0017-tar-strip-unsafe-hardlink-components.patch
 create mode 100644 package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch

diff --git a/package/busybox/0017-tar-strip-unsafe-hardlink-components.patch b/package/busybox/0017-tar-strip-unsafe-hardlink-components.patch
new file mode 100644
index 0000000000..604f1a4f9b
--- /dev/null
+++ b/package/busybox/0017-tar-strip-unsafe-hardlink-components.patch
@@ -0,0 +1,198 @@
+From 3fb6b31c716669e12f75a2accd31bb7685b1a1cb Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does the same
+
+Defends against files like these (python reproducer):
+
+import tarfile
+ti = tarfile.TarInfo("leak_hosts")
+ti.type = tarfile.LNKTYPE
+ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
+ti.size = 0
+with tarfile.open("/tmp/hardlink.tar", "w") as t:
+	t.addfile(ti)
+
+function                                             old     new   delta
+skip_unsafe_prefix                                     -     127    +127
+get_header_tar                                      1752    1754      +2
+.rodata                                           106861  106856      -5
+unzip_main                                          2715    2706      -9
+strip_unsafe_prefix                                  102      18     -84
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157
+CVE: CVE-2026-26158
+Upstream: https://git.busybox.net/busybox/commit/?id=3fb6b31c716669e12f75a2accd31bb7685b1a1cb
+Upstream: https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/libarchive/data_extract_all.c      |  7 +++--
+ archival/libarchive/get_header_tar.c        | 11 ++++++--
+ archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
+ archival/libarchive/unsafe_symlink_target.c |  1 +
+ archival/tar.c                              |  2 +-
+ archival/unzip.c                            |  2 +-
+ include/bb_archive.h                        |  3 ++-
+ 7 files changed, 42 insertions(+), 14 deletions(-)
+ 
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 8a69711..b84b960 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	}
+ #endif
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
+-	/* Strip leading "/" and up to last "/../" path component */
+-	dst_name = (char *)strip_unsafe_prefix(dst_name);
++	/* Skip leading "/" and past last ".." path component */
++	dst_name = (char *)skip_unsafe_prefix(dst_name);
+ #endif
+ // ^^^ This may be a problem if some applets do need to extract absolute names.
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 
+ 		/* To avoid a directory traversal attack via symlinks,
+ 		 * do not restore symlinks with ".." components
+-		 * or symlinks starting with "/", unless a magic
+-		 * envvar is set.
++		 * or symlinks starting with "/"
+ 		 *
+ 		 * For example, consider a .tar created via:
+ 		 *  $ tar cvf bug.tar anything.txt
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index cc6f3f0..1c40ece 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ #endif
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->name));
+-//TODO: do the same for file_header->link_target?
++	strip_unsafe_prefix(file_header->name);
++	if (file_header->link_target) {
++		/* GNU tar 1.34 examples:
++		 * tar: Removing leading '/' from hard link targets
++		 * tar: Removing leading '../' from hard link targets
++		 * tar: Removing leading 'etc/../' from hard link targets
++		 */
++		strip_unsafe_prefix(file_header->link_target);
++	}
+ 
+ 	/* Strip trailing '/' in directories */
+ 	/* Must be done after mode is set as '/' is used to check if it's a directory */
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 6670811..89a371a 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -5,11 +5,11 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
+ {
+ 	const char *cp = str;
+ 	while (1) {
+-		char *cp2;
++		const char *cp2;
+ 		if (*cp == '/') {
+ 			cp++;
+ 			continue;
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp += 3;
+ 			continue;
+ 		}
+-		cp2 = strstr(cp, "/../");
++		cp2 = cp;
++ find_dotdot:
++		cp2 = strstr(cp2, "/..");
+ 		if (!cp2)
+-			break;
+-		cp = cp2 + 4;
++			break; /* No (more) malicious components */
++
++		/* We found "/..something" */
++		cp2 += 3;
++		if (*cp2 != '/') {
++			if (*cp2 == '\0') {
++				/* Trailing "/..": malicious, return "" */
++				/* (causes harmless errors trying to create or hardlink a file named "") */
++				return cp2;
++			}
++			/* "/..name" is not malicious, look for next "/.." */
++			goto find_dotdot;
++		}
++		/* Found "/../": malicious, advance past it */
++		cp = cp2 + 1;
+ 	}
+ 	if (cp != str) {
+ 		static smallint warned = 0;
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 	}
+ 	return cp;
+ }
++
++void FAST_FUNC strip_unsafe_prefix(char *str)
++{
++	overlapping_strcpy(str, skip_unsafe_prefix(str));
++}
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
+index f8dc803..d764c89 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
+ 				*list->data ? "hard" : "sym",
+ 				list->data + 1, target
+ 			);
++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
+ 		}
+ 		list = list->link;
+ 	}
+diff --git a/archival/tar.c b/archival/tar.c
+index 9de3759..cf8c2d1 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
+ 	DBG("writeFileToTarball('%s')", fileName);
+ 
+ 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
+-	header_name = strip_unsafe_prefix(fileName);
++	header_name = skip_unsafe_prefix(fileName);
+ 
+ 	if (header_name[0] == '\0')
+ 		return TRUE;
+diff --git a/archival/unzip.c b/archival/unzip.c
+index 691a2d8..5844215 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -860,7 +860,7 @@ int unzip_main(int argc, char **argv)
+ 
+ 		/* Guard against "/abspath", "/../" and similar attacks */
+ // NB: UnZip 6.00 has option -: to disable this
+-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
++		strip_unsafe_prefix(dst_fn);
+ 
+ 		/* Filter zip entries */
+ 		if (find_list_entry(zreject, dst_fn)
+diff --git a/include/bb_archive.h b/include/bb_archive.h
+index e0ef8fc..1dc77f3 100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
+ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;
+ 
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
++void strip_unsafe_prefix(char *str) FAST_FUNC;
+ void create_or_remember_link(llist_t **link_placeholders,
+ 		const char *target,
+ 		const char *linkname,
+-- 
+2.50.1
diff --git a/package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch b/package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch
new file mode 100644
index 0000000000..bcfbf5d4d2
--- /dev/null
+++ b/package/busybox/0018-only-strip-unsafe-components-from-hardlinks.patch
@@ -0,0 +1,38 @@
+From 599f5dd8fac390c18b79cba4c14c334957605dae Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: [PATCH] tar: only strip unsafe components from hardlinks, not
+ symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in
+tar archive hardlinks, but it was being applied to symlinks too
+which broke "Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157
+CVE: CVE-2026-26158
+Upstream: https://git.busybox.net/busybox/commit/?id=599f5dd8fac390c18b79cba4c14c334957605dae
+Upstream: https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/libarchive/get_header_tar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+ 
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index 1c40ece..606d806 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+ 	strip_unsafe_prefix(file_header->name);
+-	if (file_header->link_target) {
++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
+ 		/* GNU tar 1.34 examples:
+ 		 * tar: Removing leading '/' from hard link targets
+ 		 * tar: Removing leading '../' from hard link targets
+-- 
+2.50.1
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 91d3b69139..d3e0678200 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -32,6 +32,10 @@ BUSYBOX_IGNORE_CVES += CVE-2025-46394
 # 0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-60876
 
+# 0017-tar-strip-unsafe-hardlink-components.patch
+# 0018-only-strip-unsafe-components-from-hardlinks.patch
+BUSYBOX_IGNORE_CVES += CVE-2026-26157 CVE-2026-26158
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
