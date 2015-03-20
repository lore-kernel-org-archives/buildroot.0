From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 09:27:51 -0400
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <20150320142055.5ba1af4c@free-electrons.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <20150320142055.5ba1af4c@free-electrons.com>
Message-ID: <CANPyyuPobYDV9qWG5u0OzrVy9WtCy0KmfrQUBCHPvqqJEa4kMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Mar 20, 2015 at 9:20 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> Adding Steven in Cc.
>
> On Thu, 19 Mar 2015 13:56:32 -0400, Mike Williams wrote:
>
>> Currently, package service files for systemd are installed by
>> buildroot in a variety of locations: /etc, /lib, and /usr/lib. For
>> systemd, split /lib is deprecated and only checked if a split /lib
>> and /usr/lib is enabled. /etc is meant for local customizations to
>> the default service files. It is my opinion that buildroot should
>> install all upstream package and buildroot-provided service files
>> in /usr/lib, and this series cleans up our packages to do exactly
>> that. Enabling them by default by linking them
>> to /etc/systemd/system/multi-user.target.wants has been preserved.
>>
>> Upstream systemd's standard installation directory for its binaries
>> is /usr/lib. It appears that historically, buildroot's systemd
>> installation location has been switched between /lib and /usr/lib
>> multiple times. I couldn't find any particular reason for this, so
>> I've moved it back to /usr/lib along with its service files.
>
> I am generally fine with the proposed changes, especially since other
> systemd users looked at them.
>
> However, there's one thing I'm not sure about: you're changing all the
> relative symbolic links to absolute symbolic links:
>
> -       ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
> +       ln -fs /usr/lib/systemd/system/ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
>
> While it causes no problem on the target, it means that when looking at
> output/target/ on your build machine, now all those symbolic links are
> broken. I find it quite nice when relative symlinks are used, since it
> allows to have things in output/target looking somewhat sensible.
>
> Is there any strong reason for switching to absolute symbolic links?

No, they were just relative to the files that used to be in /etc and I
used absolute because it was easier for me to not screw them up when
changing them :). How about you or one of the other buildroot core
team tell me how you want it done, and I'll re-roll the patch series.

>
> Also, there are *lots* of systemd related patches sitting in patchwork.
> Could you and Steven have a look at those pending patches, and let me
> know which ones can be applied, which ones cannot?

Will do. I think after the next series of this patch, and a couple new
spins of other patches, we should be able to send you a large list of
patches to commit.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
