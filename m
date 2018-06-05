From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Jun 2018 23:17:12 -0300
Subject: [Buildroot] [PATCH 4/5] support/testing: fix python syntax
References: <2ae621feecea77223421234eaef0de7032c841d1.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <5b15f2a8ada6e_5c1a3f8e3808bab469742@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The endless patch series... each iteration I suggest new patches for it :-)

+ Thomas P

There is nothing really wrong with the changes this patch do to the code.
But see below 2 nits that could lead us (or not) to choose one way or another
and standardize all Python scripts in the tree.

On Sun, Jun 03, 2018 at 06:08 AM, Yann E. MORIN wrote:

> Fix three issues with code style in our test infra:
>   - 'print' is now a function,
>   - exceptions need to be caught-assigned with the 'as' keyword,
>   - old-style "%s"%() formatting is deprecated.

This patch also do:
  - add indices in format string

We currently do that only for check-uniq-files.
Everywhere else we use '{}' instead of '{0}' when possible, as this is not
really needed for Python 3 when we use each arguments once in the same order
they are passed to format().

BUT... looking at "62fa5e17cb support/scripts/check-uniq-files: add indices in
format string" maybe it would be good to adopt a simplistic policy of always
using indices in format string, as it seems to be compatible to Python >= 2.6
and then we don't need to think about whether the script will be used during
the build (and therefore need to support old distros) or not when reviewing.

Thoughts?

[snip]
> -    print "Downloading to {}".format(tmpfile)
> +    print("Downloading to {0}".format(tmpfile))
                              ^
Example of index mentioned above.
2 more occurrences in the patch.

[snip]
> -            print "Missing download directory, please use -d/--download"
> -            print ""
> +            print("Missing download directory, please use -d/--download")
> +            print("")

I was about to suggest to change to 'print()' as it is already used in scanpypi.
But I didn't tested yet any form on python2.6.
5 more occurrences in the patch.

Thoughts?


Regards,
Ricardo
