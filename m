From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:10:05 +0200
Subject: [Buildroot] [PATCHv2] package/systemd: fix paths to runtime
 utilities
In-Reply-To: <20170609190347.23681-1-yann.morin.1998@free.fr>
References: <20170609190347.23681-1-yann.morin.1998@free.fr>
Message-ID: <20170610231005.4d6871ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Jun 2017 21:03:47 +0200, Yann E. MORIN wrote:
> systemd's configure is looking in $PATH to find utilities that will be
> needed at runtime.
> 
> Usually, those utilties, when installed on the host, will be found in
> the same path they would be present on the target. For example,
> /usr/bin/mount on the host would also be /usr/bin/mount on the target,
> and all is find.
> 
> Except when we need to install a host variant of util-linux, which will
> install mount in $(HOST_DIR), in which case systemd's configure would
> find that one.
> 
> Of course, it is also very well possible that those utilities are not
> installed on the host in the same location they would be on the target,
> in case a user has manually installed some of those (e.g. in /usr/local/
> or in /opt/)
> 
> Forcibly set the path to those utilities, as they are expected to be on
> the target.
> 
> For kexec, we can set it even though we do not depend on it (yet).
> systemd will appropriately test it at runtime.
> 
> For quota, we point to non-existing files, so as to catch errors at
> runtime. It is to be noted that quotacheck is optional, while quotaon
> does not seem to be (a service file is always installed, that uses it).
> 
> Note: utilties listed in the order they appear in configure.ac
> 
> Reported-by: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - fix variables and paths for mount and umount  (Adam)
> ---
>  package/systemd/systemd.mk | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Applied to master, thanks. Peter: I believe this should go in the LTS
branches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
