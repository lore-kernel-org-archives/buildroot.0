From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 14:09:02 +0200
Subject: [Buildroot] [PATCH resend v3] owl-linux: new package
In-Reply-To: <1342777953-31144-1-git-send-email-spdawson@gmail.com>
References: <1342777953-31144-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120720140902.641f193e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 10:52:33 +0100,
spdawson at gmail.com a ?crit :

> diff --git a/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch b/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch
> new file mode 100644
> index 0000000..e807de2
> --- /dev/null
> +++ b/package/owl-linux/owl-linux-fix-for-linux-3.3.x.patch
> @@ -0,0 +1,23 @@
> +Kernel commit b81693d9149c598302e8eb9c20cb20330d922c8e changed the
> +net_device_ops structure, removing the ndo_set_multicast_list callback. The
> +ndo_set_rx_mode has also been added to this structure.
> +
> +The upshot of these changes is that owl-linux fails to compile with 3.3.x
> +and later kernels.
> +
> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
> +diff -Nurp a/owl_net.c b/owl_net.c
> +--- a/owl_net.c	2012-06-14 10:51:45.000000000 +0100
> ++++ b/owl_net.c	2012-07-20 10:46:55.332751539 +0100
> +@@ -384,7 +384,11 @@ static const struct net_device_ops netde
> + #endif /* OWL_CONFIG_IFUPDOWN */
> +         .ndo_start_xmit         = owl_net_tx,
> +         .ndo_get_stats          = owl_net_get_stats,
> ++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
> +         .ndo_set_multicast_list = NULL,
> ++#else
> ++        .ndo_set_rx_mode = NULL,
> ++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0) */

I would rather suggest to simply remove the .ndo_set_multicast_list =
NULL line, and to not add the .ndo_set_rx_mode line. When using C99
structure initializers, the compiler guarantees you that all fields
that are not listed are initialized to zero, so all
those .something=NULL initializations are useless.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
