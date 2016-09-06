From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 6 Sep 2016 10:21:29 +0000
Subject: [Buildroot] [PATCH 9/9 v4] docs/manual: add appendix to convert
 old br2-external trees
In-Reply-To: <1eb85fca3b3363057a5e6662fd5af7c529593af4.1473109655.git.yann.morin.1998@free.fr>
References: <cover.1473109655.git.yann.morin.1998@free.fr>
 <1eb85fca3b3363057a5e6662fd5af7c529593af4.1473109655.git.yann.morin.1998@free.fr>
Message-ID: <aad17bc5-083e-b94d-fd2a-2a40019fdea4@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

I think the idea of this patch (document how to convert old br2-external 
tree) should be moved between patches 6 & 7 or merged in patch "6 - 
docs/manual: document the br2-external NAME"

Regards,

Julien Corjon

Le 05/09/2016 ? 23:49, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Julien CORJON <corjon.j@ecagroup.com>
> ---
>  docs/manual/appendix.txt                |  2 +-
>  docs/manual/br2-external-converting.txt | 39 +++++++++++++++++++++++++++++++++
>  docs/manual/customize-outside-br.txt    |  5 +++++
>  support/scripts/br2-external            |  7 +++++-
>  4 files changed, 51 insertions(+), 2 deletions(-)
>  create mode 100644 docs/manual/br2-external-converting.txt
>
> diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
> index 87a20bd..cd97744 100644
> --- a/docs/manual/appendix.txt
> +++ b/docs/manual/appendix.txt
> @@ -3,7 +3,7 @@
>
>  include::makedev-syntax.txt[]
>  include::makeusers-syntax.txt[]
> -
> +include::br2-external-converting.txt[]
>
>  // Automatically generated lists:
>
> diff --git a/docs/manual/br2-external-converting.txt b/docs/manual/br2-external-converting.txt
> new file mode 100644
> index 0000000..444c73d
> --- /dev/null
> +++ b/docs/manual/br2-external-converting.txt
> @@ -0,0 +1,39 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[br2-external-converting]]
> +== Converting old br2-external trees
> +
> +Before Buildroot 2016.11, it was possible to use only one br2-external
> +tree at once. With Buildroot 2016.11 came the possibility to use more
> +than one (for details, see xref:outside-br-custom[]).
> +
> +This however means that older br2-external trees are not useable as-is.
> +A minor change has to be made: adding a name to your br2-external tree.
> +
> +This can be done very easily in just a few steps:
> +
> + * First, create a new file named +external.desc+, at the root of your
> +   br2-external tree, with a single line defining the name of your
> +   br2-external tree:
> ++
> +----
> +$ echo 'name: NAME_OF_YOUR_TREE' >external.desc
> +----
> ++
> +.Note
> +Be careful when choosing a name: it has to be relatively unique, be made
> +with only ASCII characters from the set +[A-Za-z0-9_]+.
> +
> + * Then, change every occurence of +BR2_EXTERNAL+ in your br2-external
> +   tree with the new value:
> ++
> +----
> +$ find . -type f | xargs sed -i 's/BR2_EXTERNAL/BR2_EXTERNAL_NAME_OF_YOUR_TREE_PATH/g'
> +----
> +
> +Now, your br2-external tree can be used with Buildroot 2016.11 onward.
> +
> +.Note:
> +This is change makes your br2-external tree incompatible with Buildroot
> +before 2016.11.
> diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> index b0c7271..c4f6023 100644
> --- a/docs/manual/customize-outside-br.txt
> +++ b/docs/manual/customize-outside-br.txt
> @@ -33,6 +33,11 @@ If it is passed as a relative path, it is important to note that it is
>  interpreted relative to the main Buildroot source directory, *not* to
>  the Buildroot output directory.
>
> +.Note:
> +If using an br2-external tree from before Buildroot 2016.11, you need to
> +convert it before you can use it with Buildroot 2016.11 onward. See
> +xref:br2-external-converting[] for help on doing so.
> +
>  Some examples:
>
>  -----
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 9936650..612ae58 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -5,6 +5,10 @@ set -e
>  declare -a BR2_EXT_NAMES
>  declare -A BR2_EXT_PATHS
>
> +# URL to manual for help in converting old br2-external trees.
> +# Escape '#' so that make does not consider it a comment.
> +MANUAL_URL='https://buildroot.org/manual/manual.html\#br2-external-converting'
> +
>  main() {
>      local OPT OPTARG
>      local br2_ext ofile ofmt
> @@ -77,7 +81,8 @@ do_validate_one() {
>          error "'%s': no such file or directory\n" "${br2_ext}"
>      fi
>      if [ ! -f "${br2_ext}/external.desc" ]; then
> -        error "'%s': does not have a name (in 'external.desc')\n" "${br2_ext}"
> +        error "'%s': does not have a name (in 'external.desc'). See %s\n" \
> +            "${br2_ext}" "${MANUAL_URL}"
>      fi
>      br2_name="$(sed -r -e '/^name: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
>      if [ -z "${br2_name}" ]; then
>
