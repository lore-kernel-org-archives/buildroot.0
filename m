From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 01:47:27 +0100
Subject: [Buildroot] [PATCH v2 2/2] docs/manual: patches that change
 files with spaces in the name
In-Reply-To: <1453593223-10558-3-git-send-email-ricardo.martincoski@gmail.com>
References: <1453593223-10558-1-git-send-email-ricardo.martincoski@gmail.com>
 <1453593223-10558-3-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <56A41F1F.6090109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 00:53, Ricardo Martincoski wrote:
> When a patch changes one or more files with spaces in the name, a
> workaround must be applied to ensure the build using old versions of
> +patch+ in the host system.

 I think that this situation is so exotic that it doesn't warrant a mention in
the manual. The manual is already long and complicated enough.

 Regards,
 Arnout

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v1 -> v2:
>  - update the manual entry
>  - use 1 or 2 hooks to rename the file that contains spaces
>    (based on the suggestion to use a symlink from Thomas DS)
>  - change the patch file to be applied on the renamed file
> 
> Symlink and hard link cannot be used because patch unlinks them.
> So I renamed the file before patching it.
> The file can be renamed back when needed.
> 
> Probably this patch will need some rewording.
> It's my first patch to the manual.
> I tested using 'make manual-html'
> ---
>  docs/manual/patch-policy.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index 0b4604e..471ded5 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -134,6 +134,23 @@ AC_PROG_MAKE_SET
>  +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
>  ---------------
>  
> +==== Patches that change files with spaces in the name
> +
> +When a patch changes one or more files with spaces in the name, a workaround
> +must be applied to ensure the build using old versions of +patch+ in the
> +host system.
> +
> +. Add a hook to +<packagename>_POST_EXTRACT_HOOKS+ that renames the file to be
> +  patched, replacing spaces with underscores;
> +
> +. Create the patch using the usual diff command, but both
> +  +package-version.orig/+ and +package-version/+ must have the file renamed
> +  to replace the spaces with underscores;
> +
> +. If the file must keep its name, add a hook to
> +  +<packagename>_POST_PATCH_HOOKS+ that renames the patched file to its
> +  original name;
> +
>  === Integrating patches found on the Web
>  
>  When integrating a patch of which you are not the author, you have to
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
