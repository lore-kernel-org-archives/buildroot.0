From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2020 20:57:43 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Analysis
 of build results
In-Reply-To: <BN8PR12MB3330D7EE79CE6EB08E3F2B26A1310@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
 <CAPi7W80bHF=CHbQOoA_h5CJm+nXdiQBZasCJAdeYPnJ97kfdpg@mail.gmail.com>
 <BN8PR12MB3330A6ED2C32729E6833FFEDA15D0@BN8PR12MB3330.namprd12.prod.outlook.com>
 <20200911103913.381a29c6@windsurf.hq.k.grp>
 <BN8PR12MB3330D7EE79CE6EB08E3F2B26A1310@BN8PR12MB3330.namprd12.prod.outlook.com>
Message-ID: <19c5ef98-b775-2dec-480b-d7c897a4e0fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/10/2020 17:16, Alexey Brodkin wrote:
> 
> Hi Thomas, all,
> 
>>> Ok so that happens because of misconfiguration of libstdc++.

[snip]
>> Wouldn't this be normally handled by having a --with-atomic option
>> passed to gcc, which would ensure that the compiler enables -matomic,
>> without having to pass this flag explicitly ?
> 
> Finally I was able to spend some more time on that. So it looks like a kind of
> regression due to https://git.buildroot.org/buildroot/commit/?id=c568b4f37fa6d7f51e6d14d33d7eb75dfe26d7bf
> where we moved "-matomic" from TARGET_ABI to ARCH_TOOLCHAIN_WRAPPER_OPTS.
> 
> The point is (and it could be seen from my previous explanation above) libstdc++ is being built by
> temporary cross-compiler (xgcc) instead of preperly installed wrappers for real tools.
> That's why whatever we put in ARCH_TOOLCHAIN_WRAPPER_OPTS makes no sense, while CFLAGS_FOR_TARGET
> where we add contents of TARGET_ABI do make "xgcc" using "-matomic".
> 
> So far we know what's wrong. The question now what could be a good solution?

 The good solution is to add the -matomic explicitly in host-gcc-final's
CFLAGS_FOR_TARGET.

 Regards,
 Arnout

> Revert offending commit?
> 
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
