Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C85DC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 19:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4464013F;
	Mon,  8 Aug 2022 19:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4464013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjvDPSSe-JdB; Mon,  8 Aug 2022 19:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D08240112;
	Mon,  8 Aug 2022 19:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D08240112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBF81BF2B4
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0221B408A2
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 19:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0221B408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRXIZCWYUU6b for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 19:59:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED1240888
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ED1240888
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 19:59:05 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z20so10759931edb.9
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 12:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=W17bH72fQdGYsbxGIxzZZqHde3ynrqD11YXSKounWRY=;
 b=sN7OXUxKICrbyEFzOMBPp/GTwCxMEGBaT384UOO53zq6VjYa3ZlRptdL15JCOKtLMC
 BTBVyxNqYDuPu4z40Flfg0V+jPkpidlO186PXlL1+EuM+T6nYYgfrKJ79g28uG6oS5Jh
 JiztU2vXSb+YSKcZHOKCp1+3SsYuPg+B5AdOw3o6VP/1NtTFwfj692Fl6uZKHm3i758T
 oGsB2vdyeiSVeTf7VxTjDefHOiWOo0HQs4IHxbj22yArwTlT+7wlrX1xSpCr0WKZV684
 37fwXKGl0loMBzOhf4c5DWPeUcgaDRaIKH44v8UHqbG4CTKoGNzqDKjMKR2Kt49EjYHa
 opSA==
X-Gm-Message-State: ACgBeo1GfdNGyBahn9bFjR/d7yvjcL3AzCm5ODQujZ70y9E0LLfYHm0V
 +WI1SSE63a7IUg5HoK8dHwE=
X-Google-Smtp-Source: AA6agR6IHgGemE7Cm2E2oTm9HF5I66xCHIaNRHjrH0i+LE5bWTAFrn+2xWDOmmeFdY9PVff8ZrGLzg==
X-Received: by 2002:a05:6402:293:b0:43d:3936:66b0 with SMTP id
 l19-20020a056402029300b0043d393666b0mr18797716edv.404.1659988743527; 
 Mon, 08 Aug 2022 12:59:03 -0700 (PDT)
Received: from localhost (ip-109-42-113-71.web.vodafone.de. [109.42.113.71])
 by smtp.gmail.com with ESMTPSA id
 co15-20020a0564020c0f00b0043c83ac66e3sm4962002edb.92.2022.08.08.12.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:59:02 -0700 (PDT)
Date: Mon, 8 Aug 2022 21:59:00 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Message-ID: <20220808215900.0fc19e1b@tuxfamily.org>
In-Reply-To: <20220808102653.5a7a0584@windsurf>
References: <20220806224338.0159e15c@windsurf>
 <20220808101452.566fd732@tuxfamily.org>
 <20220808102653.5a7a0584@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Peter Seiderer <ps.report@gmx.net>, Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN\"   <yann.morin.1998@free.fr>"@osuosl.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 8 Aug 2022 10:26:53 +0200
schrieb Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Thomas,
> 
> On Mon, 8 Aug 2022 10:14:52 +0200
> Thomas Huth <huth@tuxfamily.org> wrote:
> 
> > > qemu_xtensa_lx60_nommu_defconfig -> elf2flt segfaults
> > > https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053940
> > > 
> > > qemu_m68k_mcf5208_defconfig -> elf2flt segfaults
> > > https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053827    
> > 
> > I'm interested in keeping the qemu defconfigs alive, please don't remove
> > them yet. I'll try to figure out what's going wrong here.  
> 
> So these are "special" issues. The elf2flt segfault is caused by the
> changes in elf2flt to support RISC-V 64-bit noMMU, in commit
> 32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33.
> 
> However, even with this removed, we have issues with elf2flt. See
> https://lore.kernel.org/buildroot/20220725164425.7316b2e3@windsurf/ for
> more details, and also
> https://lore.kernel.org/buildroot/ce677d88-8f8e-2d81-4e7b-69a35a99c6b9@smile.fr/.

Thanks for the pointers! I had a look at the source for a while, and from
what I can see, I came to the same conclusion that the modifications for
ARM should really not have been done for m68k / binutils 2.32.

I can get the mcf5208 board back working by applying a patch like this on
top of the current state in buildroot (fixes both, the segfault and the
section overlapping):

diff -u output/build/host-elf2flt-2021.08/elf2flt.c output/build/host-elf2flt-2021.08/elf2flt.c.new
--- output/build/host-elf2flt-2021.08/elf2flt.c	2022-08-08 20:45:00.671502651 +0200
+++ output/build/host-elf2flt-2021.08/elf2flt.c.new	2022-08-08 20:45:51.105171045 +0200
@@ -346,6 +346,17 @@
 }
 #endif
 
+static int is_text_sec(asection *s)
+{
+#if defined(TARGET_m68k) || defined(TARGET_xtensa)
+  return (s->flags & SEC_CODE);
+#else
+  return ((s->flags & SEC_CODE) ||
+          ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+                       (SEC_DATA | SEC_READONLY | SEC_RELOC)));
+#endif
+}
+
 static uint32_t *
 output_relocs (
   bfd *abs_bfd,
@@ -435,10 +446,7 @@
 	 * Only relocate things in the writable data sections if we are PIC/GOT.
 	 * Otherwise do text (and read only data) as well.
 	 */
-	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
-	    ((a->flags & SEC_CODE) ||
-	    ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-		         (SEC_DATA | SEC_READONLY | SEC_RELOC))))
+	if ((!pic_with_got || ALWAYS_RELOC_TEXT) && is_text_sec(a))
 		sectionp = text + (a->vma - text_vma);
 	else if (a->flags & SEC_DATA)
 		sectionp = data + (a->vma - data_vma);
@@ -1901,10 +1909,7 @@
     bfd_size_type sec_size;
     bfd_vma sec_vma;
 
-    if ((s->flags & SEC_CODE) ||
-        (((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-                     (SEC_DATA | SEC_READONLY | SEC_RELOC)) &&
-          !data_len)) {
+    if (is_text_sec(s) && !data_len) {
       vma = &text_vma;
       len = &text_len;
     } else if (s->flags & SEC_DATA) {
@@ -1941,9 +1946,7 @@
    * Includes code sections, but also includes read-only relocation
    * data sections.*/
   for (s = abs_bfd->sections; s != NULL; s = s->next)
-    if ((s->flags & SEC_CODE) ||
-       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-                    (SEC_DATA | SEC_READONLY | SEC_RELOC)))
+    if (is_text_sec(s))
       if (!bfd_get_section_contents(abs_bfd, s,
 				   text + (s->vma - text_vma), 0,
 				   elf2flt_bfd_section_size(s)))
@@ -1971,9 +1974,7 @@
    * Includes data sections, but not those read-only relocation
    * data sections already included in the text output section.*/
   for (s = abs_bfd->sections; s != NULL; s = s->next)
-    if ((s->flags & SEC_DATA) &&
-       ((s->flags & (SEC_READONLY | SEC_RELOC)) !=
-                    (SEC_READONLY | SEC_RELOC)))
+    if ((s->flags & SEC_DATA) && !is_text_sec(s))
       if (!bfd_get_section_contents(abs_bfd, s,
 				   data + (s->vma - data_vma), 0,
 				   elf2flt_bfd_section_size(s)))

Does that look passable for buildroot? If so, I can send it as a proper
patch for buildroot (i.e. a patch that adds a patch to the packages/elf2flt/
directory) and also try to get it upstream later. If not ... I'm also
running out of ideas here ... then maybe it's really time to retire the
old boards that depend on binutils 2.32 nowadays...

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
