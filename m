From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu, 29 Oct 2015 09:08:10 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
 interfaces to appear
In-Reply-To: <1446047943-24641-3-git-send-email-jezz@sysmic.org>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
Message-ID: <5631D3EA.5090500@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/2015 16:59, J?r?me Pouiller wrote:
> This patch has same purpose than 49964858f45d2243c513e6d362e992ad89ec7a45:
> 
>   On some machines, the network interface is slow to appear. For example,
>   on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
>   and our standard boot process is too fast, so our network startup script
>   is called before the USB bus is compeltely enumerated, thus it can't
>   configure eth0.
> 
>   Closes #8116.
> 
> However, it use an optionnal ifupdown hook instead of an initscript.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  system/skeleton/etc/network/if-pre-up.d/wait_iface | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100755 system/skeleton/etc/network/if-pre-up.d/wait_iface
> 
> diff --git a/system/skeleton/etc/network/if-pre-up.d/wait_iface b/system/skeleton/etc/network/if-pre-up.d/wait_iface
> new file mode 100755
> index 0000000..4f0866b
> --- /dev/null
> +++ b/system/skeleton/etc/network/if-pre-up.d/wait_iface
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
> +# and we need to configure it, wait until it appears, but not too
> +# long either. IF_WAIT_DELAY is in seconds.
> +
> +if [ "${IF_WAIT_DELAY}" ]; then
> +
> +    printf "Waiting for interface %s to appear" "${IFACE}"

I think we shouldn't print this scary message when the interface already
exist in the first place... I was suggesting to only do it if
VERBOSITY=1 but busybox does not support that.

> +    while [ ${IF_WAIT_DELAY} -gt 0 ]; do
> +
> +        if [ -e "/sys/class/net/${IFACE}" ]; then
> +
> +            printf " yes\n"

So this prints:
"Waiting for interface dummy0 to appear..... yes"
or
"Waiting for interface dummy0 to appear............... no"

We should maybe just print a new line on success and an explicit error
message on failure.

> +            exit 0
> +
> +        fi
> +        sleep 1
> +        printf "."
> +
> +        : $((IF_WAIT_DELAY -= 1))
> +
> +    done
> +    printf " no.\n"
> +    exit 1
> +
> +fi
> +
> 
