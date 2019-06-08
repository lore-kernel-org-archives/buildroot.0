From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 20:53:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: fix build with gcc < 5
In-Reply-To: <20190603195107.2347-1-fontaine.fabrice@gmail.com>
References: <20190603195107.2347-1-fontaine.fabrice@gmail.com>
Message-ID: <91091659-da59-704e-4fb4-edf294009ede@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2019 21:51, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/96fe1667190e1e08d672984f147ec8e8f5e2f4f1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.


> ---
>  ...a-va_trace-unbreak-with-C89-after-b369467.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
> 
> diff --git a/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch b/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
> new file mode 100644
> index 0000000000..19192742c8
> --- /dev/null
> +++ b/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
> @@ -0,0 +1,35 @@
> +From 6724011e8b52901f13dded130f0b47e8bdbd4dda Mon Sep 17 00:00:00 2001
> +From: Jan Beich <jbeich@FreeBSD.org>
> +Date: Wed, 10 Apr 2019 11:37:28 +0000
> +Subject: [PATCH] va/va_trace: unbreak with C89 after b3694671c784
> +
> +va/va_trace.c: In function 'va_TraceVAEncMiscParameterBuffer':
> +va/va_trace.c:3281: error: 'for' loop initial declaration used outside C99 mode
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/intel/libva/commit/6724011e8b52901f13dded130f0b47e8bdbd4dda]

 I actually prefer it if you put your SoB below the upstream reference. That
makes it clearer (at least to me) that the SoB wasn't there in the original commit.

 But it doesn't matter much, so I've applied as-is now.

 Regards,
 Arnout

> +---
> + va/va_trace.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/va/va_trace.c b/va/va_trace.c
> +index 0a17e5cd..d41f62c1 100755
> +--- a/va/va_trace.c
> ++++ b/va/va_trace.c
> +@@ -3271,6 +3271,7 @@ static void va_TraceVAEncMiscParameterBuffer(
> +     }
> +     case VAEncMiscParameterTypeROI:
> +     {
> ++        int i;
> +         VAEncMiscParameterBufferROI *p = (VAEncMiscParameterBufferROI *)tmp->data;
> + 
> +         va_TraceMsg(trace_ctx, "\t--VAEncMiscParameterBufferROI\n");
> +@@ -3278,7 +3279,7 @@ static void va_TraceVAEncMiscParameterBuffer(
> +         va_TraceMsg(trace_ctx, "\tmax_delta_qp = %d\n", p->max_delta_qp);
> +         va_TraceMsg(trace_ctx, "\tmin_delta_qp = %d\n", p->min_delta_qp);
> +         va_TraceMsg(trace_ctx, "\troi_flags.bits.roi_value_is_qp_delta = %d\n", p->roi_flags.bits.roi_value_is_qp_delta);
> +-        for (int i = 0; i < p->num_roi; i++) {
> ++        for (i = 0; i < p->num_roi; i++) {
> +             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.x      = %d\n", i, p->roi[i].roi_rectangle.x);
> +             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.y      = %d\n", i, p->roi[i].roi_rectangle.y);
> +             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.width  = %d\n", i, p->roi[i].roi_rectangle.width);
> 
