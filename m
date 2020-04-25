From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2020 23:13:50 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
In-Reply-To: <20200425153810.2e86813e@windsurf.home>
References: <20200425000629.2068191-1-heiko@sntech.de>
 <20200425153810.2e86813e@windsurf.home>
Message-ID: <20200425211350.GR5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, Thomas, All,

On 2020-04-25 15:38 +0200, Thomas Petazzoni spake thusly:
> On Sat, 25 Apr 2020 02:06:29 +0200
> Heiko Stuebner <heiko@sntech.de> wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > 
> > A custom uboot version my depend on additional unspecified packages
> > to be built before the uboot build is attempted.
> > 
> > One example is an additional config fragment referencing things
> > from other packages, so add an option similar to the config fragments
> > where these can be defined.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Hm, this is interesting. Out of curiosity, what is the specific
> case/issue you had ?
> 
> We already have a bunch of BR2_TARGET_UBOOT_NEEDS_xyz options:
> 
> config BR2_TARGET_UBOOT_NEEDS_DTC
> config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
> config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
> config BR2_TARGET_UBOOT_NEEDS_OPENSSL
> config BR2_TARGET_UBOOT_NEEDS_LZOP
> 
> and I just realized that we will need:
> 
> config BR2_TARGET_UBOOT_NEEDS_PYTHON3_PYLIBFDT
> config BR2_TARGET_UBOOT_NEEDS_PYTHON3_PYELFTOOLS
> 
> indeed, as of U-Boot 2020.01, a number of Python scripts, including the
> pylibfdt stuff, and binman, are now Python 3 only. We already have a
> few build failures in the autobuilders due to this. And
> http://patchwork.ozlabs.org/project/buildroot/patch/20200413171831.12079-1-vincent.stehle at laposte.net/
> enables host-python3 to get around this, but I don't see how it can
> work as it doesn't guarantee that host-python3 is built before U-Boot.
> 
> So perhaps we should get rid of all this craziness and have just this
> BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES ?
> 
> Questions are:
> 
>  - Is this sufficiently user-friendly? It's already not necessary easy
>    to know when one has to enable NEEDS_DTC, NEEDS_PYLIBFDT, etc. So if
>    instead of that one has to know that host-dtc host-python host-swig,
>    etc. have to be enabled.
> 
>  - How to not break too much backward compatibility. Either we do
>    Config.in.legacy handling as we usually do. Or we keep them as
>    hidden booleans and have compatibility logic in uboot.mk to add the
>    proper dependencies.
> 
> Yann, Peter, Arnout, any opinion on this ?

My opinion on that patch is that i am definitely not in favour of it. If
we go that route, then we would have to allow adding any such arbitrary
dependencies to a wide range of packages. This is not acceptable in my
opinion.

Now, there are two situations:

  - the tool is already in Buildroot: add a new _NEEDS_FOO option like
    we already have.

  - the tool is in a br2-external tre: this is in my opinion better
    served by working on the evaluation-postpone changes Arnou and I
    have been suggesting for quite a while now.

Yes, the second situation is curently cumbersome for some. but remember
that br-2xternal is just providing a Makefile fragment that is included
in the main Makefiel of Buildrot. As such, you can complement the
internal dependencies in a hackish way:

    $(UBOOT_BUILDDIR)/.spatmp_configred: my-custom-package

Yes, this is hackish, but the hack is in your br2-external tree, not in
Buildroot.

So, I am definitely not in favour of adding such an option as the
proposed BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
