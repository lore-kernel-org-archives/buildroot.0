From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Oct 2017 22:43:07 +0200
Subject: [Buildroot] [PATCH 4/4 v2] core: check files are nto touched by
 more than on package
In-Reply-To: <20171023195613.7289359f@gmx.net>
References: <cover.1508685316.git.yann.morin.1998@free.fr>
 <64a5b7666e47d87d58845028f9576ab68a186f44.1508685316.git.yann.morin.1998@free.fr>
 <20171023195613.7289359f@gmx.net>
Message-ID: <20171023204307.GA18135@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-10-23 19:56 +0200, Peter Seiderer spake thusly:
> Hello Yann,
> 
> typo in the patch title s/nto/not/...

Yup, fixed here for a respin.

> On Sun, 22 Oct 2017 17:15:40 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Currently, we do nothing about packages that touch the same file: given
> > a specific configuration, the result is reproducible (even though it
> > might not be what the user expected) because the build order is
> > guaranteed.
> > 
> > Hwever, when we later introduce top-level parallel buil, we will no
> 
> s/Hwever/However/, s/buil/build/

Ack.

> > longer be able to guarantee a build order, by the mere way of it being
> > parallel. Reconcialliting all those modified files will be impossible to
> > do automatically. The only way will be to  refuse such situations.
> 
> s/  / /

Duh... ;-)

[--SNIP--]
> > diff --git a/support/scripts/check-uniq-files.py b/support/scripts/check-uniq-files.py
> > new file mode 100755
> > index 0000000000..e77472cf80
> > --- /dev/null
> > +++ b/support/scripts/check-uniq-files.py
> > @@ -0,0 +1,40 @@
> > +#!/usr/bin/env python2

As spotted by Baruch:

s/python2/python/

> > +import sys
> > +import csv
> > +import argparse
> > +from collections import defaultdict
> > +
> > +warn = 'Warnng: {}s file "{}" is touched by more than one package: {}\n'
> > +
> > +def main():
> > +    parser = argparse.ArgumentParser()
> > +    parser.add_argument('packages_file_list', nargs='*',
> > +                    help='The packages-file-list to check from')
> > +    parser.add_argument('-t', '--type', metavar="TYPE",
> > +                        help='Report as a TYPE file (TYPE is either target, staging, or host)')
> > +
> > +    args = parser.parse_args()
> > +
> > +    if not len(args.packages_file_list) == 1:
> > +        sys.stderr.write('No packages-file-list was provided.\n')
> > +        return False
> > +
> > +    if args.type is None:
> > +        sys.stderr.write('No type was provided\n')
> > +        return False
> > +
> > +    file_to_pkg = defaultdict(list)
> > +    with open(args.packages_file_list[0], 'rb') as pkg_file_list:

'rb' is not working for python3... :-/

I'll fix the python2 vs. python3 issue and respin the series...

Regards,
Yann E. MORIN.

> > +        r = csv.reader(pkg_file_list, delimiter=',')
> > +        for row in r:
> > +            pkg = row[0]
> > +            file = row[1]
> > +            file_to_pkg[file].append(pkg)
> > +
> > +    for file in file_to_pkg:
> > +        if len(file_to_pkg[file]) > 1:
> > +            sys.stderr.write(warn.format(args.type, file, file_to_pkg[file]))
> > +
> > +if __name__ == "__main__":
> > +    sys.exit(main())
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
