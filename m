From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 25 Jan 2009 23:09:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <871vurdpc6.fsf@macbook.be.48ers.dk>
References: <20090125214834.783FA76D28@busybox.osuosl.org>
	<871vurdpc6.fsf@macbook.be.48ers.dk>
Message-ID: <1232921341.2298.18.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 22:54 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-25 21:48:33 +0000 (Sun, 25 Jan 2009)
>  ulf> New Revision: 25024
> 
>  ulf> Log:
> 
>  ulf> Use new SHELL variable BUILDROOT_KERNEL_CONFIG_METHOD
>  ulf> which will override selection between xconfig and menuconfig
> 
>  ulf> make xconfig will, if it fails, or user does not save configuration
>  ulf> result in make menuconfig beeing tried
> 
> Sigh, please don't make these changes to the tree before we come to an
> agreement on the list.
> 
>  ulf> Fix several issues causing final part of linux to be regenerated
>  ulf> on each make.
>  
>  ulf>  choice
>  ulf>  	prompt "Preferred config tool"
>  ulf> -	default BR2_MAKE_MENUCONFIG
>  ulf> +	default BR2_MAKE_XCONFIG
> 
> Don't do that.
> 
>  ulf> +# Override config method with shell variable
>  ulf> +ifneq ($(BUILDROOT_KERNEL_CONFIG_METHOD),)
>  ulf> +KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BUILDROOT_KERNEL_CONFIG_METHOD)))
>  ulf> +#"))
>  ulf> +else
>  ulf>  KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
>  ulf>  #"))
>  ulf>  ifeq ($(KERNEL_CONFIG_METHOD),)
>  ulf> -KERNEL_CONFIG_METHOD:=menuconfig
>  ulf> +KERNEL_CONFIG_METHOD:=xconfig
>  ulf>  endif
> 
> But why?

You started by doing changes which are unacceptable.

People that want to use xconfig should not suffer because
of people that does not have QT3.

With the new features, you can
1) Override whatever is in the configuration.
	and select xconfig, or menuconfig as you like
2) If you do not know, then you will default to xconfig
   and if QT3 is installed you will get this.
   If you do not have QT3 installed, then the make xconfig
   will fail and you will get menuconfig immediately afterwards
3) If you do know, and care, you can set
   the board config to use menuconfig,
   but then you are probably much better off to 
   use the shell default.


In fact, with this error handling it might make sense
to remove the configuration possibility altogether.

BR
Ulf Samuelsson
