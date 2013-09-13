From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Sep 2013 05:48:50 +0200
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <52322C4D.4060202@mind.be>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <52322C4D.4060202@mind.be>
Message-ID: <20130913054850.4e618f01@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 12 Sep 2013 23:04:13 +0200, Arnout Vandecappelle wrote:

>   It's funny how people can change their mind...

Isn't it? In french, we have an expression that more or less says:
"only idiots don't change their mind" :-)

> On 08/09/13 15:15, Thomas Petazzoni wrote:
> > This commit adds support for an environment variable named
> > BR2_EXTERNAL, which the user can point to a directory outside of
> > Buildroot that contains root filesystem overlays, kernel configuration
> > files, package recipes, defconfigs, etc. It allows users to keep their
> > specific Buildroot customizations outside of the Buildroot tree.
> >
> > BR2_EXTERNAL allows:
> 
>   I would split this into three separate patches for the three separate 
> features. I think (1) and (3) are a lot less controversial than (2).

Hum, right, I might be splitting things, but I believe than (1) and (3)
without (2) doesn't make much sense.

> >   (1) To use $(BR2_EXTERNAL) in all Buildroot configuration options
> >       that take a path as argument. This allows to reference a root
> >       filesystem overlay, a kernel configuration file, a Barebox
> >       configuration file located in the BR2_EXTERNAL directory.
> 
>   Note to list: this was already possible before, of course, the 
> difference is that now this path will be stored in the .config.

I'm not sure why you think it's going to be stored in the .config. The
'config BR2_EXTERNAL' option is here only to "forward" the environment
variable as a kconfig value, and it doesn't seem to be stored in
the .config file, as far as I can see:

$ make BR2_EXTERNAL=../company/ menuconfig
$ grep BR2_EXTERNAL .config
$

>   There is one small issue with this: I don't think that all the use 
> cases support relative paths. Ideally, the Makefile should be smart 
> enough to prepend $(TOPDIR) if it doesn't start with a /.

So far the cases I've tested did support relative paths, but I agree
that turning it into an absolute path within the Makefile is probably
safer.

> >   (2) To store external package or makefile logic, since the
> >       BR2_EXTERNAL/external.mk file is automatically included by the
> >       Makefile logic, and the BR2_EXTERNAL/Config.in file is
> >       automatically included, and appears in the top-level menu. The
> >       typical usage would be to create a BR2_EXTERNAL/package/
> >       directory to contain package definitions.
> 
>   I'm not really convinced by the principle. The external.mk is exactly 
> the same as the local override .mk; the Config.in appears at the very end 
> of the top-level menu. Instead, I think we should enforce the buildroot 
> hierarchy in the external dir, i.e.
> 
> source <path-to-external-dir>/package/Config.in
> 
> at the top of package/Config.in, and
> 
> -include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
> 
> in the top-level Makefile.

This is what I had originally done, but it seemed to me that the
external stuff may wish to add other Kconfig options than just
packages. That said, I've done this BR2_EXTERNAL stuff mainly for
packages, so if people think that we should restrict this to packages,
I'm fine with that.

>   Of course, that Config.in thing is a lot trickier because it's almost 
> impossible to refer to the output directory from the Config.in.

I'm not sure to follow you on this one.

> >   * The top-level Config.in file given to kconfig is no longer the main
> >     Config.in in the Buildroot sources, but instead a toplevel.in file
> >     generated in the output directory, which includes the top-level
> >     Buildroot Config.in file and the BR2_EXTERNAL/Config.in file if
> >     provided. Since is needed because the kconfig 'source' statement
> >     errors out if the included file doesn't exist. I have written
> >     patches that add support for an 'isource' statement in kconfig
> >     (that silently ignores the inclusion if the pointed file doesn't
> >     exist), but keeping feature patches against kconfig doesn't seem
> >     like a good idea.
> 
>   It took me a while to realize that that was _not_ the approach you had 
> taken...

Yeah, sorry if the wording was confusing. I initially experimented by
doing a kconfig modification, and then realized it could be done
without changing kconfig at all, which is obviously nicer.

> >   * The BR2_EXTERNAL environment variable gets passed in the
> >     environment of kconfig and when executing the kconfiglib-based
> >     Python script that updates the manual, so that the references to
> >     the BR2_EXTERNAL variable within Config.in files can be resolved.
> 
>   So this means that the external packages will appear in the package 
> list in the manual? I'm not sure if that is what you typically want.

I remember having an issue with the manual generation script, but it
might have been caused by the earlier kconfig-based implementation. I
agree with quite certainly don't want to have the BR2_EXTERNAL packages
listed in the manual.


>   I guess you mean phony target. You should also add
> .PHONY: toplevelin-generate
> for the (unlikely) case that someone creates a file with this name.

Ok.

>   BTW I don't like the target's name. generate-config-dot-in maybe?

Ok.

> > +	mkdir -p $(dir $(CONFIG_CONFIG_IN))
> > +	echo "mainmenu \"Buildroot $$BR2_VERSION Configuration\"" > $(CONFIG_CONFIG_IN)
> > +	echo "source \"Config.in\"" >> $(CONFIG_CONFIG_IN)
> > +ifneq ($(BR2_EXTERNAL),)
> > +	echo "source \"$$BR2_EXTERNAL/Config.in\"" >> $(CONFIG_CONFIG_IN)
> 
>   $(BR2_EXTERNAL) would be a lot more readable than $$BR2_EXTERNAL IMHO. 
> Then you can also put it in single quotes and remove the \.

Right.


>   There is one tricky issue:
> 
> cd ~/src/myproject/output
> make -C ~/src/buildroot O=$PWD menuconfig
> Hack hack hack
> Hm, I need an external dir...
> BR2_EXTERNAL=.. make menuconfig
> => BR2_EXTERNAL will point to ~/src instead of ~/src/myproject
> 
>   I.e., it doesn't work well for relative paths.
> 
>   I don't know if there is an elegant way to solve that.

I'll have a look into this.


>   This should be in a
> ifneq ($(BR2_EXTERNAL),)

Right.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
