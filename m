From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2021 17:07:39 +0100
Subject: [Buildroot] [PATCH] package/rustc: allow cargo sub packages to
 download using 'git'
In-Reply-To: <CAJe0E3dDz6xtphCxxemaivXdoZZumQT58PP9-qXPJVrPkbbjsA@mail.gmail.com>
References: <20210221075134.11739-1-guillaume.bressaix@gmail.com>
 <20210221082035.GX2276@scaer>
 <CAJe0E3dDz6xtphCxxemaivXdoZZumQT58PP9-qXPJVrPkbbjsA@mail.gmail.com>
Message-ID: <20210221160739.GZ2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2021-02-21 16:01 +0100, Guillaume Bres spake thusly:
> > because this means that downloads happen during the build, not during the
> actual download step
> 
> I understand now the problem from your side
> 
> > see this series from Thomas:
> http://lists.busybox.net/pipermail/buildroot/2020-December/298802.html
> 
> I knew Thomas and other people were active on the subject but did not know
> where to find more information.
> I looked into https://github.com/tpetazzoni/buildroot/tree/pkg-mgr-v2,
> the "eval cargo-package" is indeed what we need.
> 
> Thomas's work seems pretty much done, it's not clear to me at the moment
> what remains to be achieved
> or if I could be of help.

Well, building is a work pretty much done, indeed. What remains, is how
we shoehorn the vendoring mechanism (not specific to cargo, also applies
to go, npm, etc...) in our download infra.

> Anyway, this is the place to contribute on the
> subject.
> 
> For me, the main problem when cross-compiling a rust pkg is already figured
> out,
> $(BR2_PACKAGE_HOST_RUSTC_ARCH) must be a valid value from the official list
> of supported targets:
> https://doc.rust-lang.org/nightly/rustc/platform-support.html
> I'm just curious how you guys figure out the right value for a given board,
> because we want this automated & it is not trivial to me

This is indeed hardcoded in package/rustc/Config.in.host.

First, there's BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS which is true
for those architectures we know there is a rust compiler.

Second, there's BR2_PACKAGE_HOST_RUSTC_ARCH, which is the value of the
machineprt of the tuple. We are pretty lucky, because it matches what
Buildroot uses, except in one specific case, arnv7.

Those two options are not automated; they are manually managed and
updated whenever we need to bump rustc.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
