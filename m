From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Apr 2015 18:15:51 -0300
Subject: [Buildroot] [PATCH] strongswan: needs atomics
In-Reply-To: <20150408224028.1c419e88@free-electrons.com>
References: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>	<20150408212227.615c05a2@free-electrons.com>	<55258D3D.9070800@zacarias.com.ar>
 <20150408224028.1c419e88@free-electrons.com>
Message-ID: <55259A87.7050504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2015 05:40 PM, Thomas Petazzoni wrote:

> Does BR2_ARCH_HAS_ATOMICS says if the HW itself has atomics or if
> generally atomic operations are available in the compiler? I would say
> the latter, since this is actually what we care about.
> 
> But atomic handling is clearly an area that requires some
> clarification, as there are still some autobuilder failures that we are
> not able to solve due to bad handling of atomic related dependencies.

I'd venture to say the first (hardware has atomics) - that's what it
means right now because:

1) We don't handle libatomic, which is the fallback if HW doesn't do it.
This would entail adding LIBS="-latomic" for autotools packages, and
things are magically fixed.

2) We don't copy libatomic (patches sent), so we can't do 1 just yet.

So basically we should rename the whole thing.
BR2_ARCH_HAS_ATOMICS isn't precise, we need to formulate this probably
as BR2_ARCH_NEEDS_LIBATOMIC since AFAIK the fallback is mandatory, while
copying it for the toolchains.
We could have BR2_TOOLCHAIN_HAS_ATOMICS to point towards
toolchains/architectures that don't provide atomics and a fallback.
It also means that packages that were previously excluded can, in fact,
be used anyway as long as libatomic is thrown to the mix.

Regards.
