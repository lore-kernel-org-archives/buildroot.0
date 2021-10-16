Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66EEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 14:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C9A96109E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 14:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C9A96109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEDD44042D;
	Sat, 16 Oct 2021 14:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shrdzuVg3PZd; Sat, 16 Oct 2021 14:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019BE40406;
	Sat, 16 Oct 2021 14:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1DC1BF30B
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 14:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA01C40406
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 14:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwDAuBKUujGU for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 14:58:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB6CB403DB
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 14:58:02 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id s3so10367730ild.0
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ovXzGbTrh5vNOTwwd8DDXB2Ly7XEA4+KqwX5ed+CUiQ=;
 b=SLToTjMdIky0urT5EX5+zR50FAqsnOOiAtlajM0LUIpgkTLjpVmiLrCsb6xU7Ks/CF
 qwpJdhH+IKXL0YbcuFVWmyzDSdznsPWUtnSyJqffJLwujTDyImKEZ3b7pTYbRCrG5L7w
 rCc+YD7vs3wUptP09U1GE+wf32irvZBIVb3jvTqmAvDu6E9KaI1vTSaJDxaszabGU2lP
 1ljHYMUkafAFclYvzcqZkSmbDBLh230zbofePDafKv2ZhhD943OfhUZ3q0HPtKJzO0zk
 w41VZpwtga2OnGAmEInnqXnTzxyauD+rL5cOC/6nzQB59oGekDjYJ8CkkNVEoAmH81NH
 TPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ovXzGbTrh5vNOTwwd8DDXB2Ly7XEA4+KqwX5ed+CUiQ=;
 b=S4vkgbtIFAF0CQ0tvDhaIUt2onwosAdqQdI+QsqRla5Xn9/YETXX4JwScHHWfvAizU
 QlhLCYLOxMKeV1XpYMoTGlTUlx8qzQkQR5pwb4v5MhjsXi9S1zx7Bvl0G3A4oxeMHVHR
 NbM9rrnYq4H4gGc5TpUNdDZ+ZD8UXOFS19OjF4WPCQn4diuk29JR0n+2dkrpwWoWuyvC
 TOBV/nIlyHcg+s4ar4MAHP3jJ1E+hKvjBW+ScObe1M3Had3xlIi+xEZTmadWRB7AsYZu
 A9SQh2zrSlhzaNXjQMy3iuQ6u+5mI754jcZ77Vvqr/p+uIox3SFVWx+caOUxl2Tl3p+k
 JU5Q==
X-Gm-Message-State: AOAM532ONvDfgiuAif4bTbL8Mq/A60BA/wudvSxgPFV015o2JWs++Ou9
 Isw2vHt40SuvBGxalGLr7/YgNe1mGSbQwX9YuKr9jw0YGfIH
X-Google-Smtp-Source: ABdhPJyoSxXTeyiv3m/C+YdLKBbaMoSsLwNm/Nyy7Q/CIeNKt/dzfavUdIRn1bQouqLBwedevEcRWGXUHbjXVNdVrcw=
X-Received: by 2002:a05:6e02:1a2d:: with SMTP id
 g13mr8064666ile.123.1634396281649; 
 Sat, 16 Oct 2021 07:58:01 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sat, 16 Oct 2021 18:57:56 +0200
Message-ID: <CA+eej5MX+5kes-LBQkjRVTFiEBm9N4TO5qyecu01vkT98fCYwg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] how can i implement my kernel module and debug it
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
Content-Type: multipart/mixed; boundary="===============8966868539942182370=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8966868539942182370==
Content-Type: multipart/alternative; boundary="000000000000ca3e2005ce7989e8"

--000000000000ca3e2005ce7989e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone .
Sorry for the inconvenience , ...

I want to know how to load my kernel module, run it see these traces using
dmesg and debug it.

So , i have read this part of the  (manual
<https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_pac=
kages_building_kernel_modules>)
, but i don't know how to use it :

| What you may have noticed is that, unlike other package infrastructures,
we | explicitly invoke a second infrastructure. This allows a package to
build a kernel | module, but also, if needed, use any one of other package
infrastructures to | build normal userland components (libraries,
executables=E2=80=A6). Using the kernel-module infrastructure on its own is=
 not
sufficient; another package infrastructure *must* be used.

but in my way , i have try something :

