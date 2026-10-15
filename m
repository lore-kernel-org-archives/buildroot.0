Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD23CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830924062C;
	Thu, 15 Oct 2026 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5Vp5ijU35cv; Thu, 15 Oct 2026 20:04:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9929B407B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094683;
	b=W0Gv7b+DOUgkSuWKB/6aE/50JBq9lo8S1XtccoIErQHlxrOZc7U2Nj6RwVGPqW5xiWgU
	 oEQuBK0qWU3yDirLB67aA62054+tRx/+q56l/YNnTUvJNkUylc0/RP2PUVXGe94iQ344Z
	 BlgXaGM+f3e+zdFHrzZmzCrt8upwqdO9X9cTOa1esG+eoQYoE1CO+QbNSHyv56OneZyvZ
	 BpOlQEnMG22QfEU7C/WDl/sY7YNgsjnBWfJDWL8EpIoJFHdRP7HJBPgM9ChVLw8bB5ZN7
	 uuvAu0lg7kEbg0UwouYJOY8OoDH+qBZK8j9558gPFP1pv2LOSdqt1RRaoKxhYaRik2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094683;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=yk40cXItOlM6vzfn8R+G7/N7oD9OYD6quyf6ENLkKps=;
	b=HDDABsz0UKMjk8kl8ca0eiXT58oT//JNs570d6QOrCScyJfdwtbhK+4qEsEVok5BnjPt
	 fQh/I1op0+rFXeJOiLrzsNkaHXX9NtDZLsoKHdwRO407hzOnwMs8A6Exanq8/qL2kYL5p
	 yKRL6HKCCJGXq9HxOmumsKsVQNM5vBqpbo7xQnNEpRdx2JkzoTFFpaXtgkaauJvXo7y6K
	 MeFLHHKTU1DDCOUQJaTsz2My2yaQHJ346cI8uIifQlb7VT5AR4Lmu94PVTymTAakh0Vlr
	 v4bpasDc5PGg/KVK9iKE3hMmpWiCd7E+6cYHcoktouAf+AxZtjQSMUTzXCipoAJc8Eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094683;
	bh=yk40cXItOlM6vzfn8R+G7/N7oD9OYD6quyf6ENLkKps=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=URb6LpdpZz9zK8ulXpaEzPbJIbdN7QIsS2oMRFxspluNkn6RLwIykcUjq1SrKsyqf
	 MTAHr0tWYSuxKwt0GGp34C3wFaK9Dd0Gmn5/D9vGTuyd0JA+izpunwnHkns9O65vmN
	 zMC1Q2byeeiD5mAgYH24TyK/tJ7F9D5yBd6aDyJiZrk8lmq3zeo1XaHV8l0LDQRHKD
	 +x1uaRVSAI1sOmtcEhlTv/94q6zyFbIQGZyLQjDhLfTq/I4T7CzgIwP5GyktCjE0Rw
	 q6QDmQGtM6gxBt2rHL19+xC0ZV22VM8uobxsxYkfrvyl6LVeQFTa5hX2EgobOLrEu3
	 V9RuftP2d9kvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9929B407B3;
	Thu, 15 Oct 2026 20:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C591AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 266A9607C6
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tx10X-afBlfU for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:04:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6341060A83
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094680;
 b=byJNsdkVSy6S1cZi2XWbd1mEURQl1fcI7RBt0lv6Fx06PI6B5b+XzfarXbqjIyUOOPav
 MV1dDKBCDMpEeusZmJAJ+qbzlYhzl2dvxxtp/0eVHzmKIOjXCoG8RVj+4SPFJIR4+6amu
 D+dpqA1lpdZFK9dC6VyNlxKntl0NXkNw6uRig8bl3tNtZPk1uRRhNt+zbyPcV7YD+l+Se
 H/kFKkuEBfu+mqJAn95NJv8QTohp2XPeeV1w/kScP3SvC5tj/+Ns+OicOU7ENx5LcxfoL
 Os1djYLuLIBVqo9hr7QiExXjSdcW+fgKBboqAxbke9hWCTh6beaO/TdzrKEH+QtlqBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094680;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=AIJsjfJM/oZZGq8Jug9I2IVJeCZ7BoWDB95ckMtsBRQ=;
 b=IuwRXL2+IJ7z1aY/52kQ3vkaNMRx0ne4maPM8wybOfxq6HL59T0lD6vxGB0OjY8Ov77S
 y9SV8Cy8LkUowwGazGUSXe/Kvhapgp7rIUZ5uw+QyDxitgjNvDtUm/jVrstNbf/i2N1Zl
 qWzo+7vvQFOdtXQB4e5Tdd1EiXqLG/KoJu0At0ykKCIgUab6QOXlGTGenjNjqqJUxa3qV
 9BH2ctNKnTziTlnmbqu0zM4Avu8V//nU8ZT/EaPDYO9cPPrQL2Ws3jz/47I1QJqckj3pO
 W9JaujhiuIurV9Rq4Y7rrHnRcw7PCKeNCv4zwNBpeZCU5wwpGEQ5as2zyAmiqvMvpPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ITkpoGDj; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6341060A83
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:04:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1x27jN2tpY-00Srib; Thu, 15
 Oct 2026 22:04:33 +0200
