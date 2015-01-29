From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Jan 2015 23:52:37 +0100
Subject: [Buildroot] [PATCH try 5] wine: New package
In-Reply-To: <20150129214622.GA4213@free.fr>
References: <54C2C70E.3020700@dawncrow.de>
 <20150129214622.GA4213@free.fr>
Message-ID: <20150129225237.GB4213@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-01-29 22:46 +0100, Yann E. MORIN spake thusly:
> On 2015-01-23 23:11 +0100, Andr? Hentschel spake thusly:
> > Adds new package: wine
> > 
> >   Wine is a compatibility layer capable of running Windows applications on Linux.
> > 
> > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

I also managed to greatly improve the build time, by selectively bulding
only the host tools:

    # Wine only needs the host tools to be built, so cut-down the
    # build time by building just what we need.
    define HOST_WINE_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) tools tools/widl tools/winebuild \
                tools/winedump tools/winegcc tools/wmc tools/wrc
    endef

    # Wine only needs its host variant to be built, not that it is
    # installed, as it uses the tools from the build directory. But
    # we have no way in Buildroot to state that a host package should
    # not be installed. So, just provide an noop install command.
    define HOST_WINE_INSTALL_CMDS
        :
    endef

There is no reason to build the full host variant, when we are only
interested in the tools. And among those I select above, some might even
not be needed; I'll leave that to you to decide if we can trim that list
even further down. ;-)

And off am I, FOSDEM week-end incoming! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
