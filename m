From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 13:50:17 +0200
Subject: [Buildroot] [PATCH v3 1/2] dependencies: build a host python2
 if no suitable one cane be found
In-Reply-To: <1338674897-1810-1-git-send-email-s.martin49@gmail.com>
References: <1338674897-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <5002AE79.5020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 00:08, Samuel Martin wrote:
> Some distros choose to change the /usr/bin/python binary, make it pointed to
> python3 instead of python2.
>
> This may have some bad consequences for packages that uses some
> non-python3-compliant python scripts in their build system (eg. in install or
> post-install scripts).
>
> This patch checks for a suitable python2 version (2.6 or 2.7) on the host
> system, and declares the following variables:
> - PYTHON2: pointing to the host python2 binary;
> - NEED_PYTHON2: sets to "host-python" if no python2 binary has been found.
>
> This way, a package using some python2 scripts must:
> - adds $(NEED_PYTHON2) to its dependency list;
> - sets $(PYTHON2) as the python binary to be used.
>
> A side effect of this patch is getting rid of any host python. Buildroot can
> runs on a host without python, or with a too old python2 version, or with only
> python3.
>
> Changes since v2:
> - misc. fixes and cleanup
>
> Changes since v1:
> - use support/dependency infrastructure
> - rename some symbols

  The patch changelog should go under the Signed-off-by line, separated with
---

>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


>
>   create mode 100644 support/dependencies/check-host-python2.mk
>   create mode 100755 support/dependencies/check-host-python2.sh
>
> diff --git a/support/dependencies/check-host-python2.mk b/support/dependencies/check-host-python2.mk
> new file mode 100644
> index 0000000..3b66ffc
> --- /dev/null
> +++ b/support/dependencies/check-host-python2.mk
> @@ -0,0 +1,6 @@
> +PYTHON2 = $(call suitable-host-package,python2)
> +
> +ifeq (,$(PYTHON2))

  Minor nit: we always write ifeq ($(PYTHON2),)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
