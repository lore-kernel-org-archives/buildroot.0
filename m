From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Sep 2011 08:08:12 +0200
Subject: [Buildroot] [PATCH 1 of 3] linux: add linux-update-config and
 linux-update-defconfig targets
In-Reply-To: <20110927224603.02a7e0b1@skate>
References: <patchbomb.1317151268@localhost6.localdomain6>
 <81756817dc47990f5c42.1317151269@localhost6.localdomain6>
 <20110927224603.02a7e0b1@skate>
Message-ID: <CAAXf6LV-4mRjrR58E2RJ2pEEocH5b08n_9YdEi8pp8U9fqjjRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 27, 2011 at 10:46 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 27 Sep 2011 21:21:09 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> In analogy to build targets uclibc-update and busybox-update, add
>> extra targets to copy the current configuration to the custom
>> configuration file set in buildroot. These targets facilitate the
>> work of developers adding support for a specific board.
>>
>> linux-update-config copies .config directly.
>> linux-update-defconfig first creates a defconfig and copies that.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> As further improvements, I am wondering :
>
> ?* Whether linux-update-*config should display a warning/error when
> ? BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE is not used, instead of being
> ? silent.

Ok, that's fine.

>
> ?* Whether this configuration update shouldn't be done automatically
> ? when one does "make linux-menuconfig" or "make linux-xconfig".
> ? People have often found strange to loose their configuration changes
> ? in Linux/Busybox/uClibc when they do a make clean.

Such a feature would be good indeed. But, some remarks:
* hooking it to menuconfig/xconfig wouldn't cover the case where the
.config is manually changed. This different behavior may be confusing
as well.
What if we execute the automatic saving just before the build step?
This of course requires to start building; you cannot just change the
config and hope that it is copied automatically. In that last case, a
manual linux-update-config would be necessary.
Is this acceptable?

* previously you raised the point of busybox-update / uclibc-update
potentially overwriting the standard buildroot files. If we do not
want this and we want automatic saving of custom configs, then we need
to be able to differentiate between custom and default configuration
files.
On the other hand, if there are users that purposefully put their
project's configuration in the default files (overwriting them), then
they would not be able to benefit from the automatic saving, and
possibly not from -update-config either. But I'm not sure if we ought
to support such practice...

>
> But regardless of this discussion, I think your patch should be merged
> as is.

Thanks for your ack, also on the other patches.

We'll implement the outcome of the newly raised discussion in a
separate patch then...

~Thomas
