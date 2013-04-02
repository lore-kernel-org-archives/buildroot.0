From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 2 Apr 2013 21:44:59 +0200
Subject: [Buildroot] media-ctl build failure (autobuild)
In-Reply-To: <20130328095308.4fac9fcf@skate>
References: <CAAXf6LUxBkO6-g-dHs8_2cagNFiBYAWCE3KAEcuT=zWEsJdZMA@mail.gmail.com>
 <20130328095308.4fac9fcf@skate>
Message-ID: <CAAXf6LVy1FYLMzdjBTs+ewF_mdUgOQs00WvackwitQSWWLyb9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Thu, Mar 28, 2013 at 9:53 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Thomas De Schampheleire,
>
> On Thu, 28 Mar 2013 08:44:54 +0100, Thomas De Schampheleire wrote:
>
> > What is the appropriate action here:
> > 1. remove the old toolchains?
> > 2. add some kind of fragile dependency between media-ctl and specific
> > toolchain config variables
> > 3. introduce a way to specify which kernel header versions are used for
> > external toolchains, and check this for packages that need it
> > 4. don't bother, let the package fail for these old toolchains
>
> 5. Do what I've done for neard, i.e
> package/neard/neard-fix-missing-linux-nfc-header.patch: we add a
> patch to the package that integrates directly into the package the
> required kernel headers, and adjust the autoconf script to either use
> the header from the toolchain if it's available, or the bundled header
> if not. Over time, toolchains will be updated to more recent kernel
> header versions, and we should be able to get rid of such patches.
>
> Even though it's not really nice, I believe it's the least painful way.
>
> Of course, it has the drawback that if the user happens to use a kernel
> version that does not have the NFC functionality of the media-ctl
> functionality, it will simply not work.
>

Thanks for your input.
I'm planning to do it like this, but currently have some time
insufficiency. I hope to get to it soon.

It seems that for some v4l kernel header files, the media-ctl package
already has local copies, but for some reason I do not understand they
still forcibly check for these files in the configure script. Moreover,
even if the user does have the necessary kernel headers installed, the
local copies will be used.

I hope to be able to improve on this, with the following algorithm:
- either the user has all necessary files, and we use them
- or at least one file is missing, and we use local copies for all of the
checked files (even though only some are missing).

While this strategy is very coarse-grained, as it's basically all or
nothing, I think it would be sufficient for buildroot, and already an
improvement of the upstream media-ctl package.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130402/85220a21/attachment-0001.html>
