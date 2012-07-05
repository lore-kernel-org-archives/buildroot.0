From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 05 Jul 2012 15:52:31 +0200
Subject: [Buildroot] [PATCH v4 09/22] manual: add advice about GPL
 compliance for Buildroot
In-Reply-To: <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
Message-ID: <4FF59C1F.4000908@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
> ---
>   docs/manual/using.txt |   27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/docs/manual/using.txt b/docs/manual/using.txt
> index 42d4061..fcbd24b 100644
> --- a/docs/manual/using.txt
> +++ b/docs/manual/using.txt
> @@ -284,3 +284,30 @@ Buildroot, with the name used in the manifest file:
>   * +BSD-2c+: BSD 2-clause license;
>   * +PROPRIETARY+: marks a non-opensource package;
>     Buildroot does not save any licensing info or source code for these packages.
> +
> +Complying with the Buildroot license
> +------------------------------------
> +
> +Buildroot itself is an opensource software, released under the
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
> +License, version 2] or (at your option) any later version.
> +However, being a build system, it is not normally part of the end product:
> +if you develop the root filesystem, kernel, bootloader or toolchain for a
> +device, the code of Buildroot is only present on the development machine, not
> +in the device storage.
> +
> +Nevertheless, the general view of the Buildroot developers is that you should
> +release the Buildroot source code along with the source code of other packages
> +when releasing a product that contains GPL-licensed software.
> +This is because the
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU GPL]
> +defines the "'complete source code'" for an executable work as "'all the
> +source code for all modules it contains, plus any associated interface
> +definition files, plus the scripts used to control compilation and installation
> +of the executable'".
> +Buildroot is part of the 'scripts used to control compilation and
> +installation of the executable', and as such it is considered part of the
> +material that must be redistributed.
> +
> +Keep in mind this is only the Buildroot developers' opinion, and you should
> +consult your legal department or lawyer in case of any doubt.

The above text has been Acked-By two Buildroot developers and had no 
negative
comments after ~6 weeks, which is good.

Nevertheless, I think it lacks some parts that I would like to be clarified.

A Buildroot tree is made up of the following parts:
  1. the various makefiles and scripts that build the toolchain, handle
     package compilation and generate a root filesystem, which is the heart
     of Buildroot;
  2. patches to packages;
  3. small, proprietary, project-specific applications or libraries whose
     source code resides in the Buildroot tree (not present in mainline).

The above clarification text, as well as the COPYING text, obviously applies
to point 1, but IMO points 2 and 3 need a different policy.

Patches to packages are modifications to externally-developed code, so I
think they fall under the same license as the package.
If this is correct, a clarification should be added to the above text and,
more important, to COPYING, much like the note at the beginning of the
Linux COPYING file.

Point 3 refers to the method described by Thomas Petazzoni in
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf, page 30.
The idea is that small "project-specific applications or libraries" can be
kept inside the Buildroot tree to simplify its integration.

Technically, it's how makedevs works in Buildroot. Is makedevs considered "a
part of Buildroot"? It think it is.
But one may want to develop another small utility in the same way inside the
Buildroot tree, but keeping it proprietary. As such, it should be clear
whether or not it is allowed to keep such code inside the Buildroot tree
without it falling under the Buildroot license.

My personal feeling is that Buildroot should allow to keep such proprietary
code in the tree, but with a clear way to determine that they are not
considered a derived work of Buildroot.
The discrimination could be: whatever is a package (in the Buildroot
meaning) *and* has <PKG>_LICENSE = PROPRIETARY in its .mk is considered not
to be a part of Buildroot and can have a different license.
This clause should be part of COPYING and documented in the manual too.
The legal-info code does not currently save the Buildroot tree, but when it
will be able to do so it should also be able to skip such packages.

Of course this would allow a more flexible usage of Buildroot in real life,
but at the cost of making the licensing policy more complex.

What areyour opinions?

Thanks,
Luca
