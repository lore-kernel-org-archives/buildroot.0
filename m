From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:52:52 +0200
Subject: [Buildroot] [PATCH v6 1/1] mosh: new package
In-Reply-To: <1437844972-11261-1-git-send-email-christian@paral.in>
References: <1437844972-11261-1-git-send-email-christian@paral.in>
Message-ID: <20150725175252.GT3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-25 10:22 -0700, Christian Stewart spake thusly:
> Adding mosh, the mobile shell. Mosh uses ssh or dropbear as an initial transport to
> start mosh-server which uses UDP to communicate with the client.
> Supports a predictive model to enhance performance on weak connections
> and compensate for general lag. Also supports disconnections and
> reconnections seamlessly.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
> new file mode 100644
> index 0000000..a78cb33
> --- /dev/null
> +++ b/package/mosh/mosh.hash
> @@ -0,0 +1 @@
> +sha256 637adb7f67406447e9264d30468fe69a6d5e8f97518ef133d794cdc65483fa54 mosh-1.2.5.tar.gz

We usually identify where that hash comes from. Sicne upstream actually
did publish that hash, we can refer to it:

    # From: http://mailman.mit.edu/pipermail/mosh-users/2015-July/000283.html
    sha256 637adb7f67406447e9264d30468fe69a6d5e8f97518ef133d794cdc65483fa54 mosh-1.2.5.tar.gz

> diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> new file mode 100644
> index 0000000..142e08e
> --- /dev/null
> +++ b/package/mosh/mosh.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# mosh
> +#
> +################################################################################
> +
> +MOSH_VERSION = 1.2.5
> +MOSH_SITE = https://mosh.mit.edu/mosh-$(MOSH_VERSION).tar.gz

Eh, how could I miss that on the previous review?

The _SITE variables is just the "directory part" of the URL, like:

    MOSH_SITE = https://mosh.mit.edu/

Then Buildroot appends the archive filename to that, and the archive
filename can be specified with:

    MOSH_SOURCE = mosh-$(MOSH_VERSION).tar.gz

But since that's the default, there's no need to specify it; so only
keep the _SITE variable.

Sorry for asking an Nth iteration... :-/

Regards,
Yann E. MORIN.

> +MOSH_DEPENDENCIES = zlib ncurses protobuf openssl
> +MOSH_LICENSE = GPLv3+ with exception
> +MOSH_LICENSE_FILES = COPYING COPYING.iOS
> +
> +$(eval $(autotools-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
