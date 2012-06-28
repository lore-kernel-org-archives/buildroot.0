From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jun 2012 13:57:44 +0200
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <4FEC453F.3050309@zacarias.com.ar>
References: <20120627000701.506f534e@skate>
 <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
 <20120627145340.34895a74@skate> <4FEC453F.3050309@zacarias.com.ar>
Message-ID: <20120628135744.09fc059f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 28 Jun 2012 08:51:27 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> > Yes, as I was mentionning in my initial e-mail, I was thinking of
> > having something like:
> > 
> > config BR2_RPC_AVAILABLE
> > 	bool
> > 
> > config BR2_TOOLCHAIN_HAS_NATIVE_RPC
> > 	select BR2_RPC_AVAILABLE
> > 	bool
> > 
> > 
> > Toolchains having native RPC support (i.e uClibc with RPC support, or
> > glibc < 2.14) would select BR2_TOOLCHAIN_HAS_NATIVE_RPC Then, the
> > libtirpc package would:
> > 
> > config BR2_PACKAGE_LIBTIRPC
> > 	bool "libtirpc"
> > 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> > 	select BR2_RPC_AVAILABLE
> > 	select
> > 
> > But now, the question is for packages that need RPC support. We have
> > two choices. First, like today, the user has to manually enable RPC
> > support in the toolchain *OR* manually enable libtirpc.
> > 
> > config BR2_PACKAGE_FOO
> > 	depends on BR2_RPC_AVAILABLE
> > 
> > comment "foo needs RPC support, either in toolchain or through libtirpc"
> > 	depends on !BR2_RPC_AVAILABLE
> > 
> > Or, we can automatically select libtirpc if needed:
> > 
> > config BR2_PACKAGE_FOO
> > 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> > 
> > and no comment is needed, because if the toolchain has no RPC support,
> > it would automatically be handled by libtirpc.
> > 
> > Which one do you prefer?
> 
> I prefer the last option, otherwise users will have RPC options all
> around instead of one place (toolchain vs. packages).

Hm? Not sure to understand what you mean here.

Regardless of whether my option (1) or my option (2) is chosen, the
number of options will be the same. It is just that:

 With option (1), if the toolchain does not have native RPC support,
 then all packages that need RPC support will immediately be visible,
 and will automatically select the libtirpc package. So it's fully
 transparent for users.

 With option (2), if the toolchain does not have native RPC support,
 then all packages that need RPC support will be hidden, and the user
 will have to enable the libtirpc package to see them.

So really, even with option (1) there is no such thing as "RPC options
all around instead of one place".

Note: by this, I am not implying that I have a preference for option
(1), I am just explaining a bit more, because it seems we're not
seeing the same thing :)

> >> BR2_TOOLCHAIN_I_WANT_RPC ?
> >> After the toolchain is done we do an RPC check with readelf, if it's 
> >> not there we build libtirpc, otherwise we leave it be.
> > 
> > Hardly doable: we need to know at menuconfig time if we need libtirpc
> > in order to keep the .config selection consistent. If you don't, things
> > like "make source" or "make external-deps" will not work any more (they
> > will not know that libtirpc is needed).
> 
> True.
> From what i've seen it seems libtirpc can be built/used with a
> rpc-enabled libc.
> We just need a few package tweaks around.
> nfs-utils has a configure option to use it (--enable-tirpc) so it's easy.
> portmap has not, though rpcbind (new package) should be used with
> libtirpc, so portmap is libc-rpc or rpcbind if libtirpc but not both.

Do we want to support that? I guess what you meant is that regardless
of whether the toolchain has RPC support we can always enable
libtirpc, so that in the ct-ng backend case we don't have to worry
about this?

Ultimately, this is what will probably happen: RPC support will no
longer be seen as a toolchain capability, but just as a normal library.
But we're not there yet.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
