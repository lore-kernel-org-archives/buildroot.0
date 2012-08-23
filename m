From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Wed, 22 Aug 2012 21:53:58 -0400
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <503485C0.1000406@free-electrons.com>
References: <1344594434-22756-1-git-send-email-golubovsky@gmail.com>
 <503485C0.1000406@free-electrons.com>
Message-ID: <CADiAo4J1XeK5iN0+WNMPPDi5ie6H2Ro3QKQ6dZUpK5fBuviqcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

On Wed, Aug 22, 2012 at 3:09 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi Dmitry,
>
> This looks fine for me, I still have some comments however.

Thomas applied this patch to next already:

http://git.buildroot.net/buildroot/commit/?h=next&id=04be7f0f8ca100afaf06b264332bc2cd61fbb3d0

But I'll try to answer to your comments


> From what I can see, this patchset only removes calls to ruserok and
> innetgr. Could you merge them together so that all the conditionnal
> removal of ruserok is only in one patch and all the conditional removal
> of inetgr in another ?

It makes use of ruserok and innetgr conditional as defined by
configure tests. Something that is not very much consistent in
linux-pam itself: some of its files did have check for innetgr, other
just called it. Configure test for innetgr existed in linux-pam. There
was no test for ruserok.

This is merely technical, the way I created those patches was manual
diffing of files in a pristine linux-pam source tree vs. working copy
in Buildroot build area. This time I did file-wise to make sure each
file compiles after patching. Patches for systemd are organized more
at functional level (like fixing %ms format in all files that use it
altogether).

> Also, could you be more explicit with regard to patch names ? Like
> linux-pam-disable-ruserok.patch.

Patch names are again file-wise.

>> +
>> +LINUX_PAM_VERSION = 1.1.4
>> +LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
>
> Since gz archives are also available, I guess you can drop this line.

They are, but .bz2 is smaller: why download more?

>
>> +LINUX_PAM_SITE = http://linux-pam.org/library/
>> +LINUX_PAM_INSTALL_STAGING = YES
>> +LINUX_PAM_CONF_OPT = \
>> +     --disable-prelude \
>> +     --disable-isadir \
>> +     --disable-nis \
>> +     --disable-regenerate-docu \
>> +     --enable-securedir=/lib/security \
>> +     --libdir=/lib
>> +LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex
>
> You can drop the libintl here. I know that a lot of packages do that,
> but this is useless, since the libintl package doesn't exist.

from .config:

#
# gcc needs development files in target filesystem
#
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y

And indeed a bunch of packages have it in their dependencies. So why
is BR2_PACKAGE_LIBINTL in the config?

>
>> +LINUX_PAM_AUTORECONF = YES
>> +
>> +define LINUX_PAM_BUILD_CMDS
>> +     $(MAKE) CC="$(TARGET_CC) -lintl -lfl" LD="$(TARGET_LD)" -C $(@D) all
>> +endef
>
> Why do you need to set -lintl -lfl options ?

I had build errors without this.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
