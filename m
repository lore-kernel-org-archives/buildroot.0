From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2019 22:19:48 +0100
Subject: [Buildroot] [PATCH v2 0/5] Ensure extractor dependencies are
 taken into account
In-Reply-To: <20191216153118.1844417-1-thomas.petazzoni@bootlin.com>
References: <20191216153118.1844417-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191217211948.GB4247@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-16 16:31 +0100, Thomas Petazzoni spake thusly:
> The starting point for this series is to fix the following build
> failure:
> 
>   http://autobuild.buildroot.net/results/83c/83c6d47c06334bef27791a59bdd491b1de124c49/build-end.log

After a slow start yesterday evening, I now applied the rest of the
series to master. Thanks!

Regards,
Yann E. MORIN.

> The problem is the following:
> 
>  - The _SOURCE for gettext-tiny is a .tar.gz
> 
>  - In addition to this _SOURCE tarball, we also extract the
>    gettext-gnu source code, which is a .tar.xz
> 
>  - Extracting .tar.xz may require building host-xzcat, is xzcat is not
>    available system-wide
> 
>  - The build fails because host-xzcat is not added in the dependencies
>    of gettext-tiny. Indeed, while generic-package takes care of adding
>    the extract dependencies needed for _SOURCE, it does not know about
>    other extract dependencies.
> 
> This issue appears in
> http://autobuild.buildroot.net/results/83c/83c6d47c06334bef27791a59bdd491b1de124c49/build-end.log
> because BR2_PER_PACKAGE_DIRECTORIES=y and therefore any missing
> dependency is immediately visible. But in theory, it could appear
> without per-package support.
> 
> This series solves that by introducing an extractor-pkg-dependency
> that returns the list of packages that must be added to
> <pkg>_EXTRACT_DEPENDENCIES to extract the archive passed as
> argument. It is then used in package/pkg-generic.mk to replace the
> existing logic to calculate <pkg>_EXTRACT_DEPENDENCIES, and extended
> to take into account the extractor dependencies needed by
> _EXTRA_DOWNLOADS instead of just _SOURCE.
> 
> We also rename extractor-dependency to extractor-system-dependency to
> clarify its difference from extractor-pkg-dependency, and we rework
> the implementation of extractor-system-dependency.
> 
> Changes since v1:
> 
>  - Instead of fixing manually individual packages, directly derive
>    extractor dependencies of EXTRA_DOWNLOADS files inside the
>    generic-package infrastructure. Suggested by Yann. This allowed to
>    greatly removed the number of patches in the series.
> 
>  - Added Reviewed-by from Romain Naour on patches 1 and 4.
> 
> Best regards,
> 
> Thomas Petazzoni
> 
> Thomas Petazzoni (5):
>   package/pkg-utils.mk: rename extractor-dependency to
>     extractor-system-dependency
>   package/pkg-utils.mk: add extractor-pkg-dependency macro
>   package/pkg-utils.mk: rework implementation of
>     extractor-system-dependency
>   package/pkg-generic.mk: use extractor-pkg-dependency macro
>   package/pkg-generic.mk: also apply extractor-pkg-dependency to
>     <pkg>_EXTRA_DOWNLOADS
> 
>  package/pkg-generic.mk                   | 14 ++++----------
>  package/pkg-utils.mk                     | 24 ++++++++++++++++++------
>  support/dependencies/check-host-lzip.mk  |  1 -
>  support/dependencies/check-host-xzcat.mk |  1 -
>  4 files changed, 22 insertions(+), 18 deletions(-)
> 
> -- 
> 2.23.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
