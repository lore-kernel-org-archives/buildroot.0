From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jan 2015 00:58:40 +0100
Subject: [Buildroot] [PATCH 1/3] python-jinja2: add python-markupsafe as
 dependency
In-Reply-To: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <54C431B0.4090304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/23/15 21:58, Erico Nunes wrote:
> BR2_PACKAGE_PYTHON_JINJA2 selects the BR2_PACKAGE_PYTHON_MARKUPSAFE
> option but doesn't depend on it in python-jinja2.mk.
> 
> This turned in an error in an attempt to build python-jinja2 for host:
> "No local packages or download links found for markupsafe"
> 
> Adding the python-markupsafe fixes this error and also ensures that it
> builds before python-jinja2 in any case.

 I've tested it and python-jinja2 builds fine without python-markupsafe.

 It is true that host-python-jinja2 does depend on host-python-markupsafe
(otherwise it will try to download it and we want to avoid that). But then you
should add

HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe

to patch 3/3.


 Regards,
 Arnout

> 
> Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
> ---
>  package/python-jinja2/python-jinja2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 49625e3..01f743b 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -10,5 +10,6 @@ PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
>  PYTHON_JINJA2_SETUP_TYPE = setuptools
>  PYTHON_JINJA2_LICENSE = BSD-3c
>  PYTHON_JINJA2_LICENSE_FILES = LICENSE
> +PYTHON_JINJA2_DEPENDENCIES = python-markupsafe
>  
>  $(eval $(python-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
