From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 May 2016 19:28:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: use host-python
In-Reply-To: <1462275976-31982-1-git-send-email-martin@barkynet.com>
References: <1462275976-31982-1-git-send-email-martin@barkynet.com>
Message-ID: <e0b19e0d-0dfd-9ac8-0891-114cdd416eae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/16 13:46, Martin Bark wrote:
> The ca-certificates Makefile directly calls python and hence does not
> pickup the buildroot host-python.

  Not entirely accurate, I think (didn't check with the autobuild failure 
output, but this is my guess based on the source). I think it does use 
host-python because that comes first in the path. However, at that point, 
host-python is symlinked to python3 instead of python2.

>
> During the build all the Makefile does is execute mozilla/certdata2pem.py.
> Simplify the build process by directly calling this script using
> host-python.

  While you're at it, you could also add a comment to the code why host-python 
is needed (i.e. why system python is not OK). I couldn't find a reference to 
that in the logs. Something like:

# certdata2pem.py needs python2.7 - not python2.6, not python3. So system
# can't be used.

  With that:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
> This fixes:
>  http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
>  http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
>  http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/
>
> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> ---
> Note: to reproduce the auto build errors you need to have python 2.6
> installed on the host.
> ---
>  package/ca-certificates/ca-certificates.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index da1b70d..8a3389f 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -12,7 +12,8 @@ CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
>
>  define CA_CERTIFICATES_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
> +	cd $(@D)/mozilla ;\
> +		$(HOST_DIR)/usr/bin/python2 ./certdata2pem.py
>  endef
>
>  define CA_CERTIFICATES_INSTALL_TARGET_CMDS
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
