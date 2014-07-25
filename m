From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 18:55:50 +0200
Subject: [Buildroot] [PATCH] libfslvpuwrap: fix tests of return value
 from IOGetVirtMem
In-Reply-To: <1406270593-17193-1-git-send-email-bisson.gary@gmail.com>
References: <1406270593-17193-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140725165550.GB3955@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-07-24 23:43 -0700, Gary Bisson spake thusly:
> Same as similar patches for imx-vpu, the returned value from
> IOGetVirtMem was not properly checked.

That's the same problem as seen in imx-vpu and fixed by:
    package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch

right?

> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> 
> ---
> Yann, Eric, all,
> This patch is just a copy of what Eric pushed for this package in Yocto.
> Thanks,
> Gary
> ---
>  ...-fix-tests-of-return-value-from-IOGetVirt.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
> 
> diff --git a/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch b/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
> new file mode 100644
> index 0000000..ccd2d9e
> --- /dev/null
> +++ b/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
> @@ -0,0 +1,41 @@
> +From 7ca66c10c05168c7d342df7c7a70d4a1ae0629f7 Mon Sep 17 00:00:00 2001
> +From: Eric Nelson <eric.nelson@boundarydevices.com>
> +Date: Sat, 28 Jun 2014 09:45:09 -0700
> +Subject: [PATCH] vpu_wrapper: fix tests of return value from IOGetVirtMem
> +
> +IOGetVirtMem() returns a pointer or specifically -1 (MAP_FAILED)
> +in the case of failure.
> +
> +Upstream-Status: Pending

Is there a public URL to the bug report or the patch submission?
If so, can you paste the URL here, so we know when we update that we
need to remove that patch?

With the URL added, you can add my:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +
> +Signed-off-by: Laci Tele <laci@boundarydevices.com>
> +Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> +---
> + vpu_wrapper.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/vpu_wrapper.c b/vpu_wrapper.c
> +index 9249174..148c5df 100755
> +--- a/vpu_wrapper.c
> ++++ b/vpu_wrapper.c
> +@@ -6653,7 +6653,7 @@ VpuDecRetCode VPU_DecGetMem(VpuMemDesc* pInOutMem)
> + 		return VPU_DEC_RET_FAILURE;
> + 	}
> + 	ret=IOGetVirtMem(&buff);
> +-	if(ret==0) //if(ret!=RETCODE_SUCCESS)
> ++	if(ret == -1) //if(ret==MAP_FAILED)
> + 	{
> + 		VPU_ERROR("%s: get virtual memory failure: size=%d, ret=%d \r\n",__FUNCTION__,buff.size,ret);
> + 		return VPU_DEC_RET_FAILURE;
> +@@ -8277,7 +8277,7 @@ VpuEncRetCode VPU_EncGetMem(VpuMemDesc* pInOutMem)
> + 		return VPU_ENC_RET_FAILURE;
> + 	}
> + 	ret=IOGetVirtMem(&buff);
> +-	if(ret==0) //if(ret!=RETCODE_SUCCESS)
> ++	if(ret == -1) //if(ret==MAP_FAILED)
> + 	{
> + 		VPU_ENC_ERROR("%s: get virtual memory failure: size=%d, ret=%d \r\n",__FUNCTION__,buff.size,(UINT32)ret);
> + 		return VPU_ENC_RET_FAILURE;
> +-- 
> +1.9.1
> +
> -- 
> 2.0.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
