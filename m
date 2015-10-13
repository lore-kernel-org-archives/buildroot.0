From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 13 Oct 2015 09:47:20 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: imported fix for journald
	SIGABRTs.
In-Reply-To: <1444708715-4696-1-git-send-email-jordan@yelloz.me>
References: <1444708715-4696-1-git-send-email-jordan@yelloz.me>
Message-ID: <CAGduivwRwmxVZeKK0Jx+QM8us8yzrSWzG_dT8RD4zS7W5UfCFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Tue, Oct 13, 2015 at 5:58 AM, Jordan Yelloz <jordan@yelloz.me> wrote:

> Prior to applying this patch, assertion errors would reliably be displayed
> on the
> console. These failed assertions led to crashes in systemd-journald on
> startup.
>
> This patch fixes systemd bug #512:
> <https://github.com/systemd/systemd/issues/512>
>
NAK on this one. There's already a patch in the queue to bump systemd to
v226 (and it should be trumped with a patch to update to v227 but it
requires some others patches so it'll take more time) that includes this
patch.
https://patchwork.ozlabs.org/patch/525867/

>
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  .../0004-sd-device-never-return-NULL-0.patch       | 55
> ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644
> package/systemd/0004-sd-device-never-return-NULL-0.patch
>
> diff --git a/package/systemd/0004-sd-device-never-return-NULL-0.patch
> b/package/systemd/0004-sd-device-never-return-NULL-0.patch
> new file mode 100644
> index 0000000..a0aa543
> --- /dev/null
> +++ b/package/systemd/0004-sd-device-never-return-NULL-0.patch
> @@ -0,0 +1,55 @@
> +From aad85277b519c700c33a39f2e6558384d2d4aa9f Mon Sep 17 00:00:00 2001
> +From: David Herrmann <dh.herrmann@gmail.com>
> +Date: Wed, 15 Jul 2015 12:30:08 +0200
> +Subject: [PATCH 1/1] sd-device: never return NULL+0
> +
> +It is highly confusing if a getter function returns 0, but the value is
> +set to NULL. This, right now, triggers assertions as code relies on the
> +returned values to be non-NULL.
> +
> +Like with sd-bus-creds and friends, return 0 only if a value is actually
> +available.
> +
> +Discussed with Tom, and actually fixes real bugs as in #512.
> +
> +Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> +---
> + src/libsystemd/sd-device/sd-device.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> [-SNIP-]
> +
> --
> 2.6.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151013/692ade26/attachment.html>
