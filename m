From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jul 2019 22:57:54 +0200
Subject: [Buildroot] [RFC PATCH v3 1/2] makedevs: only warn when xattr
 support disabled
In-Reply-To: <20190730203147.21113-1-petr.vorel@gmail.com>
References: <20190730203147.21113-1-petr.vorel@gmail.com>
Message-ID: <20190730205754.GH3194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-07-30 22:31 +0200, Petr Vorel spake thusly:
> Previously makedevs failed when xattr configuration defined while
> disabled BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES.
> Therefore check for this configuration would be required
> in each use. Therefore only print warning with number of discharged lines.
> 
> No package is using this feature so far (it's used only in tests),
> thus no need to change any package config.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[--SNIP--]
> @@ -641,6 +640,15 @@ int main(int argc, char **argv)
>  loop:
>  		free(line);
>  	}
> +
> +	if (xattr_warned) {
> +			bb_error_msg("%u lines with xattr configuration discharged, enable "

"discharged" is not the most appropriate term. I'd have just said
"ignored".

> +					     "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES "
> +						 "to get xattr support\n",
> +					     xattr_warned);

Yes, that's nice! :-)

> +			ret = EXIT_FAILURE;

Why do you want to exit in failure?

When makedevs exits in error, then whole fakeroot script aborts even
before attempting to generate the image.

I can see two problems with that:

  - first, when iputils is enabled, then the build will by default fail,
    as xattr support is by default disabled,

  - I can very well see a scenario where xattr, and thus capabilities,
    are not desired. For example, if I need iputils, but will only ever
    call clockdiff as root, then I don't care about its capabilities.

So, I think it is nice that we warn that xattrs are dropped, but we
should not fail the build.

Regards,
Yann E. MORIN.

> +	}
> +
>  	fclose(table);
>  
>  	return ret;
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
