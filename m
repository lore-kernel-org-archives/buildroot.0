From: Benjamin Tietz <benjamin@micronet24.de>
Date: Sat, 16 Jun 2007 16:18:08 +0200
Subject: [Buildroot] Easy packaging - Makefile.autotools.in with extra
	make magic
In-Reply-To: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
References: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
Message-ID: <20070616141808.GA4219@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

First let me thank you for your work. There are lots of good ideas in.
But I think there is another problem since _every_ package gets
installed in ths staging_dir now. It should be fixed, that only
packages that need it (like libraries) are installed there; also the
-clean target should be fixed that way...

The user-defined variables in a Makefile should be all UPPERCASE to
prevent them from confusion with commands. (The mixed-case even doesn't
look as good as the uppercase).

A word on the PACKAGE_SITE: it might have an default, like 

252: $(1)_SITE ?= http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)/

By the way, what about a user defined GNU-Mirror - the official one is
sometimes real slow...

Just another word on the replace.sh: why? ( I'm afraid of hundreds of stupid
scripts lying around somewhere)
It is used only once and could be substituted by something like
	
	for i in $(find $(STAGING_DIR)/usr/lib/ -name \*.la); do \
		mv "$i" "$i~"; \
		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" "$i~" > "$i";\
	done

Even while this lacks the nice line of output, it reuses the $(SED) var,
since not all systems have an installed sed (or didn't have it in the
PATH). so it is easier to port. The second issue I can imagine is if
someone  is using an regex containing an unescaped ':'. Since you hided
it that nice it would take some time... Uhh, remember all the poor users
of M$-OSs; they all might have an ':' in their $(STAGING_DIR) ("C:\My
Files\buildroot") ...

On Thu, Jun 14, 2007 at 05:08:09PM +0200, Julien Letessier wrote:
> Hi list,
> 
> I've been working on an upgrade to Benjamin's buildroot makefile for
> GNU autotools-compliant packages.
> Package makefiles themselves can now be even simpler (see example at
> end of email). I also addressed a few shortcomings:
> - packages aren't re-downloaded at every build.
This should only appear, when the file downloaded is named differently
to the file requested ( the target). On my machine I solved it
somehow...
> - packages can have archives with nonstandard names (e.g. "tcl8.4.15")
> - human-writable are provided (like "foo-extract", "foo-configure", etc.)
A very nice idea. I tried to solve it by creating special rules, but
since you cant use something like $(subst ) on rules I dropped it.
> - packages which don't [totally] use the autotools can from this
> makefile by overriding some targets.
> - autoreconf(1) is supported, e.g. when configure scripts are broken
> and  configure.ac's have to be patched
Its a nice idea, but should be used by the user through an option, since
there are compatiblity-problems between nearly all versions of automake.
And If you don't know how to solve them, you can't compile.
On the other hand, not every build-system has auto(re)conf and friends
> - libtool 'foo.la' files are properly patched once installed in the
> staging directory
> - the makefile is documented ;)
the documentation ... I know, I was lazy
I simply got bored of writing the same Makefile for every new package (
or to copy a Makefile and change some patterns) and so started of with
one and forgot to write more text.

> 
> For the alsa-lib examples, the makefile becomes:
> 
> >alsa-lib_VERSION = 1.0.14
> >alsa-lib_SITE = ftp://ftp.alsa-project.org/pub/lib
> >alsa-lib_SOURCE = alsa-lib-$(alsa-lib_VERSION).tar.bz2
> >$(eval $(call AUTOTARGETS,alsa-lib))
> 
> Attachements:
> - autotools2.patch (Makefile.autools.in and replace.sh)
> - apr.patch (apache portable runtime package)
> - alsa-lib.patch (alsa libraries)
> 
> Apply these with "patch -p0"
> 
> Benjamin, please give me your opinion about this!
> 
> Cheers,
> -- 
> Julien Letessier
> <julien.letessier@technosens.fr>

But its an improvement over my first shot.

best regards

Benjamin
