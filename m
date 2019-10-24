From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2019 10:17:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: removed template config,
 added convenient 'sudo' group config options.
In-Reply-To: <e97fd4a9-2d28-1d36-1ad3-9ae3c4486fd8@mind.be>
References: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
 <e97fd4a9-2d28-1d36-1ad3-9ae3c4486fd8@mind.be>
Message-ID: <20191024101727.7af5db84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Oct 2019 00:15:01 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  With just a few sub-options, it's not worth making an additional menu. Kconfig
> will indent the sub-options when they're conditional on the immediately
> preceding symbol, as is the case here. That's enough.

Agreed.

> > +config BR2_PACKAGE_SUDO_GROUP
> > +	bool "add system group 'sudo'"
> > +	help
> > +	  Create a convenient system group named 'sudo' for
> > +	  granting users sudo permissions.
> > +
> > +config BR2_PACKAGE_SUDO_GROUP_RULE
> > +	bool "allow member of group 'sudo' to execute any command."
> > +	select BR2_PACKAGE_SUDO_GROUP
> > +	help
> > +	  Reinserts this rule from the /etc/sudoers configuration file:
> > +
> > +	  %sudo ALL=(ALL) ALL  
> 
>  Does it really make sense to have separate options for these two aspects? If
> you add a sudo group, it's most likely because you have something like that in
> your sudoers file. Without this option, you'll anyway need a custom sudoers file
> so it's pretty much irrelevant what you have in it.
> 
>  In fact, does it make sense to have the sudo group optional to begin with?

I think we don't need any new option at all:

 (1) Just create the sudo group unconditionally

 (2) Leave the customization of the /etc/sudoers file to the user,
     through an overlay/post-build script. We cannot add zillions of
     options to customize all aspects of each package configuration.

> > +define SUDO_REMOVE_GARBAGE  
> 
>  Please split this into two patches, because they're doing two separate,
> unrelated things. In fact, your commit message already suggests this because you
> say "this and that".
> 
>  Speaking of the commit message: it should use imperative (remove, add) and
> should not end with a dot (at least the summary line shouldn't).

Agreed. Also please don't use "garbage", I think we can find a better
word than garbage.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
