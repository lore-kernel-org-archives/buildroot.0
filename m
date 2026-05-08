Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB90CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F700615BF;
	Fri,  8 May 2026 10:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdVQAX8qfeUp; Fri,  8 May 2026 10:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A48615B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778234950;
	bh=3j+QT4t4sVgsXNg4g+Co3oCHx1Ow/L3Wi/EF8c+/ZJM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FikkCqFXoQQz9O4U/WQcxFeqs8uhq39r/5rT6hz0x/z0MXFpq5BDugjAsI2aouDBU
	 MFRhpyWdG4i368wQHaXkFkvQeXLSh2awMHmBGFmdSzK2hLfKDu58K5cvRF3hb2f3hG
	 kxnM4SeULcBJc3RhPSFut2jZjughWB0PGdXR/bhh79n5pMi2sBoaQ/SI93AGLLsOYI
	 fKB3pLwRoQaKThudZhGNq09+UhTZBvBmfyPB82UNKlve0C0PS7Wr4CO/MmIB+F4G4T
	 W7Fj9iiWtSLfAR8x0ZUP0dGJfTV4cSKVatCr56DvQJ2mUFMQEY506g13b3f46A3BTX
	 aeqKhyopXTPFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A48615B8;
	Fri,  8 May 2026 10:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D8B0317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B29940A0A
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0_U4oePs6Ud for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E6EF40918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6EF40918
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E6EF40918
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:09:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-67e9b3037dcso1670987a12.0
 for <buildroot@buildroot.org>; Fri, 08 May 2026 03:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778234946; cv=none;
 d=google.com; s=arc-20240605;
 b=a0tiKpwYhTApotgKtkGMxYzb/eVpKnvIaU4gl/5meK6t45FvoZLYNxDJqBT8jLqvzm
 6C82zMz0bC6ixRI7dRdy+Do2w7R+5VJV05izrpzZs80tKlgzIMi8522n8WBv7GBmb0WB
 2fyLYzKe21sP6oxWf8ik9611+ClmFaqm/ULC3ZHzCacpFqAPMj8M3zx7L4W3LXuDMl+I
 RdNSs58HYAii6qEUbZsG7rFnjrFP10GVNiNwumWO2YfTah0mbWrqzJCZj2LQ0yeNX2wp
 zeJO4pGAsAbEFrgYxyLs/jnp/BOb+E0M5mja1+5vsl4+dBNrAG30QCTR/HKDmQk+feg4
 4geA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UqLznJVoQ/71Hy30jJOV1x72xZfgY8m1lIMmWlbII5c=;
 fh=eyXCqroiavktjz/ByyCHggnl/2UblsBO1wba2hv+HXA=;
 b=ELaXu2tbc5M4HaSfdJLS6slMzOcuUruhR5aWYnMIT9SaHZQnz8FrRkT+LSPQk86ad+
 zxocMatryQp7h95SQKWMQdGHF67dlwcFCIIRlkfuTbMDeTbprXWJoEG4Aa2WxNQPQydY
 l39PNSnwmOVsTYt9WG7TXMCBXyXeXMvfkHe9Fpa+yOjli9L7NK1uvI+q+t7ycTxun/Yv
 N4l66INszfE321XG9j3MIVFLrD5bI0IfqDl8QyvXyJQFH0oGSH8QZjhrIdgWza7RaCHI
 DwWwH1xrkuXyAFTBzyt6ZW8xvCDnfP0NbBxKr/hHZOIHXwO8EuZCMBie6G4fy8tSpn+J
 EjbA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778234946; x=1778839746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqLznJVoQ/71Hy30jJOV1x72xZfgY8m1lIMmWlbII5c=;
 b=QQTE2Ki2FPPmW+1t/EAoV7PtjVJWc75TjgXjFGQykqDGOeMsPQ4WLvSC2EZziYqZHu
 6Ce85i/2QEcUHwX1N1GdB1eAHVDNmYCeSeyGpMSscArUOh5oZWgEKcp1JtdsvIL/pY8L
 Wai5B2oxzmteSmGw+LCErQmA6uL8ZYquOiJjQBorTT+50G5F5CpEVGV2eVuvuAocWpv8
 mX9TS/O0xNZcxsw6YtgGM+64j7rSD4PmVkuWjosGiKTcm2ThRBVf99HSkvmM//Yf1LKQ
 Ib6TSbgPaBCW5//os6cRWQnFToE0DR1DATB0E8lBEtSUe4SmeBUOWKY1G3ClyMi6R/Un
 K4Hw==
