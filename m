From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 22:25:27 +0200
Subject: [Buildroot] [PATCH 1/1] Add proxy download support
In-Reply-To: <CABbD_XC3g0Avbeydtg3Aq9v9HsP5Eh+yKnxVBVchFcNFVEQrtw@mail.gmail.com>
References: <1413903203-33909-1-git-send-email-kaszak@gmail.com>
 <20141021164901.GF3912@free.fr>
 <CABbD_XC3g0Avbeydtg3Aq9v9HsP5Eh+yKnxVBVchFcNFVEQrtw@mail.gmail.com>
Message-ID: <20141021202527.GA23999@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

K?roly, All,

On 2014-10-21 20:23 +0200, K?roly Kasza spake thusly:
> > NAK.
> > This should belong to the user's envirnment.
> >
> OK, but then I think this should be stated in the user manual.

This is by far not specific to Buildroot at all, but we can add a blurb
in the manual, telling the user that Buildroot uses the user's settings.

> > I once tried to handle proxy support in crosstool-NG, and after trying
> > to handle the exponentially growing cases (http proxy, with or without
> > authentication, socks proxy...)
> >
> This handles standard http proxies (hence the name) with or without auth.
> Most proxies (and even corporate ones) fall into this category (like Squid,
> MS Forefront, etc).

That's just am incorrect assumption. I know first-hand of network setups
that use much complex proxy setups...

> > Also, this solution is not bullet proof, because it leaves alone
> > non-http protocols: cvs, git, svn, scp...
> >
> Not true. Only CVS won't work, but:
> A, There is currently no CVS based package in Buildroot
> B, If there would, it would fall back the sources.buildroot.com, which is
> http

The initial reason for sources.buildroot.com is to be a fallback location
in case an upstream disapears after we cut a release, so we ensure that
releases continue to work for the foreseeable future.

> C, I may have mislooked and CVS can be proxied - if You allow me to send a
> V2, I will introduce that too

Well, it seems it is possible to proxy cvs through an http proxy, but
that proxy must allow the CONNECT to the CVS port, which a lot of
enterprise proxies just disallow.

For example, my company's proxy only allow CONNECT to the port 443, and
blocks anything else. Which means I can not use it to connect to:
  - a git server using the git protocol
  - a SVN server using the svn protocol
  - a CVS server
  - an ssh server

> All other download methods work with the distributed packages.
> Should at least, I only downloaded a few packages from every possible type.
> 
> AFAIK SCP & SSH are not standard download methods in the packaging system,
> they are added functionality for custom packages.

True, but nothing would prevent a user to add a custom package that
fetches via scp from a remote server outside the enterprise network
(e.g. to retrieve a package from a subsidiary network, for example).

> > Actually, it does take care of git, but some proxies do not allow the
> > CONNECT to anything else than 443, so we're back to square one for the
> > git protocol anyway.
> 
> Git always falls back back to https (the "instead of" directive) and the
> standard 443, because git:// protocol simply cannot be proxied.

Both assumptions are wrong. There are git servers that serves only via
the git protocol, so there is no possible fallback to http.

And even if there were, the relative paths of the two URLs may be
different between the two schemes, so just using http:// instead of
git:// is not sufficient.

And third, the git protocol *can* be proxified, even through an http
proxy, but it requires that proxy to be configured to allow the CONNECT
method to any port, not only 443.

> > If we were to add a proxy setting, then users would expect it to work
> > for all kind of downloads, which is absolutely impossible to achieve.
> >
> It does work with all existing packages (again, I found no CVS, SCP or SSH
> based packages in the distribution).

Yes, they are not used in Buildroot itself. But if we do changes to the
download infra, all our download helpers should behave the same.

> I can proxy scp or ssh over http, but that relies on the user's proxy
> server - there are proxies which won't allow a CONNECT method for ssh.

Exactly, so goes for CVS and GIT.

> > So, we do not have a 100% coverage, and quite some is left out.
> >
> Please name, I will try my best, to send a V2 covering those methods.
> Currently it support the 5 types that are used in the packages.

Well, I agree that it does cover all the methods Buildroot uses, but not
all the methods Buildroot uses.

What are we gonna explain our users that the proxy settings he put in
the menuconfig are not being used, because a package in its BR2_EXTERNAL
tree uses a download method that we do not know how to proxify?

> > So, I prefer we not have any of this proxy settings in Buildroot at all,
> > and just rely on the user's environment to be properly set up.
> >
> I think setting up all methods in the user environment is possible, but
> sometimes can be quite complicated.

Well, it is really easy:

    export http-proxy='http://user:pass at proxy:port/'
    export https_proxy="${http_proxy}"
    export ftp_proxy="${http_proxy}"
    . tsocks -on

Et voil?, all things are proxified (one just has to edit /etc/tsocks.conf
but that is something we really can do ourselves anyway.... Yes, I know
we can use TSOCKS_CONF_FILE=/path/to/my/tsocks.conf)

> Thank you for your opinion, could you state in which case would you accept
> the patch?
> I think I can add CVS support, and ssh/scp support - which means ALL 8
> download helpers would be able to
> use http proxies.
> And again, this is a http proxy patch, I didn't aim to support all proxy
> types in the world, as that would be
> probably pointless.

I still believe we should not have this in Buildroot at all. That is my
opinion, others may disagree with me. Let them speak up! ;-)

I know this can be a bit frustrating, but I can assure you I have
already gone down this road in the past, and it is not a road I would
like to go down again...

To me, the best would be to just document that Buildroot uses whatever
settings are set in the user's system.

BTW, I should know about proxies: absolutely everything I do on my home
machine *is* proxified via either an http or a socks proxy. Even this
very mail will leave my home network via a proxy... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
