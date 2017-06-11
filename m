From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Jun 2017 22:47:59 +0200
Subject: [Buildroot] [PATCH]Libssp support
In-Reply-To: <AM3PR05MB433129DCBFFC30EBA0588EBC9CC0@AM3PR05MB433.eurprd05.prod.outlook.com>
References: <AM3PR05MB433972636565D3B639BB0BAC9C80@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170607201316.jkzcuamoovnbkcla@tarshish>
 <AM3PR05MB433D9ACAA63A9ED51BBFF7EC9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608121224.vrmjd5zxulhu57h7@tarshish>
 <AM3PR05MB4333F3A6ACA381824BCE787C9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608231505.0ab8924c@free-electrons.com>
 <AM3PR05MB433129DCBFFC30EBA0588EBC9CC0@AM3PR05MB433.eurprd05.prod.outlook.com>
Message-ID: <1ce3b240-ec5f-4542-0186-adaa8ac95dd7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Guy,

 [Please don't top-post, but reply in-line, like I do now.]

On 11-06-17 10:55, Guy Benyei wrote:
> Hi Thomas,
> I checked the issue, and here are my findings:
> Libssp is used by gcc, only when the gcc_cv_libc_provides_ssp gcc configuration flag is set to "no".  In buildroot, this flag is set as:
> 
> 	HOST_GCC_COMMON_MAKE_OPTS = \
> 		gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> 
> For glibc SSP support is enabled by default, and BR2_TOOLCHAIN_HAS_SSP is set. Same goes for musl, except for some specific architectures. uClibc sets BR2_TOOLCHAIN_HAS_SSP only is it's configured to support SSP.

> All in all, it only makes sense to build and install libssp if the C library
> doesn't support SSP, i.e.: BR2_TOOLCHAIN_HAS_SSP is set to "n".

 It's a little more complicated than that - BR2_TOOLCHAIN_HAS_SSP should be set
when -fstack-protector works with this toolchain. In other words, if you make a
patch that uses gcc's libssp, then this symbol should be selected.

 So you need to introduce a new symbol (e.g. BR2_LIBC_HAS_SSP) that is set by
the libc, and use gcc's libssp if it is not set. The internal toolchain should
then always set BR2_TOOLCHAIN_HAS_SSP.

 All in all, a fairly complicated patch, I'm afraid. When you post something
we'll provice feedback on how it should be improved.

 Regards,
 Arnout

> I'll send out an updated patch soon.



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
