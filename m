From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Mar 2013 20:13:52 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <514B4C15.7080702@googlemail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate> <513C7DF2.9090005@googlemail.com>
 <5145CC2D.5020103@googlemail.com> <514AAF05.80104@mind.be>
 <514B4C15.7080702@googlemail.com>
Message-ID: <20130321201352.6b9455c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Thu, 21 Mar 2013 19:06:13 +0100, Carsten Schoenert wrote:

> >   How it _should_ be is that as many configure options as possible are 
> > specified explicitly in the .mk file. In particular, any configure option 
> > that is set to the non-default value in the .mk file, should also be set 
> > explicitly to the default value.
> 
> You mean for example
>   --enable-svg            build SVG image provider [default=yes]
> should be set by default to 'yes' and so on for the other 'default=yes'
> options?
> The options with default=auto should will be automaticly detected by
> configure and mostly it isn't useful to explicitly deactivating them
> because that breaks the binarys so leaving them.

No, I think Arnout means that we should leave as few options
"automatically" detected as possible.

For example, we really like to have:

ifeq ($(BR2_PACKAGE_FOO_FEATURE_BAR),y)
FOO_CONF_OPT += --enable-bar
else
FOO_CONF_OPT += --disable-bar
endif

and for all options that are not explicitly --enable-<bleh> somewhere,
have a global:

FOO_CONF_OPT += \
	--disable-<bleh> \
	--disable-<blah>

this avoids the configure script from automatically detecting things on
the host machine that we don't want it to detect.

> >   But of course, a lot of that is not the case now, because the rule is 
> > not strictly enforced. Anything you fix during the version bump is nice 
> > to have, but you're not obliged to fix it if you don't know how to (and 
> > we expect you to have tested the change, so that means trying out a 
> > number of different configurations...).
> 
> Yes I can't test all variations so thats why I ask here how to do it
> best. I'm working with a toolchain for a ARMv6 platform on a settopbox
> there we need directfb so I test mostly of my work on this settopbox.

We have autobuilders that test a big number of random configurations,
so you definitely don't have to test all combinations.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
