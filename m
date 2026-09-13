Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8FFC88E69
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32C3405A9;
	Sun, 13 Sep 2026 19:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITT0xj2ZE0vb; Sun, 13 Sep 2026 19:34:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B978A405AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328070;
	b=r3jjyInk+gX8gF5gJ/rokfjBUVggWoaPPItvMkPsPYNI5GTi4SRYdPjR4OicsCB9efzE
	 F5yoI6TfqehtBIBpDFrVpcRlRR6pnPMxKAWipXAcO6PyiPCx+EPgcilw1ulL89kBegMWX
	 7m1ybFk1R2RZj1poSa03Tf23Mnw0WnV8kptxExzSgjkTGJHyqDsg7gZE4gqdnvPX2wsoQ
	 /+nmFvqOV4liWhX53tPjiHyh7w57/AEX2mWXWlXvH07hT+Uh6ppxjhlMVHY5xpZFuTfI+
	 X1tQKVaqOezLC4hhdJvGnKfzk8x+Aluy5KwWR9Pe6C+63znYak91lg9mCxEw2ELh9Ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fWnXhKZ6YtBZNlXxS6oNwplvtkrO8rB9HYuBMjrp05s=;
	b=ihW2+0jwIK+cnoF3JIAMNis4T85/fiGlWVE9DyUEpAX7yewjtWkVR55BTisxlpsrOERX
	 v7BcyDV4OkN6TyVErqi9LoFuYeLqBmR+Q6A7GZGrROTrT9HGC6bMnRdwsXI8AIBbYVBdj
	 cxHszgPO/qChBlCr9iOOAeWSSxQbw8gF4pYQ9XsONQgfqg4x/n+tD3NZFfHfA1fGdcdJu
	 zO2AnAhkBlBATbhHZUkrtQ8QOpUR7VCeqLL2yFtWWAi87A3I4oHAxaprs36sNiosocQ4f
	 UE2VpiAcuOXT+pjoXJUwj/Z4EBzegFpmgkc0euMM1gQmx9m9bgWClUcafmk5PRcauVg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328070;
	bh=fWnXhKZ6YtBZNlXxS6oNwplvtkrO8rB9HYuBMjrp05s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gonMkLZF3T/RbR7KNvb5afUVZldXPQXpAnn/o+egxbqwmN8l0iFQ6tb20A8Ts42yl
	 vbyNL0xtgWJAmQeMbFB5Kr+EUyk+TbTe/pV8nnMyUaI8HJUbBUp7UxsXjS+RhR9IQP
	 uwGUwZXPT3ugxdnqbLA6UV7hDaco3sKnmd6nKcCYcz/epZ+ia3NeEnWqEDZZVxqLqd
	 BIN/WZFk+1VgI5XnvJTNGmPhIOiGApGm9AYX2F+XJ1hukSMexMO6ZM+aklwQ1khYnH
	 zooCto56yvp6JM+NWyzNPQGaMfA7E/puXJCL69eJaVAhrjQMGL1ku8l+0eoVa6eOod
	 vimSjPdcu3+Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B978A405AB;
	Sun, 13 Sep 2026 19:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D5D6E53
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AE9740533
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFkBG44kHFaG for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 66B82405A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=sghKmZRE+ZlIFMjyHIuZoU/usr3LvrVz0XbqhB9bNf8B1eCV6aTq5MKi3CY/HHIZKDy/
 KQRxSEG3Dv4rl+6i+sWsbyxiAZZeqZUV6NKj/rwNzM5q3XmlF2cFyVOD2gWolZ7Fl1cn+
 /L0L5DKSk9NiwLM066EtgRz/ItAzmV2ImMTG0gdxUWpTdKGycnFSJmRDGTmOvhn9I8su8
 irPkAFAhLLIzG2l5Vcnyl+x7UFkKUuyhrM+mB9oAQO4MC3WLvGAa92138Awg/rLLfSzgT
 9c+D/7+yLscdrn3U18x1dWKG83+2JCLTBs3sFV/8MLeEcoO+GIIlmAqxCt3w8eLyzmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=K2plICsMYPKcHfxeaHNzzwtNmztBKC3lv8XD3ozjrFs=;
 b=SWW51WCSdnXmWDHdacXpAu9x6Fy7P4bhEyv7INIbJE7m1OefMo7CmyWqeJAcJU59+6ux
 Qhjg+LMHKrVxKZGZK9SqGWGHPoXbhzFyD95X+ziC1kAvhXk8e8lWZpExwewgpbvclx0Ud
 qhdfHKZujYs9O5mv1XOMClfMbQZq9VAEk4hNM3D4wjbj5udthUtuwlJKcf6sDFs2uQQoa
 MtkLahVIkNK+YSDMvcArhJ3tb0eQmpy22awrxz4QFx6LprgYzSncJpzxe5bQg8rRWiN47
 nkVoGqTaTeM74j4EqLh47N6al6s75Ef7Ou8+Sa1Ws6JAMhYxMyBDMcOTXSo0KyBaQMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66B82405A4
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46C4895C70; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aff091c39dd49c418edc406879c03dd2eb0cdf8f
X-Git-Newrev: 90aeea08bb685ac38b74799d830aff4023698cd0
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.46C4895C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: add missing
 BR2_USE_MMU dependencies
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90aeea08bb685ac38b74799d830aff4023698cd0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS selects gstreamer1, which
  has a depends on BR2_USE_MMU, but does not propagate it

- BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN selects
  libsecret, which has a depends on BR2_USE_MMU, but does not propagate
  it

In practice there is no problem since ivi-homescreen depends on glibc,
and glibc doesn't support any noMMU architecture. But just by walking
the chain of option dependencies, this is not something that is
theoretically guaranteed (making automated verification of
dependencies difficult).

The other "depends on" from gstreamer1 and libsecret, BR2_USE_WCHAR
and BR2_TOOLCHAIN_HAS_THREADS are on the other hand already handled by
the top-level BR2_PACKAGE_IVI_HOMESCREEN option, so there is no
ambiguity.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ivi-homescreen/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index a4f5f6835f..d7cc4ce04e 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -187,6 +187,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
 comment "plugins with external dependencies"
 config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 	bool "Audio Players"
+	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
@@ -201,6 +202,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 
 config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
 	bool "Flutter Secure Storage"
+	depends on BR2_USE_MMU # libsecret
 	select BR2_PACKAGE_LIBSECRET
 	help
 	  Store data in secure storage
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
