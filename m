From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Jun 2017 12:15:41 +0200
Subject: [Buildroot] [PATCH v3] rauc: new package
In-Reply-To: <20170629190811.16930-1-yurovsky@gmail.com>
References: <20170629205827.086b687a@gmx.net>
 <20170629190811.16930-1-yurovsky@gmail.com>
Message-ID: <9133c20b-8b4d-bf72-6225-ac3f23519971@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andrey,

 Thank you for the quick turnaround on this patch!

On 29-06-17 21:08, Andrey Yurovsky wrote:
> RAUC is the Robust Auto-Update Controller developed by the folks at
> Pengutronix. It supports updating embedded systems from the network
> (ex: HawkBit) or from a disk and provides a d-bus interface.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---

 For future submissions: it is convenient to put a patch history in the commit
log. Put it below a --- line, which causes git-am to remove it when it is
committed to the repository. So you could put here:

---
v2 -> v3:
 - Correct spelling of Pengutronix (Peter)

v1 -> v2:
 - Add myself to DEVELOPERS (Yegor)
 - Add Config.in.host option (Yegor)
 - Add inclusion in package/Config.in and package/Config.in.host (Arnout)
 - Use uploaded tarball instead of automatic one (Arnout)
 - Verified signature of tarball (Arnout)
 - Fix license (LGPL-2.1 instead of GPL-2.1) (Arnout)
 - Convert libcurl and json-glib to automatic dependencies (Arnout)
 - Remove dbus-glib and util-linux(libmount) dependencies (Arnout)
 - Mark dbus as a runtime dependency

[I reconstructed this history because I need it to be able to review the patch.]


 Also, it's convenient to add the people who commented on the patch in Cc, to
motivate them to look at your new version.

 Obviously, no need to spin a v4 for the above. I have a few small fixes still
below, but they can probably be done while applying, so:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


>  DEVELOPERS                  |  3 +++
>  package/Config.in           |  1 +
>  package/Config.in.host      |  1 +
>  package/rauc/Config.in      | 37 +++++++++++++++++++++++++++++++++++++
>  package/rauc/Config.in.host |  9 +++++++++
>  package/rauc/rauc.hash      |  3 +++
>  package/rauc/rauc.mk        | 36 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 90 insertions(+)
>  create mode 100644 package/rauc/Config.in
>  create mode 100644 package/rauc/Config.in.host
>  create mode 100644 package/rauc/rauc.hash
>  create mode 100644 package/rauc/rauc.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e421f4..7600cb5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -95,6 +95,9 @@ F:	package/python-scandir/
>  F:	package/python-simplegeneric/
>  F:	package/python-traitlets/
>  
> +N:  Andrey Yurovsky <yurovsky@gmail.com>
> +F:  package/rauc

 Although the DEVELOPERS syntax doesn't strictly require it, we normally put a /
at the end to make it clear it's a directory.

> +
>  N:	Andy Kennedy <andy.kennedy@adtran.com>
>  F:	package/libunwind/
>  

[snip]
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> new file mode 100644
> index 0000000..6433b82
> --- /dev/null
> +++ b/package/rauc/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_RAUC
> +	bool "rauc"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_DBUS # run-time dependency
> +	help
> +	  RAUC is the Robust Auto-Update Controller developed by
> +	  Pengutronix. It supports updating embedded Linux
> +	  systems over the network or from disks and provides a
> +	  d-bus interface.

 Proper spelling is D-Bus or DBus.

> +
> +	  http://rauc.io/
> +
> +if BR2_PACKAGE_RAUC
> +
> +config BR2_PACKAGE_RAUC_NETWORK
> +	bool "network support"
> +	select BR2_PACKAGE_LIBCURL
> +	help
> +	  This option enables support for updating firmware over
> +	  the network using libcurl.
> +
> +config BR2_PACKAGE_RAUC_JSON
> +	bool "JSON output support"
> +	select BR2_PACKAGE_JSON_GLIB
> +	help
> +	  This option enables support for providing output in
> +	  JSON format.

 We don't usually add sub-options for the different package configuration
options. However, in this case it does indeed make sense:
- they are not really easy to discover for the user;
- it's unlikely that these options will change much in future versions.


 Regards,
 Arnout

> +
> +endif
> +
> +comment "rauc needs a toolchain w/ wchar, threads"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
