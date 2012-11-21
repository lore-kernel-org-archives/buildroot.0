From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2012 19:34:43 +0100
Subject: [Buildroot] Solving the mesa3d build issue
In-Reply-To: <20121117150357.2aa86a1c@skate>
References: <20121117150357.2aa86a1c@skate>
Message-ID: <50AD1EC3.4090401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/12 15:03, Thomas Petazzoni wrote:
> Hello,
>
> The mesa3d build is currently broken because it generates during its
> build process a bunch of C files from a XML description of the OpenGL
> APIs. This generation process is done through Python scripts that
> require the libxml2 Python bindings to be installed.
>
> Unfortunately, those libxml2 Python bindings are part of the libxml2
> source code itself, so we would have to enable host-python as a
> dependency of host-libxml2 in order to get those Python bindings built
> and installed. This means that all other users of host-libxml2 would
> pay the price of building host-python even if they don't need it, which
> is quite annoying.
>
> We have several solutions to address this problem:
>
>   (1) The solution proposed by Will Wagner/Noel Vellemans at
>       http://lists.busybox.net/pipermail/buildroot/2012-November/061594.html
>       and
>       http://lists.busybox.net/pipermail/buildroot/2012-November/061595.html.
>
>       This solution consists in adding a BR2_PACKAGE_HOST_LIBXML2_PYTHON
>       hidden configuration symbol, that mesa3d selects. It sells the
>       host-libxml2 package that it should build the Python binding, and
>       therefore depend on host-python.
>
>       It is quite nice in the sense that it is simple and only builds
>       host-python as a dependency of host-libxml2 when needed. However,
>       it adds something entirely non-standard: a hidden kconfig option
>       that tunes the compilation of a host package. Do we want to do
>       this?
>
[snip (2) and (3)]

  A fourth solution would be to create a new host-only package libxml2-python
that builds libxml2 with python bindings.  It would just reuse the libxml2
package with a slightly different CONF_OPT.

  The differences with the currently committed solution (1) are:

- No need for a HOST-config symbol.

- host-libxml2 will be built twice, once without and once with python bindings.

  There may even be a workaround for the second step, but at the moment I assume
it will be built twice.

  What do you think?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
