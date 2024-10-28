Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A41D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 02:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FAFF60815;
	Mon, 28 Oct 2024 02:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMpNn_tk0Auj; Mon, 28 Oct 2024 02:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F48607A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F48607A7;
	Mon, 28 Oct 2024 02:54:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 708FD112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C2F440106
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkAb5mihJm4L for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 02:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A01BF4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01BF4024E
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A01BF4024E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:54:23 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83aad8586d3so161563839f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730084062; x=1730688862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VBv2GyrXk3XBG7y5Nbptt/UqRJLxITplPVl5r6kOqvU=;
 b=omPGYv/4m/4cF0kkETZczOregqtE/B4Qs47pKHDs/nirNZtsMvsE1TeYgsCtoYY0XS
 5m4dNcdhBV5RnW/qB2xuacWFsVuyLn2crG4nHVetn/Qe+bOfDZKEoHQ7g1YydEFT6uew
 HDSjCnTnx2RE2ZhzDfqB1KnBRUruXFeN8zuW0KhykhC5pU3rzDWHrvYx+qAfKCBDRqlU
 pwwtKFJAYLy5bCPoEuSHwU+M9K0iqOqjIN5KxnXYRxQH+ukIV3LcxMB15hW43OCnMAWr
 HkQokjLn+fHstQu0HSWLNtQmzv0y2YyvdrOUUY8FGQT1SBfeeEYzriaV9QCBH7I6AebD
 UqPQ==
X-Gm-Message-State: AOJu0YzbzT9vALG3zc7Z7rKwg0mnCUdQXqjgJ7wncZY2clAs2KWsgpSo
 oluXh7GAu1EjXt297Vo1jUFJMZdhZhdeHJc8SmWosGpyD280rTBDWuWn+0eY
X-Google-Smtp-Source: AGHT+IEfLiZzXYKIagi+h7S7CCy22qnF6Y+YdophVivYU8KsNv7f4twNy3BhhJnpG8c2su133As3CA==
X-Received: by 2002:a05:6602:6d07:b0:82a:9cab:9be1 with SMTP id
 ca18e2360f4ac-83b1c5e97famr540276339f.12.1730084062402; 
 Sun, 27 Oct 2024 19:54:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc727ae9cdsm1399218173.158.2024.10.27.19.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 19:54:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 20:54:09 -0600
Message-Id: <20241028025410.62158-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028025410.62158-1-james.hilliard1@gmail.com>
References: <20241028025410.62158-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730084062; x=1730688862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VBv2GyrXk3XBG7y5Nbptt/UqRJLxITplPVl5r6kOqvU=;
 b=ITc4xtQ0g7CY1yc4CaXBF3YoLL2tMnvWombQHwE0KT0ICTkqUbVONhbybfJIuLz+FJ
 mwku+syMCJKOuc6nB5LBtkNPJeIhq9LhWzTDuNV4tRxukC+sNOEDsZT+SnqvuayRr8L/
 VEi0U/LcbkBZU+T/7/Z97Et5INHtbpd1nLuy5bM6zh0sQkmHCIX91n/f3bPwUB1tD323
 E18+66FqKQNKGJdl50sGMVHriU43l6C66LAyntgQzyscSzta9WjFeyTbeZtyU+RfmZtT
 B2ONjwEERQn1zZaYAlnMigjPOLYSYPYuzfpcG1zhOcrQtCpLNHi0DYDHJjP8zF/n8Z8W
 0pCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ITc4xtQ0
Subject: [Buildroot] [PATCH v3 3/4] package/pkgconf: bump to version 2.3.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebase only prefix subset of variables patch.

Drop revert main assume modversion patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...th-the-sysroot-a-subset-of-variables.patch | 78 ++++++++++---------
 ...me-modversion-insted-of-version-if-o.patch | 45 -----------
 package/pkgconf/pkgconf.hash                  |  2 +-
 package/pkgconf/pkgconf.mk                    |  2 +-
 5 files changed, 42 insertions(+), 86 deletions(-)
 delete mode 100644 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3744d003cc..04cddd6e50 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1026,7 +1026,6 @@ package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch lib_patch.Upstream
 package/pixman/0001-Disable-tests.patch lib_patch.Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
