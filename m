From: Steven Noonan <steven@uplinklabs.net>
Date: Fri, 20 Mar 2015 13:28:03 -0700
Subject: [Buildroot] [PATCH] package: add powertop 2.7
In-Reply-To: <20150320163316.695aa4ed@free-electrons.com>
References: <1426743621-1652-1-git-send-email-steven@uplinklabs.net>
 <20150320163316.695aa4ed@free-electrons.com>
Message-ID: <CAKbGBLiMuNMLZp+7pbPYrS4XZTzge-+gB4a331sCU33yW53BUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 8:33 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steven Noonan,
>
> On Wed, 18 Mar 2015 22:40:21 -0700, Steven Noonan wrote:
>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>
> I've applied, but to be honest, I found that they were too many trivial
> issues that should have been discovered before the patch was submitted.
> Here is the list of things that I had to change:
>
>     [Thomas:
>       - fix commit title
>       - powertop wants libintl unconditionally, so make sure
>         BR2_PACKAGE_GETTEXT is selected when BR2_NEEDS_GETTEXT is set,
>         and add gettext to the dependencies.
>       - add missing comment about thread dependency.
>       - add missing dependency on host-pkgconf, without which powertop
>         cannot find libnl.
>       - patch src/Makefile.am to not pass -fstack-protector, which fails
>         to build if the toolchain does not have SSP support.
>       - rename patch powertop-autotune.patch to confirm to the patch
>         naming convention.]

Yes, I agree, that number of issues is ridiculous.

> Commit title: we normally expect "<foo>: new package" for package
> additions. I agree, this is pure nitpicking :-)
>
> The libintl issue was trivially found by using a uClibc toolchain,
> which is the default in Buildroot. You can for example use
> http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config as
> a base configuration file to quickly test things against uClibc.
>
> The missing thread comment was trivial, it's documented in the section
> "17.2.2. Dependencies on target and toolchain options" in the Buildroot
> manual.
>
> The missing dependency on host-pkgconf is seen when you do a build with
> just powertop. Whenever you submit a new package, make sure you do a
> build from scratch with just this package enabled, so that you have
> some minimal verification that the dependencies are correct.
>
> The -fstack-protector issue was also seen because I'm using a standard
> uClibc toolchain, which do not have SSP enabled by default.
>
> The patch naming convention is also documented in the Buildroot manual.
>
> In the light of those comments, could you have a second look at your
> other "new package" submissions and retest them with a uClibc
> toolchain, and with a Buildroot build having just each new package
> enabled, in order to discover missing dependencies?
>
> Thanks a lot!

I appreciate the feedback. I had only been testing with x86_64 and x32
glibc builds, and hadn't thought of uClibc issues. I'll be sure to try
and test that in the future.
