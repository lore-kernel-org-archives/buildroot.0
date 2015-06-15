From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 15 Jun 2015 11:06:40 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <20150612221456.44a97ad5@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
Message-ID: <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 12, 2015 at 10:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Tue,  3 Mar 2015 10:17:05 +0100, Fabio Porcedda wrote:
>
>> this patch set aims to improve build reproducibility by using a
>> per-package staging directory.
>> Also this feature aims to enable as default the top-level parallel make.
>
> Here are some comments I wrote down a long time ago. It isn't a full
> review, but it should give some initial thoughts:

Thanks for reviewing it.

> If I understood correctly, the strategy used by your patches consists
> in storing only the bare toolchain sysroot in output/staging/, and
> using a per-package output/stagingpkg/<pkg>/ directory to store as an
> input to the build the staging files needed to build the package, and
> also as output the result of the build of the package.

Yes

> I am not entirely happy with this solution, for the following reasons:
>
>  * We no longer have a single staging directory that has all the
>    libraries installed. This is needed for the toolchain to be a
>    proper SDK usable by application developers outside of Buildroot.
>
>    To solve this, either we install everything to both the real
>    STAGING_DIR and a per-package staging directory, or we create a
>    final build step that consolidates all the per-package staging
>    directories into a global one. The advantage of this second option
>    is that we don't have any parallel installation going on in the
>    global staging directory.

I personally prefer too the second solution.

>  * I am not super happy with the idea of having the toolchain sysroot
>    left in the global staging directory and referenced by the compiler
>    --sysroot option on one side, and all other libraries found by
>    using -L, -I and pkg-config tricks.
>
>    I would actually prefer if a real complete sysroot was used when
>    building each package, and the compiler --sysroot option used to
>    adjust the compiler sysroot. This has however one significant
>    drawback: the toolchain sysroot must be copied for each and every
>    package, which can become quite time and space consuming. So on
>    this aspect, I'd like to have some input from other Buildroot
>    developers.

I've already rewritten the patch set using the --sysroot option in the
toolchain wrapper. I just need to clean it up and send it, i hope to
be able to send it tomorrow so we can choose the best solution for
buildroot.

>  * Your patch uses $($(2)_ADD_TOOLCHAIN_DEPENDENCY) to decide whether
>    the per-package sysroot mechanism must be used or not. Which means
>    it will only be used for target packages, and not for host
>    packages. However, I'm wondering if we should not also apply the
>    principle to host packages: to get reproducible builds, I believe
>    we should also have separate sysroots when building host
>    packages. Opinions from other Buildroot developers?
>
>  * Your approach only takes care of make the sysroot handled in a
>    per-package fashion. But what about HOST_DIR ? We could have the
>    same inconsistencies as the ones we discussed about STAGING_DIR, but
>    this time caused by the presence/absence of host utilities. One
>    build may give a given result because host tool "foo" is present (it
>    happened to be built before), and the next build may give a
>    different result because host tool "foo" is absent (it's going to be
>    build after).

You are right, but if possible i just want to handle the host
utilities matter as a next step after this step is done.

> Now some more specific comments:
>
>  - The "enable parallel" patch should come last in the series.

Ok.

>  - The patches "popt: add to the "popt.pc" file the libintl library"
>    and "logrotate: use pkg-config for the opt library" have been
>    merged in master, so you could get rid of them from your series.

Great.

>  - In patch "xinetd: use TARGET_LDFLAGS in order to support
>    per-package staging", why don't we simply use the LDFLAGS
>    environment variable, which seems to be understood by xinetd
>    Makefile? Also, missing SoB line.

I need to test it.

>  - Patch "iproute2: use the TARGET_LDFLAGS variable" seems good to go,
>    if the commit log doesn't mention per-package sysroot, so that we
>    can merge it independently.

Ok.

>  - Patch "opentyrian: use TARGET_LDFLAGS", having -lm before
>    $(TARGET_LDFLAGS) is probably more logical.

Ok.

> I didn't finished reviewing all of the package specific patches.

Maybe you can review directly the rewritten patch set the use the
sysroot option.

Best regards
-- 
Fabio Porcedda
