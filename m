From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jul 2019 19:46:51 +0200
Subject: [Buildroot] [RFC PATCH v2 1/2] makedevs: only warn on xattr
 when not enabled
In-Reply-To: <20190729230644.2423-1-petr.vorel@gmail.com>
References: <20190729230644.2423-1-petr.vorel@gmail.com>
Message-ID: <20190730174651.GG3194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-07-30 01:06 +0200, Petr Vorel spake thusly:
> Previously makedevs failed on adding xattr when
> BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES was not enabled.
> Now only warn. Therefore check for this configuration would be required
> in each use. But no package is using it so far (it's used only in tests).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> this supersede this patch:
> https://patchwork.ozlabs.org/patch/1138055/
> 
> Unfortunately I wasn't able to test it as
> buildroot/output/build/buildroot-fs/tar/fakeroot is not working for me.
> Can anyone test it?
> 
> Kind regards,
> Petr
> 
>  package/makedevs/makedevs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index c57b964f5c..ab35b8e70d 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -518,8 +518,9 @@ int main(int argc, char **argv)
>  			if (bb_set_xattr(full_name, xattr) < 0)
>  				bb_error_msg_and_die("can't set cap %s on file %s\n", xattr, full_name);
>  #else
> -			bb_error_msg_and_die("line %d not supported: '%s'\nDid you forget to enable "
> -					     "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES?\n",
> +			bb_error_msg("line %d not supported: '%s'\nEnable "
> +					     "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES"
> +						 "to get xattr support\n",

It would be nice if the message was displayed only the first time an
xattr line is encountered, something like:

    if (!xattr_warned) {
        bb_error_msg(...);
        xattr_warned = 1;
    }

Regards,
Yann E. MORIN.

>  					     linenum, line);
>  #endif /* EXTENDED_ATTRIBUTES */
>  			continue;
> -- 
> 2.22.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
