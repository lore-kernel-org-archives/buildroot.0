From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 21:00:16 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: fix detection of __atomic_*()
 built-ins
In-Reply-To: <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <56BB96D0.4040901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 16:33, Carlos Santos wrote:
[snip]
> +#
> +# On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
> +# types are available built-in. However, the __atomic_*() built-ins for
> +# 8-byte types is implemented via libatomic, so only available since gcc
> +# 4.8.
> +#
> +# In Buildroot, to simplify things, we've decided to simply require gcc
> +# 4.8 as soon as the architectures has at least one __atomic_*() built-in
> +# variant that requires libatomic.
> +#
> +# Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
> +# *could* technically build with gcc 4.7. This is probably not a big deal,
> +# and we can live with requiring gcc 4.8 on PowerPC to build protobuf. 
> +#
>  # host-protobuf only builds on certain architectures
>  config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_arm
> -	default y if BR2_i386
> -	default y if BR2_mipsel
> -	default y if BR2_x86_64

 Sorry for my confusion, but why do you remove these? It will still work with
gcc 4.7 on arm, i386, mipsel and x86_64 because it will use its custom atomic
implementation, no?


 Regards,
 Arnout

> +	default y if BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
