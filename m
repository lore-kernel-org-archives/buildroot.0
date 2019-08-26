From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:53:37 +0200
Subject: [Buildroot] [PATCH 1/9] support/graph-size: fix flake8 warnings
In-Reply-To: <831c11fcb0c77b1d1d0692469a66d664ca9d65a4.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
 <831c11fcb0c77b1d1d0692469a66d664ca9d65a4.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <2a326435-2940-1a3a-914a-e702b751d0f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 19:18, Yann E. MORIN wrote:
> There are three E501 warnings returned by flake8, when run locally,
> because we enforce a local 80-char limit, but that are not reported by
> the gitlab-ci jobs because only a 132-char limit is required there.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> ---
> I initially whined loudly when this discrepancy was added, but now I
> can prove that it is bad: running flake8 on a locally-modified script
> will return errors that have not been introduced by the developer, but
> by a previous change by someone else that was not careful to run flake8
> on it... Sigh... :-(

 Of course it does. Have you ever tried running checkpatch.pl on an existing
file? You'll get tons of warnings - especially for lines which are too long.
That's why checkpatch.pl takes a patch as input, and flake8 has the --diff option.

 For line length, it's very easy to fall in the category "makes the code less
readable" of PEP8 [1]. And adding a noqa at the end would make the line even
longer...

> ---
>  support/scripts/size-stats | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index deea92e278..8dfa391e24 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -66,8 +66,8 @@ def add_file(filesdict, relpath, abspath, pkg):
>  #
>  def build_package_dict(builddir):
>      filesdict = {}
> -    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
> -        for l in filelistf.readlines():
> +    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as f:
> +        for l in f.readlines():

 Here's an example where it *could* be argued that it makes the code less
readable. Well, it doesn't really make the code less readable, but it could have :-)

 Therefore, I've applied to next as is.

 Regards,
 Arnout


[1]
https://www.python.org/dev/peps/pep-0008/#a-foolish-consistency-is-the-hobgoblin-of-little-minds


>              pkg, fpath = l.split(",", 1)
>              # remove the initial './' in each file path
>              fpath = fpath.strip()[2:]
> @@ -151,7 +151,8 @@ def draw_graph(pkgsize, outputf):
>      plt.setp(texts, fontproperties=proptease)
>  
>      plt.suptitle("Filesystem size per package", fontsize=18, y=.97)
> -    plt.title("Total filesystem size: %d kB" % (total / 1000.), fontsize=10, y=.96)
> +    plt.title("Total filesystem size: %d kB" % (total / 1000.), fontsize=10,
> +              y=.96)
>      plt.savefig(outputf)
>  
>  
> @@ -209,7 +210,8 @@ def gen_packages_csv(pkgsizes, outputf):
>      total = sum(pkgsizes.values())
>      with open(outputf, 'w') as csvfile:
>          wr = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
> -        wr.writerow(["Package name", "Package size", "Package size in system (%)"])
> +        wr.writerow(["Package name", "Package size",
> +                     "Package size in system (%)"])
>          for (pkg, size) in pkgsizes.items():
>              wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
>  
> 
