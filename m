From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Feb 2020 11:47:10 +0100
Subject: [Buildroot] Unresponsive shell when BR2_INIT_SYSTEMD=y
In-Reply-To: <CAMty3ZDVj3s23aT5x+rbroFZpy9Tr4Lcs=X5FgBx9DG+mSwe3Q@mail.gmail.com>
References: <CAMty3ZDVj3s23aT5x+rbroFZpy9Tr4Lcs=X5FgBx9DG+mSwe3Q@mail.gmail.com>
Message-ID: <20200225114710.41a634bf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

On Sat, 22 Feb 2020 17:17:25 +0530, Jagan Teki <jagan@amarulasolutions.com> wrote:

> Hi,
> 
> I'm facing unresponsive shell issue when I enabled BR2_INIT_SYSTEMD on
> 2019.11.1 release.
> 
> The defconfigs I'm using is from below patch with BR2_INIT_SYSTEMD
> enabled for 4.4 Linux headers.
> https://patchwork.ozlabs.org/patch/1237421/
> 
> Issue status:
> - Once I login, shell appear
> - Then when I type any command and enter or enter alone it is asking password
> - Then hang.
> 
> Issue Log:
> 
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login:
> Welcome to ROC-RK3399-PC!

If your see a double login maybe you are suffering from two getty running
for the the same console (see e.g. [1] or [2] for a starting point)?

Regards,
Peter

[1] https://bugs.busybox.net/show_bug.cgi?id=11766#c4
[2] https://www.raspberrypi.org/forums/viewtopic.php?t=157836


