From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 10:40:51 +0100
Subject: [Buildroot] [PATCH] libpjsip: fix static build failures due to
 name clash
In-Reply-To: <1510352189-20531-1-git-send-email-luca@lucaceresoli.net>
References: <1510352189-20531-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <29066e8f-3749-4fa2-2715-f044391b992e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Luca,

On 10-11-17 23:16, Luca Ceresoli wrote:
> Several packages have a similar md5.c file, and each has a function
> named byteReverse(). This generates link errors when building
> statically ("multiple definition of `byteReverse'").
> 
> Fix by applying a patch from upstream:
>   https://trac.pjsip.org/repos/changeset/5688
> 
> Fixes:
>   http://autobuild.buildroot.org/results/5d7/5d72e0f8517a555399978d5a0e9f7efd0a278189/
>   http://autobuild.buildroot.org/results/c47/c47ccbb9b40011cf0d79c7040bed061ddefd9629/
>   http://autobuild.buildroot.org/results/419/419ab2c0e034cc68991281c51caa8271b0fadbab/
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>  .../0001-Fixed-possible-function-name-clash.patch   | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/libpjsip/0001-Fixed-possible-function-name-clash.patch
> 
> diff --git a/package/libpjsip/0001-Fixed-possible-function-name-clash.patch b/package/libpjsip/0001-Fixed-possible-function-name-clash.patch
> new file mode 100644
> index 000000000000..80a05ab50a6c
> --- /dev/null
> +++ b/package/libpjsip/0001-Fixed-possible-function-name-clash.patch
> @@ -0,0 +1,21 @@
> +Index: pjlib-util/src/pjlib-util/md5.c
> +===================================================================

 You forgot to add a commit message and your Sob to the patch.

 Regards,
 Arnout

> +diff --git a/pjproject/pjlib-util/src/pjlib-util/md5.c b/pjproject/pjlib-util/src/pjlib-util/md5.c
> +--- a/pjlib-util/src/pjlib-util/md5.c	(revision 5687)
> ++++ b/pjlib-util/src/pjlib-util/md5.c	(revision 5688)
> +@@ -29,13 +29,13 @@
> + #ifndef HIGHFIRST
> + #define byteReverse(buf, len)	/* Nothing */
> + #else
> +-void byteReverse(unsigned char *buf, unsigned longs);
> ++static void byteReverse(unsigned char *buf, unsigned longs);
> + 
> + #ifndef ASM_MD5
> + /*
> +  * Note: this code is harmless on little-endian machines.
> +  */
> +-void byteReverse(unsigned char *buf, unsigned longs)
> ++static void byteReverse(unsigned char *buf, unsigned longs)
> + {
> +     pj_uint32_t t;
> +     do {
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