-package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch lib_patch.Upstream
diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
index a039d0c1bc..d25039ade2 100644
--- a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -1,4 +1,4 @@
-From 267a57022699453e8d8f517519df25ac6bf6ac4e Mon Sep 17 00:00:00 2001
+From c1f9e60f46f2207f9dd07dd290ad5a2da05ad41d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 16 Dec 2018 11:52:18 +0100
 Subject: [PATCH] Only prefix with the sysroot a subset of variables
@@ -23,19 +23,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Updated to include gobject-introspection paths]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- libpkgconf/tuple.c | 60 ++++++++++++++++++++++++++++++++--------------
- 1 file changed, 42 insertions(+), 18 deletions(-)
+ libpkgconf/tuple.c | 65 ++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 46 insertions(+), 19 deletions(-)
 
 diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
-index 8523709..7cd2fff 100644
+index 83f6a47..a2aa427 100644
 --- a/libpkgconf/tuple.c
 +++ b/libpkgconf/tuple.c
-@@ -161,6 +161,21 @@ dequote(const char *value)
+@@ -178,6 +178,21 @@ dequote(const char *value)
  	return buf;
  }
  
 +static char *
-+pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot);
++pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags, bool add_sysroot);
 +
 +const char *sysrooted_keys[] = {
 +	"g_ir_scanner",
@@ -49,21 +49,19 @@ index 8523709..7cd2fff 100644
 +	NULL,
 +};
 +
- /*
-  * !doc
-  *
-@@ -181,6 +193,8 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+ static const char *
+ find_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars)
+ {
+@@ -237,14 +252,20 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
  {
  	char *dequote_value;
- 	pkgconf_tuple_t *tuple = calloc(sizeof(pkgconf_tuple_t), 1);
+ 	pkgconf_tuple_t *tuple = calloc(1, sizeof(pkgconf_tuple_t));
 +	bool add_sysroot = false;
 +	int i;
  
  	pkgconf_tuple_find_delete(list, key);
  
-@@ -188,9 +202,13 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
- 
- 	PKGCONF_TRACE(client, "adding tuple to @%p: %s => %s (parsed? %d)", list, key, dequote_value, parse);
+ 	dequote_value = dequote(value);
  
 +	for (i = 0; sysrooted_keys[i] != NULL; i++)
 +		if (!strcmp(key, sysrooted_keys[i]))
@@ -71,77 +69,81 @@ index 8523709..7cd2fff 100644
 +
  	tuple->key = strdup(key);
  	if (parse)
--		tuple->value = pkgconf_tuple_parse(client, list, dequote_value);
-+		tuple->value = pkgconf_tuple_parse_sysroot(client, list, dequote_value, add_sysroot);
+-		tuple->value = pkgconf_tuple_parse(client, list, dequote_value, flags);
++		tuple->value = pkgconf_tuple_parse_sysroot(client, list, dequote_value, flags, add_sysroot);
  	else
  		tuple->value = strdup(dequote_value);
  
-@@ -234,27 +252,14 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
+@@ -294,22 +315,8 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
  	return NULL;
  }
  
 -/*
 - * !doc
 - *
-- * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
+- * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 - *
 - *    Parse an expression for variable substitution.
 - *
 - *    :param pkgconf_client_t* client: The pkgconf client object to access.
 - *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
 - *    :param char* value: The ``key=value`` string to parse.
+- *    :param uint flags: Any flags to consider while parsing.
 - *    :return: the variable data with any variables substituted
 - *    :rtype: char *
 - */
 -char *
--pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
+-pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 +static char *
-+pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot)
++pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags, bool add_sysroot)
  {
  	char buf[PKGCONF_BUFSIZE];
  	const char *ptr;
- 	char *bptr = buf;
- 
--	if (*value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
-+	if (add_sysroot && *value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
- 		bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
+@@ -318,7 +325,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 	if (!(client->flags & PKGCONF_PKG_PKGF_FDO_SYSROOT_RULES) &&
+ 		(!(flags & PKGCONF_PKG_PROPF_UNINSTALLED) || (client->flags & PKGCONF_PKG_PKGF_PKGCONF1_SYSROOT_RULES)))
+ 	{
+-		if (*value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
++		if (add_sysroot && *value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
+ 			bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
+ 	}
  
- 	for (ptr = value; *ptr != '\0' && bptr - buf < PKGCONF_BUFSIZE; ptr++)
-@@ -294,7 +299,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
- 
- 				if (kv != NULL)
+@@ -381,7 +388,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  				{
--					parsekv = pkgconf_tuple_parse(client, vars, kv);
-+					parsekv = pkgconf_tuple_parse_sysroot(client, vars, kv, add_sysroot);
+ 					size_t nlen;
+ 
+-					parsekv = pkgconf_tuple_parse(client, vars, kv, flags);
++					parsekv = pkgconf_tuple_parse_sysroot(client, vars, kv, flags, add_sysroot);
+ 					nlen = pkgconf_strlcpy(bptr, parsekv, remain);
+ 					free(parsekv);
  
- 					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
- 					bptr += strlen(parsekv);
-@@ -339,6 +344,25 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -432,6 +439,26 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	return strdup(buf);
  }
  
 +/*
 + * !doc
 + *
-+ * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++ * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 + *
 + *    Parse an expression for variable substitution.
 + *
 + *    :param pkgconf_client_t* client: The pkgconf client object to access.
 + *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
 + *    :param char* value: The ``key=value`` string to parse.
++ *    :param uint flags: Any flags to consider while parsing.
 + *    :return: the variable data with any variables substituted
 + *    :rtype: char *
 + */
 +char *
-+pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 +{
-+	return pkgconf_tuple_parse_sysroot(client, vars, value, true);
++	return pkgconf_tuple_parse_sysroot(client, vars, value, flags, true);
 +}
 +
  /*
   * !doc
   *
 -- 
-2.19.2
+2.34.1
 
diff --git a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch b/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
deleted file mode 100644
index f659a3b07f..0000000000
--- a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4ccef40918a539905a2951bfb81cf8dba4a245c6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 2 Jan 2019 18:15:50 +0100
-Subject: [PATCH] Revert "main: assume --modversion insted of --version if
- other flags or module names are provided"
-
-This reverts commit 12a0eb124cea85586e57f33c91a1e4c73459eef6, as it
-causes pkg-config to assume --modversion is used when something as
-simple as 'pkg-config --static --version' is used, leading to a
-failure instead of the expected behavior: the one of "pkg-config
---version".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cli/main.c | 14 ++------------
- 1 file changed, 2 insertions(+), 12 deletions(-)
-
-diff --git a/cli/main.c b/cli/main.c
-index b52cc85..c5acc10 100644
---- a/cli/main.c
-+++ b/cli/main.c
-@@ -1002,18 +1002,8 @@ main(int argc, char *argv[])
- 
- 	if ((want_flags & PKG_VERSION) == PKG_VERSION)
- 	{
--		if (argc > 2)
--		{
--			fprintf(stderr, "%s: --version specified with other options or module names, assuming --modversion.\n", argv[0]);
--
--			want_flags &= ~PKG_VERSION;
--			want_flags |= PKG_MODVERSION;
--		}
--		else
--		{
--			version();
--			return EXIT_SUCCESS;
--		}
-+		version();
-+		return EXIT_SUCCESS;
- 	}
- 
- 	if ((want_flags & PKG_HELP) == PKG_HELP)
--- 
-2.20.1
-
diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
index f210869c03..6d4b7972d6 100644
--- a/package/pkgconf/pkgconf.hash
+++ b/package/pkgconf/pkgconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61f0b31b0d5ea0e862b454a80c170f57bad47879c0c42bd8de89200ff62ea210  pkgconf-1.6.3.tar.xz
+sha256  3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b  pkgconf-2.3.0.tar.xz
 sha256  07ee94b50a41ee3fc4e13a9b9c60b26fc28488494c465639f7e5f07a3952ec04  COPYING
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index a8c7b48287..057f43bb98 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKGCONF_VERSION = 1.6.3
+PKGCONF_VERSION = 2.3.0
 PKGCONF_SITE = https://distfiles.ariadne.space/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
