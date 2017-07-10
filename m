From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jul 2017 23:43:08 +0200
Subject: [Buildroot] [PATCH 6/7] Makefile: add check that
 $(HOST_DIR)/usr is not a directory
In-Reply-To: <687fe9da-0d24-0a0d-7ed7-5796073e8fb7@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-7-arnout@mind.be>
 <20170710180240.43215e1a@windsurf.lan>
 <20170710161238.GA3014@scaer>
 <3a401955-07d9-054c-61a4-c91871ae1257@mind.be>
 <20170710232735.0844286e@windsurf.lan>
 <687fe9da-0d24-0a0d-7ed7-5796073e8fb7@mind.be>
Message-ID: <20170710214308.GC22898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On 2017-07-10 23:36 +0200, Arnout Vandecappelle spake thusly:
> On 10-07-17 23:27, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Mon, 10 Jul 2017 21:51:50 +0200, Arnout Vandecappelle wrote:
> > 
> >>  Actually, I realize now: when people do a git pull, we expect them to do "make
> >> clean all" afterwards. And "make clean" will delete HOST_DIR - so no
> >> HOST_DIR/usr will exist anymore.
> >>
> >>  So the original report from Thomas only happened because Thomas didn't do a
> >> "make clean" like he should have...
> > 
> > Not correct, each time my output directory and host directories were
> > empty. The only thing that was different is that the host directory is
> > not set to the default of $(BASE_DIR)/host, but to /opt/something, and
> > this /opt/something is created (empty) before I start the build.
> 
>  The part about a non-standard HOST_DIR is irrelevant, it's doing
> 
> make clean
> mkdir -p output/host
> make
> 
> that triggered the issue. Which obviously makes no sense at all in the normal
> situation, but does make some kind of twisted sense in the non-standard HOST_DIR
> situation.
> 
> > So my build was perfectly clean, it is just that I created the host
> > directory prior to starting the build, which IMO isn't crazy,
> > especially when such host directory was customized in the Buildroot
> > configuration.
> 
>  Well, it doesn't make *that* much sense to me, because pre-populating that
> directory with stuff is kind of fragile, given that it will all be removed again
> by "make clean".

It is not about running "make clean" but having stuff pre-isntalled in
there, from a clean build.

I.e. people would do:
  mkdir /my/host-dir
  tar xf mystuff.tar -C /my/host-dir
  make -C buildroot my_toolchain_defconfig
  make -C buildroot toolchain

and then their stuff is poulting the host-dir, which we should try to
avoid.

Granted, there is nothing that would prevent them from extracting it
after the build...

>  Anyway, I still don't think that this patch is very useful :-)

Until we have weird build errors that are reported, because some weirdo
will have already extracted a few toolchains in there. Or tries to
re-use the same host dir to isntall many toolchains in there... ;-)

(Note: I take it that Thomas uses different host dirs for each of the
toolchains, ot that the host dir is empty at the start of each toolchain
build.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
