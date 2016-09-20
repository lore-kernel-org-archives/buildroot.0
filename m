From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:17:50 +0200
Subject: [Buildroot] [PATCH 4/4] package/nvidia-driver: update version
In-Reply-To: <0addd1f1dd9b75f20f96877f05d8bdcc98b44533.1471968455.git.yann.morin.1998@free.fr>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
 <0addd1f1dd9b75f20f96877f05d8bdcc98b44533.1471968455.git.yann.morin.1998@free.fr>
Message-ID: <20160920211750.25ff9719@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 18:26:35 +0200, Yann E. MORIN wrote:
> This new version brings in support for egl-wayland, the EGL extensions
> aimed at making it possible to implement Wayland servers and clients. As
> such, nvidia-driver becoms the seconf EGL implementation in Buildroot
> that can act as a libegl provider with egl-wayland extensions.
> 
> In this version, it becomes possible to use our kernel-module infra,
> with just a little few minor tricks: we need just specify the Linux
> source and build trees (they are the same for us) and the list of
> modules to build. We still need a little patch against the Kbuild files.
> 
> We also get rid of the LIBS_NO_VERSION trick and always use complete
> filenames, as more libs are now packaged with different version in their
> filenames, and even some with no version at all.
> 
> When installing libs, we switch from a shell loop to a make foreach
> loop, which is easier to handle. It has the side-effect (and advantage)
> of displyaing the install commands for each library, rather than a
> single biggish one, so it is easier to see what goes wrong. This also
> means that an error in each phase of the install (the copy of the files
> then each symlink) can be caught more easily (it was not previously):
> each sequence is now its own make command; we need not use "|| exit 1"
> after each command, even in a if block, because the if blocks returns
> with the exit code of the last command in it; e.g. if an ln fails, the
> if-block in which it is enclosed will return the exit code of ln, and
> make will catch it.
> 
> Similarly for the X driver modules and each of the programs installed:
> we now can catch any failure in the isntall of those.
> 
> All of this somewhat simplifies the .mk. It is a little bit longer, but
> the structure is saner and more explicit.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nvidia-driver/0001-use-LDFLAGS.patch |  48 +++++++
>  package/nvidia-driver/Config.in              |   6 +-
>  package/nvidia-driver/nvidia-driver.hash     |   4 +-
>  package/nvidia-driver/nvidia-driver.mk       | 206 ++++++++++++++-------------
>  4 files changed, 162 insertions(+), 102 deletions(-)
>  create mode 100644 package/nvidia-driver/0001-use-LDFLAGS.patch

I just fixed a few minor typos in the commit log, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
