From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Jan 2016 10:07:56 +0100
Subject: [Buildroot] [PATCH] linux: provide symlink dtc->linux-dtc is
 there is no dtc yet
In-Reply-To: <569059C7.8090901@mind.be>
References: <1452252619-13802-1-git-send-email-patrickdepinguin@gmail.com>
 <569059C7.8090901@mind.be>
Message-ID: <CAAXf6LWrEo8DWhLGO_wQqGRm086hkefQAvhB4B2qrY3L0G6tgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 9, 2016 at 1:52 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Thomas,
>
>  In the subject: is -> if
>
> On 08-01-16 12:30, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Commit ab74e09eb4e28dab8bed8d783c5f0464d39a32e7 renamed the dtc host tool
>> provided by linux to linux-dtc to avoid clashes with the dtc host tool
>> provided by host-dtc.
>>
>> However, external scripting may well rely on the existence of a device tree
>> compiler as $(HOST_DIR)/usr/bin/dtc, regardless of its source. Changing
>> these external scripts to use linux-dtc means that the scripts need to be
>> aware of the buildroot release they are working with, which is not very
>> nice.
>>
>> Add a symlink dtc->linux-dtc when no $(HOST_DIR)/usr/bin/dtc is present.
>> When host-dtc is not enabled, the end result will be dtc and
>> linux-dtc representing the same thing.
>> When host-dtc is enabled, either it is build before linux and no symlink
>> is created at any time, or it is build after linux, and the 'install'
>> command in host-dtc will overwrite the symlink with a proper dtc. In both
>> cases, the end result will be dtc and linux-dtc representing a different
>> thing.
>
>  Or, when we eventually enable top-level parallel build, dtc and linux-dtc may
> be installed in parallel...
>
>  Why do you always have these controversial patches, Thomas :-)
>
>  How about a simple:
>
>         ln -s linux-dtc $(HOST_DIR)/usr/bin/dtc 2>/dev/null
>
>  i.e. just try to create the symlink and ignore errors. Creating a symlink is
> atomic.
>
>  Argh, no, that leaves another race condition: the install of the dtc package
> will do stat, (unlink), open, so between the stat or unlink and the open there
> is a window in which the symlink will succeed. Then the version from host-dtc
> will overwrite linux-dtc, which is not what we want...
>
>  I just love race conditions :-)
>
>
>  Perhaps a better solution is to revisit ab74e09e completely. The intention of
> that commit was to have the linux version of dtc available for scripts. But is
> there ever any reason for a script _not_ to use the linux version? So what we
> would actually like is to keep a single dtc: the linux one if it is available,
> that one will be used, and host-dtc is a NOP. If not, then host-dtc kicks into
> action.
>
>  So we'd add a dependency from host-dtc to linux if BR2_LINUX_KERNEL=y, and in
> the build and install commands test if dtc is available in the kernel (testing
> $(HOST_DIR)/usr/bin/dtc isn't sufficient, because it's possible that we rebuilt
> host-dtc and then we do want to overwrite it). It's a bit kludgy but it would
> work I think.

This would mean that a simple 'make host-dtc' would result in the
kernel being built first, which in the case of a large package like
the kernel is quite cumbersome.

We can get rid of any race condition by making the symlink in a
sequential part of the build, say target-finalize or a separate step.
It's a bit odd (which is why I did not do that in the first place) but
would work too.

>
>  PeterS, PeterK, what do you think?
>
>
>  That said, we don't have parallel build at the moment, and my proposed
> alternative is definitely going to be controversial, so we should probably
> accept this one as is and revisit later. So:
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks :)

/Thomas
