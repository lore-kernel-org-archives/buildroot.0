From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 11:41:20 +0100
Subject: [Buildroot] [PATCH v2 11/15] python2: generate reproducible .pyc
In-Reply-To: <1479460224-6119-12-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-12-git-send-email-jezz@sysmic.org>
Message-ID: <b6bad468-9690-bf8d-1d7e-d3913f85cb91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> .pyc files contain modification time of .py source. In order to make
> build reproducible, we fix modification time of all .py before to
> compile .pyc files.

 I wonder if it is worth doing this globally.

 Normally, the .py file will come out of a tarball, so it's modification time is
fixed.

 So this is only about generated .py files. How often does that happen? Isn't it
better to deal with that per package?


 Regardless, this patch really does three things so should probably be three
patches:

1. Move the PYTHON_REMOVE_PYC_FILES hunk around. I really prefer this to be a
separate patch where you promise that nothing else change, because review is a
lot more difficult when things move around.

2. Do not remove .pyc if source .py is not present. This is in fact independent
of reproducible builds.

3. Do the fix time.

> 
> In order to guarantee .pyc are regenerated regardless their modification time,
> we remove .pyc before to compile. However, I wonder if it wouldn't be simpler
> to always call compile_all with 'force' flag.

 That would indeed be simpler. But actually, doesn't compile_all recompile
whenever the timestamp has changed? So it will really recompile everything after
you have done the FIX_TIME, because the timestamp has changed... So removing
(and therefore moving the hunk) is not needed.


 Regards,
 Arnout

> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/python/python.mk | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index cc65376..b0ff1fd 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -226,6 +226,26 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
>  
> +# Normally, *.pyc files should not have been compiled, but just in
> +# case, we make sure we remove all of them.
> +# However, do not remove .pyc if source .py is not present.
> +ifneq ($(BR2_PACKAGE_PYTHON_PY_ONLY)$(BR2_REPRODUCIBLE)),)
> +define PYTHON_REMOVE_PYC_FILES
> +	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
> +		sed -z -e s/py$$/pyc/ | \
> +		xargs -0 --no-run-if-empty rm -f
> +endef
> +PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
> +endif
> +
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +define PYTHON_FIX_TIME
> +find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
> +		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
> +endef
> +PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_FIX_TIME
> +endif
> +
>  define PYTHON_CREATE_PYC_FILES
>  	PYTHONPATH="$(PYTHON_PATH)" \
>  	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
> @@ -245,16 +265,6 @@ endef
>  PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
>  endif
>  
> -# Normally, *.pyc files should not have been compiled, but just in
> -# case, we make sure we remove all of them.
> -ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
> -define PYTHON_REMOVE_PYC_FILES
> -	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | \
> -		xargs -0 --no-run-if-empty rm -f
> -endef
> -PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
> -endif
> -
>  # In all cases, we don't want to keep the optimized .pyo files
>  define PYTHON_REMOVE_PYO_FILES
>  	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
