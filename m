From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 22:37:23 +0200
Subject: [Buildroot] [PATCH] package/systemd: show correct version info
In-Reply-To: <20190508033811.7090-1-xlcwu.taiwan@gmail.com>
References: <20190508033811.7090-1-xlcwu.taiwan@gmail.com>
Message-ID: <381952d8-c11a-1d9c-fec3-e204e4f68a7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 J?rg, Yann, another example of the thing we discussed last week... Apparently
people indeed do find the version info important.

On 08/05/2019 05:38, Joe Lin wrote:
> When systemd running show wrong version in dmesg log:
> systemd[1]: systemd 2019.02-1086-gf5f17c4 running in system mode.
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 Just to be sure: this happens only with in-tree build, not with out-of-tree
build (where there is no parent .git dir), right?

> Shoule be:
> systemd[1]: systemd 241 running in system mode. (-PAM -AUDIT -SEL>             ^^^^^^^^^^^
> Fix:
>   Get version info using git, ensure to get right git tree.
>     meson.build call vcs-tagger
>     - meson.build:vcs_tagger =
>        [meson.source_root() + '/tools/meson-vcs-tag.sh',
>     - script "meson-vcs-tag.sh" execute `git describe` directly
>   So
>     add "--git-dir ./.git" into the script "tools/meson-vcs-tag.sh"
>     to ensure systemd in br2 tree can get correct version info.
> 
> Signed-off-by: Joe Lin <xlcwu.taiwan@gmail.com>
> 
> ---
>  ...-correct-version-info-when-build-in-br2-git-tree.patch | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch
> 
> diff --git a/package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch b/package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch
> new file mode 100644
> index 0000000000..41e83dffb6
> --- /dev/null
> +++ b/package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch
> @@ -0,0 +1,8 @@

 Since upstream is managed in git, please make this a git-formatted patch
(generated with git format-patch -N) [1]. Make sure it has a summary and
description just like any other commit, and also include your Signed-off-by. The
latter is needed to ascertain that the patch may be distributed under the
upstream project's license (which may be different from Buildroot's).

 Also, please send the patch upstream (and add a reference to the upstream pull
request or whatnot in your Buildroot submission).

> +--- a/tools/meson-vcs-tag.sh	2019-05-07 08:53:51.527553144 +0000
> ++++ b/tools/meson-vcs-tag.sh	2019-05-07 08:35:49.152813721 +0000
> +@@ -15,4 +15,4 @@
> + # Apparently git describe has a bug where it always considers the work-tree
> + # dirty when invoked with --git-dir (even though 'git status' is happy). Work
> + # around this issue by cd-ing to the source directory.
> +-cd "$dir" && git describe --abbrev=7 --dirty=+ 2>/dev/null | sed 's/^v//' || echo "$fallback"
> ++cd "$dir" && git --git-dir ./.git describe --abbrev=7 --dirty=+ 2>/dev/null | sed 's/^v//' || echo "$fallback"

 If you use --git-dir, the cd is not needed, you can use the directory directly. So:

git --git-dir "${dir}/.git" describe --abbrev=7 --dirty=+ 2>/dev/null | sed
's/^v//' || echo "$fallback"



 However, maybe we should look for a more fundamental solution, by forcing the
same behaviour as an out-of-tree build. I think it should be sufficient to
create an empty .git file in the output directory. All git commands will then
fail with "fatal: invalid gitfile format" and not recurse to Buildroot's git
directory. Packages which have a fallback (like this one) will work as expected,
while packages which don't (like mfgtools) will fail hard and we'll detect the
issue.

 This won't make it into 2019.05, though, so the current patch is still relevant.


 Regards,
 Arnout

[1] https://buildroot.org/manual.html#_format_and_licensing_of_the_package_patches
