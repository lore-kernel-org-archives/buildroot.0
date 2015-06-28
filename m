From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 17:33:21 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <20150615111757.03ec0b48@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
 <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
 <20150615111757.03ec0b48@free-electrons.com>
Message-ID: <CAHkwnC8YPier_a5Jbn3MVoFROj_TtGmxqsXC7aA2-J0UiAgO5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 15, 2015 at 11:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Mon, 15 Jun 2015 11:06:40 +0200, Fabio Porcedda wrote:
>

[snip]

>> >  * I am not super happy with the idea of having the toolchain sysroot
>> >    left in the global staging directory and referenced by the compiler
>> >    --sysroot option on one side, and all other libraries found by
>> >    using -L, -I and pkg-config tricks.
>> >
>> >    I would actually prefer if a real complete sysroot was used when
>> >    building each package, and the compiler --sysroot option used to
>> >    adjust the compiler sysroot. This has however one significant
>> >    drawback: the toolchain sysroot must be copied for each and every
>> >    package, which can become quite time and space consuming. So on
>> >    this aspect, I'd like to have some input from other Buildroot
>> >    developers.
>>
>> I've already rewritten the patch set using the --sysroot option in the
>> toolchain wrapper. I just need to clean it up and send it, i hope to
>> be able to send it tomorrow so we can choose the best solution for
>> buildroot.
>
> Good. We'll see how it looks. So now the per-package sysroot also
> contains the C library and kernel headers as well? It's really a
> complete sysroot?

Yes, i copy the whole directory ${STAGING_DIR}, e.g.
output/host/usr/arm-buildroot-linux-gnueabi/sysroot

>> >  * Your patch uses $($(2)_ADD_TOOLCHAIN_DEPENDENCY) to decide whether
>> >    the per-package sysroot mechanism must be used or not. Which means
>> >    it will only be used for target packages, and not for host
>> >    packages. However, I'm wondering if we should not also apply the
>> >    principle to host packages: to get reproducible builds, I believe
>> >    we should also have separate sysroots when building host
>> >    packages. Opinions from other Buildroot developers?
>> >
>> >  * Your approach only takes care of make the sysroot handled in a
>> >    per-package fashion. But what about HOST_DIR ? We could have the
>> >    same inconsistencies as the ones we discussed about STAGING_DIR, but
>> >    this time caused by the presence/absence of host utilities. One
>> >    build may give a given result because host tool "foo" is present (it
>> >    happened to be built before), and the next build may give a
>> >    different result because host tool "foo" is absent (it's going to be
>> >    build after).
>>
>> You are right, but if possible i just want to handle the host
>> utilities matter as a next step after this step is done.
>
> I'm indeed fine with solving this part as a next step, however, I'd
> like to at least have some basic ideas of how it will be solved, to see
> the big picture and see if solving the big picture is doable.

My idea is to solve it in the same way as the staging directory,
copying the whole "output/host" directory expect for the sysroot part
if it is a host package.
Or maybe there is better way to do it?

BR
-- 
Fabio Porcedda
