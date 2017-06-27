From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jun 2017 23:41:44 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: skip ld-musl
 symlink on static build
In-Reply-To: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
References: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
Message-ID: <da672995-8d97-3657-627d-65b30e71a828@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Baruch,

On 27-06-17 19:57, Baruch Siach wrote:
> Static build with external musl toolchain leaves a dangling symlink to
> libc.so. Don't create that symlink on static build.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 826934505e20..8460e37d095f 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -475,7 +475,7 @@ endef
>  # With the musl C library, the libc.so library directly plays the role
>  # of the dynamic library loader. We just need to create a symbolic
>  # link to libc.so with the appropriate name.
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL):$(BR2_STATIC_LIBS),y:)

 This patch conflicts with [1]. Could you combine them in a single series?
Otherwise looks good to me, but it really should be viewed combined with [1].

 Regards,
 Arnout

>  ifeq ($(BR2_i386),y)
>  MUSL_ARCH = i386
>  else ifeq ($(BR2_ARM_EABIHF),y)
> 

[1] http://patchwork.ozlabs.org/patch/780411/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
