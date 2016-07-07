From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jul 2016 19:33:14 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160707163322.GA3827@free.fr>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <20160707163322.GA3827@free.fr>
Message-ID: <20160707173314.GC3827@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Paul, All,

On 2016-07-07 18:33 +0200, Yann E. MORIN spake thusly:
> On 2016-07-06 17:56 +0200, Thomas Petazzoni spake thusly:
> > Today, Paul (in Cc) reported on IRC an interesting problem: on a
> > configuration with systemd enabled (and acting as udev provider),
> > pciutils would fail to build due to libudev.h being missing.
> > 
> > After some investigation, "make graph-depends" revealed the origin of
> > the problem: a very interesting circular dependency. Here is what make
> > graph-depends thinks of the situation:
> > 
> > Recursion detected for  : systemd
> > which is a dependency of: udev
> > which is a dependency of: pciutils
> > which is a dependency of: linux
> > which is a dependency of: cryptodev-linux
> > which is a dependency of: openssl
> > which is a dependency of: libcurl
> > which is a dependency of: systemd
> 
> Hmmm... make itself should have spit a warning of its own. However, I
> could not see a way to have make error out; it is a mere warning... :-(

Indeed it does catch it. But not until it is time for it to actuall
build openssl:

    make[1]: Circular /home/ymorin/dev/buildroot/O/build/openssl-1.0.2h/.stamp_configured <- cryptodev-linux dependency dropped.
    >>> openssl 1.0.2h Downloading

DAng. Why doesn't it detect it at the beginning of the build? And why
can't we tell make to consider it an error rather than a warning?

Damn... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
