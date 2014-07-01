From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 1 Jul 2014 10:35:36 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <53B250A9.9000707@mind.be>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost>
 <53AA6938.80303@mind.be>
 <CAAXf6LVkiOswF-Hb=QGLH7rrNyX4S+bH1dU1rde+HWomn-dL8Q@mail.gmail.com>
 <53B250A9.9000707@mind.be>
Message-ID: <CAAXf6LXugjXDjtyACL=i1hAcYy27WqZ=636Sx0OdJu05Jyi3sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Jul 1, 2014 at 8:09 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>>
>> FYI, my plan for this patch series is to first fix all issues for
>> uclibc, then extract that to a kconfig-package, then convert busybox,
>> barebox, linux to this kconfig-package, one by one.
>>
>> With respect to the skeleton above: you moved the FIXUP_DOT_CONFIG to
>> the .config and menuconfig target. If a user manually edits .config
>> (or copies over a new file) then these fixups will not be applied. I
>> think they should be applied nevertheless, so moving the fixup to the
>> configure command and letting configure depend on .config makes more
>> sense to me.
>>
>> Would you agree?
>
>  I don't really agree that we should care about a user manually overwriting
> .config (so _not_ using a 'make xxxconfig'. However, if we can support that, so
> much the better of course.
>
>  Moving the fixup to the configure step has the disadvantage that there is a
> difference between:
>
> make clean; make uclibc-menuconfig; make uclibc-update-defconfig
>
> and
>
> make clean; make uclibc-menuconfig; make; make uclibc-update-defconfig
>
> (the first case will not have the fixups applied, the second case does).

Yes, but this is why in patch 2/5 I also added the FIXUP step to the
update-defconfig target. After this, both sequences should give the
same result.

>
>  Also, with 'make clean; make uclibc-menuconfig' you'll won't see the result of
> the fixups in your menuconfig, which is pretty strange. Especially for e.g.
> linux-menuconfig, because 'make clean; make linux-menuconfig' would give you the
> config options for i386 instead of your target...

For linux, the menuconfig step depends on the -configure step, and the
configure commands include the copy + fixup of the config file. This
works fine with respect to what you wrote above, but has the
disadvantage that the entire toolchain has to be built/downloaded
before being able to set the linux config (which violates one of the
stated requirements).

>
>
>  That said, it doesn't hurt to just put the fixups everywhere: in the .config
> target, in the -menuconfig target, and in the PRE_CONFIGURE_HOOKS.

I think it indeed boils down to adding the fixup to the right places
to get the right, expected behavior, without the downsides that we
already discovered...

Best regards,
Thomas
