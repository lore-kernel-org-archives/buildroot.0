From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:16:42 +0100
Subject: [Buildroot] [PATCH 1/4 v3] core/pkg-generic: remove
 intermediate file-list files
In-Reply-To: <297a89e97062ee3fb93a34de5d5d57b3515f4852.1509204637.git.yann.morin.1998@free.fr>
References: <cover.1509204637.git.yann.morin.1998@free.fr>
 <297a89e97062ee3fb93a34de5d5d57b3515f4852.1509204637.git.yann.morin.1998@free.fr>
Message-ID: <20171127231642.536c7954@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Oct 2017 17:30:56 +0200, Yann E. MORIN wrote:
> To compute the list of files added by a package, we first store the list
> of files before the install, do the install, list the files after the
> install, and finally compare the two lists. The two lists are stored in
> dot-files, hidden in the package's build dir.
> 
> We currently keep those two files, and only list the files installed in
> target/
> 
> In followup patches, we'll also list files installed in staging/ as well
> as files installed in host/.
> 
> Rather than add even more internal, hidden files in the package build
> dir, we'll just re-use the same two temporary files to store the bfore

bfore -> before

> and after lists.
> 
> So, remove them after the comparison is done.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks. Interestingly, when I submitted the first
iterations of the patches adding this file list collecting mechanism, I
was also removing the files. And then between v3 and v4, I decided to
keep them, with the following explanation:

   They are now named .br_filelist_before and .br_filelist_after. They
   are also no longer removed after the step_pkg_size_end hook, as
   they don't consume that much space and could be useful for
   analysis. If anyone finds that annoying, I'll be happy to change
   this back to remove them.

 :-)

As we discussed on IRC, the idea of re-using the
same .br_filelist_before and .br_filelist_after for both the staging
and target installation is not going to work nicely with top-level
parallel build, because target and staging installation for a given
package can happen in parallel.

However, the whole file list collection mechanism will have to be
re-thought for top-level parallel build, so I took your patch anyway.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
