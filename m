From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 23:02:00 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/check-uniq-files: Only
 report each package once
In-Reply-To: <1544537144-10197-1-git-send-email-tolvupostur@gmail.com>
References: <1544537144-10197-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <20181230220200.GB24224@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-12-11 15:05 +0100, Einar Jon Gunnarsson spake thusly:
> Rebuilding the same package should not trigger
> a 'touched by more than one package' warning
> 
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> ---
>  support/scripts/check-uniq-files | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
> index fbc6b5d..03faa71 100755
> --- a/support/scripts/check-uniq-files
> +++ b/support/scripts/check-uniq-files
> @@ -28,7 +28,8 @@ def main():
>      with open(args.packages_file_list[0], 'rb') as pkg_file_list:
>          for line in pkg_file_list.readlines():
>              pkg, _, file = line.rstrip(b'\n').partition(b',')
> -            file_to_pkg[file].append(pkg)
> +            if not pkg in file_to_pkg[file]:
> +                file_to_pkg[file].append(pkg)

I think the proper way would be to change file_to_pkg[file] to be a set
rather than a list. Care to test the following, instead:

    diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
    index fbc6b5d6e7..eb92724e42 100755
    --- a/support/scripts/check-uniq-files
    +++ b/support/scripts/check-uniq-files
    @@ -24,11 +24,11 @@ def main():
             sys.stderr.write('No type was provided\n')
             return False
     
    -    file_to_pkg = defaultdict(list)
    +    file_to_pkg = defaultdict(set)
         with open(args.packages_file_list[0], 'rb') as pkg_file_list:
             for line in pkg_file_list.readlines():
                 pkg, _, file = line.rstrip(b'\n').partition(b',')
    -            file_to_pkg[file].append(pkg)
    +            file_to_pkg[file].add(pkg)
     
         for file in file_to_pkg:
             if len(file_to_pkg[file]) > 1:

Regards,
Yann E. MORIN.

>      for file in file_to_pkg:
>          if len(file_to_pkg[file]) > 1:
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
