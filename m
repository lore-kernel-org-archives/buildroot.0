From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Mar 2021 20:38:04 +0000
Subject: [Buildroot] [Bug 13271] systemd-resolved: /etc/resolv.conf link
 broken on per-package build
In-Reply-To: <bug-13271-163@https.bugs.busybox.net/>
References: <bug-13271-163@https.bugs.busybox.net/>
Message-ID: <bug-13271-163-8RGkXSjChv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13271

Leo <leojrfs@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |leojrfs at gmail.com

--- Comment #1 from Leo <leojrfs@gmail.com> ---
Created attachment 8836
  --> https://bugs.busybox.net/attachment.cgi?id=8836&action=edit
skeleton-init-systemd per-package workaround

I can confirm this.

This kind of issues might happen when using `per-package`.
The reason for this is that `target-finalize` rsyncs all the target
subdirectories under the package directory (example:
`$O/per-package/foo/target`) in alphabetic order:

```
$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
```

So, files in the final target, might get consecutively overwritten in that
process by the content of each package `per-package` `target` directory.

In this case, `udev` is one of the packages that overrides the `resolv.conf`,
it comes after `systemd` in the rsync order previously mentioned.

`udev` depends on `toolchain` which in turn depends on `skeleton-init-systemd`,
where `resolv.conf` is a link to `../tmp/resolv.conf`, thus,
`$O/per-package/udev/target/etc/resolv.conf` gets its value by rsyncing
`$O/per-package/toolchain/target/etc/resolv.conf` just before building.


Ideally, rsync would execute in dependency order instead of alphabetic order. I
tried to tinker around that, but had not much success. Im not sure how to solve
this problem.


In the meanwhile, I attach a patch for `skeleton-init-systemd.mk`, which solves
this specific issue. Im not sure it is the best way to solve this problem, for
the reasons I just mentioned.

Any thoughts?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
