From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 16:57:01 +0100
Subject: [Buildroot] [PATCH 3/4] luajit: only available on x86(-64) hosts
In-Reply-To: <20171102104520.29257-4-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-4-peter@korsgaard.com>
Message-ID: <0ebec9aa-305f-68cf-6ae6-8ff8781b4346@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 11:45, Peter Korsgaard wrote:
> The -m32 compiler flag is used for 32bit builds and host-luajit has limited
> architecture support, so limit to x86(-64) hosts.

 I really don't see why this is needed. What we need is that the host and target
bitness is the same. On x86_64, we can always do this by compiling with -m32
(which is what we do in the .mk file). But I see no reason at all why building
for a 32-bit target would not be possible on ARM, MIPS or PowerPC (32-bit).

 That said, we can't easily test that and nobody cares anyway, so I've committed
with an updated commit message.

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/luajit/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 1a27c434e1..6b9c6e6ae8 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,5 +1,8 @@
>  config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	bool
> +	# -m32 flag is used for 32bit builds and host-luajit has
> +	# limited architecture support
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	default y if BR2_i386 || \
>  		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
>  		BR2_powerpc || BR2_arm || BR2_armeb || \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
