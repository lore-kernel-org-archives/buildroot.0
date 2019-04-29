From: Dominik Menke <dom@digineo.de>
Date: Mon, 29 Apr 2019 18:18:37 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <b3efb298-2353-ce88-552b-34fbe26df110@digineo.de>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
 <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
 <4e0cc833-814c-3cc6-deb3-6539a0f92f4f@mind.be>
 <b3efb298-2353-ce88-552b-34fbe26df110@digineo.de>
Message-ID: <df9e7287-f9b0-4381-6a04-3424ee752065@digineo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/29/19 11:01 AM, Dominik Menke wrote:
> On 4/27/19 11:47 PM, Arnout Vandecappelle wrote:
>>    [...] So I don't
>> really understand why it doesn't work for you.
>
> I will investigate further.

I now belive the fsck package mashup to be a red herring. I've switched 
to buildroot master (89e70a7077 = systemd 241, e2fsprogs 1.44.5, 
util-linux 2.33, kernel 4.19).

By adding systemd.journald.forward_to_console=1 to /boot/cmdline.txt, 
and sifting through the output I found this beauty:


>          Starting File System Check on Root Device...
> [    4.547439] systemd-fsck[94]: /dev/mmcblk0p2: Superblock last write time (Mon Apr 29 17:37:11 2019,
> [    4.551637] systemd-fsck[94]: 	now = Thu Feb 14 11:11:59 2019) is in the future.
> [    4.552072] systemd-fsck[94]: FIXED.
> [    5.101772] systemd-fsck[94]: /dev/mmcblk0p2: ***** REBOOT SYSTEM *****
> [    5.102214] systemd-fsck[94]: /dev/mmcblk0p2: 4658/65536 files (0.7% non-contiguous), 145524/262144 blocks
> [    5.150450] systemd-fsck[94]: fsck failed with exit status 3.
> [    5.180549] systemd-fsck[94]: Running request reboot.target/start/replace
> [FAILED] Failed to start File System Check on Root Device.
> See 'systemctl status systemd-fsck-root.service' for details.
> [    5.210607] systemd-fsck[94]: Failed to start unit: Unit final.target not found.
> [    5.279763] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
>          Starting Remount Root and Kernel File Systems...
> [    5.294799] systemd[1]: systemd-fsck-root.service: Main process exited, code=exited, status=1/FAILURE
> [  OK  ] Started Remount Root and Kernel File Systems.
> [    5.361063] systemd[1]: systemd-fsck-root.service: Failed with result 'exit-code'.
> [  OK  ] Reached target Local File Systems (Pre).
> [    5.430870] systemd[1]: Failed to start File System Check on Root Device.
> [  OK  ] Reached target Local File Systems.
> [    5.501359] systemd[1]: Starting Remount Root and Kernel File Systems...
>          Starting Rebuild Journal Catalog...
> [    5.560605] systemd[1]: Started Remount Root and Kernel File Systems.
>          Starting Flush Journal to Persistent Storage...
> [    5.620725] systemd[1]: Reached target Local File Systems (Pre).
>          Starting Rebuild Hardware Database...
> [    5.681179] systemd[1]: Reached target Local File Systems.
> [FAILED] Failed to start Rebuild Journal Catalog.
> See 'systemctl status systemd-journal-catalog-update.service' for details.
> [    5.741141] systemd[1]: Condition check resulted in Commit a transient machine-id on disk being skipped.
> [FAILED] Failed to start Flush Journal to Persistent Storage.
> [FAILED] Failed to start Rebuild Hardware Database.
> [FAILED] Failed to start udev Kernel Device Manager.
> [FAILED] Failed to start Create Volatile Files and Directories.
> [FAILED] Failed to start Update is Completed.

Correct me if I'm wrong, but this looks like correcting the (correct) 
last write time to the (wrong) current time, fsck tries to trigger a 
system reboot.

Is this fixable without a real-time clock? ntp becomes available far too 
late in the boot process.

Kind Regards,
Dominik