X-Gm-Message-State: AOJu0Yx41Zppfetbi02V4VHM7ccUtFOodO83/FoZQzxjV9aC7o8XwDFG
 20MwsHNwAbRx0o/Q7M7PnWjKNtDQuNwDnZeqi+Jl5aC6KxyqKMxfgynDJp27gyB6fpRjVhWIpxQ
 HogBD2DVVHp8l8n4679krivWktiIhvCgNRCYJ9hydLA==
X-Gm-Gg: Acq92OF0z5pazCIxt94RVHJuXS/MQRcbdKD4yO90/ul1RS9ghiLwNb4fWK1cMZAOhxh
 a+EusZGK/d8Vwhyn5WQmoUIU8AzRfLW0Wug+pLvJi2PYPwD71wrF4aYNZri4XMyVviUZKY/tyLw
 ITW0f4T2Z8v79cibCJbK+OwEU8fA4vqZHrKFInub5DzuKzKwE9PCP8xkmNpHP8rlxo7kT19r9S/
 7zvcRUvdxgwmiWsr/Mk1RUAlMYmdhOx3MmYDNOfrv2cR8N6tbAFTW6gG78HtV5knSkRr2qblR6e
 pf0BrI5tgLGNVR6l
X-Received: by 2002:a05:6402:1ec9:b0:676:9c6d:5c4d with SMTP id
 4fb4d7f45d1cf-67ef09b24c2mr1004765a12.17.1778234946008; Fri, 08 May 2026
 03:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <20260506223341.1759760-35-james.hilliard1@gmail.com>
 <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
In-Reply-To: <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Date: Fri, 8 May 2026 12:08:54 +0200
X-Gm-Features: AVHnY4KpfQ1oaANvXPKO_dUqjYdjKVs_KWtIK7Jtohxnv9zqKtvvBUUm-qPEtYM
Message-ID: <CAMwDAPi5_9AjWgvc+M8SjOZ5cf9YLR2B_WDBg9PTiUbfyH75WA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>, manuel.diener@oss.othermo.de
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>, 
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>, Brandon Maier <brandon.maier@collins.com>, 
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Doug Kehn <rdkehn@gmail.com>, 
 Spenser Gilliland <spenser@gillilanding.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1778234946; x=1778839746; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UqLznJVoQ/71Hy30jJOV1x72xZfgY8m1lIMmWlbII5c=;
 b=LXIrwJH8wXv4LK1Vi/rWUJFSHavcs3rW9FPNR8hWxCWeFzOvXM20VX/kXR2XFYpSmV
 yubS1PphzlbHvvH6NtIpwTrYgV2ALSSuU/hynQ28015bmoUptvWLB7LiY8d4x9JSRa3+
 EzZLbpq+y4a17+7cJPC3spkmHr/oVe2O1sBK96Udo6vZNPS9eWSXcKMhumeXobrpAZYt
 AX5Ss0gGsaoLHbjHN4Uo5sHO/XX/Y6o/zPrhDgUzCXsr4jUo6tasCu9Xhs9pjbfKUYrN
 2LBVG2CeKAxY90pdOx2PXhZpNpxmUpOv8ad5MJoP5W+pUE+BHQ/sxJ4BCBrIcXpEo1AS
 VX4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=LXIrwJH8
Subject: Re: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve
 /usr/sbin symlink
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
Content-Type: multipart/mixed; boundary="===============2805349586645900705=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2805349586645900705==
Content-Type: multipart/alternative; boundary="00000000000048cac706514b96c7"

--00000000000048cac706514b96c7
Content-Type: text/plain; charset="UTF-8"

Edit: I think there was a misunderstanding; I thought you were the
maintainer for uboot-tools for a second. Sorry about that.

Added "Manuel Diener" who did the last version bump commit for uboot-tools
to the thread.

On Fri, 8 May 2026 at 11:57, Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
wrote:

