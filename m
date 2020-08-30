From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 16:22:34 +0200
Subject: [Buildroot] [PATCH RFC v5] package/util-linux: build programs
 and libraries in separate packages
In-Reply-To: <20190929140135.32041-1-unixmania@gmail.com>
References: <20190929140135.32041-1-unixmania@gmail.com>
Message-ID: <4299c0ed-596c-20c0-5cf3-e17af1ad0954@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 29/09/2019 16:01, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The different tools and libraries in util-linux have a lot of optional
> dependencies. When we want to support those optional dependencies, we
> can easily generate dependency cycles. For instance, findmount and lsblk
> need udev to work correctly, but eudev and systemd both depend libblkid,
> which comes from util-linux.

 Finally committed to next, with a few additional small changes. I also pushed
two follow-up patches to util-linux.mk itself, to make sure they stay as similar
as possible.


 Regards,
 Arnout

> Normal distros (e.g. Debian) solve this by first building a minimal
> package that has no dependencies at all, then build the packages that
> depend on util-linux, and finally rebuild util-linux with all bells and
> whistles. Solve it in Buildroot by means of the following changes:
> 
> - Split util-linux into two packages:
>   - util-linux-libs, providing lib{blkid,fdisk,mount,smartcols,uuid}.
>   - util-linux, providing both the aforementioned libs and the programs.
> - Add a blind selection for util-linux-libs, i.e. it is indirectly
>   selected according to the util-linux options.
> - Make host and target util-linux have a build dependencies on the -libs
>   packages.
> - Make eudev and systemd have build dependencies on util-linux-libs.
>   This can be extended to other packages in the future but is not needed
>   right now because the configuration options are backward-compatible.
> - Make util-linux have an optional build dependency on the package that
>   provides libudev (either eudev or systemd), if it is selected.
> 
> Installing util-linux overrides files installed by util-linux-libs but
> this is not a problem: it's allowed for a package to overwrite files
> from another package, as long as there is a dependency between the two.
> 
> The build dependency of util-linux on util-linux-libs ensures that
> util-linux overwrites the files installed by util-linux-libs and not
> vice versa. In practice this dependency shouldn't be needed: the only
> reason for util-linux-libs to be built is to break a circular
> dependency. In that case, there is already a transitive dependency of
> util-linux on util-linux-libs, so adding it explicitly is redundant.
> Still, better safe than sorry.
> 
> We can't do the same for host-util-linux-libs, since there is no config
> symbol for it. However, host-util-linux-libs is not used at the moment,
> so we can ignore that issue for the time being.
> 
> With this approach we don't need to patch configuration files neither
> change packages other than eudev and systemd.
> 
> Other packages that require util-linux libraries and whose libraries may
> be used by util-linux programs can be updated later. We also don't need
> to change any existing defconfig, since all configuration options are
> kept in the util-linux package.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=11811
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[snip]
