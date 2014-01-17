From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 17 Jan 2014 10:16:41 +0800
Subject: [Buildroot] [RFC,
 PATCH 0/8] Enable a buildroot-based petitboot bootloader
In-Reply-To: <1389862338.917573.283530987294.0.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
Message-ID: <52D89289.4070205@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> While most of this series is fairly straightforward, there are a few
> items that might need a little more attention:

Also, the way I'm doing the kexec could use a sanity check. Currently,
it goes like this:

- we configure busybox init (permanently through inittab) to use
  /usr/sbin/kexec-restart as the "restart" handler.

- when petitboot is told to boot a new kernel, it loads it (along with
  optional initrd and device-tree blob) into the running kernel
  with the kexec command. This only loads the new kernel through the
  kexec_load syscall, it doesn't initiate any boot process.

- next, petitboot runs its shutdown command, which we've configured
  as /usr/libexec/petitboot/bb-kexec-reboot. This is a busybox-
  init-specific script that simply sends a SIGQUIT to bb init to
  invoke the restart.

- bb init starts the shutdown procedure, and terminates running
  processes, then finally executes the restart handler (which we
  configured earlier to /usr/sbin/kexec-restart).

- /usr/sbin/kexec-restart simply calls the reboot() syscall, with
  the correct magic value to execute the kernel we loaded earlier.

The reason we're using the restart handler here is that busybox init
doesn't know about the reboot()'s magic value to perform a kexec, and
the busybox folks would rather that this *isn't* handled by init (which
makes sense).

Feedback welcome!

Cheers,


Jeremy
