From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jan 2013 18:38:58 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
 <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <50E470B2.9010508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  More comments on top of what I sent before...

On 12/06/12 14:36, J?r?my Rosen wrote:
> add a new target to deploy a live filesystem to be used with NFS or as a chroot
>
> Signed-off-by: J?r?my Rosen<jeremy.rosen@openwide.fr>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I used this patch (after some more adaptation) to rsync the rootfs to a 
running target over ssh. This is ideal for development. It's 
unfortunately a bit hackish because ssh tries to use /root/.ssh/... under 
fakeroot.

[snip]
> ---
> v2 : implement Arnoult's suggestion, update manual entry
> v3 : improve documentation for the chroot case, more suggestions by Arnoult
> ---
>   docs/manual/beyond-buildroot.txt     |   20 ++++++++------------
>   fs/Config.in                         |    1 +
>   fs/live/Config.in                    |   14 ++++++++++++++
>   fs/live/live.mk                      |   19 +++++++++++++++++++
>   support/dependencies/dependencies.sh |    8 ++++++++
>   5 files changed, 50 insertions(+), 12 deletions(-)
>   create mode 100644 fs/live/Config.in
>   create mode 100644 fs/live/live.mk
>
> diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
> index a87b584..17ccc1a 100644
> --- a/docs/manual/beyond-buildroot.txt
> +++ b/docs/manual/beyond-buildroot.txt
> @@ -9,19 +9,15 @@ Boot the generated images
>   NFS boot
>   ~~~~~~~~
>
> -To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
> -images_ menu.
> +To achieve NFS-boot, enable _live root filesystem_ in the _Filesystem
> +images_ menu and select a _live image location_ to choose where the live
> +filesystem will be deployed. you can use _$(BINARIES_DIR)_ to easily

  Trailing whitespace.


> +build in +/path/to/output_dir/images+
>
> -After a complete build, just run the following commands to setup the
> -NFS-root directory:
> +You will be asked for a password during the build. This is needed to create
> +device entries in the target filesystem

  Note exactly correct.  Something like:

Since the NFS root must be installed as the real root user, you need to 
have sudo access. You will be asked for a password during the build.

>
> --------------------
> -sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
> --------------------
> -
> -Remember to add this path to +/etc/exports+.
> -
> -Then, you can execute a NFS-boot from your target.
> +You will need to add the _live image location_  to +/etc/exports+.
>

[snip]

> +define ROOTFS_LIVE_INIT
> +  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not be installed on the host system" ; false ; fi

  Trailing whitespace.

> +endef
> +
> +ROOTFS_LIVE_PRE_GEN_HOOKS += ROOTFS_LIVE_INIT
> +
> +$(eval $(call ROOTFS_TARGET,live))
[snip]


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
