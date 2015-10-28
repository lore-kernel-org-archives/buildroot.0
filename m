From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Oct 2015 18:46:53 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
 interfaces to appear
In-Reply-To: <1446047943-24641-3-git-send-email-jezz@sysmic.org>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
Message-ID: <20151028174653.GA3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-10-28 16:59 +0100, J?r?me Pouiller spake thusly:
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

Please drop the empty lines.

Also, I would have preferred patches 2 & 3 to be folded into a single
patch. I don't really understand how it all works:

  - does the busybox ifup-down and full-fledged ifup-down support
    wait-delay?
  - I looked at man 5 interfaces, and there is no mention of wait-delay,
  - I don't see how 'wait-delay' translates to 'wait_iface'
  - I guess 'wait-delay' is made an environment variable IF_WAIT_DELAY
    before the script is run, but I'd have preferred explanations rather
    than having to guess.

Care to shed some light, please?

Otherwise, the idea looks fine to me. Thanks! :-)

Regards,
Yann E. MORIN.

> +    printf "Waiting for interface %s to appear" "${IFACE}"
> +    while [ ${IF_WAIT_DELAY} -gt 0 ]; do
> +
> +        if [ -e "/sys/class/net/${IFACE}" ]; then
> +
> +            printf " yes\n"
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
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
