From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Sep 2020 23:25:56 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/postgresql: set locale for
 initdb to C
In-Reply-To: <d08f39b4-0461-cbb3-d18e-dce12bac6cad@mind.be>
References: <20200920150659.7562-1-ps.report@gmx.net>
 <20200920150659.7562-3-ps.report@gmx.net>
 <d08f39b4-0461-cbb3-d18e-dce12bac6cad@mind.be>
Message-ID: <20200922232556.1c52acd6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Mon, 21 Sep 2020 23:25:03 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 20/09/2020 17:06, Peter Seiderer wrote:
> > Postgresql systemd startup fails with:
> > 
> >   Starting PostgreSQL database server...
> >   [FAILED] Failed to start PostgreSQL database server.
> >   See 'systemctl status postgresql.service' for details.
> > 
> >   $ systemctl status postgresql.service | cat
> >   ? postgresql.service - PostgreSQL database server
> >        Loaded: loaded (/usr/lib/systemd/system/postgresql.service; enabled; vendor preset: enabled)
> >        Active: failed (Result: exit-code) since Sat 2020-09-12 12:16:35 UTC; 35s ago
> >       Process: 164 ExecStartPre=/bin/sh -c if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi (code=exited, status=1/FAILURE)
> > 
> >   Sep 12 12:16:35 buildroot systemd[1]: Starting PostgreSQL database server...
> >   Sep 12 12:16:35 buildroot postgres[166]: The files belonging to this database system will be owned by user "postgres".
> >   Sep 12 12:16:35 buildroot postgres[166]: This user must also own the server process.
> >   Sep 12 12:16:35 buildroot postgres[166]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
> >   Sep 12 12:16:35 buildroot systemd[1]: postgresql.service: Control process exited, code=exited, status=1/FAILURE
> >   Sep 12 12:16:35 buildroot postgres[164]: pg_ctl: database system initialization failed
> >   Sep 12 12:16:35 buildroot systemd[1]: postgresql.service: Failed with result 'exit-code'.
> >   Sep 12 12:16:35 buildroot systemd[1]: Failed to start PostgreSQL database server.
> > 
> > Fix it by setting a sane/always available locale=C in the startup files.
> > 
> > A similare failure/fix was reported by Pascal de Bruijn ([1]), but with
> > en_US.UTF-8 instead of C.
> > 
> > [1] http://lists.busybox.net/pipermail/buildroot/2019-November/266700.html
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> > 
> >  - tested with the following defconfig
> > 
> >     BR2_aarch64=y
> >     BR2_cortex_a72=y
> >     BR2_ARM_FPU_VFPV4=y
> >     BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> >     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> >     BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >     BR2_INIT_SYSTEMD=y
> >     BR2_SYSTEM_DHCP="eth0"
> >     BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> >     BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
> >     BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
> >     BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
> >     BR2_LINUX_KERNEL=y
> >     BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> >     BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
> >     BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> >     BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >     BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
> >     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> >     BR2_PACKAGE_STRACE=y
> >     BR2_PACKAGE_RPI_FIRMWARE=y
> >     BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> >     BR2_PACKAGE_POSTGRESQL=y
> >     BR2_TARGET_ROOTFS_EXT2=y
> >     BR2_TARGET_ROOTFS_EXT2_4=y
> >     BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> >     # BR2_TARGET_ROOTFS_TAR is not set
> >     BR2_PACKAGE_HOST_DOSFSTOOLS=y
> >     BR2_PACKAGE_HOST_GENIMAGE=y
> >     BR2_PACKAGE_HOST_MTOOLS=y
> > ---
> >  package/postgresql/S50postgresql      | 2 +-
> >  package/postgresql/postgresql.service | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
> > index 1ece4fca9e..c47880dfd8 100644
> > --- a/package/postgresql/S50postgresql
> > +++ b/package/postgresql/S50postgresql
> > @@ -7,7 +7,7 @@ umask 077
> >  
> >  if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
> >  	echo "Initializing postgresql data base..."
> > -	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
> > +	su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=C'  
> 
>  I think it would be nicer if the default locale could be used instead of
> forcing C, but I can't be bother to find a solution for that, so

Is there the concept of default locale in buildroot? Did not find
anything setting/using /etc/locale.conf (maybe systemd is setting
something)?

Thanks for review...

Regards,
Peter

> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  Regards,
>  Arnout
> 
> >  	echo "done"
> >  fi
> >  
> > diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
> > index 53e6f84f00..42d973255c 100644
> > --- a/package/postgresql/postgresql.service
> > +++ b/package/postgresql/postgresql.service
> > @@ -17,7 +17,7 @@ StandardError=syslog
> >  SyslogIdentifier=postgres
> >  PIDFile=/var/lib/pgsql/postmaster.pid
> >  
> > -ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> > +ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql -o --locale=C; fi"
> >  ExecStart=/usr/bin/postgres -D /var/lib/pgsql
> >  ExecReload=/usr/bin/kill -HUP $MAINPID
> >  KillMode=mixed
> >   
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
