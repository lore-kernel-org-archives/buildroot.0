From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Sep 2013 08:53:17 +0200
Subject: [Buildroot] [PATCH 3/3] docs/manual: add explanations about
 BR2_EXTERNAL
In-Reply-To: <5232362E.60107@mind.be>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <5232362E.60107@mind.be>
Message-ID: <20130913085317.4bcd10dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 12 Sep 2013 23:46:22 +0200, Arnout Vandecappelle wrote:

> > ++BR2_EXTERNAL+ is an environment variable that one can use to point to
> > +a directory that contains Buildroot customizations. This environment
> > +variable must be passed everytime a Buildroot +make+ command is
> > +invoked, be it at configuration time (+make menuconfig+, +make
> > +xconfig+, etc.), at build time (+make+) or any other Buildroot command
> > +(+make source+, +make legal-info+, etc.).
> 
>   Hang on... It's stored in the .config, right? So no need to pass it 
> every time?

No, it is *not* stored in the .config. See other parts of the thread.

>   In fact, if the config option would get a prompt, you could even enter 
> it through the config instead of through the environment. The only reason 
> to pass it through the environment is to be able to list the available 
> defconfigs.

No, that's not the only reason. In Config.in, we are sourcing
$(BR2_EXTERNAL)/Config.in, so we need to know the value of
$(BR2_EXTERNAL) before running menuconfig/xconfig.

If BR2_EXTERNAL is just a Config.in option, you have a chicken-and-egg
problem: you need its value before running menuconfig, but to define
its value, you need to run menuconfig.

The BR2_EXTERNAL Config.in option is *only* here to "transfer" the
environment variable value into a Config.in option so that Config.in
files can use $BR2_EXTERNAL to reference other Config.in files. That's
the only reason why we have this BR2_EXTERNAL Config.in option. And as
discussed previously, the value of this option is not even stored in
the .config file.

> > +To achieve this, it is recommended but not mandatory, to store those
> > +   details in directories called +board/<boardname>/+ under
> 
>   You use someboard instead of <boardname> earlier.

Will fix, thanks.


> > +------
> > +menu "<somecompany> packages"
> > +
> > +source "$BR2_EXTERNAL/package/package1/Config.in"
> > +source "$BR2_EXTERNAL/package/package2/Config.in"
> 
>   Wow, does this work?

Are you sure you read/understand the BR2_EXTERNAL completely? :-)

The example above is an example of a $(BR2_EXTERNAL)/Config.in file.
This file is the only one that gets conditionally included (i.e
included when BR2_EXTERNAL is set, not included when BR2_EXTERNAL is
not set).

The Config.in files included by $(BR2_EXTERNAL)/Config.in are the ones
added by the user in his external directory, so obviously he will only
be listing Config.in files that really exist, just like we do in
Buildroot.

There must be something really not clear in the documentation I've
written, because it seems you did not get how it was all working. Do
not hesitate to point out what was causing confusion, so that I can
improve the wording of the documentation.

Maybe you should look at the directory/file hierarchy example shown
below.

> Then actually, you don't need that generated 
> Config.in at all... Instead, you can add
> 
> source "$BR2_EXTERNAL/package/Config.in"
> 
> to the top of package/Config.in. And set a non-empty default for 
> BR2_EXTERNAL, e.g. $(TOPDIR)/support/dummy_external, which contains an 
> empty package/Config.in.

Humm, this however looks like a very interesting trick. I'll try this
out.

> > +In the end, a typical +BR2_EXTERNAL+ directory organization would
> > +generally be:
> > +
> > +-----
> > +??? Config.in
> > +??? external.mk
> > +??? board/
> > +?   ??? <someboard>/
> > +?       ??? overlay/
> > +?           ??? etc/
> > +?               ??? <some file>
> > +??? configs/
> > +?   ??? <some board>_defconfig
> > +??? package/
> > +    ??? Config.in
> > +    ??? package1/
> > +        ??? Config.in
> > +        ??? package1.mk
> > +    ??? package2/
> > +        ??? Config.in
> > +        ??? package2.mk

Have you had a look at this part of the documentation?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
