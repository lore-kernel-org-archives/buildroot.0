From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 22:15:38 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
Message-ID: <ca5edb67-da78-bf4c-1578-c897a26218c6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 17:06, Thomas Petazzoni wrote:
> Currently, our strategy for the RPATH of host binaries is as follows:
> 
>  - During the build, we force an absolute RPATH to be encoded into
>    binaries, by passing -Wl,-rpath,$(HOST_DIR)/lib. This ensures that
>    host binaries will find their libraries.
> 
>  - In the "make sdk" target, when preparing the SDK to be relocatable,
>    we use patchelf to replace those absolute RPATHs by relative RPATHs
>    that use $ORIGIN.
> 
> Unfortunately, the use of absolute RPATH during the build is not
> compatible with the move to per-package SDK, where a different host
> directory is used for the build of each package. Therefore, we need to
> move to a different strategy for RPATH handling.
> 
> The new strategy is as follows:
> 
>  - During the build, we do not encode any RPATH into the host
>    binaries. Instead, we specify LD_LIBRARY_PATH environment to point
>    to the current HOST_DIR/lib directory (for the package being
>    currently built).
> 
>  - At the end of the build, in order to make sure that binaries are
>    usable without LD_LIBRARY_PATH, we fixup the host binaries to use
>    $ORIGIN/../lib. This is more-or-less what was done previously in
>    the "make sdk" target, except that instead of turning absolute
>    paths into relative paths in the RPATH, we are simply setting the
>    RPATH to $ORIGIN/../lib.
> 
>    In order to implement this, the fix-rpath script logic is adjusted
>    for the "host" case.
> 
> An alternative strategy would have been to keep the
> -Wl,-rpath,$(HOST_DIR) flag, and therefore the absolute RPATH in the
> host binaries, and fix such RPATH at the end of the build of every
> package. However, that would require calling fix-rpath after the
> installation of every package, which is a bit expensive.

 As discussed, this would be the preferred approach after all.

> 
> This change is independent from the per-package SDK functionality, and
> could be applied separately.

 Shouldn't this type of comment be below the --- ?

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
[snip]
> @@ -89,7 +89,8 @@ main() {
>              cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
>  
>              # we always want $ORIGIN-based rpaths to make it relocatable.
> -            sanitize_extra_args+=( "--relative-to-file" )
> +            sanitize_args+=( "--set-rpath" )
> +            sanitize_args+=( "\$ORIGIN/../lib" )

 One advantage of --make-rpath-relative over --set-rpath is that the former will
also remove rpaths that are not needed (which I guess is often the case for host
tools). OTOH for host tools this is not really important. And it doesn't even
save size, patchelf doesn't shift sections to the left (IIRC). But it does save
a tiny amount of startup time - for gcc, this could have an impact on overall
build time.


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
