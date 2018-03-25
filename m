From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 10:50:18 +0200
Subject: [Buildroot] [PATCH v2 2/3] test-pkg: test a subset of
 toolchains by default, add -a and -n options
In-Reply-To: <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
 <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180325085018.GH2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-23 22:48 +0100, Thomas Petazzoni spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> During the latest Buildroot Developers meeting, we discussed that
> test-pkg would perhaps be more widely used if it tested a smaller
> subset of toolchains. Indeed, it currently tests 47 toolchains, which
> takes very long to build. Several of the toolchain configurations are
> quite similar, and it is perhaps not necessary for contributors to
> test them all before submitting a package.
> 
> Therefore, this commit changes the test-pkg script to only test a
> subset of the toolchain configurations by default. The N first
> configurations of the CSV files are tested, where N is hard-coded in
> the script. The CSV file has therefore been re-organized to have the
> first N toolchains be the most important ones.
> 
> A -a/--all option is added to test with all toolchains, while a
> -n/--number option is added to test with the first N toolchains, N
> being passed on the command line.
> 
> Note that the list of toolchains (built in the "toolchains" shell
> variable) is no longer sorted. Indeed, when the first N toolchains are
> tested, we want them to be tested in the same order as they are listed
> in the CSV file, as we are careful to order them in an interesting
> order. We only sort when all toolchains are tested.

I don't understand why you want to test them in the order they are
listed... I understand that you want them to be _selected_ in the order
they appear, yes. But tested? See below...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Except for a small nit [0]:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[--SNIP--]
>      # Extract the URLs of the toolchains; drop internal toolchains
>      # E.g.: http://server/path/to/name.config,arch,libc
>      #  -->  http://server/path/to/name.config
>      toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
>                    |if [ ${random} -gt 0 ]; then \
>                        sort -R |head -n ${random}
> -                   else
> -                      cat
> -                   fi |sort
> +                  elif [ ${number} -gt 0 ]; then \

[0] BTW, no need for a trailing '\' here...

> +                      head -n ${number}
> +                  else
> +                      sort
> +                  fi

We could always keep the previous trick to sort the selected toolchains;

    |if [ ${random} -gt 0 ]; then \
        sort -R |head -n ${random} 
     elif [ ${number} -gt 0 ]; then
        head -n ${number}
     else
        cat
     fi |sort

This way, the toolchains are selected in the order they appear in the
file, they are always tested in alphabetical order, like it was before
that patch.

But I won't let this prevent the merge, so my Reviewed-by stands.

Regards,
Yann E. MORIN.

>  
> @@ -154,6 +185,10 @@ toolchain config fragment and the required host architecture, separated by a
>  comma. The config fragments should contain only the toolchain and architecture
>  settings.
>  
> +By default, a useful subset of toolchains is tested. If needed, all
> +toolchains can be tested (-a), an arbitrary number of toolchains (-n
> +in order, -r for random).
> +
>  Options:
>  
>      -h, --help
> @@ -170,9 +205,16 @@ Options:
>          Test-build the package PKG, by running 'make PKG'; if not specified,
>          just runs 'make'.
>  
> +    -a, --all
> +        Test all toolchains, instead of the default subset defined by
> +        Buildroot developers.
> +
> +    -n N, --number N
> +        Test N toolchains, in the order defined in the toolchain CSV
> +        file.
> +
>      -r N, --random N
> -        Limit the tests to the N randomly selected toolchains, instead of
> -        building with all toolchains.
> +        Limit the tests to the N randomly selected toolchains.
>  
>      -t CSVFILE, --toolchains-csv CSVFILE
>          CSV file containing the paths to config fragments of toolchains to
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
