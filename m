From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 18:52:27 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <20140113045330.GF4944@tarshish>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <20140113045330.GF4944@tarshish>
Message-ID: <20140113175227.GC3344@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-01-13 06:53 +0200, Baruch Siach spake thusly:
> On Mon, Jan 13, 2014 at 12:44:48AM +0100, Yann E. MORIN wrote:
[--SNIP--]
> > diff --git a/support/download/check-hash b/support/download/check-hash
> > new file mode 100755
> > index 0000000..5cf708f
> > --- /dev/null
> > +++ b/support/download/check-hash
> > @@ -0,0 +1,38 @@
> > +#!/bin/sh
> > +set -e
> > +
> > +# Helper to check a file matches its known hash
> > +# Call it with:
> > +#   $1: the basename of the package's tarball
> > +#   $2: the full path to the file to check
> > +#   $3: the path of the file containing all the the expected hashes
> > +
> > +tarball="${1}"
> > +file="${2}"
> > +h_file="${3}"
> > +
> > +# Does the hash-file exist?
> > +if [ ! -f "${h_file}" ]; then
> > +    exit 0
> > +fi
> > +
> > +# Do we know a hash for that tarball?
> > +known=$( grep -E '^[[:xdigit:]]+[[:space:]]{2}'"${tarball}"'$$' "${h_file}" \
> > +         |cut -d ' ' -f 1
> > +       )
> > +if [ -z "${known}" ]; then
> > +    exit 0
> > +fi
> > +
> > +# Do the hashes match?
> > +hash=$( sha1sum "${file}" |cut -d ' ' -f 1 )
> > +if [ "${hash}" = "${known}" ]; then
> > +    exit 0
> > +fi
> > +
> > +printf "ERROR: %s has wrong SHA256\n" "${tarball}"
> 
> That's SHA1.

Doh, good catch!

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
