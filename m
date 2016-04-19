From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Apr 2016 23:53:00 +0200
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
Message-ID: <5716A8BC.1060805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/16 20:15, Baruch Siach wrote:
> c-icap adds link time -rpath ${exec_prefix}/lib which defaults to /usr/lib.
> This adds host libraries to the search path

  I think this is actually uncovering a bigger problem.

  -rpath doesn't add the specified library to the compile-time search path. So 
it should be OK in this case.

  However, -rpath _is_ used when ld links against that .so file and finds a 
NEEDED entry there that it doesn't have yet.

  For /usr/lib it's no problem, it can be safely removed. The problem is for 
rpath entries that _are_ necessary: they should still stay, and of course they 
shouldn't refer to the build directory. For example, libdw.so has an RPATH of 
/usr/lib/elfutils, which is used at runtime to dlopen() libebl. Now the problem 
is: if /usr/lib/elfutils exists on the host, we may try to link a target library 
or executable agains a host library that is there. For elfutils there isn't much 
risk, but there may be others that are more problematic.

  But of course, all that bears no relation to this patch :-)

  Regards,
  Arnout


 > which is bad for cross
> compilation. Direct make exec_prefix variable to staging instead.
>
> Fixes:
> http://autobuild.buildroot.net/results/077/077374329b2782dbb4b4a9ee7af264cdda311ccc/
> http://autobuild.buildroot.net/results/057/057a88179150a4f02990d7b9b0d8f2de3c9da1a3/
> http://autobuild.buildroot.net/results/da6/da62b80989df6b8f1b5557b4987d7a6999d30bb8/
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   package/c-icap/c-icap.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
> index b4defb87379a..40926ea8e5d8 100644
> --- a/package/c-icap/c-icap.mk
> +++ b/package/c-icap/c-icap.mk
> @@ -17,6 +17,7 @@ C_ICAP_CONF_OPTS = \
>   	--without-perl \
>   	--enable-large-files \
>   	--enable-ipv6
> +C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
>
>   ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
>   C_ICAP_CONF_OPTS += --with-berkeleydb
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
