From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 22:14:53 +0100
Subject: [Buildroot] [PATCH] utils/size-stats-compare: add package name
 in detail output
In-Reply-To: <20210216115609.24656-1-patrickdepinguin@gmail.com>
References: <20210216115609.24656-1-patrickdepinguin@gmail.com>
Message-ID: <20210302211453.GJ2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-16 12:56 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> size-stats-compare gives an overview of the size increase/decrease between
> two cases, based on packages-file-list.txt. The 'detail' mode gives info per
> file, otherwise per package.
> 
> But sometimes, you want the detailed per-file info, but only for a specific
> package. Since the detailed output no longer lists the package name, you
> cannot simply grep for it. A workaround was to filter the input
> packages-file-list.txt's first, and then pass these filtered versions to
> size-stats-compare.
> 
> Make this easier by adding the package name next to the filename in detailed
> output. This allows grep'ing normally.
> For example:
> 
>   $ utils/size-stats-compare orig new  -t 100 -d | grep ebtables
>       -67712 removed lib/ebtables/libebtc.so (ebtables)
>       -66764 removed lib/ebtables/libebt_nat.so (ebtables)
>       -66752 removed sbin/ebtables (ebtables)
>       -66704 removed lib/ebtables/libebt_arp.so (ebtables)
>       -66700 removed lib/ebtables/libebt_stp.so (ebtables)
>       -66700 removed lib/ebtables/libebt_among.so (ebtables)
>       -66684 removed lib/ebtables/libebt_ip.so (ebtables)
>       -66676 removed lib/ebtables/libebt_limit.so (ebtables)
>       -66656 removed lib/ebtables/libebt_log.so (ebtables)
>       -66648 removed lib/ebtables/libebt_mark.so (ebtables)
>       -66636 removed lib/ebtables/libebt_pkttype.so (ebtables)
>       -66604 removed lib/ebtables/libebt_vlan.so (ebtables)
>       -66588 removed lib/ebtables/libebt_ulog.so (ebtables)
>       -66588 removed lib/ebtables/libebt_nflog.so (ebtables)
>       -66584 removed lib/ebtables/libebt_arpreply.so (ebtables)
>       -66544 removed lib/ebtables/libebt_ip6.so (ebtables)
>       -66540 removed lib/ebtables/libebt_802_3.so (ebtables)
>       -66536 removed lib/ebtables/libebt_standard.so (ebtables)
>       -66524 removed lib/ebtables/libebt_mark_m.so (ebtables)
>       -66524 removed lib/ebtables/libebt_redirect.so (ebtables)
>       -66452 removed lib/ebtables/libebtable_broute.so (ebtables)
>       -66452 removed lib/ebtables/libebtable_filter.so (ebtables)
>       -66452 removed lib/ebtables/libebtable_nat.so (ebtables)
>        66752   added usr/sbin/ebtablesd (ebtables)
>        66752   added usr/sbin/ebtables-legacy (ebtables)
>        66752   added usr/sbin/ebtablesu (ebtables)
>       200840   added usr/lib/libebtc.so.0.0.0 (ebtables)

I think it would make more sense to have the package name before the
file name, so that it is easier to filter. Indeed, the package name will
never have spaces, while the filenames may:

    -66452 ebtables removed lib/ebtables/libebtable_nat.so
     66752 ebtables added   usr/sbin/ebtablesd

Yes, this means that parsers of this will have to be adapted. But even
with the package name at the end, they would have to be adapted.

Unless you have a strong argument to keep it at the end?

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/size-stats-compare | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/size-stats-compare b/utils/size-stats-compare
> index a3d7f250c6..7a6cb9d258 100755
> --- a/utils/size-stats-compare
> +++ b/utils/size-stats-compare
> @@ -40,9 +40,9 @@ def read_file_size_csv(inputf, detail=None):
>  
>      for row in reader:
>          if detail:
> -            sizes[row[0]] = int(row[2])
> +            sizes[(row[0], row[1])] = int(row[2])
>          else:
> -            sizes[row[1]] = int(row[3])
> +            sizes[(None, row[1])] = int(row[3])
>  
>      return sizes
>  
> @@ -73,13 +73,18 @@ def print_results(result, threshold):
>  
>      from six import iteritems
>      list_result = list(iteritems(result))
> -    # result is a dictionary: name -> (flag, size difference)
> -    # list_result is a list of tuples: (name, (flag, size difference))
> +    # result is a dictionary: (filename, pkgname) -> (flag, size difference)
> +    # list_result is a list of tuples: ((filename, pkgname), (flag, size difference))
> +    # filename may be None if no detail is requested.
>  
>      for entry in sorted(list_result, key=lambda entry: entry[1][1]):
>          if threshold is not None and abs(entry[1][1]) <= threshold:
>              continue
> -        print('%12s %7s %s' % (entry[1][1], entry[1][0], entry[0]))
> +        if entry[0][0]:
> +            name = '%s (%s)' % (entry[0][0], entry[0][1])
> +        else:
> +            name = '%s' % entry[0][1]
> +        print('%12s %7s %s' % (entry[1][1], entry[1][0], name))
>  
>  
>  # main #########################################################################
> @@ -126,5 +131,5 @@ print('Size difference per %s (bytes), threshold = %s' % (keyword, args.threshol
>  print(80*'-')
>  print_results(delta, args.threshold)
>  print(80*'-')
> -print_results({'TOTAL': ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
> +print_results({(None, 'TOTAL'): ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
>                threshold=None)
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
