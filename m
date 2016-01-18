From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Jan 2016 18:56:56 +0100
Subject: [Buildroot] [PATCH v3 2/4] package/dhcp: add bind configure
 options for cross compiling
In-Reply-To: <1453131741-1613-3-git-send-email-rdkehn@yahoo.com>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
 <1453131741-1613-3-git-send-email-rdkehn@yahoo.com>
Message-ID: <569D2768.9070208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-01-16 16:42, Doug Kehn wrote:
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
> Changes v2 -> v3
>   - removed RFC tag
> Changes v1 -> v2
>   - no changes
> ---
>  package/dhcp/0001-bind-configure.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/dhcp/0001-bind-configure.patch
> 
> diff --git a/package/dhcp/0001-bind-configure.patch b/package/dhcp/0001-bind-configure.patch
> new file mode 100644
> index 0000000..9a38f45
> --- /dev/null
> +++ b/package/dhcp/0001-bind-configure.patch
> @@ -0,0 +1,19 @@
> +add bind configure options for cross compiling
> +
> +Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> +
> +Index: dhcp-4.3.3-P1/bind/Makefile.in
> +===================================================================
> +--- dhcp-4.3.3-P1.orig/bind/Makefile.in
> ++++ dhcp-4.3.3-P1/bind/Makefile.in
> +@@ -30,7 +30,9 @@ bindconfig = --disable-kqueue --disable-
> + 	--without-openssl --without-libxml2 --enable-exportlib \
> + 	--with-gssapi=no --enable-threads=no @BINDCONFIG@ \
> + 	--with-export-includedir=${binddir}/include \
> +-	--with-export-libdir=${binddir}/lib
> ++	--with-export-libdir=${binddir}/lib \
> ++	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
> ++	--build=$(GNU_HOST_NAME) --with-randomdev=/dev/urandom

 I think the --target, --host and --build parts are upstreamable.

 However, the --with-randomdev certainly is not upstreamable in its current
form. It should probably use ac_cv_file__dev_random to decide.

 BTW we have a bit of an inconsistency here: in dhcp, we choose /dev/random but
in bind we choose /dev/urandom.

 Note that if we call configure explicitly in a POST_CONFIGURE_HOOK, then this
patch is not needed (although the --target, --host, --build stuff is of course
still interesting to improve its cross-compilation support).

 Regards,
 Arnout

> + 
> + @BIND_ATF_FALSE at cleandirs = ./lib ./include
> + @BIND_ATF_TRUE at cleandirs = ./lib ./include ./atf
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
