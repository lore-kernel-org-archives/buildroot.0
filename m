From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 18:14:21 +0100
Subject: [Buildroot] [PATCH] package/musl: Make scheduler functions
 Linux-compatible
In-Reply-To: <509e7dab95b95c040af26c842e94777b069d6ba5.camel@gmail.com>
References: <509e7dab95b95c040af26c842e94777b069d6ba5.camel@gmail.com>
Message-ID: <e0c7dcc9-5e65-1934-d59e-c9d9247781cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/05/2019 22:00, stefan.nickl at gmail.com wrote:
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
> ---
>  package/musl/0002-sched-linux-compat.patch | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 package/musl/0002-sched-linux-compat.patch
> 
> diff --git a/package/musl/0002-sched-linux-compat.patch
> b/package/musl/0002-sched-linux-compat.patch
> new file mode 100644
> index 0000000000..c1626ea7c3
> --- /dev/null
> +++ b/package/musl/0002-sched-linux-compat.patch
> @@ -0,0 +1,74 @@
> +The POSIX functions sched_getscheduler(), sched_setscheduler(),
> +sched_getparam(), sched_setparam() are technically not correctly
> +implemented by the Linux syscalls of the same name, because what the
> +kernel calls a PID and what POSIX calls a PID isn't truly the same,
> +resulting in somewhat different semantics as to what these functions
> +exactly apply to.
> +
> +Since the musl developers put a high premium on POSIX compliance, they
> +deliberately implement these functions to return -ENOSYS instead of
> +relaying them to the respective Linux syscalls as glibc/uClibc do.
> +
> +This means that virtually all programs written for Linux using these
> +functions are currently broken. For example running 'chrt -p 1' fails
> +with "Function not implemented" on a musl-libc based system.
> +
> +While the musl developers are right strictly speaking, it seems
> +unfeasible to fix all affected programs in a way that hardly any Linux
> +developer will consider to be broken in the first place. So this patch
> +simply changes musl to fall in line with the other libcs.
> +
> +Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

 This is really the only way that we can make musl usable in practice. Ideally
it should be merged into musl-compat-headers or something like that, but that's
a lot more complicated.

 Therefore, I've applied to master, thanks.

 Regards,
 Arnout
