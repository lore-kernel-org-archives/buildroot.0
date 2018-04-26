From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Thu, 26 Apr 2018 15:22:35 -0300 (BRT)
Subject: [Buildroot] [PATCH] support/scripts/check-uniq-files: ignore
 reinstalled packages
In-Reply-To: <20180426162731.4710-1-john@metanate.com>
References: <20180426162731.4710-1-john@metanate.com>
Message-ID: <1437404419.346987.1524766955385.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

----- Mensagem original -----
> De: "John Keeping" <john@metanate.com>
> Para: buildroot at buildroot.org
> Cc: "John Keeping" <john@metanate.com>
> Enviadas: Quinta-feira, 26 de abril de 2018 13:27:31
> Assunto: [Buildroot] [PATCH] support/scripts/check-uniq-files: ignore reinstalled packages

> If a package is rebuilt, then any files it installs will be listed
> multiple times in the file list and check-uniq-files will report that
> these files are touched by more than one package even though it is the
> same package listed multiple times.
> 
> Switch to storing the package names in a set so that each package can
> only appear once.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> support/scripts/check-uniq-files | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
> index fbc6b5d6e7..eb92724e42 100755
> --- a/support/scripts/check-uniq-files
> +++ b/support/scripts/check-uniq-files
> @@ -24,11 +24,11 @@ def main():
>         sys.stderr.write('No type was provided\n')
>         return False
> 
> -    file_to_pkg = defaultdict(list)
> +    file_to_pkg = defaultdict(set)
>     with open(args.packages_file_list[0], 'rb') as pkg_file_list:
>         for line in pkg_file_list.readlines():
>             pkg, _, file = line.rstrip(b'\n').partition(b',')
> -            file_to_pkg[file].append(pkg)
> +            file_to_pkg[file].add(pkg)
> 
>     for file in file_to_pkg:
>         if len(file_to_pkg[file]) > 1:
> --
> 2.17.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I can confirm we have problems rebuilding packages using buildroot 2018-02.1. The 3 files "package-file-list" are increasing in size when we rebuild packages (make <pkg>-rebuild or make <pkg>-reinstall), and the compilation time is increasing linearly with every rebuild, but the increase is noticeable.

One build that takes one hour is increasing 40 minutes every time we rebuild the entire platform (make <pkg>-rebuild for all packages). And we can see the problem is directly associated with the instrumentation hooks, mainly the "check-bin-arch" parsing the ever increasing "package-file-list".

Thanks

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
