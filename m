From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 10:29:57 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <53C63546.4040204@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
 <20140715213125.1b848b48@free-electrons.com>
 <53C63546.4040204@lucaceresoli.net>
Message-ID: <20140716102957.76a63a7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed, 16 Jul 2014 10:18:14 +0200, Luca Ceresoli wrote:

> > However, I've for now rejected those two patches. The reason is that I
> > don't think we should add an option to customize the user with which
> > each and every daemon is started. Buildroot should use a sane default
> > option, and for additional configuration, leave it to the Buildroot
> > user to use BR2_ROOTFS_USERS_TABLES to create any additional/custom
> > user that may be needed.
> 
> I generally agree with you.
> 
> The problem with exim is that it does not allow to configure its user
> from a runtime configuration file, because it's hard-coded in the
> binary. The only way to select a user is to change the build-time
> configuration.
> 
> So, it's true that one can easily create a new user for exim using
> BR2_ROOTFS_USERS_TABLES. But currently the only way to tell exim to use
> that user is to supply an entire config file (which is possible thanks
> to patch 1 that you've just applied). This would bring out of sync from
> changes in the config file coming from upstream (exim as well as
> Buildroot).
> 
> Patch 2 allows one to keep the Buildroot-provided configuration file,
> and Buildroot would take care of tweaking the one line needed to
> actually use the new username.

Well, I think we generally support two cases in Buildroot:

 1) A basic, default, sane configuration. This is what already existed
    prior to your patch series, where exim uses a dedicated user
    created by the exim package.

 2) A way of providing a custom configuration, which is possible thanks
    to the BR2_ROOTFS_USERS_TABLES plus the possibility of providing a
    custom Exim configuration file.

Of course, it means than if all you want is to change the user with
which Exim is running, you have to go with option (2), even if for all
other options you need to keep the exact same options as the ones
normally used with option (1).

But it's exactly the same as with the kernel: if you can use a
defconfig, it's easy and simple. If you need to use a defconfig + one
more option, then you have no other choice than switching to using your
own kernel configuration file. We won't add Config.in options for each
and every kernel options.

And therefore I don't think we should add Config.in options for each
and every exim configuration option. You might be interested by
changing the user, but the next user will be interested in changing
this other knob, and so on and so on. We clearly don't want to go down
that road, and instead we want to go for option (2) by providing a
general customization solution, which allows to solve the problem, even
if it requires a little bit of effort if your customization is only
related to one or two differences compared to the basic Buildroot
configuration.

Of course, others are very welcome to enter this discussion and give
their opinion.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
