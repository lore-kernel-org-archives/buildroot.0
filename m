From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Mar 2009 21:34:21 +0100
Subject: [Buildroot] svn commit: [25827] trunk/buildroot/package/automake
In-Reply-To: <87tz5ggqup.fsf@macbook.be.48ers.dk>
References: <20090326165522.5C989771F6@busybox.osuosl.org>
	<87tz5ggqup.fsf@macbook.be.48ers.dk>
Message-ID: <20090326213421.55dae490@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Mar 2009 18:02:06 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Hmm, isn't this mixing up the host aclocal dir and the target
> (staging) one? The host packages install into HOST_DIR (and hence
> HOST_DIR/usr/share/aclocal), and the target libraries install into
> STAGING_DIR.
> 
> I guess auto* won't be able to find the m4 files for the packages
> where we don't build a host version with this change.

I must admit I don't know. But, when AUTORECONF is set in the package
(as is done by tslib), then the command in the $(AUTORECONF) variable,
defined in autoconf/autoconf.mk is called. This command is :

AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"

So it uses the host autoreconf tool, and gives ACLOCAL_DIR as the path
for m4 files. So obviously, this ACLOCAL_DIR should be relative to
HOST_DIR and not STAGING_DIR.

At least, my (maybe incorrect) change fixes the issue I reported in
the mail titled "Bug while autoreconfiguring tslib", sent today. But
maybe the correct fix is something like

- AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
+ AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(HOST_ACLOCAL_DIR)"

And then defining HOST_ACLOCAL_DIR relatively to $(HOST_DIR).

BTW, could you remind me why we need to compile all these tools for the
host (pkg-config, automake, autoconf). Couldn't they be dependencies of
Buildroot ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
