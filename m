Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7260C5B572
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 13:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2FF60A35;
	Wed, 12 Aug 2026 13:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZfPcuE-kB_G; Wed, 12 Aug 2026 13:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18F4F6061F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786542988;
	bh=wi+MjDkq/7Eih/TnwDePUVyfFRFkVLtHdy/+BEfOLbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2AE9xQc11MlceJOJWZO+tVn9BBdVnekT3Yyjo5Tv5oQt6lqRzlwfddCneVjGWZ2I
	 BvakaKDcnQICHIO91Shq8ek5eXZ6VuMDIyU7KlmQk8aCJkjU7xSSvZKVu/9taluyXH
	 PD4o0i9XfJADGE4C0KbxsAj2b/bnw7O5xBuOraMsDlD730mykODasvDEg0B3c47yYh
	 YpCPIqnDSLZH2fJ9jGf/ZTJxL+Y7WKIag1zn9TGbs/UAusn45jxgJtWtbNF3JyX4vG
	 9ZWoWQvZucPAl1DcSdkS9VBC5IzdEbuZyOs6LpE6m0GOe40XtXOe765Z66E4tLhJmd
	 zaGstDXofbTSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F4F6061F;
	Wed, 12 Aug 2026 13:56:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E9CE1B8
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 13:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70CC240448
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 13:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAcjfLuya3eG for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 13:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CCBA403B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCBA403B2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CCBA403B2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 13:56:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so8986955e9.1
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 06:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786542981; x=1787147781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Zv9L0VED5+6/hDT2RD3qpz7GSaKSLy+kUY6jAZZ7B7A=;
 b=ne0IJ35aiUmyuazuJ9TJQ7/tqWgaMuaqx/QDtTh1VWcIomcT4HWLSYxj8ogMi7EO5g
 yWb11SePhG4dUgQ50bzCbqAG1zFMT36iYkoMZEHpwNDUlXfwjalYMtmWjBfjna8ZltP3
 zqWgCneGD2JNUZnb49E2v9EfJLgevz3AERnEUX+7m+KIBwB2/O8bkwvAMr4CDWcwy0ts
 w9UPIGS53zDtCvHr06AgeMvIllFoMtuI45Ri1U9Qr8qWHto2rCWibKywfaewXcVDUTbh
 yQ/Ptx6FzaOxTLDzseGzcxpoQhDFOZWh4Cj23uLSNCsLK+efD6cj8M00t3VLP/2G/t2R
 IRxA==
X-Gm-Message-State: AOJu0Yz5WYZbV1ImdqOxK0F8ysU8NU/eyabIQkztxzxPDTEbMK7UrByx
 urkuO3L4W15ZkO6T+YhAsYljdlfUlDr4V0GmJJQcc5qDonDTkwbwcmTV6HAiznyVjnS0ZgfFji7
 Qolag
X-Gm-Gg: AR+sD134474JYpItxOjtBGjRxgTW+LOT354oS1WJRXyoGC/+/btkeAk+2t8HzIc71DW
 oK8y84RbgzhO/Sgw2ArdnSPlbjzf8Ib+aNYpBjflRoMAaziv0BSGEH0DGvNnjreBHRcgW0zwVOG
 4l1n++MExoBann9XiM1ov8zDq8D1Xs7j3R9fPzlG0Fh9mksxU9ZlTt9uhkbej0Hg2Ak/g939PsQ
 GHzSWI92zpnFfygH0KLU57ZIxZ7mtDUabBguLVsBdBpT4CpOsOv0C3lO0zURVk19ha47YWYwgEz
 m/iPLPxyywLmIvMn84B/REqgOocIASa0vmOevnLH0QpIj71NwYT+33skffKIFPmATDr52a5821N
 heJ8QSFWBLCCktv0vxO1+yxwUaKHrdkYsyPLz6/hwp9qUpbGLynYhCtFB1TXKHH2LuP7ITZMhPL
 4CbrZhdZ3JSqitnAVvmme3ABL1g+MGhBy1DeuzqiS74rdjjPOsewVT
X-Received: by 2002:a05:600c:e48a:b0:499:80ce:827b with SMTP id
 5b1f17b1804b1-49980ce82c5mr12503465e9.4.1786542981045; 
 Wed, 12 Aug 2026 06:56:21 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c946ce1sm48325215e9.5.2026.08.12.06.56.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 06:56:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 12 Aug 2026 15:56:19 +0200
