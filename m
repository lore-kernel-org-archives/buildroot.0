From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 15:13:40 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828135546.511e1ec5@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
 <CAAXf6LXqi=BWZ6dovZS3HEfCZbr5DbECvQLJCwOH94Ax=P_z9Q@mail.gmail.com>
 <20130828135546.511e1ec5@skate>
Message-ID: <CAAXf6LU9F_44bBCcr3pPJO6T3eVAdom-3p1H+sVwW_ga4LAsPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 28, 2013 at 1:55 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 28 Aug 2013 13:31:38 +0200, Thomas De Schampheleire wrote:
>
>> > We don't have that many build failures today, so let's have a look
>> > together at each of them and see what we can do about them.
>>
>> Good idea! Ideally we can get them to 0, so that from that point
>> onwards any autobuild failure becomes a clear focus point.
>
> Agreed. Though we have to keep in mind that the release is in 3 days,
> and after that 'next' will be merged in master, and we'll have plenty
> of new autobuilder failures to look at.

I don't think we will be able to fix everything before the release. So
after next is merged in, we should try fixing the new problems as soon
as possible, in addition to the current ones.
Have you heard of the 'stop&fix' principle? The idea is that no new
patches are accepted when there are existing failures, and all
developers are expected to help in fixing the problem before doing
anything else.

>
>> >>    powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/7bcab9b94a81b89789dc1cabe9f6940ed4f5ea51/
>> >
>> > Too old kernel headers in toolchain. Options:
>> >
>> >  1/ Add an exception in the autobuilder script.
>> >
>> >  2/ Modify media-ctl to integrate the necessary kernel headers and use
>> >     them when not available from the toolchain.
>> >
>> > I'm inclined to favor 1/.
>>
>> I once took a look at this. The media-ctl package already has some
>> copies of kernel headers to deal with older kernels. There was a check
>> in configure to detect this, IIRC. The stupid thing was that the
>> headers in the media-ctl sources would be applied unconditionally.
>> My intent was to patch media-ctl to provide also this missing header,
>> and cleanup the stupidity described. Unfortunately I didn't continue
>> this yet.
>>
>> What exactly do you mean with approach 1/? Forcing a recent kernel
>> when building media-ctl?
>> That doesn't solve the problem for other users that try to enable
>> media-ctl on older kernels, right?
>
> By 1/ I meant to not fix the problem, and only avoid it in the
> autobuilders by making sure that when a non-suitable toolchain (too old
> kernel headers) is used to build media-ctl, then we exclude media-ctl
> from the build. I already have quite a few of such exclusions. What I
> find not very nice is that the set of exclusions is not documented
> anywhere, while they should be documented as "Known issues", or
> something like that.

I think this can be a good solution. Some problems are either too
complex to fix in buildroot and are really problems of upstream
packages, or some problems are exhibited in such exotic configurations
that no-one really cares about, or problems are caused by old
toolchains/kernels that could be upgraded by the user.

In these cases, a 'Known issues' + autobuild check may be better than
leaving the autobuild fail continuously. Users that bump into such an
issue, and do want to have a solution, can bring up the issue on the
mailing list and help look for a real solution.

Of course it's not the solution to add each build failure to the known
issue, because then buildroot becomes useless. But I'm sure we can
have good judgement here by the community members.

>
> For reference, here is the current set of tweaks that I apply to the
> randpackageconfig before starting the build. Note that when "return
> False" is used, it means that the configuration is rejected and not
> built, so a completely different random configuration will be tried.
>
>     # Make sure Qt license is approved
>     if "BR2_PACKAGE_QT=y\n" in config_items:
>         if "# BR2_PACKAGE_QT_LICENSE_APPROVED is not set\n" in config_items:
>             config_items.remove("# BR2_PACKAGE_QT_LICENSE_APPROVED is not set\n")
>             config_items.append("BR2_PACKAGE_QT_LICENSE_APPROVED=y\n")
>     if "BR2_PACKAGE_QT5BASE=y\n" in config_items:
>         if "# BR2_PACKAGE_QT5BASE_LICENSE_APPROVED is not set\n" in config_items:
>             config_items.remove("# BR2_PACKAGE_QT5BASE_LICENSE_APPROVED is not set\n")
>             config_items.append("BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y\n")
>     # Make sure LTP is not enabled when we have an uClibc toolchain
>     if "BR2_PACKAGE_LTP_TESTSUITE=y\n" in config_items and \
>             toolchain_is_uclibc(config_items):
>         config_items.remove("BR2_PACKAGE_LTP_TESTSUITE=y\n")
>     # Make sure xfsprogs is not enabled when we have an uClibc toolchain
>     if "BR2_PACKAGE_XFSPROGS=y\n" in config_items and \
>             toolchain_is_uclibc(config_items):
>         config_items.remove("BR2_PACKAGE_XFSPROGS=y\n")
>     # Make sure mrouted is not enabled when we have an uClibc toolchain
>     if "BR2_PACKAGE_MROUTED=y\n" in config_items and \
>             toolchain_is_uclibc(config_items):
>         config_items.remove("BR2_PACKAGE_MROUTED=y\n")
>     if 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/ctng-mips64-eglibc.tar.bz2"\n' in config_items and \
>             "BR2_PACKAGE_SQUID=y\n" in config_items:
>         # Reject this configuration
>         return False
>     if 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full.tar.bz2"\n' in config_items and \
>             "BR2_PACKAGE_SQUID=y\n" in config_items:
>         # Reject this configuration
>         return False
>     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44=y\n' in config_items and \
>             "BR2_PACKAGE_SQUID=y\n" in config_items:
>         # Reject this configuration
>         return False
>     if 'BR2_PACKAGE_CLASSPATH=y\n' in config_items:
>         # Reject this configuration
>         return False
>     if 'BR2_sh2a=y\n' in config_items and  'BR2_PACKAGE_LIBFFI=y\n' in config_items:
>         return False
>     if 'BR2_arc=y\n' in config_items and  'BR2_PACKAGE_LIBFFI=y\n' in config_items:
>         return False
>     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in config_items:
>         config_items.remove("# BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE is not set\n")
>         config_items.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
>

Best regards,
Thomas
