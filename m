From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 15:24:05 +0200
Subject: [Buildroot] [PATCH] fs/cpio/init: unbreak ttyname_r() on glibc
 after dropping /dev/console exec
In-Reply-To: <20200829130911.19760-1-peter@korsgaard.com>
References: <20200829130911.19760-1-peter@korsgaard.com>
Message-ID: <20200829132405.GE14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-08-29 15:09 +0200, Peter Korsgaard spake thusly:
> Commit 98a6f1fc02e41 (fs/cpio: make initramfs init script survive 'console='
> kernel argument) dropped the explicit /dev/console execs for fd 0,1,2, as
> they fail when booted with console= and aren't really needed as the kernel
> will setup fd 0,1,2 from /dev/console before executing the initramfs anyway.
> 
> Not doing this unfortunately confuses glibc's ttyname_r(3) implementation
> (used by E.G.  busybox/coreutils 'tty'), causing it to fail with ENOENT as
> it does a fstat on fd 0 and tries to match up st_ino / st_dev against the
> entries in /dev (since glibc 2.26):
> 
>  commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
>  Author: Christian Brauner <christian.brauner@canonical.com>
>  Date:   Fri Jan 27 15:59:59 2017 +0100
> 
>     linux ttyname and ttyname_r: do not return wrong results
> 
>     If a link (say /proc/self/fd/0) pointing to a device, say /dev/pts/2, in a
>     parent mount namespace is passed to ttyname, and a /dev/pts/2 exists (in a
>     different devpts) in the current namespace, then it returns /dev/pts/2.
>     But /dev/pts/2 is NOT the current tty, it is a different file and device.
> 
>     Detect this case and return ENODEV.  Userspace can choose to take this as a hint
>     that the fd points to a tty device but to act on the fd rather than the link.
> 
>     Signed-off-by: Serge Hallyn <serge@hallyn.com>
>     Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> 
> The reason it fails is that we manually mount devtmpfs on /dev in /init, so
> the /dev/console used by the kernel (in rootfs) is not the same file as
> /dev/console at runtime (in devtmpfs).
> 
> Notice: Once logged in, tty does work correctly.  Presumably login reopens
> stdin/stdout/stderr.
> 
> To fix this, re-add the exec of /dev/console for fd 0,1,2, but only do so if
> possible.  Because of the above mentioned shell behaviour (specified by
> POSIX [0]), perform this check in a subshell.
> 
> [0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_20_01
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  fs/cpio/init | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/cpio/init b/fs/cpio/init
> index b0af18b67a..f74ef7e15f 100755
> --- a/fs/cpio/init
> +++ b/fs/cpio/init
> @@ -1,4 +1,15 @@
>  #!/bin/sh
>  # devtmpfs does not get automounted for initramfs
>  /bin/mount -t devtmpfs devtmpfs /dev
> +
> +# use the /dev/console device node from devtmpfs if possible to not
> +# confuse glibc's ttyname_r().
> +# This may fail (E.G. booted with console=), and errors from exec will
> +# terminate the shell, so use a subshell for the test
> +if (exec 0</dev/console) 2>/dev/null; then
> +    exec 0</dev/console
> +    exec 1>/dev/console
> +    exec 2>/dev/console
> +fi

You forgot the else part, which should redirect to /dev/null, so that we
do have valid fds in the case /dev/console does not really exist, no?

Regards,
Yann E. MORIN.

>  exec /sbin/init "$@"
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
