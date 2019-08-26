From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:53:52 +0200
Subject: [Buildroot] [PATCH 4/9] support/graph-size: report 'Unkown"
 after all packages, but before "Others"
In-Reply-To: <d78b0de4b0e6d83ec8030fece702483debfc38e4.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
 <d78b0de4b0e6d83ec8030fece702483debfc38e4.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <f5f73d1c-2562-4859-6e8d-aa0877cd14ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 19:18, Yann E. MORIN wrote:
> Currently, the "unknown" category may be reproted anywhere, so it does
> not really stand out when there are a lot of packages in the graph.
> 
> Move it towards the end, but right before the "other" category, so that
> it is a bit more visible. Like for Others, don;t report it if its size
> is zero.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/scripts/size-stats | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index 398c256e8b..82258e4606 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -131,12 +131,18 @@ def draw_graph(pkgsize, outputf):
>      labels = []
>      values = []
>      other_value = 0
> +    unknown_value = 0

 A slightly more pythonesque way (IMO) would be

    unknown_value = pkgsize.pop("unknown")

(assuming that pkgsize["unknown"] doesn't get used anymore).

 But opinons may vary and I couldn't be bothered with testing my change, so
applied to next as is, thanks.

 Regards,
 Arnout

>      for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1]):
>          if sz < (total * 0.01):
>              other_value += sz
> +        elif p == "unknown":
> +            unknown_value = sz
>          else:
>              labels.append("%s (%d kB)" % (p, sz / 1000.))
>              values.append(sz)
> +    if unknown_value != 0:
> +        labels.append("Unknown (%d kB)" % (unknown_value / 1000.))
> +        values.append(unknown_value)
>      if other_value != 0:
>          labels.append("Other (%d kB)" % (other_value / 1000.))
>          values.append(other_value)
> 
