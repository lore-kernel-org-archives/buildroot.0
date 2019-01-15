From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jan 2019 21:43:08 +0100
Subject: [Buildroot] [PATCH v2 6/7] tpm2-tools: do not enforce
 dependency on tpm2-abrmd
In-Reply-To: <20190115101522.21042-6-peter@korsgaard.com>
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-6-peter@korsgaard.com>
Message-ID: <20190115204308.GB2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-01-15 11:15 +0100, Peter Korsgaard spake thusly:
> tpm2-tools is commonly used with the resource manager, tpm2-abrmd - But it
> CAN be used without, E.G.  by setting the TPM2TOOLS_TCTI_NAME environment
> variable to communicate directly with the kernel driver:
> 
> export TPM2TOOLS_TCTI_NAME=device
> 
> For some use cases (E.G.  initramfs) it makes sense to use tpm2-tools
> without abrmd, so downgrade the dependency from select to imply, so abrmd is
> enabled by default but can be explicitly disabled.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/tpm2-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index cc87e2a1bf..f4622b4ec9 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_TPM2_TOOLS
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_TPM2_ABRMD # run-time
> +	imply BR2_PACKAGE_TPM2_ABRMD # run-time

Sorry, but I reiterate my position: I don't like the use of 'imply'.

Either the thing is mandatory, in which case we select it or depend on
it, or the thing is optional, in which case we elt the user enable it.

Use of imply does not sound nice to me, because it is not authoritative.
I'm afraid we get reports of users complaining that "sometimes the stuff
is enabled when I do X, while sometmes it is not enabled when I do the
same X.'

The coutner argument has been that we were now trying to make sensible
choices for the user, so that things "work out of the box". My position
is that it is an illusion, because making things "just work" is more
often than not more involving than just enabling a package.

For example, when dealing with TPM and such: keys and certs provisionning
and checking the chain of trust and such is only scratching the surface.
People that want to deal with this topic better know what they *are* doing,
as it is a sensible topic. Those people will have to understand what they
need if they do not already know.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_TPM2_TSS
>  	help
>  	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
> -- 
> 2.11.0
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
