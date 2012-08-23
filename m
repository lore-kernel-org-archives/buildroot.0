From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 23 Aug 2012 09:59:57 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <CADiAo4J1XeK5iN0+WNMPPDi5ie6H2Ro3QKQ6dZUpK5fBuviqcg@mail.gmail.com>
References: <1344594434-22756-1-git-send-email-golubovsky@gmail.com>
 <503485C0.1000406@free-electrons.com>
 <CADiAo4J1XeK5iN0+WNMPPDi5ie6H2Ro3QKQ6dZUpK5fBuviqcg@mail.gmail.com>
Message-ID: <5035E2FD.8000603@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 23/08/2012 03:53, Dmitry Golubovsky a ?crit :
> On Wed, Aug 22, 2012 at 3:09 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>> This looks fine for me, I still have some comments however.
> 
> Thomas applied this patch to next already:
> 
> http://git.buildroot.net/buildroot/commit/?h=next&id=04be7f0f8ca100afaf06b264332bc2cd61fbb3d0

Yes, I saw that just after sending the mail. Sorry.

>>> +LINUX_PAM_SITE = http://linux-pam.org/library/
>>> +LINUX_PAM_INSTALL_STAGING = YES
>>> +LINUX_PAM_CONF_OPT = \
>>> +     --disable-prelude \
>>> +     --disable-isadir \
>>> +     --disable-nis \
>>> +     --disable-regenerate-docu \
>>> +     --enable-securedir=/lib/security \
>>> +     --libdir=/lib
>>> +LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex
>>
>> You can drop the libintl here. I know that a lot of packages do that,
>> but this is useless, since the libintl package doesn't exist.
> 
> from .config:
> 
> #
> # gcc needs development files in target filesystem
> #
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_LIBINTL=y
> 
> And indeed a bunch of packages have it in their dependencies. So why
> is BR2_PACKAGE_LIBINTL in the config?

Well, actually, the content of _DEPENDENCIES are the package names, and
are not quite related to Kconfig here. If you look into packages/, you
will see that there is only a gettext package and no libintl package.
And it is this gettext package that defines the Kconfig symbol
BR2_PACKAGE_LIBINTL in package/gettext/Config.in (and this option adds
nothing at all, it actually removes the gettext binaries to leave only
the libintl). All of this is likely to change quite soon though, as few
of us have worked on making all the gettext stuff more consistent.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
