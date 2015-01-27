From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jan 2015 22:13:08 +0100
Subject: [Buildroot] [PATCH] toolchain/external: do not accept
 distro-class toolchains
In-Reply-To: <1422225691-15930-1-git-send-email-yann.morin.1998@free.fr>
References: <1422225691-15930-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <54C7FF64.3030501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/15 23:41, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 3121da4..61a3639 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -347,6 +347,11 @@ check_unusable_toolchain = \
>  		echo "them unsuitable as external toolchains for build systems" ; \
>  		echo "such as Buildroot." ; \
>  		exit 1 ; \
> +	fi; \
> +	with_sysroot=`$${__CROSS_CC} -v 2>&1 |sed -r -e '/.* --with-sysroot=([^[:space:]]+)[[:space:]].*/!d; s//\1/'`; \
> +	if test "$${with_sysroot}"  = "/" ; then \
> +		echo "Distribution toolchains are unsuitable for use by Buildroot," ; \
> +		echo "as they were configured in a way that makes them non-relocatable."; \

 This sounds as if the problem is that the binary can't be moved to a different
place. But for pre-installed external toolchains, we don't do that.

 But I guess the real problem is that we can't copy the libs to the staging dir,
right? So perhaps that should be written in this remark.

 Regards,
 Arnout

>  	fi
>  
>  #
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
