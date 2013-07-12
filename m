From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 12 Jul 2013 09:01:18 +0200
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Jul 11, 2013 at 10:30 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Register mdev as hotplug helper for many goodies and expected behaviour
> (like automatic firmware loading).
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/busybox/S10mdev | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
> index c06aa20..c41f166 100644
> --- a/package/busybox/S10mdev
> +++ b/package/busybox/S10mdev
> @@ -6,6 +6,7 @@
>  case "$1" in
>    start)
>         echo "Starting mdev..."
> +       echo /sbin/mdev 2>/dev/null >/proc/sys/kernel/hotplug
>         /sbin/mdev -s
>         ;;
>    stop)

In linux/linux.mk, there mdev is already set as hotplug helper in the
kernel configuration.
How does this change relate to it? At first sight, it seems unnecessary.

I did notice that setting mdev as hotplug helper in the kernel
configuration, can seriously impact boot performance. On a board with
a not so fast single core processor (around 500MHz) boot time until
userspace became about 10 seconds coming from 2s. We solved this by
setting no helper in the kernel configuration (and telling buildroot
to use just devtmpfs instead of mdev), and manually copying S10mdev to
the rootfs. Then, mdev is run once during userspace init.
This doesn't give automatic firmware loading, but that would be solved
by your above patch, I think.

Did anyone else notice such slowdown behavior?

Best regards,
Thomas
