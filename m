From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Sep 2016 11:14:16 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-ABGnl5IA8V@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

Floris Bos <bos@je-eigen-domein.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |---

--- Comment #16 from Floris Bos <bos@je-eigen-domein.nl> ---
(In reply to Maxime Hadjinlian from comment #15)
>The skeleton has changed since that times, and systemd has been updated too, so 
>this has to be kept in mind.

The updates did not improve a thing.

Still broken for me to this date if the root file system is mounted read-write
(by an initramfs) before passing control over to systemd

Journal service starts quicker on my test system (Raspberry) and creates
/tmp/journal (/var/log/journal) first. Then 0.2 seconds later a tmpfs /tmp is
mounted on top, rendering the journal files unreachable.

==
[   12.145381] systemd[1]: Starting Journal Service...
[   12.154950] systemd[1]: Started Create list of required static device nodes
for the current kernel.
[   12.157820] systemd[1]: Starting Create Static Device Nodes in /dev...
[   12.174068] systemd[1]: Mounted POSIX Message Queue File System.
[   12.179373] systemd[1]: Mounted Debug File System.
[   12.179523] systemd[1]: Mounted Configuration File System.
[   12.294936] systemd[1]: Started Apply Kernel Variables.
[   12.299556] systemd[1]: Started Remount Root and Kernel File Systems.
[   12.369659] systemd[1]: Starting udev Coldplug all Devices...
[   12.374580] systemd[1]: Started Create Static Device Nodes in /dev.
[   12.379076] systemd[1]: Starting udev Kernel Device Manager...
[   12.379246] systemd[1]: Reached target Local File Systems (Pre).
[   12.382691] systemd[1]: tmp.mount: Directory /tmp to mount over is not
empty, mounting anyway.
[   12.386300] systemd[1]: Mounting /tmp...
[   12.399922] systemd[1]: Mounted /tmp.
[   12.409040] systemd[1]: Reached target Local File Systems.
==

Due to the asynchronious nature of systemd the results during your test may
differ, but that doesn't mean the problem isn't still there.


>I would add that the patch that changes the Storage options unconditionally is 
>too harsh anyway. We can't enforce where the log should be or not be, written. 
>This should be a post-build scripts tweak to me

Would argue that systemd should work with the default skeleton out-of-the-box,
and the "Storage=Volatile" patch makes sense in that situation.
Why not let the people that want to deviate from the default do post-build
tweaks instead?!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
