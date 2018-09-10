From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2018 20:07:05 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <CA+TH9Vm1m+xUC3NydquYNw67SCFLNYvi_rqufxVw3BTtmOS=xQ@mail.gmail.com>
References: <CA+_SqVbJqv2On+9UPE4pcoyiK1wfDZp=t1h1yMdfVB-CQGp91g@mail.gmail.com>
 <20180909133341.GJ2841@scaer>
 <CA+_SqVafj+DAsaBtSPJkf2bwbmh_3JojRjBrzG0oT6GduKTG4g@mail.gmail.com>
 <20180909142019.GK2841@scaer>
 <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
 <20180909185518.GA2409@scaer>
 <CA+_SqVa2EiU2OXNoc0O=o7GwB0wW15jMjmnY60LL6bKV2PSeRQ@mail.gmail.com>
 <CA+_SqVbyxT0xCg-7mtryFm-=GRCqwZo2hPpwNaVe8nG8_wxxbA@mail.gmail.com>
 <20180910150009.GA2674@scaer>
 <CA+TH9Vm1m+xUC3NydquYNw67SCFLNYvi_rqufxVw3BTtmOS=xQ@mail.gmail.com>
Message-ID: <20180910180705.GF2674@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-09-10 19:10 +0200, Angelo Compagnucci spake thusly:
> Il giorno lun 10 set 2018 alle ore 17:00 Yann E. MORIN
> <yann.morin.1998@free.fr> ha scritto:
> I can agree with you, but what do you propose for handling package
> managers: Simply put a !BR2_REPRODUCIBLE for a package that needs
> dependencies resolved and cannot handle dependencies cleanly?

Yes, see below...

> > [0] For example, consider an explicit and complete list such as (spitted
> >     for readability):
> >         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="
> >             http://internal-server/node/mod-1
> >             http://internal-server/node/mod-2
> >             http://internal-server/node/mod-3
> >             http://internal-server/node/mod-4
> >         "
> >     and that all the dependencies of those modules *are* present in that
> >     list, leaving npm no chance to download anything.
> 
> As I said previously, hiding npm inside nodejs is wrong. What if you
> have a couple nodejs based software and for one you have a clear
> picture of dependencies but not for the other?
> Npm should decoupled and used each time a nodejs software needs it.

npm (the utility) comes from nodejs (the source tree). So, the npm we
use in Buildroot comes from host-nodejs (the Buildroot package). Thus,
the package that calls npm (i.e. nodejs today) is already decorelated
from the package that installs npm.

And you can already use npm from a generic-package in Buildroot as it is
today...

There are two ways to install stuff with npm in Buildroot:

  - add a pacakge name (URL, name and version, or just name) in the
    existing BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL config option;

  - add a new generic-package that calls npm as part of its
    _INSTALL_CMDS.

In either case you may or may not have reproducibility. In the former,
Buildroot can not decide either way, because only a human can tell, so
your patch 3 can't be applied, because it is wring.

As for the latter case, the human was in charge of writing the .mk and
Config.in. Whether they write TAINT=YES in the .mk, or depends on
!BR2_REPRODUCIBLE in the Config.in has the same effect. As we already
have BR2_REPRODUCIBLE, we don't need TAINT.

Or I don't understand the problem...

> This is what I did with watchtower:
[--SNIP--]
> +WATCHTOWER_TAINTS = YES

If you are going so far as to explicitly write this line, just hide the
package behing BR2_REPRODUCIBLE instead, yes.

And even better yet, for packages we would include in Buildroot, provide
a clean and reproducible list of packages for the dependencies for those
packages. Although this would be the ideal situation, if that is not
possible, then hide behind !BR2_REPRODUCIBLE.

For packages that stay in a br2-external or a random fork elsewhere, I
don't think we should care, as I explained previously.

For a parallel: if I do a build without threads, then packages than need
threads are hidden (with a comment). Similarly, if I want a reproducible
build, the packages that can't be reproducible are hidden (with a
comment).

By the way, this has nothing to do with whether they are packages coming
from a "package manager". Even "traditional" packages may want to do
unclean downloads at build time; for example, some care had to be taken
for asterisk, or it would download some sound stuff during the install
step (although that was reproducible).

> +cd $(WATCHTOWER_SRC_PATH) && GOPATH="$(@D)/$(WATCHTOWER_WORKSPACE)" $(HOST_DIR)/usr/bin/glide install

What would prevent having a script like we have in utils/scancpan or
utils/scanpypi to do the same processing for Go packages? Or npm
modules?

Yes, some people are afraid we get thousands of them. But we don't know
how far we'll go. Today, we're pretty happy adding random python modules.
Why would it be different for the other "package managers"?

If we find that this is going "way too far", we can revisit that later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
