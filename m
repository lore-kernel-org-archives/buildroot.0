From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jun 2012 08:51:27 -0300
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <20120627145340.34895a74@skate>
References: <20120627000701.506f534e@skate>
 <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
 <20120627145340.34895a74@skate>
Message-ID: <4FEC453F.3050309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/27/12 09:53, Thomas Petazzoni wrote:

>>>  *) Should we make the dependency from packages on libtirpc a
>>>     "select", like all other library dependencies, or a "depends
>>> on", to
>>>     mimic what we currently do for RPC support (packages "depends on
>>>     BR2_INET_RPC", and they show a comment if BR2_INET_RPC isn't
>>>     available) ?
>>
>> Probably keep it as a "depends on", in some cases you'll already have 
>> the toolchain providing RPC.
>> Maybe even block libtirpc if the origin toolchain has RPC support? Or 
>> can they be used at the same time? (Not that anyone would want too i 
>> think...)
> 
> Yes, as I was mentionning in my initial e-mail, I was thinking of
> having something like:
> 
> config BR2_RPC_AVAILABLE
> 	bool
> 
> config BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 	select BR2_RPC_AVAILABLE
> 	bool
> 
> 
> Toolchains having native RPC support (i.e uClibc with RPC support, or
> glibc < 2.14) would select BR2_TOOLCHAIN_HAS_NATIVE_RPC Then, the
> libtirpc package would:
> 
> config BR2_PACKAGE_LIBTIRPC
> 	bool "libtirpc"
> 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 	select BR2_RPC_AVAILABLE
> 	select
> 
> But now, the question is for packages that need RPC support. We have
> two choices. First, like today, the user has to manually enable RPC
> support in the toolchain *OR* manually enable libtirpc.
> 
> config BR2_PACKAGE_FOO
> 	depends on BR2_RPC_AVAILABLE
> 
> comment "foo needs RPC support, either in toolchain or through libtirpc"
> 	depends on !BR2_RPC_AVAILABLE
> 
> Or, we can automatically select libtirpc if needed:
> 
> config BR2_PACKAGE_FOO
> 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 
> and no comment is needed, because if the toolchain has no RPC support,
> it would automatically be handled by libtirpc.
> 
> Which one do you prefer?

I prefer the last option, otherwise users will have RPC options all
around instead of one place (toolchain vs. packages).

>>>  *) How to handle the case of the Crosstool-NG backend? With the
>>>     current Crosstool-NG backend, we have no idea which version of
>>>     (e)glibc is being built, so we have no idea whether RPC support
>>>     will be provided by the toolchain. Should we add a config option
>>>     saying "My toolchain will have RPC support", which we will then
>>>     check after the toolchain build, like we do with external
>>>     toolchains? Other suggestions?
>>
>> BR2_TOOLCHAIN_I_WANT_RPC ?
>> After the toolchain is done we do an RPC check with readelf, if it's 
>> not there we build libtirpc, otherwise we leave it be.
> 
> Hardly doable: we need to know at menuconfig time if we need libtirpc
> in order to keep the .config selection consistent. If you don't, things
> like "make source" or "make external-deps" will not work any more (they
> will not know that libtirpc is needed).

True.
From what i've seen it seems libtirpc can be built/used with a
rpc-enabled libc.
We just need a few package tweaks around.
nfs-utils has a configure option to use it (--enable-tirpc) so it's easy.
portmap has not, though rpcbind (new package) should be used with
libtirpc, so portmap is libc-rpc or rpcbind if libtirpc but not both.
Others remain to be seen.
Regards.
