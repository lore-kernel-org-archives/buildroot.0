From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 21:31:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ca-certificates: depend on
 host-python or host-python3
In-Reply-To: <1462371474-27987-1-git-send-email-martin@barkynet.com>
References: <1462371474-27987-1-git-send-email-martin@barkynet.com>
Message-ID: <a1a2c597-df76-5768-c894-e787d4daefa6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/16 16:17, Martin Bark wrote:
> The ca-certificates Makefile directly calls python but if python3 has been
> selected then it is possible for $(HOST_DIR)/usr/bin/python to not exist
> in the PATH at the time ca-certificates is built.  This means the Makefile
> will use python installed on the build host. If the build hosts python is
> less than python 2.7 then the build will fail.

  I'm not sure if this explanation if very clear...

>
> ca-certificates will build using host-python3. Fix the issue by depending
> on host-python3 if python3 is being used otherwise depend on host-python.
>
> This fixes:
>  http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
>  http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
>  http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/
>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> ---
> Changes v1 -> v2
>  - Depend on host-python or host-python3 instead of directly calling
>    $(HOST_DIR)/usr/bin/python2 (Suggested by Arnout Vandecappelle)
>  - Added comments to ca-certificates.mk (Suggested by Arnout Vandecappelle)
> ---
>  package/ca-certificates/ca-certificates.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index da1b70d..393c8cd 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -7,7 +7,11 @@
>  CA_CERTIFICATES_VERSION = 20160104
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
>  CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20160104T220912Z/pool/main/c/ca-certificates
> -CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
> +CA_CERTIFICATES_DEPENDENCIES = host-openssl
> +# ca-certificates can be built with either python 2 or python 3
> +# but it must be at least python 2.7

  But this explanation definitely is clear, and that's the most important.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout


> +CA_CERTIFICATES_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
>  CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
