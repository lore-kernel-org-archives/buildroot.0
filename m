Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E2FD6B6C3
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 19:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8A860A5F;
	Wed, 30 Oct 2024 19:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mUqArxH-bTd; Wed, 30 Oct 2024 19:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B1F608FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B1F608FB;
	Wed, 30 Oct 2024 19:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2D925E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B57811F0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPt9aSA3XRBa for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 19:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51606811F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51606811F2
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51606811F2
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:31 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a4c303206eso614395ab.3
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 12:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730314830; x=1730919630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OWJi6FGSb2uhDoAh46TgbVwkrFAQFSugAtzVkevfiA=;
 b=PSln4ZsVlMzpOk/t7mqZ96dWTYAbMe63OMO3/Fh77d3YX8tV7mU33/d6irIzNhgzXm
 ontjRdF6P+7SGS8xyfj/cIxL1ZyiqXvZ/lStyXAlKiABIutGNWVwwNQAfPT9XHIlh9Jj
 Wn21ouLbI3N6aGzEfrzxA17FLy36AQluXk8gcVqU1VXjPjLrdIlJiLiVTIzTa51m9Kag
 hx1y0eNkxfVVjrc3q+DjcdzvlKHwxeBkJK3dS+xcSKJS2H5+Be6DHb1Zc6g9ArOTqtOE
 cK+e7cywoJ9gvzLgXTisihaSIY1liCTtWk1rJe9LjjcgbFZaCPzwY/G9belLIfcvw+TZ
 kQew==
X-Gm-Message-State: AOJu0YwKtr2eqWcL1YUgZJHRydJVk4CrsfCKqMoWkQRL3eDTPVLO300G
 xhSe35oHPEV8jCNHIRXBuPPauwratvFwtWNfpWTgkQJ7w/6lrLFp4pPhuQ==
X-Google-Smtp-Source: AGHT+IF+ZhHFBLK8vHbRBUZz0zpq8Te5dxW2bxmVEwI4txXO3XQWGWOk1nbSKOPnRTXcCEwU7Pf9BQ==
X-Received: by 2002:a05:6e02:1886:b0:3a0:9f85:d74e with SMTP id
 e9e14a558f8ab-3a4ed2f6098mr153804115ab.16.1730314828421; 
 Wed, 30 Oct 2024 12:00:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df3c48sm29881875ab.34.2024.10.30.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 12:00:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 13:00:17 -0600
Message-Id: <20241030190020.1444105-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030190020.1444105-1-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730314830; x=1730919630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OWJi6FGSb2uhDoAh46TgbVwkrFAQFSugAtzVkevfiA=;
 b=J5+TROvbWlVjOVZZIVolxofZY2pggKkrkord9MLsKlTgFHOqCtcdHRlVYF2cxnkYVh
 JzsJFKQ5oqo4nCSa+RshYEfeM64AkIX1vvrH97LxQ7ST6sA2QUF/nxJF83FG5ycLYNqN
 yi1uMAxbnJM7LPB4o4uF6ywQWtW/3GuA3yOjJmwmfJRcAAOl+9bUw1H4rsmgAQq8evCM
 7St5EXjINfBDWAlheYSMgVecGjqpNEROUdAIXQ2dEg19wCRrcVYOpiAA7g0kJOkUEZM4
 2jd0Qo3qPJiIMXpDH+ozRcO83BACC+0wuByRwEQ3aP2xXPXuuS8wwBbGW+1QsZITFySW
 FHZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J5+TROvb
Subject: [Buildroot] [PATCH v4 3/6] package/pkgconf: bump to version 2.3.0
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
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
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
index 8ffdbd4e59..6a9922b055 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1025,7 +1025,6 @@ package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
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
