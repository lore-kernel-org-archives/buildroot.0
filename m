From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Jun 2012 08:00:40 -0300
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <20120627000701.506f534e@skate>
References: <20120627000701.506f534e@skate>
Message-ID: <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-06-26 19:07, Thomas Petazzoni wrote:

> Hello,

Hi Thomas.

> So I've created a package for libtirpc, which after a few fixes, 
> seems
> to work fine. But now, the hard part is how to handle this new 
> package
> in terms of dependencies, and this is where I'd like to have your
> opinion.

How big is libtirpc in the target? Curiosity :)

> I have essentially two problems:
>
>  *) Should we consider libtirpc just an add-on for (e)glibc, and
>     therefore make it visible/available/used only when a (e)glibc
>     toolchain lacking RPC support is used, or instead, should we 
> offer
>     libtirpc as soon as the toolchain lacks RPC support (which would
>     also be the case for uClibc toolchain with no RPC support from 
> the
>     C library) ?

I'd say while we're working at it we could do it for uClibc as well 
since it provides benefits which (probably) also apply to uClibc's RPC.

>  *) Should we make the dependency from packages on libtirpc a
>     "select", like all other library dependencies, or a "depends on", 
> to
>     mimic what we currently do for RPC support (packages "depends on
>     BR2_INET_RPC", and they show a comment if BR2_INET_RPC isn't
>     available) ?

Probably keep it as a "depends on", in some cases you'll already have 
the toolchain providing RPC.
Maybe even block libtirpc if the origin toolchain has RPC support? Or 
can they be used at the same time? (Not that anyone would want too i 
think...)

>  *) How to handle the case of the Crosstool-NG backend? With the
>     current Crosstool-NG backend, we have no idea which version of
>     (e)glibc is being built, so we have no idea whether RPC support
>     will be provided by the toolchain. Should we add a config option
>     saying "My toolchain will have RPC support", which we will then
>     check after the toolchain build, like we do with external
>     toolchains? Other suggestions?

BR2_TOOLCHAIN_I_WANT_RPC ?
After the toolchain is done we do an RPC check with readelf, if it's 
not there we build libtirpc, otherwise we leave it be.
Regards.
