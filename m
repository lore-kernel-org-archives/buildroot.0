From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 6 Aug 2015 21:21:18 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-29
In-Reply-To: <20150801082226.GB8475@waldemar-brodkorb.de>
References: <20150730063016.85822101F90@stock.ovh.net>
 <1438247167.5763.13.camel@synopsys.com>
 <1438262056.5763.48.camel@synopsys.com>
 <20150801082226.GB8475@waldemar-brodkorb.de>
Message-ID: <20150806192117.GL8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Waldemar Brodkorb wrote,

> Hi,
> Alexey Brodkin wrote,
> 
> > Hi Thomas,
> > 
> > On Thu, 2015-07-30 at 12:06 +0300, Alexey Brodkin wrote:
> > > Hi Thomas,
> > > >          arc |                    sudo-1.8.13 | NOK | 
> > > > 
> > > > http://autobuild.buildroot.net/results/1b77539d08ffd950317a58cef8e2a4ce624c4710/
> > > ------------------------->8--------------------
> > > /home/test/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getenv.os): In
> > > function `__GI_getenv':
> > > getenv.c:(.text+0x0): multiple definition of `getenv'
> > > env_hooks.o:env_hooks.c:(.text+0x11c): first defined here
> > > ------------------------->8--------------------
> > > 
> > > I believe something similar to the issue Vincente fixed for Bash, see
> > > http://git.buildroot.net/buildroot/commit/?id=9623ff651f83a350819719f10705552da9793205
> > > 
> > > Will look into that and prepare a patch.
> > 
> > Looks like there's no simple way to resolve this issue with static building on "sudo" against uClibc.
> > There's no autoconf option to disable internal implementation of "getenv" and somehow "sudo" could be
> > built as a static binary on my x86 host (obviously with glibc).
> > 
> > I'd say that this has something to do with uClibc (how it differs in implementation of "getenv")
> > compared to glibc but this is out of my scope of knowledge.
> > 
> > Probably Waldemar might be interested in that issue as well.
> 
> I can reproduce it and will push it on my TODO list. Thanks for
> reporting this.

It is indeed uClibc specific. The reason seems to be some
differences in include/libc-symbols.h between uClibc and glibc.
In uclibc getenv object file contains a hidden symbol for
__GI_getenv, but in GNU libc it is a hiddden symbol getenv.

Sudo implements it's own getenv, and overwrites getenv() from C
library via adding "default" visibility. This works fine for glibc,
because getenv symbol is hidden. In uClibc it is supposed to be
hidden, too, but unfortunately there a alias is used, which indeed
it hidden. 

We could set getenv weak like with this:
diff --git a/libc/stdlib/getenv.c b/libc/stdlib/getenv.c
index d5db178..9b04d0f 100644
--- a/libc/stdlib/getenv.c
+++ b/libc/stdlib/getenv.c
@@ -27,4 +27,4 @@ char *getenv(const char *var)
     }
     return NULL;
 }
-libc_hidden_def(getenv)
+libc_hidden_weak(getenv)

This works, but I am not sure it is correct.
Any opinions on this?

best regards
 Waldemar
