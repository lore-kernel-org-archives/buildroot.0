From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Mar 2015 23:39:31 +0100
Subject: [Buildroot] [PATCH v5 2/3] python-cheetah: add host-package
	support
In-Reply-To: <1426011874-11011-2-git-send-email-gwenj@trabucayre.com>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
 <1426011874-11011-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <54FF72A3.4040701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/15 19:24, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some packages, like GNURadio for VOLK, needs cheetah on host at buildtime.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v3 -> v4:
>  * use HOST_PYTHON_CHEETAH_DEPENDENCIES instead of PYTHON_CHEETAH_DEPENDENCIES
>  * suppress '+' for dependency definition
> ---
>  package/python-cheetah/python-cheetah.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
> index 08076b5..3155951 100644
> --- a/package/python-cheetah/python-cheetah.mk
> +++ b/package/python-cheetah/python-cheetah.mk
> @@ -9,5 +9,7 @@ PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
>  PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
>  PYTHON_CHEETAH_LICENSE = MIT
>  PYTHON_CHEETAH_SETUP_TYPE = setuptools
> +HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown

 This should probably carry a comment to remember what you explained in an
earlier mail, e.g.:

# Runtime dependency on markdown is not expressed in Config.in for host package

and perhaps a fuller explanation in the commit log (explaining that setuptools
will download it if it can't be found).



 BTW, Thomas, when you committed python-cheetah you removed the runtime
dependency on markdown because there are some examples you can run without
markdown. Is that the way we work? The cheetah package itself declares a
dependency on markdown because one of its classes (Filters.Markdown) uses it. Of
course, as long as you don't use that particular filter, there won't be a
problem. But it feels weird to me that we remove a dependency that is claimed by
a package, unless there is a good reason for it (and I don't count saving 260K
of .pyc files as a good enough reason).


 Regards,
 Arnout

>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
