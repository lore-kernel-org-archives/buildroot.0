Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0071C52D7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F89D60ABB;
	Thu, 15 Aug 2024 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PG-4nvslfDDd; Thu, 15 Aug 2024 19:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2277D608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2277D608FB;
	Thu, 15 Aug 2024 19:56:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8251BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CCFA408CF
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umbGjfbXucBn for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 19:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.154;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54808400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54808400B5
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54808400B5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:56:29 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id D23DD308BF70;
 Thu, 15 Aug 2024 21:56:27 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id I9XtGAU0KFl5; Thu, 15 Aug 2024 21:56:24 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id 4A573308BF6F;
 Thu, 15 Aug 2024 21:56:23 +0200 (CEST)
Received: from int-subm015.mykolab.com (unknown [10.9.37.15])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id BA48C31604E6;
 Thu, 15 Aug 2024 21:56:22 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 15 Aug 2024 21:56:22 +0200
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240814231617.48c69688@windsurf>
References: <20240814204912.7116-1-zgyarmati@zgyarmati.de>
 <20240814204912.7116-2-zgyarmati@zgyarmati.de>
 <20240814231617.48c69688@windsurf>
Message-ID: <8cdd053034b109042c90d1c8116524ba@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-type:content-type:message-id:references:in-reply-to
 :subject:subject:from:from:date:date:mime-version:received
 :received:received; s=dkim20240523; t=1723751784; x=1725566185;
 bh=97GjgNcd0IqNiwQxkZ2L+rDycfOmXZa3whbVtjyKvF4=; b=bdehp6v7Mscy
 rw7Ht3Z3WSTZoxdf8TBk8+V8FbkXX0b9+05byUgfFSkDgkwECwDcxNhptyIAKYJa
 UiklZGZUAzmgF7wEOoY3PtimVI87ypGHdFHR3ABfBIgJmMMeIuEatQv85AM4rceg
 9jxiQYGOZDmFwETFlDbbqmT7eVqrVWJehU3x9rrJFVoWJd3zitkrOupo6cJHMP/w
 32/jsU3FKAMxC5z+I7dn5xXQ82y5MJpfK7a5yOenjWTb7WY+cMXi2vPvqL3UTyA9
 sXSdgvxqHRiZYwCIiNO9Ij0GwZEWW3fBaEfb8wHMatexVC97d8pELc0Mx/qBYgqq
 VsPii5v0PQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=bdehp6v7
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [RFC 1/1] package/libusb: set dependency on
 BR2_ARC_ATOMIC_EXT
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8449784855510164954=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8449784855510164954==
Content-Type: multipart/alternative;
 boundary="=_54b6d701e087f0d3b9c559836bc5be95"

--=_54b6d701e087f0d3b9c559836bc5be95
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed



Dear Thomas&All,

yep, i was afraid that that there is more to this, that's why i sent it 
in as RFC.
Let's see what is Alexey's and Yuriy's opinion on this and i'll 
investigate further as needed.

Thx

On 2024-08-14 23:16, Thomas Petazzoni wrote:

