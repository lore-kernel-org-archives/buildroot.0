From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Feb 2017 18:41:10 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170227173117.xjxcxv4r5vb2dlub@tarshish>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks>
 <20170227172540.GA17670@free.fr>
 <20170227173117.xjxcxv4r5vb2dlub@tarshish>
Message-ID: <20170227174110.GB17670@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-02-27 19:31 +0200, Baruch Siach spake thusly:
> On Mon, Feb 27, 2017 at 06:25:40PM +0100, Yann E. MORIN wrote:
> > On 2017-02-27 18:12 +0100, J?rg Krause spake thusly:
> > > On Sun, 2017-02-26 at 23:42 +0100, Yann E. MORIN wrote:
> > > > cmake-3.7 has a bug in how it handles rpath, linking with libraries
> > > > from
> > > > the host.
> > > > 
> > > > Until we completely understand the issue, just blacklist cmake-3.7.
> > > > 
> > > > The issue has been reported upstream:
> > > > ????http://public.kitware.com/pipermail/cmake/2017-February/064970.ht
> > > > ml
> > > 
> > > Brad King from Kitware replied today [1]. In short, Brad does not think
> > > there anything wrong about handling the rpath and supposes to load a
> > > custom platform cmake file instead of the Linux one.
> > > 
> > > [1] http://public.kitware.com/pipermail/cmake/2017-February/065063.html
> > 
> > OK, so what we would have to do (basically):
> > 
> >   - copy Modules/Platform/Linux.cmake to Modules/Platform/Buildroot.cmake
> > 
> >   - tweak that file so that the two settings (lib32 and lib64) are now
> >     FALSE in that file
> > 
> >   - tweak our support/misc/toolchain.cmake to set(CMAKE_SYSTEM_NAME Buildroot)
> > 
> > and we'd be all good?
> > 
> > Or alternatively:
> > 
> >   - add Modules/Platform/Buildroot.cmake, which:
> >     - includes Modules/Platform/Linux.cmake
> >     - sets the the two settings (lib32 and lib64) to FALSE
> > 
> >   - tweak our support/misc/toolchain.cmake to set(CMAKE_SYSTEM_NAME Buildroot)
> > 
> > Thoughts?
> 
> Again, what about host installed cmake?

And this is exactly the kind of reply I expected! ;-)

> Can we set lib{32,64} to FALSE 
> directly in toolchain.cmake?

I don't think so...

The toolchainfile.cmake sets CMAKE_SYSTEM_NAME, which is used to find
the appropriate SystemName module. It means the SystemName.cmake file
can only be parsed after tolchainfile.cmake is.

So, anything we set in toolchainfile.cmake would be overriden by the
settings in the SystemName.cmake file.

Ergo, we're screwed in this case...

Unless we can tell cmake to look for modules in alternate locations.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