Message-ID: <20260812135620.292165-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786542981; x=1787147781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zv9L0VED5+6/hDT2RD3qpz7GSaKSLy+kUY6jAZZ7B7A=;
 b=DDZaQHYdef9DKLv0wEV6I7pzT4gUV6GdkiuB+f14RvFBWShMnYtGtDcJYlqhvo5/Vw
 f2lHTGvZuffEtp68jLv8WXmFOZ0UVp31JiYdntUkWYaXoKqmgg1PLdJchMI2WwyGqHDe
 ifhxEIJLVA75kb7XwttmehczqMT3UAr4iwn3QULIR0K4hvQieyt4gzqEFG3LJw7xfTgI
 FqAzDi9ikPKeTgWF7OT3ctrayiFZ59X/swoxi/YOP3dcSCetag7s2ENJJEg6u5LB3LTk
 eBBp8SOq4nFJ/DyLb9a83QxKyJf2bFntrpEMOns+Sv0HdUzHwMbr9i2t4EYFQkncUk+j
 5dNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DDZaQHYd
Subject: [Buildroot] [PATCH 2025.02.x] package/openssh: upstream patch for
 various CVEs
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

Commit on master [1] fixed a number of vulnerabilities but the 2025.02.x
branch is still on OpenSSH v9.9p2.

This commit fixes the following vulnerabilities by backporting upstream
patches:

- CVE-2026-59995:
    sftp in OpenSSH before 10.4 does not properly constrain the location
    of downloaded files when "sftp server:/path ." is used with an
    attacker-controlled server.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-59995
 - https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b

- CVE-2026-59996:
    scp in OpenSSH before 10.4 may place a file in the parent directory of
    an intended directory when the copy occurs between two remote
    destinations.

For more information, see:
 - https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78
 - https://www.cve.org/CVERecord?id=CVE-2026-59996

- CVE-2026-59997:
    internal-sftp in sshd in OpenSSH before 10.4 recognizes only the first
    9 command-line arguments, which can be important if a later command-
    line argument would have helped to ensure the intended security
    properties of an SFTP connection.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-59997
 - https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014

- CVE-2026-59999:
    In sshd in OpenSSH before 10.4, DisableForwarding=yes was supposed to
    take precedence over PermitTunnel=yes, but did not.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-59999
 - https://github.com/openssh/openssh-portable/commit/c805b97b67c774e0bf922ffb29dfbcda9d7b5add

- CVE-2026-60000:
    sshd in OpenSSH before 10.4 allows remote attackers to cause a denial
    of service (resource consumption from excessive authentication
    attempts) because MaxAuthTries was mishandled for
    GSSAPIAuthentication.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-60000
 - https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192

- CVE-2026-60001:
    sshd in OpenSSH before 10.4 does not always honor the minimum
    authentication delay.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-60001
 - https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454

- CVE-2026-60002:
    ssh in OpenSSH before 10.4 can have a use-after-free when a server
    changes its host key during a key re-exchange. (This outcome occurs
    only on the client side.)

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-60002
 - https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23

The CVE-2026-59998 is windows specific and thus ignored.

[1] 90add0c09e package/openssh: security bump to version 10.4p1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/0012-CVE-2026-59995.patch |  36 ++++
 package/openssh/0013-CVE-2026-59996.patch |  31 ++++
 package/openssh/0014-CVE-2026-59997.patch |  52 ++++++
 package/openssh/0015-CVE-2026-59999.patch |  30 +++
 package/openssh/0016-CVE-2026-60000.patch | 132 +++++++++++++
 package/openssh/0017-CVE-2026-60001.patch | 121 ++++++++++++
 package/openssh/0018-CVE-2026-60002.patch | 216 ++++++++++++++++++++++
 package/openssh/openssh.mk                |  16 ++
 8 files changed, 634 insertions(+)
 create mode 100644 package/openssh/0012-CVE-2026-59995.patch
 create mode 100644 package/openssh/0013-CVE-2026-59996.patch
 create mode 100644 package/openssh/0014-CVE-2026-59997.patch
 create mode 100644 package/openssh/0015-CVE-2026-59999.patch
 create mode 100644 package/openssh/0016-CVE-2026-60000.patch
 create mode 100644 package/openssh/0017-CVE-2026-60001.patch
 create mode 100644 package/openssh/0018-CVE-2026-60002.patch

