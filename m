From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2015 23:44:26 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix use of extensions
In-Reply-To: <20150313214751.2df5307c@free-electrons.com>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
 <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
 <20150313214751.2df5307c@free-electrons.com>
Message-ID: <20150313224426.GB4391@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-13 21:47 +0100, Thomas Petazzoni spake thusly:
> On Fri, 13 Mar 2015 19:57:29 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > This is because dependencies are only acted on at configure time, which
> > is a step further after the kconfig stage. This probably was not an
> > issue before we switched to the kconfig infra for the kernel, but that
> > use-case was completely missed at the time (blame me!).
> 
> Hum, I am not sure to see why the switch to the kconfig-package
> infrastructure would have modified this behavior. So I'd like to
> understand how it used to work, if it ever worked (but I believe it
> did, no?).

OK, so I think I know what happened when we migrated linux over to the
kconfig-package infra, and what we loose then.

Back before we used the kconfig-package infra, linux-menuconfig (as well
as the other configurators) was written as custom rules, that were
basically something like:

    linux-menuconfig: linux-configure
        $(MAKE) -C $(LINUX_DIR) menuconfig

And there we had our dependency on a previously configured linux tree,
and *that* was kicking-in our dependency on extensions.

Fast forward post 2015.02, and we now have linux use the kconfig-package infra,
which completely decorrelates the kconfig-part of the configuration,
from the actual package-part of the configuration, as it introduces an
intermediate 'kconfig-fixup' step:

    linux-configure -------> kconfig-fixup --> .config --> $(LINUX_CONFIG_FILE)
                        /
    linux-menuconfig --'

So, linux-menuconfig now no longer depends on the linux tree to be
configured. Hence the extensions breaking...

And this, I hope, concludes the nalaysis and is enough to convince you
this is a new problem, caused by the kconfig-package infra. Hehe! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
