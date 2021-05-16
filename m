From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:24:51 +0200
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/pkg-stats: add
 column reporting ignored CVEs
In-Reply-To: <20210422194557.17499-2-matthew.weber@rockwellcollins.com>
References: <20210422194557.17499-1-matthew.weber@rockwellcollins.com>
 <20210422194557.17499-2-matthew.weber@rockwellcollins.com>
Message-ID: <20210516162451.GK2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2021-04-22 14:45 -0500, Matt Weber spake thusly:
> When doing analysis it is helpful to be able to view what CVE have
> been patched / diagnosed to not apply to Buildroot. This exposes
> that list to the reporting and prevents a step where you have to
> dig into the .mk's of a pkg to check for sure what has been
> ignored.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Applied to master, thanks.

I just did a small change: only set background if there are ignored
CVEs.

Regards,
Yann E. MORIN.

> ---
> v3 - New
> ---
>  support/scripts/pkg-stats | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 5b7fd1e0aa..0f90c16116 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -735,6 +735,10 @@ td.cve-unknown {
>   background: #ffd870;
>  }
>  
> +td.cve_ignored {
> + background: #ccc;
> +}
> +
>  </style>
>  <title>Statistics of Buildroot packages</title>
>  </head>
> @@ -909,6 +913,14 @@ def dump_html_pkg(f, pkg):
>          f.write("    N/A\n")
>      f.write("  </td>\n")
>  
> +    # CVEs Ignored
> +    td_class = ["centered"]
> +    td_class.append("cve_ignored")
> +    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
> +    for ignored_cve in pkg.ignored_cves:
> +        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (ignored_cve, ignored_cve))
> +    f.write("  </td>\n")
> +
>      # CPE ID
>      td_class = ["left"]
>      if pkg.is_status_ok("cpe"):
> @@ -948,6 +960,7 @@ def dump_html_all_pkgs(f, packages):
>  <td class=\"centered\">Warnings</td>
>  <td class=\"centered\">Upstream URL</td>
>  <td class=\"centered\">CVEs</td>
> +<td class=\"centered\">CVEs Ignored</td>
>  <td class=\"centered\">CPE ID</td>
>  </tr>
>  """)
> -- 
> 2.17.1
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
