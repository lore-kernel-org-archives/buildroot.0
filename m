From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jan 2015 22:07:19 +0100
Subject: [Buildroot] [PATCH v2 2/2] python-jinja2: allow build as
	host-package
In-Reply-To: <1422293158-26124-2-git-send-email-erico.nunes@datacom.ind.br>
References: <1422293158-26124-1-git-send-email-erico.nunes@datacom.ind.br>
 <1422293158-26124-2-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <54C7FE07.4030206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/15 18:25, Erico Nunes wrote:
> Jinja2 is a general purpose templating language for python and can be
> required during build time for python scripts that generate code.
> 
> While currently there are no in-tree Buildroot packages which depend on
> host-python-jinja2, I'm currently having to deal with a proprietary
> software build system that requires it.

 Forgot to mention in my last review: in that case, you should also add a
Config.in.host for it (and update package/Config.in.host).


> I have tested that it builds and works correctly as a host python
> package for a Buildroot host-python and someone else might require it,
> so I'm proposing its inclusion.
> 
> python-jinja2 for target builds fine without python-markupsafe as a
> build dependency, but when building host-python-jinja2 without
> host-python-markupsafe installed, the python package manager tries to
> download and install it.

 Good explanation! :-)

 However, this should probably be added as a comment in the .mk file as well -
perhaps a bit shorter, e.g.:

# In host build, setup.py tries to download markupsafe if it is not installed


 Regards,
 Arnout

> To avoid that and install host-python-markupsafe properly through
> Buildroot, the host build dependency is needed. Host support for
> python-markupsafe was submitted in a previous patch from this patchset.
> 
> Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
> ---
>  package/python-jinja2/python-jinja2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 49625e3..2105f3a 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -10,5 +10,7 @@ PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
>  PYTHON_JINJA2_SETUP_TYPE = setuptools
>  PYTHON_JINJA2_LICENSE = BSD-3c
>  PYTHON_JINJA2_LICENSE_FILES = LICENSE
> +HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
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