> Hi James!
>
> -D normally doesn't replace symlinks with directories, but Ubuntu 26.04
> ships with Rust uutils instead of GNU coreutils, which has a bug in
> `install` that causes this:
>
> https://github.com/uutils/coreutils/issues/12166
>
> This also affects lots of other packages (e.g. lvm2) and patching every
> single one of them to not use `install -D` is probably out of the question.
>
> Also, can you look at my patch for issue 173 (
> https://gitlab.com/buildroot.org/buildroot/-/work_items/173)? uboot-tools
> currently silently builds without FIT_SIGNATURE support even if enabled.
> This should be fixed.
>
> Best regards,
> Ferdinand Bachmann
>
> On Thu, 7 May 2026 at 00:34, James Hilliard <james.hilliard1@gmail.com>
> wrote:
>
>> With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
>> Using install -D for files below $(TARGET_DIR)/usr/sbin can create
>> the parent directory path and replace that symlink with a real
>> directory.
>>
>> With per-package directories, this can later make rsync fail when a
>> package target directory contains a non-empty usr/sbin directory and
>> the skeleton provides usr/sbin -> bin.
>>
>> The skeleton dependency has already created /usr/sbin, either as a
>> directory or as the merged-bin symlink, so use plain install and let it
>> follow the existing path.
>>
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> ---
>>  package/uboot-tools/uboot-tools.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/
>> uboot-tools.mk
>> index fa0b6aba78..89d2ec38ea 100644
>> --- a/package/uboot-tools/uboot-tools.mk
>> +++ b/package/uboot-tools/uboot-tools.mk
>> @@ -92,14 +92,14 @@ endif
>>
>>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
>>  define UBOOT_TOOLS_INSTALL_FWPRINTENV
>> -       $(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv
>> $(TARGET_DIR)/usr/sbin/fw_printenv
>> +       $(INSTALL) -m 0755 $(@D)/tools/env/fw_printenv
>> $(TARGET_DIR)/usr/sbin/fw_printenv
>>         ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
>>  endef
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
>>  define UBOOT_TOOLS_INSTALL_DUMPIMAGE
>> -       $(INSTALL) -m 0755 -D $(@D)/tools/dumpimage
>> $(TARGET_DIR)/usr/sbin/dumpimage
>> +       $(INSTALL) -m 0755 $(@D)/tools/dumpimage
>> $(TARGET_DIR)/usr/sbin/dumpimage
>>  endef
>>  endif
>>
>> --
>> 2.53.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--00000000000048cac706514b96c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Edit: I think there was a misunderstanding; I thought=
 you were the maintainer for uboot-tools for a second. Sorry about that.</d=
iv><div><br></div><div>Added &quot;Manuel Diener&quot;=C2=A0who did the las=
t version bump commit for uboot-tools to the thread.</div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, 8 May 2026 at 11:57, Ferdinand Bachmann &lt;<a href=3D"mailto:=
ferdinand.bachmann@go-e.com">ferdinand.bachmann@go-e.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv>Hi James!</div><div><br></div><div>-D normally doesn&#39;t replace symli=
nks with directories, but Ubuntu 26.04 ships with Rust uutils instead of GN=
U coreutils, which has a bug in `install` that causes this:</div><div><br><=
/div><div><a href=3D"https://github.com/uutils/coreutils/issues/12166" targ=
et=3D"_blank">https://github.com/uutils/coreutils/issues/12166</a></div><di=
v><br></div><div>This also affects lots of other packages (e.g. lvm2) and p=
atching every single one of them to not use `install -D` is probably out of=
 the question.</div><div><br></div><div>Also, can you look at my patch for =
issue 173 (<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/work_ite=
ms/173" target=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-/work=
_items/173</a>)? uboot-tools currently silently builds without FIT_SIGNATUR=
E support even if enabled. This should be fixed.</div><div><br></div><div>B=
est regards,</div><div>Ferdinand Bachmann</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 May 2026 at 00:34,=
 James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"=
_blank">james.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">With BR2_ROOTFS_MERGED_BIN=3Dy, /usr/sbin =
is a symlink to bin.<br>
Using install -D for files below $(TARGET_DIR)/usr/sbin can create<br>
the parent directory path and replace that symlink with a real<br>
directory.<br>
<br>
With per-package directories, this can later make rsync fail when a<br>
package target directory contains a non-empty usr/sbin directory and<br>
the skeleton provides usr/sbin -&gt; bin.<br>
<br>
The skeleton dependency has already created /usr/sbin, either as a<br>
directory or as the merged-bin symlink, so use plain install and let it<br>
follow the existing path.<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"n=
oreferrer" target=3D"_blank">uboot-tools.mk</a> b/package/uboot-tools/<a hr=
ef=3D"http://uboot-tools.mk" rel=3D"noreferrer" target=3D"_blank">uboot-too=
ls.mk</a><br>
index fa0b6aba78..89d2ec38ea 100644<br>
--- a/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a><br>
+++ b/package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"noreferr=
er" target=3D"_blank">uboot-tools.mk</a><br>
@@ -92,14 +92,14 @@ endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)<br>
=C2=A0define UBOOT_TOOLS_INSTALL_FWPRINTENV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printe=
nv $(TARGET_DIR)/usr/sbin/fw_printenv<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 $(@D)/tools/env/fw_printenv =
$(TARGET_DIR)/usr/sbin/fw_printenv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_se=
tenv<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)<br>
=C2=A0define UBOOT_TOOLS_INSTALL_DUMPIMAGE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(T=
ARGET_DIR)/usr/sbin/dumpimage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 $(@D)/tools/dumpimage $(TARG=
ET_DIR)/usr/sbin/dumpimage<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
-- <br>
2.53.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>
</blockquote></div>

--00000000000048cac706514b96c7--

--===============2805349586645900705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2805349586645900705==--
