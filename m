From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 27 Nov 2014 11:37:49 +0100
Subject: [Buildroot] [PATCH RFC] Makefile: from a defconfig file,
 point to the corresponding board/ entry
In-Reply-To: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
References: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LU7cF0+R=7T6RE4M3efW52a1v+JyqkjgOEJ3ZXsV+dm8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Nov 27, 2014 at 12:13 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> This is an RFC!
>
> When configuring Buildroot from a defconfig files, soem users complain
> it is non-obvious that the corresponding board documentattion is to be
> found in the board/ sub-directory.
>
> So, deduce the board name from the defconfig file, look for a similarly
> named sub-dir of board (first level only), and if such a directory
> exists, print a message stating extra documentation for that board is to
> be found there.
>
> This works for only 5 of our 69 defconfig files, because:
>
>   - some boards docs are in sub-sub-dirs (count raises to 11 in that
>     case);
>
>   - most boards dirs are not directly named after the defconfig file,
>     like:
>         board/olimex/imx233_olinuxino/
>         configs/olimex_imx233_olinuxino_defconfig
>
> So, we could maybe improve this by renaming and moving our boards docs
> so there is a one-to-one mapping from the board directory to the
> corresponding defconfig file (but not necessarily the other way around).


I would like to point out that automatically detecting the board
directory is fragile, because
- the mapping may not be obvious, as you already found
- there may be more than one 'board' directory. For example, a typical
setup when having multiple more-or-less-related projects in a company
is to have several layers of post-build/rootfs-overlay/..., for
example:
board/company/common/...
board/company/project1/...
board/company/project2/...
In the defconfigs of both project1 and project2, the post-build and
rootfs-overlay settings would contain multiple entries, being
common+project1 and common+project2 respectively.
There may even be more levels than that, for example (in my case)
common, architecture-specific, project-family-specific,
board-specific.

Best regards,
Thomas
