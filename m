From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 May 2021 21:29:20 +0200
Subject: [Buildroot] [PATCH] support/download/hg: fix broken method
In-Reply-To: <CAAXf6LVr_TxvnLLz4q82=yHLOJcG8ZuZ+m482VTLwWk-kOBMBg@mail.gmail.com>
References: <20210427194544.15861-1-patrickdepinguin@gmail.com>
 <20210428195122.GB2137340@scaer>
 <CAAXf6LVr_TxvnLLz4q82=yHLOJcG8ZuZ+m482VTLwWk-kOBMBg@mail.gmail.com>
Message-ID: <20210503192920.GI2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-05-03 20:40 +0200, Thomas De Schampheleire spake thusly:
> El mi?, 28 abr 2021 a las 21:51, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > On 2021-04-27 21:45 +0200, Thomas De Schampheleire spake thusly:
> > > Commit 54d3d94b6e3846447b5796ef8587b08b537cd348 broke the 'hg' download
[--SNIP--]
> > > Fix by using the _plain_hg function instead. The disadvantage is that the
> > > command for 'hg archive' is no longer printed.
[--SNIP--]
> > All in all, we have only 4 packages that are downloaded from Hg:
> >   - canfestival: does not have a hash, but fails to extract, nad we have
> >     a few autobuild failures:
> >         http://autobuild.buildroot.org/results/3fd/3fd118fb87299099e47026161c1d8c948eb9a5c1/build-end.log
> >         http://autobuild.buildroot.org/results/bf4/bf42580e4c03015004975e03736d6d6a3a87b04d/build-end.log
> >
> >   - dvb-apps: has a hash, thus fails to download from upstream, and
> >     falls back to downloading an old archive from s.b.o
> >
> >   - opentyrian: does not have a hash, but upstream is dead, so falls
> >     back to downloading an old archive from s.b.o:
> >         hg clone --noupdate 'https://bitbucket.org/opentyrian/opentyrian' 'opentyrian-9c9f0ec3532b'
> >         abort: HTTP Error 404: Not Found
> >
> >   - python-pygame: has a hash *and* upstream is dead, so fails to
> >     download from upstream, and falls back to downloading an old archive
> >     from s.b.o.
> >         hg clone --noupdate 'https://bitbucket.org/pygame/pygame' 'python-pygame-d61ea8eabd56'
> >         abort: HTTP Error 404: Not Found
> >
[--SNIP--]
> - dvb-apps: only problem is that the hash file does not match the
> archive generated. It's not clear to me why.
> From your analysis, even the original hg download helper should
> generate reproducible archives, right? When I try it several times
> tonight, I observe following retrieved hash:
> 
> ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has
> wrong sha256 hash:
> ERROR: expected:
> 926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
> ERROR: got     :
> 71cab442377987425aa05770d6e5724bcbcdd3ea144e54c63883be8fcebf5644

Weird, it works here...

    $ hg --version
    Mercurial Distributed SCM (version 5.3.1)

> If there is still a problem with reproducibility for the hg helper, we
> are back to fixing that, with the -br1 suffix.

So, if that's the case, then we should use our mk-tar_gz() helper, and
not rely on the archive generated from hg.

> - opentyrian: upstream is dead due to Bitbucket no longer supporting
> hg. There seems to be a new (git) upstream:
> https://github.com/opentyrian/opentyrian . Perhaps **Julien
> Boibessot** is interested in fixing this?

I've already sent a patch:
    https://patchwork.ozlabs.org/project/buildroot/patch/20210429195324.2463255-1-yann.morin.1998 at free.fr/

> - python-pygame: likewise, new upstream:
> https://github.com/pygame/pygame . Also something that Julien could
> look at?

> > If you ever reconsider, feel free to poke me about the archive format
> > version stuff. ;-)
> Yes, I think we would better handle it at some point, but now is not a
> good time for me.

If we can't solve this reproducibility issue, then we'll have no choice
but to leap.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
