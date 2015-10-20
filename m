From: David Kosir <david.kosir@bylapis.com>
Date: Tue, 20 Oct 2015 23:50:28 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <20151020203326.GA31310@free.fr>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
 <20151020203326.GA31310@free.fr>
Message-ID: <CAOcYpt1nwhHC7d_rpG3G5J+u8z8FaXykSntgp85NBQ1ziCy7ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

First of all, thanks for comments.

>>        Userspace device daemon. This is a standalone version,
>>        independent of systemd. It is a fork maintained by Gentoo.
>> @@ -22,6 +21,12 @@ if BR2_PACKAGE_EUDEV
>>  config BR2_PACKAGE_PROVIDES_UDEV
>>      default "eudev"
>>
>> +config BR2_PACKAGE_EUDEV_AVOID_USR
>> +    bool "don't install to /usr"
>> +    help
>> +      Avoid installing to /usr, use (e)prefix=/
>> +      Useful when having separate /usr partition.
>
> We recently committed an option to merge / and /usr. How does your
> change compare with that option?
>
> See:
>     http://git.buildroot.org/buildroot/commit/?id=c5bd8af65e50a51735eb112fed9cbe6337f14e06

My idea was a bit different but my explanation was poor, sorry.
I have separate /usr partition which mounts from nfs server, so I need
to avoid all /usr paths for base programs and libraries.
Actually, I was using mdev before udev and busybox had option for not
use /usr (called CONFIG_INSTALL_NO_USR) so my idea worked.
I wanted to achieve that with udev too, so I needed to implement
something like that.

BTW, my patch from first email wasn't good, I made mistake and sent
first version which didn't build. I will fix it.

>> @@ -33,6 +38,11 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
>>      help
>>        Enables hardware database installation to /etc/udev/hwdb.d
>>
>> +config BR2_PACKAGE_EUDEV_ENABLE_KMOD
>> +    bool "enable kernel module support"
>> +    select BR2_PACKAGE_KMOD
>> +    help
>> +      Enable loadable kernel modules support (kmod)
>
> In this case, what we usually do is:
>   - we do not add such option above;
>   - we enable the support if the corresponding package is enabled.
>
> Which in this case would translate to a simple change in the .mk :
>
>     ifeq ($(BR2_PACKAGE_KMOD),y)
>     EUDEV_DEPENDENCIES += kmod
>     EUDEV_CONF_OPTS += --enable-libkmod
>     else
>     EUDEV_CONF_OPTS += --disable-libkmod
>     endif
>
> And that's all (for kmod).

I understand it, that approach makes sense.
I'm curious if that will make problems because kmod would be
unselected by default which is not expected from such common package.
That was why I made it to request kmod explicitly.
I don't have much experience so I tend to accept your solution, but
I'm curious if this matters at all.

> Care to split the patch in two and resend that?

Sure, I will make it first thing tomorrow morning.

> In the meantime, I marked this patch as "cjhamges requested" in our
> patchwork.
>
> Thanks! :-)

Thank you!
David
