From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Tue, 25 Nov 2014 22:09:13 +0100
Subject: [Buildroot] [PATCH v4 9/9] autobuild-run: extend TODO list
In-Reply-To: <1415822317-22500-10-git-send-email-patrickdepinguin@gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
 <1415822317-22500-10-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LVgM33BfF2M4xCJebq4s+Rj8XjXzWxwU4YnJ4zotEJZ5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 12, 2014 at 8:58 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Some misc. additions to the autobuild-run TODO list.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  scripts/autobuild-run | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 7fe0b00..a73ccc9 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -47,6 +47,17 @@
>  # - Instead of excluding all configurations that have
>  #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
>  #   necessary host machine requirements are there to build classpath.
> +# - Integrate method check-requirements with the SysInfo class, distinghuishing
> +#   between required and optional dependencies.
> +# - Extend required dependencies to subversion, mercurial, cpio, wget, python,
> +#   etc.
> +# - Detect selection of multiple virtual package providers and don't consider it
> +#   a failure
> +# - Properly handle kill of main script: stop all running children and do not
> +#   print out stacktraces

Brief update on this topic: the autobuild-run code currently kills the
process group associated with the python process, but it turns out
that the build jobs are not part of the same process group as the
python process.
As far as I can see, the subprocess class should spawn processes into
the same process group, so maybe make is explicitly changing this?
Further investigation is needed here, but I think that if we can make
sure that these processes are part of the same group as the python
parent process, then the kill of autobuild-run will automatically kill
the children, as expected.

To visualize the process groups: ps -e -o pid,user,pgid,args --sort pgid

Best regards,
Thomas
