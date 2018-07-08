From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 11:57:02 +0200
Subject: [Buildroot] [PATCH 5/5] check-package: detect the use of ${} in
 .mk files
In-Reply-To: <20180708051701.3153-5-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
 <20180708051701.3153-5-ricardo.martincoski@gmail.com>
Message-ID: <bd78682a-51ec-2f47-6b54-e86bfa857699@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 07:17, Ricardo Martincoski wrote:
> And warn to use $() instead.
> For examples see [1] and [2].
> 
> In the regexp, search for ${VARIABLE} but:
>  - ignore comments;
>  - ignore variables to be expanded by the shell "$${}";

 Theoretically, we should check for $$${} but I don't think the extra complexity
is warranted.

>  - do not use \w as it would give false warnings for this sed contruct
>    in mesa3d-headers.mk: 's:@includedir@:${prefix}/include:'.

 This is actually a bug in mesa3d-headers.mk!

 Yann, you introduced this more than 3 years ago in 7468b60e7c7fe7f. It clearly
can never have worked, since the /usr bit would be missing from the paths. Of
course, libdir and includedir aren't really needed in the pc file since they're
the default, but wouldn't the dridriver dir be needed?

 For the convenience of people trying to make sense of what I'm writing, here's
the relevant bit of mesa3d-headers.mk:

define MESA3D_HEADERS_BUILD_DRI_PC
        sed -e 's:@\(exec_\)\?prefix@:/usr:' \
            -e 's:@libdir@:${exec_prefix}/lib:' \
            -e 's:@includedir@:${prefix}/include:' \
            -e 's:@DRI_DRIVER_INSTALL_DIR@:${libdir}/dri:' \
            -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
            -e 's:@DRI_PC_REQ_PRIV@::' \
            $(@D)/src/mesa/drivers/dri/dri.pc.in \
            >$(@D)/src/mesa/drivers/dri/dri.pc
endef

 And this is the resulting dri.pc file:

prefix=/usr
exec_prefix=/usr
libdir=/lib
includedir=/include
dridriverdir=/dri

Name: dri
Description: Direct Rendering Infrastructure
Version: 18.1.3
Requires.private:
Cflags: -I${includedir}



 I think using \w would actually be better, because we do have lowercase make
variables and macros, and we want to catch them as well.


 Otherwise LGTM so you can add my
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
once it has the \w.

 Regards,
 Arnout

> 
> [1] http://lists.busybox.net/pipermail/buildroot/2018-July/225211.html
> [2] https://github.com/buildroot/buildroot/commit/36305380db1312442623128689fe5067d9058381
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> With only this patch applied:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/80161018
> ---
>  utils/checkpackagelib/lib_mk.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 86e9aa2d97..423e592de1 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -251,3 +251,13 @@ class UselessFlag(_CheckFunction):
>                      "({}#_infrastructure_for_autotools_based_packages)"
>                      .format(self.filename, lineno, self.url_to_manual),
>                      text]
> +
> +
> +class VariableWithBraces(_CheckFunction):
> +    VARIABLE_WITH_BRACES = re.compile(r"^[^#].*[^$]\${[A-Z0-9_]+}")
> +
> +    def check_line(self, lineno, text):
> +        if self.VARIABLE_WITH_BRACES.match(text.rstrip()):
> +            return ["{}:{}: use $() to delimit variables, not ${{}}"
> +                    .format(self.filename, lineno),
> +                    text]
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
