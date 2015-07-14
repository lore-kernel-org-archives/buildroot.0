From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jul 2015 13:33:55 +0200
Subject: [Buildroot] [PATCH] qpid-proton: needs host python 2
In-Reply-To: <8442e9d6be96eb9a8c4165024e98ce38e7de1a6f.1436872438.git.baruch@tkos.co.il>
References: <8442e9d6be96eb9a8c4165024e98ce38e7de1a6f.1436872438.git.baruch@tkos.co.il>
Message-ID: <20150714113355.GA26192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-14 14:13 +0300, Baruch Siach spake thusly:
> qpid-proton uses Python as part of its build system. Only Python 2 is
> currently supported.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bdf/bdf94981b52dc3a04fd21ff770a0a20d883bb1c3/
> http://autobuild.buildroot.net/results/669/66964a00e44502ae00d5348a5ca2b632c729a417/
> http://autobuild.buildroot.net/results/30d/30d2fed1149857b11375f2801f522a84f441fc1e/
> 
> and more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/qpid-proton/qpid-proton.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
> index eae4589bf538..d21609d29776 100644
> --- a/package/qpid-proton/qpid-proton.mk
> +++ b/package/qpid-proton/qpid-proton.mk
> @@ -12,6 +12,7 @@ QPID_PROTON_LICENSE_FILES = LICENSE
>  QPID_PROTON_INSTALL_STAGING = YES
>  QPID_PROTON_DEPENDENCIES = \
>  	util-linux \
> +	host-python \

This simply can't work, because the offending .py scripts are using a
hard-coded sha-bang:
    #!/usr/bin/python

So, even though we'd now have $(HOST_DIR)/usr/bin/python that is a
python2, the scripts would still be calling the host's python, not ours.

I'm already working on fixing all of those...

Regards,
Yann E. MORIN.

>  	$(if $(BR2_PACKAGE_OPENSSL),openssl)
>  QPID_PROTON_CONF_OPTS = \
>  	-DBUILD_JAVA=OFF \
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
