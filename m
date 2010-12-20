From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 20 Dec 2010 17:11:44 +0800
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <20101217113436.43ec2958@surf>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<20101217113436.43ec2958@surf>
Message-ID: <AANLkTimyNWZtc0+o0hGsJj65pzLA-ge3RK9FOEMvNZj3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tom,

On Fri, Dec 17, 2010 at 6:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Sonic,
>
> On Thu, 16 Dec 2010 17:49:51 +0800
> Sonic Zhang <sonic.adi@gmail.com> wrote:
>
>> Current DOWNLOAD_SVN and DOWNLOAD_GIT scripts only retrieve source code of a
>> given version from the repository. It is more complicated to generate patches
>> against the source after fixing bugs and developing in buildroot directly.
>> This patch adds an option BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT to checkout the
>> source with version control information. This option is disabled by default.
>
> I understand the need for this, and fully agree with it, but I don't
> think that's the right way to solve it.
>
> Currently, Buildroot takes care of downloading, extracting, patching,
> configuring, building and installing packages. But for some packages,
> we would like Buildroot to not take care of the download/extract/patch
> steps, and let the user point Buildroot to a particular location where
> the source tree of the component is already available. The use case is
> that Buildroot users want to hack on the kernel, on a particular
> library or application: they want to have the source tree of this
> component is whatever location they want, to manage this source code
> with whatever version control system they want, and they don't want
> Buildroot to remove the source code when a global "make clean" is not
> in Buildroot.
>
> The need solved by your proposal is, I think, solved by this general
> use case. Unfortunately, your solution does not solve the entire
> problem:
>
> ?* It is only valid for components for which sourcing from git/svn is
> ? done.
>

Yes, my patch doesn't take care of other VCS, because current package
makefile support git/svn only as well.


> ?* It still keeps the source tree in Buildroot's build directory, which
> ? gets removed at "make clean".
>

This problem can be solved by 1) store the git/svn tree in download
folder other than converting to tarballs, 2) create a symbol link in
output/build folder to the git/svn tree in download folder. When make
clean, only the symbol link is removed.


> I haven't implemented yet an alternative solution, but through a few
> discussions on IRC with other Buildroot contributors, the rough scheme
> we came up with is the following.
>
> ?Allow the user to write a "local.mk" file that gets included before
> ?any package .mk file. In this "local.mk" file, the user can define
> ?variables such as DIRECTFB_OVERRIDE_SOURCE_DIR=/home/foobar/directfb/.
> ?The package infrastructure would of course be modified to take into
> ?account this new variable, and use the given directory as the source
> ?tree to compile the DirectFB package.
>
> Again, that's a rough scheme, but at least it should solve your use
> case, but also the use case brought by Mike who wanted to specify a
> custom source tree for the kernel.
>
> Does that make sense ? Would it solve your use case ?

Yes, this helps developers who has some separate local source trees.
But it is not as convenient as automatically storing svn/git tree in
download folder mentioned above, when you want to check out complete
sources trees in a distribution at once. If this is something
buildroot Makefile can help?


Sonic

>
> Of course, I can't guarantee any date for the implementation of this.
> Buildroot is, IMO, still in a very large cleanup phase started almost 2
> years ago, and I'm currently focusing on finalizing that cleanup phase
> before extending Buildroot with radically new use cases. But of course,
> if there are contributions going into this direction, they'll be very
> welcome.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
