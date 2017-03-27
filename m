From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 27 Mar 2017 06:43:07 -0700
Subject: [Buildroot] Patchwork cleanup, 10 patches to look at
In-Reply-To: <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
Message-ID: <CAHQ1cqEgafyrfw+p=yOY1dDREeEf5Zu27nJ5JARt2-_mOtq-rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 27, 2017 at 5:35 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 26-03-17 23:53, Thomas Petazzoni wrote:
>> Hello,
>>
>> I'd like to again restart the patchwork cleanup effort. There are
>> numerous patches in patchwork that I'm not sure what we want to do
>> with.
>
>  Great initiative!
>
>>
>> Here is a list of 10 patches that we need to take a decision on. If no
>> decision is taken in the next 2 weeks, I'll mark them as Rejected.
>>
>>  * avahi: link with libintl if libglib2 is enabled
>>    https://patchwork.ozlabs.org/patch/683732/
>>
>>    My plan is to enable the stub libintl in uClibc-ng and stop having
>>    all those linking issues with libintl from gettext. The only
>>    drawback would be that there would no longer be "translation"
>>    support with uClibc: the libintl implementation in uClibc-ng is
>>    really just a stub.
>>
>>    Thoughts ?
>
>  I think having internationalization support can still be useful in a
> Buildroot/uClibc based system, e.g. to support translation of a custom CLI UI.
> So using the stub implementation unconditionally sounds like a bad idea.
>
>  How about instead making gettext/intl support depend on !static? That's also a
> catch-all solution, but a lot less aggressive.
>
>
>>  * qemu: allow to build statically
>>    https://patchwork.ozlabs.org/patch/692667/
>>
>>    We normally don't want to have special options for each package to
>>    build them statically. Should we make an exception for Qemu?
>
>  I see something like this like having package options that do little more than
> selecting other packages, like BR2_PACKAGE_PHP_EXT_BZIP2. It's something we want
> to avoid, but sometimes there are good reasons to do it.
>
>  So for Qemu and also for Docker I do think it makes sense to have static as a
> per-package option.
>
>
>>  * infra: fix 'packages-file-list.txt' with TLP
>>    https://patchwork.ozlabs.org/patch/694519/
>>
>>    Adds a lock around the installation step of packages, to make
>>    top-level parallel build still generate a correct list of files per
>>    package.
>>
>>    Gustavo, what is your plan regarding this?
>>
>>    Others: should we merge this?
>
>  I don't think this is the proper approach. The proper approach is map/reduce,
> i.e. generate the pieces in per-package files and collect them together in a
> final gathering stage. Obviously, this requires a per-package target first, but
> that's anyway the way we want to go.
>
>  I thought someone already made that comment but I can't find it in that thread...
>
>>  * e2fsprogs: keep util-linux's fsck if chosen
>>    https://patchwork.ozlabs.org/patch/696634/
>>
>>    This fixes a real bug, but even Maxime who submitted the patch is
>>    not too happy with the proposal. Could someone look into this?
>>
>>  * linux-headers: Account for LINUX_OVERRIDE_SRCDIR
>>    https://patchwork.ozlabs.org/patch/713927/
>>
>>    I think I am against this patch, because if the user sets
>>    LINUX_OVERRIDE_SRCDIR, then suddenly he will see his kernel headers
>>    being rebuilt as well.
>>
>>    Arnout ?
>
>  Well, as you can see in the discussion thread, I argued against it, asked for a
> stronger argument for it, but none was forthcoming.

The patch in question is trivial, so asking for stronger argument for
it is as good as saying "no". I don't have any plans on working on
that patch further, and given the state of discussion, IMHO, marking
it as "Rejected" would be the right thing to do.

Thanks,
Andrey Smirnov
