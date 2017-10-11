From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 08:53:40 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: use
 --no-check-certificate in wget by default
In-Reply-To: <f8f82c6a-f51a-8fe6-dc3a-dfc061dd7955@mind.be>
References: <20170902212938.23712-1-thomas.petazzoni@free-electrons.com>
 <20171010222543.0beed48d@windsurf.lan>
 <f8f82c6a-f51a-8fe6-dc3a-dfc061dd7955@mind.be>
Message-ID: <20171011085340.48fe6e73@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Oct 2017 23:25:03 +0200, Arnout Vandecappelle wrote:

>  I don't understand how this can happen. The autobuilders should all be running
> supported (not EOL) distros, right?

Absolutely not. I'm intentionally running an old Debian in order to
catch build issues related to old systems. Running non-supported (i.e
EOL distros) is very common in enterprise environments, so I want to
keep testing this. Just to be clear: I don't personally run EOL
distros, and we don't use EOL distros at Free Electrons so it's not
something that I personally care about. But I believe that a lot of
companies do use such old distros on build machines, and therefore it
makes sense to keep testing with a fairly old system.

And therefore the certificates are often out of date.

>  But I seem to remember that you have a CentOS 5 autobuilder running, and CentOS
> 5 went EOL on March 31, 2017. So perhaps it's time to switch to CentOS 6?

Me running CentOS ? Crazy you. I'm running a Debian system for the
autobuilders.

> >> In order to avoid such failures that are not very interesting in the
> >> context of the autobuilders  
> 
>  I think they *are* interesting (not very, but still interesting), because
> actual users *will* hit these problems.

Not really: by the time we make a release, sources.buildroot.net will
have fetched the tarball, and therefore our users will simply see
nothing, except that their download gracefully falls back to
sources.buildroot.net.

So those build failures only pollute the autobuild.buildroot.net
results in the time window between a package being bumped, and the
tarball being grabbed by sources.buildroot.net. If you look today at
autobuild.buildroot.net, there are no more dbus-1.10.24 build failures,
because the "old" autobuilder instances download the tarball from
sources.b.n.

> > We recently bump dbus to 1.10.24, and look how the autobuilders are
> > "polluted" by this certificate issue:
> > http://autobuild.buildroot.net/?reason=dbus-1.10.24.  
> 
>  But once Peter updates sources.buildroot.org that should be OK again, no?

Yes, but this pollution happens again and again and again every time we
bump a package that is fetched from https://, with a certificate too
recent for those old systems. This creates useless noise in the
autobuilders. And this noise is useless because we are really not going
to do anything about this.

But perhaps it's an issue more unique to my autobuilder instance, and
therefore something I should fix locally? Perhaps just an autobuild-run
feature that allows to append a custom config option to the config file
being built, so that people can locally add some tweaks?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