> roc-rk3399-pc login: [   10.624687] random: nonblocking pool is initialized
> 
> roc-rk3399-pc login: root
> -sh: can't access tty; job control turned off
> # ls
> Password:
> Login timed out after 60 seconds
> [   88.012240] tty_port_close_start: tty->count = 1 port count = 2.
> [  OK  ] Stopped Console Getty.
> [  OK  ] Started Console Getty.
> [  OK  ] Stopped Serial Getty on ttyFIQ0.
> [  OK  ] Started Serial Getty on ttyFIQ0.
> [   93.335900] tty_port_close_start: tty->count = 1 port count = 2.
> 
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login:
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login: root
> -sh: can't access tty; job control turned off
> # ls
> Password:
> < hang here>
> 
> Complete Log:
> 
> Welcome to Buildroot 2019.11.1!
> 
> [    1.998880] systemd[1]: Set hostname to <roc-rk3399-pc>.
> [    2.020020] dwmmc_rockchip fe310000.dwmmc: Successfully tuned phase to 200
> [    2.026363] mmc2: queuing unknown CIS tuple 0x91 (3 bytes)
> [    2.026984] mmc2: new ultra high speed SDR104 SDIO card at address 0001
> [    2.087439] wifi_platform_bus_enumerate device present 1
> [    2.087930] ======== Card detection to detect SDIO card! ========
> [    2.088502] mmc2:mmc host rescan start!
> [    2.104593] bcmsdh_register: register client driver
> [    2.105243] bcmsdh_sdmmc_probe: Enter num=1
> [    2.105838] bcmsdh_sdmmc_probe: Enter num=2
> [    2.106250] bus num (host idx)=2, slot num (rca)=1
> [    2.106725] found adapter info 'DHD generic adapter'
> [    2.107250] sdioh_attach: set sd_f2_blocksize 256
> [    2.107755] sdioh_attach: sd clock rate = 0
> [    2.108371] dhdsdio_probe : no mutex held. set lock
> [    2.108960] F1 signature read @0x18000000=0x17224356
> [    2.113574] F1 signature OK, socitype:0x1 chip:0x4354 rev:0x2 pkg:0x2
> [    2.115731] DHD: dongle ram size is set to 786432(orig 786432) at 0x180000
> [    2.116959] dhd_conf_set_chiprev: chip=0x4354, chiprev=2
> [    2.118298] CFG80211-ERROR) wl_setup_wiphy : Registering Vendor80211
> [    2.120821] CFG80211-ERROR) wl_init_prof : wl_init_prof: No profile
> [    2.121738] wl_escan_attach: Enter
> [    2.122132] wl_escan_init: Enter
> [    2.122771] wl_create_event_handler(): thread:wl_escan_handler:ac started
> [    2.122893] tsk Enter, tsk = 0xffffffc0776f01b0
> [    2.124236] dhd_attach(): thread:dhd_watchdog_thread:ad started
> [    2.125030] dhd_attach(): thread:dhd_dpc:ae started
> [    2.125800] dhd_attach(): thread:dhd_rxf:af started
> [    2.126264] dhd_deferred_work_init: work queue initialized
> [    2.126802] dhd_tcpack_suppress_set: TCP ACK Suppress mode 0 -> mode 2
> [    2.127461] dhd_bus_set_default_min_res_mask: Unhandled chip id
> [    2.128184] sdioh_cis_read: func_cis_ptr[0]=0x10ac
> [    2.135628] Dongle Host Driver, version 1.579.77.41.10 (r)
> [    2.136921] wl_ext_iapsta_attach_netdev: ifidx=0, bssidx=0
> [    2.137471] Register interface [wlan0]  MAC: cc:4b:73:26:eb:36
> [    2.137471]
> [    2.138346] dhd_tcpack_suppress_set: TCP ACK Suppress mode 2 -> mode 0
> [    2.138979] dhd_wl_ioctl: returning as busstate=0
> [    2.139436] dhd_dbg_detach_pkt_monitor, 2204
> [    2.139845] dhd_bus_devreset: == Power OFF ==
> [    2.140497] bcmsdh_oob_intr_unregister: Enter
> [    2.140907] bcmsdh_oob_intr_unregister: irq is not registered
> [    2.141461] dhd_txglom_enable: enable 0
> [    2.141824] dhd_conf_set_txglom_params: txglom_mode=copy
> [    2.142330] dhd_conf_set_txglom_params: txglomsize=0, deferred_tx_len=0
> [    2.142963] dhd_conf_set_txglom_params: txinrx_thres=128, dhd_txminmax=-1
> [    2.143603] dhd_conf_set_txglom_params: tx_max_offset=0, txctl_tmo_fix=-1
> [    2.144232] dhd_bus_devreset:  WLAN OFF DONE
> [    2.144689] wifi_platform_set_power = 0
> [    2.145069] ======== PULL WL_REG_ON(-1) LOW! ========
> [    2.145582] [WLAN_RFKILL]: rockchip_wifi_power: 0
> [    2.146067] [WLAN_RFKILL]: wifi shut off power.
> [    2.146528] dhdsdio_probe : the lock is released.
> [    2.147136] dhd_module_init: Exit err=0
> [    2.223600] systemd[1]: /usr/lib/systemd/system/dbus.socket:5:
> ListenStream= references a path below legacy directory /var/run/,
> updating /var/run/dbus/system_bu
> s_socket ? /run/dbus/system_bus_socket; please update the unit file accordingly.
> [    2.288676] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.289764] systemd[1]: system-serial\x2dgetty.slice: unit
> configures an IP firewall, but the local system does not support
> BPF/cgroup firewalling.
> [    2.290979] systemd[1]: (This warning is only shown for the first
> unit using IP firewalling.)
> [    2.293507] systemd[1]: Created slice system-serial\x2dgetty.slice.
> [  OK  ] Created slice system-serial\x2dgetty.slice.
> [    2.294660] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.295967] systemd[1]: Started Dispatch Password Requests to
> Console Directory Watch.
> [  OK  ] Started Dispatch Password ?ts to Console Directory Watch.
> [    2.297161] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.298558] systemd[1]: Started Forward Password Requests to Wall
> Directory Watch.
> [  OK  ] Started Forward Password R?uests to Wall Directory Watch.
> [    2.299740] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.300913] systemd[1]: Reached target Paths.
> [  OK  ] Reached target Paths.
> [    2.301514] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.302685] systemd[1]: Reached target Remote File Systems.
> [  OK  ] Reached target Remote File Systems.
> [    2.303378] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.304647] systemd[1]: Reached target Slices.
> [  OK  ] Reached target Slices.
> [    2.305235] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.306463] systemd[1]: Reached target Swap.
> [  OK  ] Reached target Swap.
> [    2.307083] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.308544] systemd[1]: Listening on initctl Compatibility Named Pipe.
> [  OK  ] Listening on initctl Compatibility Named Pipe.
> [    2.317878] systemd[1]: Condition check resulted in Journal Audit
> Socket being skipped.
> [    2.318718] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.320056] systemd[1]: Listening on Journal Socket (/dev/log).
> [  OK  ] Listening on Journal Socket (/dev/log).
> [    2.320923] random: systemd: uninitialized urandom read (16 bytes
> read, 69 bits of entropy available)
> [    2.322516] systemd[1]: Listening on Journal Socket.
> [  OK  ] Listening on Journal Socket.
> [    2.323788] systemd[1]: Listening on Network Service Netlink Socket.
> [  OK  ] Listening on Network Service Netlink Socket.
> [    2.325053] systemd[1]: Listening on udev Control Socket.
> [  OK  ] Listening on udev Control Socket.
> [    2.326025] systemd[1]: Listening on udev Kernel Socket.
> [  OK  ] Listening on udev Kernel Socket.
> [    2.327243] systemd[1]: Condition check resulted in Huge Pages File
> System being skipped.
> [    2.330581] systemd[1]: Mounting POSIX Message Queue File System...
>          Mounting POSIX Message Queue File System...
> [    2.334920] systemd[1]: Mounting Kernel Debug File System...
>          Mounting Kernel Debug File System...
> [    2.339763] systemd[1]: Mounting Temporary Directory (/tmp)...
>          Mounting Temporary Directory (/tmp)...
> [    2.340855] systemd[1]: Condition check resulted in Create list of
> static device nodes for the current kernel being skipped.
> [    2.342219] systemd[1]: Condition check resulted in File System
> Check on Root Device being skipped.
> [    2.347010] systemd[1]: Starting Journal Service...
>          Starting Journal Service...
> [    2.349503] systemd[1]: Condition check resulted in Load Kernel
> Modules being skipped.
> [    2.356495] systemd[1]: Mounting FUSE Control File System...
>          Mounting FUSE Control File System...
> [    2.376756] systemd[1]: Mounting Kernel Configuration File System...
>          Mounting Kernel Configuration File System...
> [    2.380356] systemd[1]: Starting Remount Root and Kernel File Systems...
>          Starting Remount Root and Kernel File Systems...
> [    2.384801] systemd[1]: Starting Apply Kernel Variables...
>          Starting Apply Kernel Variables...
> [    2.395614] EXT4-fs (mmcblk1p10): re-mounted. Opts: (null)
> [    2.397189] systemd[1]: Starting Wait Until Kernel Time Synchronized...
>          Starting Wait Until Kernel Time Synchronized...
> [    2.402366] systemd[1]: Starting Create Static Device Nodes in /dev...
>          Starting Create Static Device Nodes in /dev...
> [    2.406572] systemd[1]: Starting udev Coldplug all Devices...
>          Starting udev Coldplug all Devices...
> [    2.417541] systemd[1]: Mounted POSIX Message Queue File System.
> [  OK  ] Mounted POSIX Message Queue File System.
> [    2.419070] systemd[1]: Mounted Kernel Debug File System.
> [  OK  ] Mounted Kernel Debug File System.
> [    2.420703] systemd[1]: Mounted Temporary Directory (/tmp).
> [  OK  ] Mounted Temporary Directory (/tmp).
> [    2.423303] systemd[1]: Mounted FUSE Control File System.
> [  OK  ] Mounted FUSE Control File System.
> [    2.425281] systemd[1]: Mounted Kernel Configuration File System.
> [  OK  ] Mounted Kernel Configuration File System.
> [    2.431648] systemd[1]: Started Remount Root and Kernel File Systems.
> [  OK  ] Started Remount Root and Kernel File Systems.
> [    2.433729] systemd[1]: Started Apply Kernel Variables.
> [  OK  ] Started Apply Kernel Variables.
> [    2.435694] systemd[1]: Started Create Static Device Nodes in /dev.
> [  OK  ] Started Create Static Device Nodes in /dev.
> [    2.440084] systemd[1]: Reached target Local File Systems (Pre).
> [  OK  ] Reached target Local File Systems (Pre).
> [    2.441076] systemd[1]: Reached target Local File Systems.
> [  OK  ] Reached target Local File Systems.
> [    2.447108] systemd[1]: Condition check resulted in Rebuild
> Hardware Database being skipped.
> [    2.448028] systemd[1]: Condition check resulted in Commit a
> transient machine-id on disk being skipped.
> [    2.448995] systemd[1]: Condition check resulted in Platform
> Persistent Storage Archival being skipped.
> [    2.452187] systemd[1]: Starting udev Kernel Device Manager...
>          Starting udev Kernel Device Manager...
> [    2.479305] systemd[1]: Started udev Kernel Device Manager.
> [  OK  ] Started udev Kernel Device Manager.
> [    2.482661] systemd[1]: Starting Network Service...
>          Starting Network Service...
> [    2.513274] systemd[1]: Started Network Service.
> [  OK  ] Started Network Service.
> [    2.546765] systemd[1]: Started Journal Service.
> [  OK  ] Started Journal Service.
>          Starting Flush Journal to Persistent Storage...
> [    2.562832] systemd-journald[180]: Received client request to flush
> runtime journal.
> [    2.569401] systemd-journald[180]: File
> /var/log/journal/4439edff454b4b928f11339c391678c1/system.journal
> corrupted or uncleanly shut down, renaming and replacing
> .
> [    2.620550] systemd-journald[180]: Failed to read journal file
> /var/log/journal/4439edff454b4b928f11339c391678c1/user-1006.journal
> for rotation, trying to move i
> t out of the way: Device or resource busy
> [  OK  ] Started udev Coldplug all Devices.
> [  OK  ] Started Flush Journal to Persistent Storage.
>          Starting Create Volatile Files and Directories...
> [  OK  ] Started Create Volatile Files and Directories.
> [  OK  ] Found device /dev/ttyFIQ0.
> [  OK  ] Reached target Sound Card.
>          Starting Network Name Resolution...
>          Starting Network Time Synchronization...
>          Starting Update UTMP about System Boot/Shutdown...
> [  OK  ] Started Update UTMP about System Boot/Shutdown.
> [  OK  ] Started Network Time Synchronization.
> [  OK  ] Reached target System Initialization.
> [  OK  ] Started Daily Cleanup of Temporary Directories.
> [  OK  ] Reached target System Time Set.
> [  OK  ] Reached target Timers.
> [  OK  ] Listening on D-Bus System Message Bus Socket.
> [  OK  ] Reached target Sockets.
> [  OK  ] Reached target Basic System.
> [  OK  ] Started Console Getty.
> [  OK  ] Started D-Bus System Message Bus.
> [  OK  ] Started Serial Getty on ttyFIQ0.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Reached target Multi-User System.
>          Starting Update UTMP about System Runlevel Changes...
> [  OK  ] Started Network Name Resolution.
> [  OK  ] Reached target Network.
> [  OK  ] Reached target Host and Network Name Lookups.
> [  OK  ] Started Update UTMP about System Runlevel Changes.
> [    4.301029] fusb302 4-0022: PD disabled
> [    7.957210] tty_port_close_start: tty->count = 1 port count = 2.
> 
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login:
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login: [   10.624687] random: nonblocking pool is initialized
> 
> roc-rk3399-pc login: root
> -sh: can't access tty; job control turned off
> # ls
> Password:
> Login timed out after 60 seconds
> [   88.012240] tty_port_close_start: tty->count = 1 port count = 2.
> [  OK  ] Stopped Console Getty.
> [  OK  ] Started Console Getty.
> [  OK  ] Stopped Serial Getty on ttyFIQ0.
> [  OK  ] Started Serial Getty on ttyFIQ0.
> [   93.335900] tty_port_close_start: tty->count = 1 port count = 2.
> 
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login:
> Welcome to ROC-RK3399-PC!
> roc-rk3399-pc login: root
> -sh: can't access tty; job control turned off
> # ls
> Password:
> 
> Any inputs, please let me know.
> 
> Jagan.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
