From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 May 2018 16:15:58 +0200
Subject: [Buildroot] [PATCH] package/nss-myhostname: Add package
In-Reply-To: <1527168341-29387-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1527168341-29387-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <e0451708-c948-a55e-2839-9ae2be5f1ea8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vincent,

 In addition to Peter's comments...

On 24-05-18 15:25, Vincent Prince wrote:
> Also fix nss-mdns hook to work with nss-myhostname
> 
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
[snip]
> diff --git a/package/nss-myhostname/Config.in b/package/nss-myhostname/Config.in
> new file mode 100644
> index 0000000..968b911
> --- /dev/null
> +++ b/package/nss-myhostname/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_NSS_MYHOSTNAME
> +	bool "nss-myhostname"
> +    depends on !BR2_PACKAGE_SYSTEMD_MYHOSTNAME

 My guess is that this will needs nsswitch, right? So I guess it will need

	depends on BR2_TOOLCHAIN_USES_GLIBC

like nss-mdns, and also the "nss-myhostname needs a glibc toolchain" comment.

> +	help
> +		Name Service Switch module for resolving the local hostname
> +
> +		http://0pointer.de/lennart/projects/nss-myhostname
> diff --git a/package/nss-myhostname/nss-myhostname.hash b/package/nss-myhostname/nss-myhostname.hash
> new file mode 100644
> index 0000000..9e33bec
> --- /dev/null
> +++ b/package/nss-myhostname/nss-myhostname.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256  2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2 nss-myhostname-0.3.tar.gz
> diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
> new file mode 100644
> index 0000000..153e1d0
> --- /dev/null
> +++ b/package/nss-myhostname/nss-myhostname.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +## nss-myhostname
> +#
> +#################################################################################
> +
> +NSS_MYHOSTNAME_VERSION = 0.3
> +NSS_MYHOSTNAME_SITE = http://0pointer.de/lennart/projects/nss-myhostname
> +NSS_MYHOSTNAME_LICENSE = LGPL-2.1

 It has the "or later" clause, so LGPL-2.1+

> +NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
> +NSS_MYHOSTNAME_AUTORECONF = YES
> +
> +define MYHOSTNAME_SET_NSSWITCH
> +    $(SED) '/^hosts:/s/\s*\<myhostname\>//' \

 If you use -e, use it everywhere for symmetry.

> +		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' -r $(TARGET_DIR)/etc/nsswitch.conf

 -r is not what we usually use, we use -E. However, the regex looks wrong to me
with -E, it should then be an unquoted (, no?

 Also, if the patterns contain /, use a different delimiter, we usually use ,
So something like:

 	$(SED) -E -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's,(^hosts:.*)(\<files\>)(.*)(\<dns\>),\1\2 myhostname \3\4,' \
 		$(TARGET_DIR)/etc/nsswitch.conf

 Regards,
 Arnout

> +endef
> +
> +NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