- Config.in

config BR2_PACKAGE_KERNEL_MODULE
        bool "kernel_module"
        depends on BR2_LINUX_KERNEL
        help
                Linux Kernel Module Cheat.

- external.mk

KERNEL_MODULE_VERSION =3D 1.0
KERNEL_MODULE_SITE =3D $(BR2_EXTERNAL_KERNEL_MODULE_PATH)
KERNEL_MODULE_SITE_METHOD =3D local
$(eval $(kernel-module))
$(eval $(generic-package))

- Makefile

obj-m +=3D $(addsuffix .o, $(notdir $(basename $(wildcard
$(BR2_EXTERNAL_KERNEL_MODULE_PATH)/*.c))))
ccflags-y :=3D -DDEBUG -g -std=3Dgnu99 -Wno-declaration-after-statement

.PHONY: all clean

all:
    $(MAKE) -C '$(LINUX_DIR)' M=3D'$(PWD)' modules

clean:
    $(MAKE) -C '$(LINUX_DIR)' M=3D'$(PWD)' clean

- hello.c

#include <linux/module.h>#include <linux/kernel.h>

MODULE_LICENSE("GPL");
static int myinit(void)
{
    printk(KERN_INFO "hello init\n");
    return 0;
}
static void myexit(void)
{
    printk(KERN_INFO "hello exit\n");
}

module_init(myinit)
module_exit(myexit)

And in the terminal :

make BR2_EXTERNAL=3D"$(pwd)/../kernel_module" qemu_x86_64_defconfig
echo 'BR2_PACKAGE_KERNEL_MODULE=3Dy' >> .config
make BR2_JLEVEL=3D"$(($(nproc) - 2))" all
qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive
file=3Doutput/images/rootfs.ext2,if=3Dvirtio,format=3Draw -append
root=3D/dev/vda -net nic,model=3Dvirtio -net user


On qemu :

modprobe hello
modprobe: module hello not found in modules.dep

how can i solve it ??

please i need your help

--000000000000ca3e2005ce7989e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone .<br>Sorry for the inconvenience , ...<br><br>=
<div>I want to know how to load my kernel module, run it see these traces u=
sing dmesg and debug it.</div><div><br></div><div>So , i have read this par=
t of the=C2=A0 (<a href=3D"https://buildroot.org/downloads/manual/manual.ht=
ml#_infrastructure_for_packages_building_kernel_modules">manual</a>) , but =
i don&#39;t know how to use it :</div><div><br></div><div>| What you may ha=
ve noticed is that, unlike other package infrastructures,
we | explicitly invoke a second infrastructure. This allows a package to
build a kernel | module, but also, if needed, use any one of other package
infrastructures to | build normal userland components (libraries,
executables=E2=80=A6). Using the <code class=3D"gmail-literal">kernel-modul=
e</code> infrastructure on its own is
not sufficient; another package infrastructure <span class=3D"gmail-strong"=
><strong>must</strong></span> be used.</div><div><br></div><div>but in my w=
ay , i have try something : <br></div><div><br></div><div>- Config.in</div>=
<div><pre class=3D"gmail-lang-c gmail-s-code-block"><code class=3D"gmail-hl=
js gmail-language-c">config BR2_PACKAGE_KERNEL_MODULE
        <span class=3D"gmail-hljs-type">bool</span> <span class=3D"gmail-hl=
js-string">&quot;kernel_module&quot;</span>
        depends on BR2_LINUX_KERNEL
        help
                Linux Kernel Module Cheat.</code></pre></div><div>- <a href=
=3D"http://external.mk">external.mk</a></div><div><br></div><div><pre class=
=3D"gmail-lang-c gmail-s-code-block"><code class=3D"gmail-hljs gmail-langua=
ge-c">KERNEL_MODULE_VERSION =3D <span class=3D"gmail-hljs-number">1.0</span=
>
KERNEL_MODULE_SITE =3D $(BR2_EXTERNAL_KERNEL_MODULE_PATH)
KERNEL_MODULE_SITE_METHOD =3D local
$(eval $(kernel-module))
$(eval $(generic-package))<br><br>- Makefile<br><br><code class=3D"gmail-hl=
js gmail-language-c">obj-m +=3D $(addsuffix .o, $(notdir $(basename $(wildc=
ard $(BR2_EXTERNAL_KERNEL_MODULE_PATH)<span class=3D"gmail-hljs-comment">/*=
.c))))
ccflags-y :=3D -DDEBUG -g -std=3Dgnu99 -Wno-declaration-after-statement

.PHONY: all clean

all:
    $(MAKE) -C &#39;$(LINUX_DIR)&#39; M=3D&#39;$(PWD)&#39; modules

clean:
    $(MAKE) -C &#39;$(LINUX_DIR)&#39; M=3D&#39;$(PWD)&#39; clean<br><br>- h=
ello.c<br><br><code class=3D"gmail-hljs gmail-language-c"><span class=3D"gm=
ail-hljs-meta">#<span class=3D"gmail-hljs-keyword">include</span> <span cla=
ss=3D"gmail-hljs-string">&lt;linux/module.h&gt;</span></span>
<span class=3D"gmail-hljs-meta">#<span class=3D"gmail-hljs-keyword">include=
</span> <span class=3D"gmail-hljs-string">&lt;linux/kernel.h&gt;</span></sp=
an>

MODULE_LICENSE(<span class=3D"gmail-hljs-string">&quot;GPL&quot;</span>);

<span class=3D"gmail-hljs-keyword">static</span> <span class=3D"gmail-hljs-=
type">int</span> <span class=3D"gmail-hljs-title gmail-function_">myinit</s=
pan><span class=3D"gmail-hljs-params">(<span class=3D"gmail-hljs-type">void=
</span>)</span>
{
    printk(KERN_INFO <span class=3D"gmail-hljs-string">&quot;hello init\n&q=
uot;</span>);
    <span class=3D"gmail-hljs-keyword">return</span> <span class=3D"gmail-h=
ljs-number">0</span>;
}

<span class=3D"gmail-hljs-keyword">static</span> <span class=3D"gmail-hljs-=
type">void</span> <span class=3D"gmail-hljs-title gmail-function_">myexit</=
span><span class=3D"gmail-hljs-params">(<span class=3D"gmail-hljs-type">voi=
d</span>)</span>
{
    printk(KERN_INFO <span class=3D"gmail-hljs-string">&quot;hello exit\n&q=
uot;</span>);
}

module_init(myinit)
module_exit(myexit)<br><br><code class=3D"gmail-hljs gmail-language-c">And =
in the terminal : </code></code></span></code></code></pre></div><div><pre =
class=3D"gmail-lang-c gmail-s-code-block"><code class=3D"gmail-hljs gmail-l=
anguage-c">make BR2_EXTERNAL=3D<span class=3D"gmail-hljs-string">&quot;$(pw=
d)/../kernel_module&quot;</span> qemu_x86_64_defconfig
echo <span class=3D"gmail-hljs-string">&#39;BR2_PACKAGE_KERNEL_MODULE=3Dy&#=
39;</span> &gt;&gt; .config
make BR2_JLEVEL=3D<span class=3D"gmail-hljs-string">&quot;$(($(nproc) - 2))=
&quot;</span> all
qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=3Doutput=
/images/rootfs.ext2,<span class=3D"gmail-hljs-keyword">if</span>=3Dvirtio,f=
ormat=3Draw -append root=3D/dev/vda -net nic,model=3Dvirtio -net user<br><b=
r><br></code></pre><pre class=3D"gmail-lang-c gmail-s-code-block"><code cla=
ss=3D"gmail-hljs gmail-language-c">On qemu :<br></code></pre><pre class=3D"=
gmail-lang-c gmail-s-code-block"><code class=3D"gmail-hljs gmail-language-c=
">modprobe hello<br>modprobe: module hello not found in modules.dep<br><br>=
</code></pre><pre class=3D"gmail-lang-c gmail-s-code-block"><code class=3D"=
gmail-hljs gmail-language-c">how can i solve it ??<br></code></pre><pre cla=
ss=3D"gmail-lang-c gmail-s-code-block"><code class=3D"gmail-hljs gmail-lang=
uage-c">please i need your help<br></code></pre><pre class=3D"gmail-lang-c =
gmail-s-code-block"><code class=3D"gmail-hljs gmail-language-c"><br></code>=
</pre></div></div>

--000000000000ca3e2005ce7989e8--

--===============8966868539942182370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8966868539942182370==--
