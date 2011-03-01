From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 1 Mar 2011 19:54:29 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux.mk: depend on actual kernel
 image instead of stamp file
In-Reply-To: <20110301172355.2c535403@surf>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
	<1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
	<20110301172355.2c535403@surf>
Message-ID: <AANLkTiks_ZYtzDCdzWUdF08wHo7fi_uVSUKfToeT4yz_@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 March 2011 17:23, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 18 Feb 2011 00:44:54 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> Use the real output file (kernel image) as target instead of a stamp
>> file. This way Buildroot cannot be tricked into thinking that the kernel
>> image is installed when it's not.
>
> Well, we switched *all* packages from dependencies on installed files
> to dependencies on stamp files when migrating them from hand-coded
> makefiles to the package infrastructures, so I don't think we should do
> the opposite for the Linux kernel package.

Yes, I know. But I think that the Linux kernel image is special. It is
one file. It is easy to track. Using stamp files for *generic
packages* makes sense because it is difficult to keep track of all the
files they may install.

Here is how Buildroot currently behave:

1. build and see that output/images/ contain rootfs.tar and zImage.
2. remove output/images/ and rebuild
3. output/images/ now only has rootfs.tar, no zImage!

That is just confusing behaviour and I want to fix it.

> But maybe we need to provide for each package (kernel included) a clean
> and nice mechanism to delete their stamp files so that they get
> reinstalled at the next make invocation.

That is possible. But wouldn't you then have to track dependencies
yourself? I'd rather "rm -rf output/target/ output/images/" and have
Buildroot rebuild these dirs automatically than issuing some "make
pkg1-clean-stamp ... pkgN-clean-stamp".

Or did I misunderstand you idea?

> Regardless of the solution chosen, I think any change in this direction
> should come with a clear update in the documentation. I don't want to
> see dozens of different hacks^Wmechanisms to do partial rebuilds being
> added all over the place without any coherency nor documentation.

I wasn't thinking that big :-)  This patch is just a small usability
fix IMO, so I don't think is warrants a doc update.

> Regards!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
