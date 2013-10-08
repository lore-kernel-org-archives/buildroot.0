From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Oct 2013 11:03:48 +0200
Subject: [Buildroot] [PATCH 4/9] manual: add information about buildroot
 toolchain not being relocable and put some hints to use it
In-Reply-To: <ef67fc0502d4a0a4cdce65dc850921e08e0cfef0.1381002281.git.s.martin49@gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <ef67fc0502d4a0a4cdce65dc850921e08e0cfef0.1381002281.git.s.martin49@gmail.com>
Message-ID: <CAAXf6LVJssbqDG2dDJ0r=Q4C4YO3VigiRKZzkdisAze7nJKfdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Here are some comments on the current version of the patch. Maybe some
parts will be altered after the comments of ThomasP, but anyway...

On Sat, Oct 5, 2013 at 9:49 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Signed-off-by: A.R.D. <contact@team-ard.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes v2 -> v3:
> - rephrase how to use buildroot toochain as an external one
>
> Changes v1 -> v2:
> - rephrase commit message
> - wrap line at 70-80 chars
> - misc. typo and formating fixes
> - misc. rewordings
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/customize-toolchain.txt | 72 +++++++++++++++++++++++++++++--------
>  1 file changed, 57 insertions(+), 15 deletions(-)
>
> diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
> index 82ecc28..324afd2 100644
> --- a/docs/manual/customize-toolchain.txt
> +++ b/docs/manual/customize-toolchain.txt
> @@ -31,28 +31,70 @@ set the environment variable BR_DEBUG_WRAPPER to either one of:
>  Using the internal Buildroot toolchain backend
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> -The internal Buildroot toolchain backend *only* allows to generate
> -*http://www.uclibc.org/[uClibc]-based toolchains*.
> +The internal Buildroot toolchain backend allows to generate any C-library-based
> +toolchains. 'eglibc' and 'glibc' -based toolchain generation support is still
> +experimental in Buildroot

'any' is a bold statement. Apparently there now exists a musl C
library, and until Thomas' patches we did not have support for it. So
I would rephrase to:

The internal Buildroot toolchain backend allows to generate toolchains
based on uClibc, glibc and eglibc. Generation of (e)glibc-based
toolchains is still experimental in Buildroot.

(and when the musl patches are merged, we would add musl here too).

>
> -However, it allows to tune major settings, such as:
> +It allows to tune major settings, such as:
>
>  * Linux headers version;
>
> -* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc]);
> +* C library configuration (only available for
> +  http://www.uclibc.org/[uClibc], see xref:uclibc-custom[uClibc]);
>
>  * Binutils, GCC, Gdb and toolchain options.
>
>  These settings are available after selecting the +Buildroot toolchain+ type in
>  the menu +Toolchain+.
>
> -Using the Crosstool-NG backend
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> -
> -The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
> -limited set of settings under the Buildroot +Toolchain+ menu:
> -
> -* The http://crosstool-ng.org[crosstool-NG] configuration file
> -
> -* Gdb and some toolchain options
> -
> -Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
> +It is possible to only build the toolchain by running:
> +
> +---------------------------------------
> +make toolchain
> +---------------------------------------
> +
> +To avoid to rebuild the toolchain (when using the 'internal Buildroot toolchain
> +backend') after executing +make clean+, you can build the toolchain in some
> +place, then use this prebuilt toolchain as an 'external toolchain' in another
> +buildroot configuration.

I would rephrase as:
To avoid rebuilding the toolchain after executing +make clean+ (when
using the internal Buildroot toolchain backend), you can build the
toolchain in one location, then use this prebuilt toolchain ...

(note that I explicitly removed the apostrophes ' around internal
Buildroot toolchain backend; I don't think this is needed).

> +
> +1. Configure the toolchain using the 'internal Buildroot toolchain backend'

same comment on apostrophes

> +  to meet your needs:
> ++
> +---------------------------------------
> +make O=/path/to/somewhere menuconfig
> +---------------------------------------
> ++
> +1. Build the toolchain:
> ++
> +---------------------------------------
> +make O=/path/to/somewhere toolchain
> +---------------------------------------
> ++
> +1. Configure target configuration using the prebuilt toolchain as an
> +   'external toolchain':
> ++
> +---------------------------------------
> +make O=/path/to/somewhere_else menuconfig
> +---------------------------------------
> ++
> +In the 'Toolchain' menu, set:
> ++
> +* 'Toolchain type': +External toolchain+ (+BR2_TOOLCHAIN_EXTERNAL+)
> +* 'Toolchain': +Custom toolchain+ (+BR2_TOOLCHAIN_EXTERNAL_CUSTOM+)
> +* 'Toolchain origin': +Pre-installed toolchain+
> +  (+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED+)
> +* 'Toolchain path': +/path/to/somewhere/host/usr+
> +  (+BR2_TOOLCHAIN_EXTERNAL_PATH+)
> +* and set the external toolchain properties accordingly to the ones set for
> +  the prebuilt toolchain.

according

> ++
> +1. Build the target binaries:
> ++
> +---------------------------------------
> +make O=/path/to/somewhere_else
> +---------------------------------------
> +
> +Note that toolchains built using the 'internal Buildroot toolchain backend' are

apostrophes

> +*not* relocable, so if you plan to share it with other machines, you will
> +*have to* install it in the same location (i.e.: in +/path/to/somewhere+).

relocatable

and I would rephrase as:
..., so if you plan to use these toolchains on different machines, you
will ...... in the same location (..) on every machine.

Best regards,
Thomas