Message-ID: <1cd8fb5c-c628-4b15-b081-0e8f98ff9990@gmx.de>
Date: Thu, 15 Oct 2026 22:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20261015190219.243913-1-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261015190219.243913-1-peter@korsgaard.com>
X-Provags-ID: V03:K1:tIBAd+PdVFFLd50af7xkFTU7CUegptS28q6+5JOrq5t1rfGZB9u
 db7ObGMlW16OHo7m4jLI7SGfQ9ONbfLDfrUh5mElXdxgHkJURj+pTZlYEOkFjI1eIT6pSMo
 XPP8RaahJ0B/zkSQGOop5wbGg+zFAUu/bgJ+3K4PrJgjpk0mgHAQDJs7uNPQ3Ig3fcYyZZ/
 R08f02TImXElDVRIoqdOQ==
UI-OutboundReport: notjunk:1;M01:P0:QItI2OhlQhQ=;Ur9SoEnhDnxFpS+n4i+SVVT9A0M
 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
Subject: Re: [Buildroot] [PATCH] package/libglib2: backport upstream
 security fix for CVE-2026-58016
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 15.10.26 um 21:02 schrieb Peter Korsgaard:
> Fixes the following vulnerability:
> 
> CVE-2026-58016: A flaw was found in GLib.  A state confusion issue exists in
> g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> processing malformed D-Bus introspection XML, specifically with a `node`
> element nested within other elements like `method`, `signal`, `property` or
> `arg`.  This issue can cause an unsigned integer overflow and lead to an
> out-of-bounds read, resulting in a denial of service.
> 
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5156
> 
> Backport the upstream patch (included in 2.89.0), but drop the test addition
> for easier backport:
> 
> https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thank you!

> ---
>   ...on-Fix-XML-parser-state-handling-for.patch | 42 +++++++++++++++++++
>   package/libglib2/libglib2.mk                  |  3 ++
>   2 files changed, 45 insertions(+)
>   create mode 100644 package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> 
> diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> new file mode 100644
> index 0000000000..4582382f80
> --- /dev/null
> +++ b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> @@ -0,0 +1,42 @@
> +From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Thu, 16 Apr 2026 15:27:37 +0100
> +Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
> + element nesting
> +
> +The check for whether a `<node>` element in D-Bus introspection XML was
> +nested correctly was broken. `<node>` elements can only be at the top
> +level, or nested immediately within another `<node>` element.
> +
> +Fix the check and add some unit tests for it.
> +
> +Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
> +uses example XML strings adapted from their report.
> +
> +Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> +
> +Fixes: #3932
> +CVE: CVE-2026-58016
> +Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +[Peter: drop tests]
> +---
> + gio/gdbusintrospection.c        |  2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
> +index 1138ba9d7..4df8e87db 100644
> +--- a/gio/gdbusintrospection.c
> ++++ b/gio/gdbusintrospection.c
> +@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
> +   /* ---------------------------------------------------------------------------------------------------- */
> +   if (strcmp (element_name, "node") == 0)
> +     {
> +-      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
> ++      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
> +         {
> +           g_set_error_literal (error,
> +                                G_MARKUP_ERROR,
> +--
> +2.47.3
> +
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 45aa894b81..3770e8671a 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -17,6 +17,9 @@ LIBGLIB2_INSTALL_STAGING = YES
>   LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
>   LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>   
> +# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
> +LIBGLIB2_IGNORE_CVES += CVE-2026-58016
> +
>   # glib/valgrind.h contains inline asm not compatible with thumb1
>   ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>   LIBGLIB2_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
