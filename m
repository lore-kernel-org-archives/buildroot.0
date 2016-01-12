From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2016 23:31:44 +0100
Subject: [Buildroot] [PATCH 1/1] pocketsphinx: new package
In-Reply-To: <1452513336-5839-1-git-send-email-yba@tkos.co.il>
References: <1452513336-5839-1-git-send-email-yba@tkos.co.il>
Message-ID: <56957ED0.4080503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-01-16 12:55, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> PocketSphinx is one of Carnegie Mellon University's open source large
> vocabulary, speaker-independent, continuous speech recognition engines.
> 
> PocketSphinx is designed for mobile applications.
> PocketSphinx is a toolkit that uses the Sphinxbase library.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/Config.in                      |    1 +
>  package/pocketsphinx/Config.in         |   16 ++++++++++++++++
>  package/pocketsphinx/pocketsphinx.hash |    3 +++
>  package/pocketsphinx/pocketsphinx.mk   |   23 +++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/pocketsphinx/Config.in
>  create mode 100644 package/pocketsphinx/pocketsphinx.hash
>  create mode 100644 package/pocketsphinx/pocketsphinx.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 41faddd..b4470fc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1206,6 +1206,7 @@ endif
>  	source "package/netbsd-queue/Config.in"
>  	source "package/orc/Config.in"
>  	source "package/p11-kit/Config.in"
> +	source "package/pocketsphinx/Config.in"
>  	source "package/poco/Config.in"
>  	source "package/protobuf/Config.in"
>  	source "package/protobuf-c/Config.in"
> diff --git a/package/pocketsphinx/Config.in b/package/pocketsphinx/Config.in
> new file mode 100644
> index 0000000..b6666c1
> --- /dev/null
> +++ b/package/pocketsphinx/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_POCKETSPHINX
> +	bool "pocketsphinx"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_SPHINXBASE
> +	help
> +	  PocketSphinx is one of Carnegie Mellon University's open
> +	  source large vocabulary, speaker-independent, continuous
> +	  speech recognition engine.
> +
> +	  http://cmusphinx.sourceforge.net/
> +
> +comment "pocketsphinx needs a toolchain with threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "pocketsphinx depends on sphinxbase"
> +	depends on !BR2_PACKAGE_SPHINXBASE

 This comment is not needed.

> diff --git a/package/pocketsphinx/pocketsphinx.hash b/package/pocketsphinx/pocketsphinx.hash
> new file mode 100644
> index 0000000..9815d98
> --- /dev/null
> +++ b/package/pocketsphinx/pocketsphinx.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 34c4d218bbb8c5bb85622909426a137fe89140ea2e35c65e84fe3ccc42356a39 pocketsphinx-5prealpha.tar.gz
> +
> diff --git a/package/pocketsphinx/pocketsphinx.mk b/package/pocketsphinx/pocketsphinx.mk
> new file mode 100644
> index 0000000..27e66d5
> --- /dev/null
> +++ b/package/pocketsphinx/pocketsphinx.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# pocketsphinx
> +#
> +################################################################################
> +
> +# At the time of this submission (20160110) the github cmusphinx/pocketsphinx
> +# commit 9ee2fc6f83ed8a1d19ffee689ee3c6c48a8c4d58 does not build successfully
> +# and the rep contains no 5prealpha or other tags, so we use the SourceForge
> +# sources.

 Sourceforge is also the official source for this package, and it has an
uploaded tarball (github doesn't). So this comment is not really needed IMHO.

> +POCKETSPHINX_VERSION = 5prealpha
> +POCKETSPHINX_SITE = http://downloads.sourceforge.net/project/cmusphinx/pocketsphinx/$(POCKETSPHINX_VERSION)
> +POCKETSPHINX_SOURCE = pocketsphinx-$(POCKETSPHINX_VERSION).tar.gz

 This is the defualt, you can leave it out.

> +POCKETSPHINX_AUTORECONF = YES

 Why is this needed? The tarball contains configure and Makefile.in, and you
don't have patches.

> +POCKETSPHINX_LICENSE = MIT

 It's BSD-2c, no?

> +# The license is contained in the copyright notice at the top of each source
> +# file. There is no specific file with a general license notice.
> +POCKETSPHINX_LICENSE_FILES = 

 Then you should take one of the source files, e.g. one of the smaller ones,
src/libpocketsphinx/kws_detections.h - but do keep this comment.

 Could you also report this problem upstream? It exists in the repo, so they
just forgot to add it to the tarball.


 Regards,
 Arnout

> +POCKETSPHINX_CONF_OPTS = --without-python
> +POCKETSPHINX_INSTALL_STAGING = YES
> +POCKETSPHINX_DEPENDENCIES = sphinxbase
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
