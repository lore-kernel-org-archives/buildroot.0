From: Cam Hutchison <camh@xdna.net>
Date: Wed, 9 Mar 2016 22:47:22 +1100
Subject: [Buildroot] [PATCH 1/1] overlay: Allow overlay to be a tar
	archive.
In-Reply-To: <87ziu728ut.fsf@dell.be.48ers.dk>
References: <1453763906-22220-1-git-send-email-camh@xdna.net>
 <87pov44scp.fsf@dell.be.48ers.dk>
 <CABa6e=o7BoB-YYSfCs3Q8LnTHk_GUYxxjt50ztnsZM-HuaL+7Q@mail.gmail.com>
 <87ziu728ut.fsf@dell.be.48ers.dk>
Message-ID: <CABa6e=rOoqaFRm-jXw1KVemyH81wX3a5t3Hji7xd-Gqta_fDQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 March 2016 at 22:23, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:
>
>  > My use case is for using buildroot rootfs tarballs from other phases of
>  > a larger build, both where some developers are responsible for some
>  > parts (kernel/bootloader, common rootfs, specific applications,
>  > integration), and where there are multiple boards to develop for that
>  > have a large amount of commonality for which it is wasteful to rebuild
>  > the same parts over and over.
>
> Ok, and you use Buildroot as the toplevel (E.G. the thing that
> integrates everything) buildsystem?

These days I do. I originally had a front-end shell script that split the build
up into phases (boot loader, kernel, base rootfs, custom apps) as that is
how my client wanted to develop - most of the developers were not familiar
with buildroot and they didn't want the app developers to have to wait for
kernel compiles, etc. The final phase of the script was to pull together
all the rootfs tarballs from each phase into a single rootfs and make an
image. That was six years ago.

These days I still have a front-end script that maintains separate configs
for each phase, but the final phase pulls it together using the overlay
tarballs from this patch and using genimage in a post-image script. The
final phase is just a buildroot config, and the front-end script just makes
it easier to launch the build with different configs.

I still find this phased build useful - right now I'm building a cluster of
raspberry pi 1, 2 & 3, orange pi pc & plus and pcduino nano lites (just
for fun). I do the base rootfs as a common build (except pi 1) and
each board has a custom uboot/kernel phase that pulls in the common
tarball rootfs.

I have another local patch that generates images without the skeleton
which is what makes these tarball rootfs's able to overlay properly. I also
plan to use this to generate single app tarballs that can be turned into
container images for the cluster, but this all starts to get outside the scope
of buildroot that I'm not submitting that patch.
