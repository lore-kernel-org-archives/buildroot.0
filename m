From: Guy Benyei <guybe@mellanox.com>
Date: Sun, 11 Jun 2017 08:55:33 +0000
Subject: [Buildroot] [PATCH]Libssp support
In-Reply-To: <20170608231505.0ab8924c@free-electrons.com>
References: <AM3PR05MB433972636565D3B639BB0BAC9C80@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170607201316.jkzcuamoovnbkcla@tarshish>
 <AM3PR05MB433D9ACAA63A9ED51BBFF7EC9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608121224.vrmjd5zxulhu57h7@tarshish>
 <AM3PR05MB4333F3A6ACA381824BCE787C9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608231505.0ab8924c@free-electrons.com>
Message-ID: <AM3PR05MB433129DCBFFC30EBA0588EBC9CC0@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
I checked the issue, and here are my findings:
Libssp is used by gcc, only when the gcc_cv_libc_provides_ssp gcc configuration flag is set to "no".  In buildroot, this flag is set as:

	HOST_GCC_COMMON_MAKE_OPTS = \
		gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)

For glibc SSP support is enabled by default, and BR2_TOOLCHAIN_HAS_SSP is set. Same goes for musl, except for some specific architectures. uClibc sets BR2_TOOLCHAIN_HAS_SSP only is it's configured to support SSP.
All in all, it only makes sense to build and install libssp if the C library doesn't support SSP, i.e.: BR2_TOOLCHAIN_HAS_SSP is set to "n". I'll send out an updated patch soon.

Thanks
      Guy

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Friday, June 9, 2017 12:15 AM
To: Guy Benyei <guybe@mellanox.com>
Cc: Baruch Siach <baruch@tkos.co.il>; buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH]Libssp support

Hello,

On Thu, 8 Jun 2017 12:57:17 +0000, Guy Benyei wrote:

> I don't change the gcc end - the ssp support is implemented in gcc 
> anyway, the compiler built with or without the "--disable-libssp" is 
> the same compiler. This change only adds the libssp library, so the 
> ssp feature can be activated. The reason I prefer this over building 
> uClibc with ssp support is that in this case I may choose whether to 
> add the libssp binaries to my image. Changing uClibc, or creating an 
> alternative uClibc with ssp support would require a bigger uClibc or 
> two different builds. I agree, that the patch should be enhanced in 
> order to take in account the buildroot configuration, probably by 
> adding a separate configuration item. Of course, I'am ready to do this 
> work, but as you said, I'll have to convince the maintainers that this 
> feature is worth to be added.

On my side, as long as there is a proper patch to support SSP support at the compiler level, in addition to at the C library, I think I'd be fine with applying it.

However, it has to be a proper patch, that makes sure SSP support can only be enabled either at the compiler level *or* at the C library level. For example, I'm not sure if you can disable SSP support in musl or glibc, and what happens if you have SSP support in both the C library and gcc's libssp. All those questions have to be answered in the commit log of such a patch.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
