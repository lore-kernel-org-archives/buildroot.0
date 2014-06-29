From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:36:18 +0200
Subject: [Buildroot] [PATCH V5 2/2] google-breakpad: integration into
 Makefile and Config.in
In-Reply-To: <53AB3198.9010908@mind.be>
References: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>
 <1403702174-23850-3-git-send-email-pascal.huerst@gmail.com>
 <53AB3198.9010908@mind.be>
Message-ID: <20140629123618.407b95f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Pascal,

On Wed, 25 Jun 2014 22:31:20 +0200, Arnout Vandecappelle wrote:

> > +config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
> 
>  I don't really like the name of this option. What do you think of
> BR2_GOOGLE_BREAKPAD_GENSYMS_PATTERNS ?

I think this explains some of your comments below: Pascal's patch only
support listing complete file names in
BR2_GOOGLE_BREAKPAD_INCLUDE_FILES, while you apparently thought his
intention was to support file patterns. It indeed seems like a good
idea, but it's clearly a different thing.

> > +	string "executables and libraries to be used by google-breakpad"
> > +	depends on BR2_PACKAGE_GOOGLE_BREAKPAD
> 
>  Hm, this is counter-intuitive, though honestly I don't know how to improve it.
> The user would first have to go to the target packages and select google
> breakpad, and then return to the Build options menu at the top to set the patterns.
> 
>  Actually, this symbol could be defined inside the google-breakpad/Config.in,
> no? Though you probably got a comment before that that is not the right place :-)

Yeah, that's tricky. We could turn it into a "select", but then
everybody will always see this option related to google-breakpad in the
Build options. So I believe the solution of using a 'depends on' is
still the most appropriate solution. Maybe a little piece of
documentation should be added in the Buildroot manual to explain how
the Google Breakpad integration works?

However, I don't really like the prompt. Maybe it should be:

	[ ] Enable Google Breakpad support
	   () List of binaries to extract symbols from

> > +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
> > +	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
> > +		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
> 
>  To be more compatible with Fabio's series that reworks this part of the
> infrastructure, it's better to define this as a new variable which is called
> here. That will make it easier to resolve the conflict between these two series.
> Fabio's series will also make it possible to define this completely inside the
> google-breakpad.mk.

Yes, having it all in the google-breakpad.mk seems like a good idea.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