> Hello Zoltan,
> 
> Alexey, Yuriy, there is a potentially ARC-specific issue below.
> 
> On Wed, 14 Aug 2024 22:49:11 +0200
> Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:
> 
>> diff --git a/package/libusb/Config.in b/package/libusb/Config.in
>> index 5a04ac128b..637a0c7d4d 100644
>> --- a/package/libusb/Config.in
>> +++ b/package/libusb/Config.in
>> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBUSB
>> bool "libusb"
>> depends on BR2_TOOLCHAIN_HAS_THREADS
>> depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Thread_local
>> +    depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
> 
> Thanks a lot for looking into this issue!
> 
> However, this is not the right fix. First, because other architecture
> can be affected: sparcv8 most likely would suffer from the same issue.
> 
> Second because the proper solution is to ensure that libusb links
> against libatomic, which contains the implementation of
> __atomic_fetch_add_4 for architectures for which it is not a compiler
> built-in.
> 
> There is already some provision for this in configure.ac:
> 
> dnl Check for new-style atomic builtins. We first check without linking 
> to -latomic.
> AC_MSG_CHECKING(whether __atomic_load_n is supported)
> AC_LINK_IFELSE([AC_LANG_SOURCE([[
> #include <stdint.h>
> int main() {
> struct {
> uint64_t *v;
> } x;
> return (int)__atomic_load_n(x.v, __ATOMIC_ACQUIRE) &
> (int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL);
> }]])], GCC_ATOMIC_BUILTINS_SUPPORTED=yes, 
> GCC_ATOMIC_BUILTINS_SUPPORTED=no)
> AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SUPPORTED)
> if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != xyes; then
> AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
> fi
> 
> But it doesn't seem to work in this case:
> 
> checking whether __atomic_load_n is supported... no
> checking for library containing __atomic_fetch_add_4... no
> 
> The configure test fails like this:
> 
> configure:17559: 
> /home/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/arc-buildroot-linux-uclibc-gcc 
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64  -O2 -g0  -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -latomic   >&5
> conftest.c:33:6: warning: conflicting types for built-in function 
> '__atomic_fetch_add_4'; expected 'unsigned int(volatile void *, 
> unsigned int,  int)' [-Wbuiltin-declaration-mismatch]
> 33 | char __atomic_fetch_add_4 ();
> |      ^~~~~~~~~~~~~~~~~~~~
> /home/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: 
> /home/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/lib/libatomic.so: 
> undefined reference to `__atomic_test_and_set'
> collect2: error: ld returned 1 exit status
> 
> This is rather odd. Is there a bug in ARC's libatomic implementation?
> Alexey, Yuriy, what do you think?
> 
> Thanks a lot,
> 
> Thomas

-- 
https://zgyarmati.de
--=_54b6d701e087f0d3b9c559836bc5be95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p id=3D"reply-intro">Dear Thomas&amp;All,</p>
<p>yep, i was afraid that that there is more to this, that's why i sent it =
in as RFC. <br />Let's see what is Alexey's and Yuriy's opinion on this and=
 i'll investigate further as needed.</p>
<p><br /></p>
<p>Thx</p>
<p><br />On 2024-08-14 23:16, Thomas Petazzoni wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Hello Zoltan,<br /><br />Alexey, Yuriy, there is a potentially ARC-specific=
 issue below.<br /><br />On Wed, 14 Aug 2024 22:49:11 +0200<br />Zoltan Gya=
rmati &lt;<a href=3D"mailto:zgyarmati@zgyarmati.de">zgyarmati@zgyarmati.de<=
/a>&gt; wrote:<br /><br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">diff --git a/package/libusb/Config.in b/package/libusb=
/Config.in<br />index 5a04ac128b..637a0c7d4d 100644<br />--- a/package/libu=
sb/Config.in<br />+++ b/package/libusb/Config.in<br />@@ -2,6 +2,7 @@ confi=
g BR2_PACKAGE_LIBUSB<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool "libusb"<br />=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;depends on BR2_TOOLCHAIN_HAS_THREADS<br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Thr=
ead_local<br />+ &nbsp;&nbsp;&nbsp;depends on !(BR2_arc &amp;&amp; !BR2_ARC=
_ATOMIC_EXT)</blockquote>
<br />Thanks a lot for looking into this issue!<br /><br />However, this is=
 not the right fix. First, because other architecture<br />can be affected:=
 sparcv8 most likely would suffer from the same issue.<br /><br />Second be=
cause the proper solution is to ensure that libusb links<br />against libat=
omic, which contains the implementation of<br />__atomic_fetch_add_4 for ar=
chitectures for which it is not a compiler<br />built-in.<br /><br />There =
is already some provision for this in configure.ac:<br /><br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dnl Check for new-style atomic builtins=
=2E We first check without linking to -latomic.<br />&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;AC_MSG_CHECKING(whether __atomic_load_n is suppor=
ted)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AC_LINK_IFELSE([A=
C_LANG_SOURCE([[<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#incl=
ude &lt;stdint.h&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i=
nt main() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct {<br />&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t *v;<br />&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;} x;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return (int)__atomic_load_n(x.v, _=
_ATOMIC_ACQUIRE) &amp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;(int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL)=
;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}]])], GCC_ATOMIC_BU=
ILTINS_SUPPORTED=3Dyes, GCC_ATOMIC_BUILTINS_SUPPORTED=3Dno)<br />&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SU=
PPORTED)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if test "x$GC=
C_ATOMIC_BUILTINS_SUPPORTED" !=3D xyes; then<br />&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AC_S=
EARCH_LIBS([__atomic_fetch_add_4], [atomic])<br />&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;fi<br /><br />But it doesn't seem to work in this ca=
se:<br /><br />checking whether __atomic_load_n is supported... no<br />che=
cking for library containing __atomic_fetch_add_4... no<br /><br />The conf=
igure test fails like this:<br /><br />configure:17559: /home/autobuild/aut=
obuild/instance-13/output-1/per-package/libusb/host/bin/arc-buildroot-linux=
-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_O=
FFSET_BITS=3D64 &nbsp;-O2 -g0 &nbsp;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOUR=
CE -D_FILE_OFFSET_BITS=3D64 &nbsp;conftest.c -latomic &nbsp;&nbsp;&gt;&amp;=
5<br />conftest.c:33:6: warning: conflicting types for built-in function '_=
_atomic_fetch_add_4'; expected 'unsigned int(volatile void *, unsigned int,=
 &nbsp;int)' [-Wbuiltin-declaration-mismatch]<br />&nbsp;&nbsp;&nbsp;33 | c=
har __atomic_fetch_add_4 ();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~~~~~~~<br />/home/autobuild/autobu=
ild/instance-13/output-1/per-package/libusb/host/bin/../lib/gcc/arc-buildro=
ot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home=
/autobuild/autobuild/instance-13/output-1/per-package/libusb/host/bin/../li=
b/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-ucl=
ibc/lib/libatomic.so: undefined reference to `__atomic_test_and_set'<br />c=
ollect2: error: ld returned 1 exit status<br /><br />This is rather odd. Is=
 there a bug in ARC's libatomic implementation?<br />Alexey, Yuriy, what do=
 you think?<br /><br />Thanks a lot,<br /><br />Thomas</div>
</blockquote>
<p><br /></p>
<div id=3D"signature">-- <br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
<a href=3D"https://zgyarmati.de" target=3D"_blank" rel=3D"noopener noreferr=
er">https://zgyarmati.de</a></div>
</div>
</body></html>

--=_54b6d701e087f0d3b9c559836bc5be95--

--===============8449784855510164954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8449784855510164954==--
