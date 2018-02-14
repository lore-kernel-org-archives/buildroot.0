From: Christian Stewart <christian@paral.in>
Date: Wed, 14 Feb 2018 18:13:37 -0500
Subject: [Buildroot] 
 =?utf-8?b?W0phbiBLdW5kcsOhdF0gIFtQQVRDSCAxLzNdIHN5?=
 =?utf-8?q?stemd=3A_Ensure_/run_and_/var/run_are_the_same_on_R/O_rootfs?=
In-Reply-To: <87k1vfz2m4.fsf@paral.in>
References: <87k1vfz2m4.fsf@paral.in>
Message-ID: <87eflnyxjy.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan, all,

> From: Jan Kundr?t <jan.kundrat@cesnet.cz>
> I'm leaving that one to someone who is more familiar with systemd and
> buildroot conventions. My box now boots again, so I'm happy :).
>
> [1] https://bugs.freedesktop.org/show_bug.cgi?id=101628
>
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index a2d4e8c4b3..95142904f5 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -42,7 +42,9 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
>  	mkdir $(TARGET_DIR)/var
>  	for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
>  		j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
> -		if [ -L "$${i}" ]; then \
> +		if [ "$${j}" = "/var/run" ]; then \
> +			echo "# $${j} is being handled by systemd"
> +		elif [ -L "$${i}" ]; then \
>  			printf "L+! %s - - - - %s\n" \
>  				"$${j}" "../usr/share/factory/$${j}" \
>  			|| exit 1; \
> -- 
> 2.14.3
>

I applied this patch, thanks. Unfortunately, it seems the problem is
still occurring. Maybe it's a different problem?


[   16.650294] systemd[1]: System is tainted: var-run-bad
[   16.680724] systemd[1]: Starting Network Connectivity...
[   16.710421] systemd[1]: Started D-Bus System Message Bus.
[   16.740678] systemd[1]: Failed to connect to system bus: No such file or directory
[   16.770425] systemd[1]: Failed to initialize D-Bus connection: No such file or directory
[   16.800386] systemd[1]: Starting Network Manager...


[1518648890.7497] hostname: hostname: hostnamed not used as proxy creation failed

[   39.020736] dbus-daemon[314]: [system] Failed to activate service 'org.freedesktop.systemd1': timed out
[   39.100451] dbus-daemon[314]: [system] Activating systemd to hand-off: service name='org.freedesktop.nm
_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service' requested by ':1.0' (uid=0 pid=315 comm="/u
sr/sbin/NetworkManager --no-daemon ")                                                                    
[   39.150403] NetworkManager[315]: <info>  [1518648890.7540] manager[0x20ac030]: rfkill: WWAN hardware ra

It seems that systemd still cannot talk to the system bus.

I can also see this happening if I try to execute systemd-hostnamed:

# ./systemd-hostnamed 
Failed to get system bus connection: No such file or directory

# ls /var/run/
NetworkManager  dhcpcd.pid          docker       ifstate   utmp
dbus            dhcpcd.sock         docker.pid   sepermit
dhcpcd          dhcpcd.unpriv.sock  docker.sock  sshd.pid

# ls /var/run/dbus
system_bus_socket

# ls /run/
blkid   lock  mount     systemd  user  xtables.lock
docker  log   ntpd.pid  udev     utmp

If I link dbus like so:

# ln -s /var/run/dbus/ /run/dbus

It seems then that everything works fine.

~ Christian