diff --git a/package/openssh/0012-CVE-2026-59995.patch b/package/openssh/0012-CVE-2026-59995.patch
new file mode 100644
index 0000000000..d832ad5b3c
--- /dev/null
+++ b/package/openssh/0012-CVE-2026-59995.patch
@@ -0,0 +1,36 @@
+From 1b39f39657d2e58f8ec57341581a39bbf0be645b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 29 Jun 2026 01:47:21 +0000
+Subject: [PATCH] upstream: avoid download to server-controlled path when
+ performing
+
+download on the commandline. From Swival scanner
+
+OpenBSD-Commit-ID: d1b2c44305fdfe6d51eed9ecc727e59478bf311f
+CVE: CVE-2026-59995
+Upstream: https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ sftp.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/sftp.c b/sftp.c
+index 0ab9206c2772..0b57e083398c 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -2270,13 +2270,8 @@ interactive_loop(struct sftp_conn *conn, char *file1, char *file2)
+ 				return (-1);
+ 			}
+ 		} else {
+-			/* XXX this is wrong wrt quoting */
+-			snprintf(cmd, sizeof cmd, "get%s %s%s%s",
+-			    global_aflag ? " -a" : "", dir,
+-			    file2 == NULL ? "" : " ",
+-			    file2 == NULL ? "" : file2);
+-			err = parse_dispatch_command(conn, cmd,
+-			    &remote_path, startdir, 1, 0);
++			err = process_get(conn, dir, file2, remote_path, 0, 0,
++			    global_aflag, 0);
+ 			free(dir);
+ 			free(startdir);
+ 			free(remote_path);
diff --git a/package/openssh/0013-CVE-2026-59996.patch b/package/openssh/0013-CVE-2026-59996.patch
new file mode 100644
index 0000000000..5151afb01c
--- /dev/null
+++ b/package/openssh/0013-CVE-2026-59996.patch
@@ -0,0 +1,31 @@
+From 36480181fa22f98e180b4f9e10203480c0346c78 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 28 Jun 2026 23:47:16 +0000
+Subject: [PATCH] upstream: resist that return ".." via remote glob during
+
+remote/remote copies, similar to fixes for bz3871 for remote/local copies.
+From Swival scanner
+
+OpenBSD-Commit-ID: c0c20a1b746db55c08e53658bf21ea9405b300a5
+CVE: CVE-2026-59996
+Upstream: https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ scp.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/scp.c b/scp.c
+index 621db83c02d1..28ac7a29d2a3 100644
+--- a/scp.c
++++ b/scp.c
+@@ -2045,6 +2045,10 @@ throughlocal_sftp(struct sftp_conn *from, struct sftp_conn *to,
+ 			goto out;
+ 		}
+ 
++		/* Special handling for source of '..' */
++		if (strcmp(filename, "..") == 0)
++			filename = "."; /* Download to dest, not dest/.. */
++
+ 		if (targetisdir)
+ 			abs_dst = sftp_path_append(target, filename);
+ 		else
diff --git a/package/openssh/0014-CVE-2026-59997.patch b/package/openssh/0014-CVE-2026-59997.patch
new file mode 100644
index 0000000000..a519a3079c
--- /dev/null
+++ b/package/openssh/0014-CVE-2026-59997.patch
@@ -0,0 +1,52 @@
+From e9916c44c1324ab9ab022719e4df08a390a83014 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 5 Jun 2026 08:53:07 +0000
+Subject: [PATCH] upstream: pass >9 commandline arguments to the internal-sftp
+ server,
+
+previously they were silently dropped; reported by Steve Caffrey ok deraadt@
+
+OpenBSD-Commit-ID: ee6cd5430a3ca027c3223af54b58ad3cc7ccd624
+CVE: CVE-2026-59997
+Upstream: https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ session.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/session.c b/session.c
+index dee66598e4e4..fc9c9d6f88ff 100644
+--- a/session.c
++++ b/session.c
+@@ -1639,21 +1639,22 @@ do_child(struct ssh *ssh, Session *s, const char *command)
+ 		exit(1);
+ 	} else if (s->is_subsystem == SUBSYSTEM_INT_SFTP) {
+ 		extern int optind, optreset;
+-		int i;
+-		char *p, *args;
++		int sftp_argc;
++		char **sftp_argv;
+ 
+ 		setproctitle("%s@%s", s->pw->pw_name, INTERNAL_SFTP_NAME);
+-		args = xstrdup(command ? command : "sftp-server");
+-		for (i = 0, (p = strtok(args, " ")); p; (p = strtok(NULL, " ")))
+-			if (i < ARGV_MAX - 1)
+-				argv[i++] = p;
+-		argv[i] = NULL;
++		if (argv_split(command == NULL ? "sftp-server" : command,
++		    &sftp_argc, &sftp_argv, 1) != 0) {
++			error("internal error: can't split internal-sftp "
++			    "arguments");
++			exit(1);
++		}
+ 		optind = optreset = 1;
+-		__progname = argv[0];
++		__progname = sftp_argv[0];
+ #ifdef WITH_SELINUX
+ 		ssh_selinux_change_context("sftpd_t");
+ #endif
+-		exit(sftp_server_main(i, argv, s->pw));
++		exit(sftp_server_main(sftp_argc, sftp_argv, s->pw));
+ 	}
+ 
+ 	fflush(NULL);
diff --git a/package/openssh/0015-CVE-2026-59999.patch b/package/openssh/0015-CVE-2026-59999.patch
new file mode 100644
index 0000000000..35003ee8db
--- /dev/null
+++ b/package/openssh/0015-CVE-2026-59999.patch
@@ -0,0 +1,30 @@
+From 8dfe7ed6e2fd988de08df508355a196b956b2753 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 31 May 2026 04:47:29 +0000
+Subject: [PATCH] upstream: DisableForwarding=yes didn't override
+ PermitTunnel=yes
+
+Reported independently by Huzaifa Sidhpurwala of Redhat and Marko
+Jevtic; ok markus@
+
+OpenBSD-Commit-ID: b5c13f0746cf079b21f8deba47407fad49ccbf4c
+CVE: CVE-2026-59999
+Upstream: https://github.com/openssh/openssh-portable/commit/c805b97b67c774e0bf922ffb29dfbcda9d7b5add
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ serverloop.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index 8e63480ecefa..8a6e3db8024e 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -498,7 +498,7 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
diff --git a/package/openssh/0016-CVE-2026-60000.patch b/package/openssh/0016-CVE-2026-60000.patch
new file mode 100644
index 0000000000..cab7ce1e6c
--- /dev/null
+++ b/package/openssh/0016-CVE-2026-60000.patch
@@ -0,0 +1,132 @@
+From 5d04ca6af739b82fd30d84d2783ca802ebfa1192 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:53:30 +0000
+Subject: [PATCH] upstream: Fix multiple RFC 4462 (GSSAPIAuthentication)
+ compliance
+
+problems
+
+1) Remove an early failure return for GSSAPI authentication attempts
+made for invalid accounts that yielded different behaviour for
+valid vs invalid accounts.
+
+2) Fix a situation where some GSSAPI requestes were not correctly
+subjected to MaxAuthTries.
+
+3) Fix a moderate pre-authentication resource DoS related to #2.
+
+Add missing logging for error cases.
+
+Report and fixes from Manfred Kaiser, milCERT AT
+
+OpenBSD-Commit-ID: ca0acdd64eea435d6f89534538a9eb404a5629d3
+CVE: CVE-2026-60000
+Upstream: https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ auth2-gss.c | 55 ++++++++++++++++++++++++-----------------------------
+ 1 file changed, 25 insertions(+), 30 deletions(-)
+
+diff --git a/auth2-gss.c b/auth2-gss.c
+index 355926afcd6e..85251b7d0b57 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -111,12 +111,6 @@ userauth_gssapi(struct ssh *ssh, const char *method)
+ 		return (0);
+ 	}
+ 
+-	if (!authctxt->valid || authctxt->user == NULL) {
+-		debug2_f("disabled because of invalid user");
+-		free(doid);
+-		return (0);
+-	}
+-
+ 	if (GSS_ERROR(mm_ssh_gssapi_server_ctx(&ctxt, &goid))) {
+ 		if (ctxt != NULL)
+ 			ssh_gssapi_delete_ctx(&ctxt);
+@@ -178,8 +172,14 @@ input_gssapi_token(int type, uint32_t plen, struct ssh *ssh)
+ 			    (r = sshpkt_send(ssh)) != 0)
+ 				fatal_fr(r, "send ERRTOK packet");
+ 		}
++		logit("Failed gssapi-with-mic for %s%.100s "
++		    "from %.200s port %d ssh2",
++		    authctxt->valid ? "" : "invalid user ",
++		    authctxt->user,
++		    ssh_remote_ipaddr(ssh), ssh_remote_port(ssh));
+ 		authctxt->postponed = 0;
+ 		ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
++		ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+ 		userauth_finish(ssh, 0, "gssapi-with-mic", NULL);
+ 	} else {
+ 		if (send_tok.length != 0) {
+@@ -191,14 +191,18 @@ input_gssapi_token(int type, uint32_t plen, struct ssh *ssh)
+ 				fatal_fr(r, "send TOKEN packet");
+ 		}
+ 		if (maj_status == GSS_S_COMPLETE) {
+-			ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+-			if (flags & GSS_C_INTEG_FLAG)
+-				ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_MIC,
++			ssh_dispatch_set(ssh,
++			    SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
++			/* note: keep ERRTOK handler as per RFC 4462 s3.4 */
++			if (flags & GSS_C_INTEG_FLAG) {
++				ssh_dispatch_set(ssh,
++				    SSH2_MSG_USERAUTH_GSSAPI_MIC,
+ 				    &input_gssapi_mic);
+-			else
++			} else {
+ 				ssh_dispatch_set(ssh,
+ 				    SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE,
+ 				    &input_gssapi_exchange_complete);
++			}
+ 		}
+ 	}
+ 
+@@ -210,10 +214,6 @@ static int
+ input_gssapi_errtok(int type, u_int32_t plen, struct ssh *ssh)
+ {
+ 	Authctxt *authctxt = ssh->authctxt;
+-	Gssctxt *gssctxt;
+-	gss_buffer_desc send_tok = GSS_C_EMPTY_BUFFER;
+-	gss_buffer_desc recv_tok;
+-	OM_uint32 maj_status;
+ 	int r;
+ 	u_char *p;
+ 	size_t len;
+@@ -221,26 +221,21 @@ input_gssapi_errtok(int type, uint32_t plen, struct ssh *ssh)
+ 	if (authctxt == NULL)
+ 		fatal("No authentication or GSSAPI context");
+ 
+-	gssctxt = authctxt->methoddata;
+-	if ((r = sshpkt_get_string(ssh, &p, &len)) != 0 ||
++	/* Minimal error handling - just cancel auth and return FAILURE */
++	if ((r = sshpkt_get_string_direct(ssh, NULL, NULL)) != 0 ||
+ 	    (r = sshpkt_get_end(ssh)) != 0)
+ 		fatal_fr(r, "parse packet");
+-	recv_tok.value = p;
+-	recv_tok.length = len;
+-
+-	/* Push the error token into GSSAPI to see what it says */
+-	maj_status = mm_ssh_gssapi_accept_ctx(gssctxt, &recv_tok,
+-	    &send_tok, NULL);
+-
+-	free(recv_tok.value);
+ 
+-	/* We can't return anything to the client, even if we wanted to */
++	logit("Failed gssapi-with-mic for %s%.100s from %.200s port %d ssh2",
++	    authctxt->valid ? "" : "invalid user ",
++	    authctxt->user,
++	    ssh_remote_ipaddr(ssh), ssh_remote_port(ssh));
++	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+-
+-	/* The client will have already moved on to the next auth */
+-
+-	gss_release_buffer(&maj_status, &send_tok);
++	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_MIC, NULL);
++	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE, NULL);
++	userauth_finish(ssh, 0, "gssapi-with-mic", NULL);
+ 	return 0;
+ }
+ 
diff --git a/package/openssh/0017-CVE-2026-60001.patch b/package/openssh/0017-CVE-2026-60001.patch
new file mode 100644
index 0000000000..b5e0248454
--- /dev/null
+++ b/package/openssh/0017-CVE-2026-60001.patch
@@ -0,0 +1,121 @@
+From d43ba60c91cb323ca921049b7d43b1908c318454 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:44:48 +0000
+Subject: [PATCH] upstream: Fix cases in GSSAPI and keyboard-interactive
+
+authentication where the minimum per-attempt delay was not being enforced.
+
+Reported by Orange Cyberdefense Vulnerability Team
+
+OpenBSD-Commit-ID: c40bd35cc2428fcaccad7a141703c28baa6da01e
+CVE: CVE-2026-60001
+Upstream: https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ auth.h        |  3 ++-
+ auth2-chall.c |  6 +++++-
+ auth2-gss.c   |  9 ++++++++-
+ auth2.c       | 12 +++++++++---
+ 4 files changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/auth.h b/auth.h
+index 634a84aa85f7..0f11458ca2c8 100644
+--- a/auth.h
++++ b/auth.h
+@@ -175,6 +175,7 @@ void	auth_log(struct ssh *, int, int, const char *, const char *);
+ void	auth_maxtries_exceeded(struct ssh *) __attribute__((noreturn));
+ void	userauth_finish(struct ssh *, int, const char *, const char *);
+ int	auth_root_allowed(struct ssh *, const char *);
++void	auth_failure_delay(Authctxt *, double);
+ 
+ char	*auth2_read_banner(void);
+ int	 auth2_methods_valid(const char *, int);
+diff --git a/auth2-chall.c b/auth2-chall.c
+index f3889079b64f..8a23ca2dca2a 100644
+--- a/auth2-chall.c
++++ b/auth2-chall.c
+@@ -296,6 +296,7 @@ input_userauth_info_response(int type, uint32_t seq, struct ssh *ssh)
+ 	u_int i, nresp;
+ 	const char *devicename = NULL;
+ 	char **response = NULL;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal_f("no authctxt");
+@@ -354,6 +355,9 @@ input_userauth_info_response(int type, uint32_t seq, struct ssh *ssh)
+ 			auth2_challenge_start(ssh);
+ 		}
+ 	}
++
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
+ 	userauth_finish(ssh, authenticated, "keyboard-interactive",
+ 	    devicename);
+ 	return 0;
+diff --git a/auth2-gss.c b/auth2-gss.c
+index 0535485277a6..355926afcd6e 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -250,6 +250,7 @@ input_gssapi_exchange_complete(int type, uint32_t plen, struct ssh *ssh)
+ {
+ 	Authctxt *authctxt = ssh->authctxt;
+ 	int r, authenticated;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal("No authentication or GSSAPI context");
+@@ -263,6 +264,8 @@ input_gssapi_exchange_complete(int type, uint32_t plen, struct ssh *ssh)
+ 		fatal_fr(r, "parse packet");
+ 
+ 	authenticated = mm_ssh_gssapi_userok(authctxt->user);
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
+ 
+ 	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+@@ -283,6 +286,7 @@ input_gssapi_mic(int type, uint32_t plen, struct ssh *ssh)
+ 	gss_buffer_desc mic, gssbuf;
+ 	u_char *p;
+ 	size_t len;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal("No authentication or GSSAPI context");
+@@ -310,6 +314,9 @@ input_gssapi_mic(int type, uint32_t plen, struct ssh *ssh)
+ 	sshbuf_free(b);
+ 	free(mic.value);
+ 
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
++
+ 	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+diff --git a/auth2.c b/auth2.c
+index 3a168274631e..3f353a719ba0 100644
+--- a/auth2.c
++++ b/auth2.c
+@@ -265,6 +265,12 @@ ensure_minimum_time_since(double start, double seconds)
+ 	nanosleep(&ts, NULL);
+ }
+ 
++void
++auth_failure_delay(Authctxt *authctxt, double tstart)
++{
++	ensure_minimum_time_since(tstart, user_specific_delay(authctxt->user));
++}
++
+ static int
+ input_userauth_request(int type, u_int32_t seq, struct ssh *ssh)
+ {
+@@ -346,8 +352,8 @@ input_userauth_request(int type, uint32_t seq, struct ssh *ssh)
+ 		authenticated =	m->userauth(ssh, method);
+ 	}
+ 	if (!authctxt->authenticated && strcmp(method, "none") != 0)
+-		ensure_minimum_time_since(tstart,
+-		    user_specific_delay(authctxt->user));
++		auth_failure_delay(authctxt, tstart);
++
+ 	userauth_finish(ssh, authenticated, method, NULL);
+ 	r = 0;
+  out:
diff --git a/package/openssh/0018-CVE-2026-60002.patch b/package/openssh/0018-CVE-2026-60002.patch
new file mode 100644
index 0000000000..35d38a8b9b
--- /dev/null
+++ b/package/openssh/0018-CVE-2026-60002.patch
@@ -0,0 +1,216 @@
+From e8bdfb151a356d0171fea4194dd205fbb252be23 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:49:58 +0000
+Subject: [PATCH] upstream: fix ownership and lifetime of several bits of
+ client
+
+state that need to persist for the life of the connection, especially the
+cached hostkey that was being incorrectly freed early on some paths, possibly
+allowing its use after free.
+
+Reported by Zhenpeng (Leo) Lin from depthfirst.com
+
+OpenBSD-Commit-ID: faaa6ad72e7d69d41fa8b197b606265b7d9bc73f
+CVE: CVE-2026-60002
+Upstream: https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ssh.c         | 26 +++-----------------------
+ sshconnect.c  | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
+ sshconnect.h  |  9 ++++++---
+ sshconnect2.c | 22 ++++++++++++----------
+ 4 files changed, 67 insertions(+), 39 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 5a160c8c1352..7c644c23c214 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -606,26 +606,6 @@ set_addrinfo_port(struct addrinfo *addrs, int port)
+ 	}
+ }
+ 
+-static void
+-ssh_conn_info_free(struct ssh_conn_info *cinfo)
+-{
+-	if (cinfo == NULL)
+-		return;
+-	free(cinfo->conn_hash_hex);
+-	free(cinfo->shorthost);
+-	free(cinfo->uidstr);
+-	free(cinfo->keyalias);
+-	free(cinfo->thishost);
+-	free(cinfo->host_arg);
+-	free(cinfo->portstr);
+-	free(cinfo->remhost);
+-	free(cinfo->remuser);
+-	free(cinfo->homedir);
+-	free(cinfo->locuser);
+-	free(cinfo->jmphost);
+-	free(cinfo);
+-}
+-
+ /*
+  * Main program for the ssh client.
+  */
+@@ -1744,8 +1724,8 @@ main(int ac, char **av)
+ 	ssh_signal(SIGCHLD, main_sigchld_handler);
+ 
+ 	/* Log into the remote system.  Never returns if the login fails. */
+-	ssh_login(ssh, &sensitive_data, host, (struct sockaddr *)&hostaddr,
+-	    options.port, pw, timeout_ms, cinfo);
++	ssh_login(ssh, &sensitive_data, host, &hostaddr, options.port,
++	    pw, timeout_ms, cinfo);
+ 
+ 	/* We no longer need the private host keys.  Clear them now. */
+ 	if (sensitive_data.nkeys != 0) {
+diff --git a/sshconnect.c b/sshconnect.c
+index 2fc1f6026eb2..0ddfc76b367b 100644
+--- a/sshconnect.c
++++ b/sshconnect.c
+@@ -84,6 +84,49 @@ extern char *__progname;
+ static int show_other_keys(struct hostkeys *, struct sshkey *);
+ static void warn_changed_key(struct sshkey *);
+ 
++void
++ssh_conn_info_free(struct ssh_conn_info *cinfo)
++{
++	if (cinfo == NULL)
++		return;
++	free(cinfo->conn_hash_hex);
++	free(cinfo->shorthost);
++	free(cinfo->uidstr);
++	free(cinfo->keyalias);
++	free(cinfo->thishost);
++	free(cinfo->host_arg);
++	free(cinfo->portstr);
++	free(cinfo->remhost);
++	free(cinfo->remuser);
++	free(cinfo->homedir);
++	free(cinfo->locuser);
++	free(cinfo->jmphost);
++	freezero(cinfo, sizeof(*cinfo));
++}
++
++struct ssh_conn_info *
++ssh_conn_info_dup(const struct ssh_conn_info *cinfo)
++{
++	struct ssh_conn_info *ret;
++
++	if (cinfo == NULL)
++		return NULL;
++	ret = xcalloc(1, sizeof(*ret));
++	ret->conn_hash_hex = xstrdup(cinfo->conn_hash_hex);
++	ret->shorthost = xstrdup(cinfo->shorthost);
++	ret->uidstr = xstrdup(cinfo->uidstr);
++	ret->keyalias = xstrdup(cinfo->keyalias);
++	ret->thishost = xstrdup(cinfo->thishost);
++	ret->host_arg = xstrdup(cinfo->host_arg);
++	ret->portstr = xstrdup(cinfo->portstr);
++	ret->remhost = xstrdup(cinfo->remhost);
++	ret->remuser = xstrdup(cinfo->remuser);
++	ret->homedir = xstrdup(cinfo->homedir);
++	ret->locuser = xstrdup(cinfo->locuser);
++	ret->jmphost = xstrdup(cinfo->jmphost);
++	return ret;
++}
++
+ /* Expand a proxy command */
+ static char *
+ expand_proxy_command(const char *proxy_command, const char *user,
+@@ -1589,8 +1632,8 @@ warn_nonpq_kex(void)
+  */
+ void
+ ssh_login(struct ssh *ssh, Sensitive *sensitive, const char *orighost,
+-    struct sockaddr *hostaddr, u_short port, struct passwd *pw, int timeout_ms,
+-    const struct ssh_conn_info *cinfo)
++    struct sockaddr_storage *hostaddr, u_short port, struct passwd *pw,
++    int timeout_ms, const struct ssh_conn_info *cinfo)
+ {
+ 	char *host;
+ 	char *server_user, *local_user;
+diff --git a/sshconnect.h b/sshconnect.h
+index 4c19490da487..2ac2c07e005a 100644
+--- a/sshconnect.h
++++ b/sshconnect.h
+@@ -73,7 +73,7 @@ int	 ssh_connect(struct ssh *, const char *, const char *,
+ void	 ssh_kill_proxy_command(void);
+ 
+ void	 ssh_login(struct ssh *, Sensitive *, const char *,
+-    struct sockaddr *, u_short, struct passwd *, int,
++    struct sockaddr_storage *, u_short, struct passwd *, int,
+     const struct ssh_conn_info *);
+ 
+ int	 verify_host_key(char *, struct sockaddr *, struct sshkey *,
+@@ -82,7 +82,7 @@ int	 verify_host_key(char *, struct sockaddr *, struct sshkey *,
+ void	 get_hostfile_hostname_ipaddr(char *, struct sockaddr *, u_short,
+     char **, char **);
+ 
+-void	 ssh_kex2(struct ssh *ssh, char *, struct sockaddr *, u_short,
++void	 ssh_kex2(struct ssh *ssh, char *, struct sockaddr_storage *, u_short,
+     const struct ssh_conn_info *);
+ 
+ void	 ssh_userauth2(struct ssh *ssh, const char *, const char *,
+@@ -98,3 +98,6 @@ void	 load_hostkeys_command(struct hostkeys *, const char *,
+     const struct sshkey *, const char *);
+ 
+ int hostkey_accepted_by_hostkeyalgs(const struct sshkey *);
++
++void ssh_conn_info_free(struct ssh_conn_info *);
++struct ssh_conn_info *ssh_conn_info_dup(const struct ssh_conn_info *);
+diff --git a/sshconnect2.c b/sshconnect2.c
+index ecb4ae524ee7..d1555ee97274 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -87,7 +87,7 @@ extern Options options;
+  */
+ 
+ static char *xxx_host;
+-static struct sockaddr *xxx_hostaddr;
++static struct sockaddr_storage xxx_hostaddr;
+ static const struct ssh_conn_info *xxx_conn_info;
+ static int key_type_allowed(struct sshkey *, const char *);
+ 
+@@ -103,7 +103,7 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 		fatal("Server host key %s not in HostKeyAlgorithms",
+ 		    sshkey_ssh_name(hostkey));
+ 	}
+-	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
++	if (verify_host_key(xxx_host, (struct sockaddr *)&xxx_hostaddr, hostkey,
+ 	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+ 	return 0;
+@@ -220,16 +220,16 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port,
+ }
+ 
+ void
+-ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+-    const struct ssh_conn_info *cinfo)
++ssh_kex2(struct ssh *ssh, char *host, struct sockaddr_storage *hostaddr,
++    u_short port, const struct ssh_conn_info *cinfo)
+ {
+ 	char *myproposal[PROPOSAL_MAX];
+ 	char *all_key, *hkalgs = NULL;
+ 	int r, use_known_hosts_order = 0;
+ 
+-	xxx_host = host;
+-	xxx_hostaddr = hostaddr;
+-	xxx_conn_info = cinfo;
++	xxx_host = xstrdup(host);
++	xxx_hostaddr = *hostaddr;
++	xxx_conn_info = ssh_conn_info_dup(cinfo);
+ 
+ 	if (options.rekey_limit || options.rekey_interval)
+ 		ssh_packet_set_rekey_limits(ssh, options.rekey_limit,
+@@ -252,8 +252,10 @@ ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+ 		fatal_fr(r, "kex_assemble_namelist");
+ 	free(all_key);
+ 
+-	if (use_known_hosts_order)
+-		hkalgs = order_hostkeyalgs(host, hostaddr, port, cinfo);
++	if (use_known_hosts_order) {
++		hkalgs = order_hostkeyalgs(host, (struct sockaddr *)hostaddr,
++		    port, cinfo);
++	}
+ 
+ 	kex_proposal_populate_entries(ssh, myproposal,
+ 	    options.kex_algorithms, options.ciphers, options.macs,
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 136dc08d36..d85c3f7c36 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -32,6 +32,22 @@ OPENSSH_IGNORE_CVES += CVE-2026-35387
 OPENSSH_IGNORE_CVES += CVE-2026-35388
 # 0011-CVE-2026-35414.patch
 OPENSSH_IGNORE_CVES += CVE-2026-35414
+# 0012-CVE-2026-59995.patch
+OPENSSH_IGNORE_CVES += CVE-2026-59995
+# 0013-CVE-2026-59996.patch
+OPENSSH_IGNORE_CVES += CVE-2026-59996
+# 0014-CVE-2026-59997.patch
+OPENSSH_IGNORE_CVES += CVE-2026-59997
+# Windows Specific (see https://nvd.nist.gov/vuln/detail/CVE-2026-59998)
+OPENSSH_IGNORE_CVES += CVE-2026-59998
+# 0015-CVE-2026-59999.patch
+OPENSSH_IGNORE_CVES += CVE-2026-59999
+# 0016-CVE-2026-60000.patch
+OPENSSH_IGNORE_CVES += CVE-2026-60000
+# 0017-CVE-2026-60001.patch
+OPENSSH_IGNORE_CVES += CVE-2026-60001
+# 0018-CVE-2026-60002.patch
+OPENSSH_IGNORE_CVES += CVE-2026-60002
 
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
