From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:24:25 +0200
Subject: [Buildroot] [PATCH v2 1/1] utils/check-package: add a check for
 the new spacing convention
In-Reply-To: <20200531204233.31866-1-heiko.thiery@gmail.com>
References: <20200531204233.31866-1-heiko.thiery@gmail.com>
Message-ID: <20200602232425.57210c9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 May 2020 22:42:31 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The seperation of the fields in the hash file should be 2 spaces for
> consistency.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

I'm not sure how to proceed with this: it causes a huge number of
warnings, because there are many packages still not fixed.

So, two options:

 (1) We merge this and live for warnings for the next few weeks until
 all packages are fixed. The advantage is that people will notice that
 packages need to be fixed.

 (2) We wait until all packages are fixed, and then we merge the
 check-package change to make sure we don't regress on this.

I'm not sure which is best. Perhaps we need to do (2) for a little
while in order to reduce the number of warnings, and then go for (1) ?
I'm not sure.

In any case, I'm also getting some weird Python exceptions while
running "make check-package":

Traceback (most recent call last):
  File "./utils/check-package", line 194, in <module>
    __main__()
  File "./utils/check-package", line 177, in __main__
    nwarnings, nlines = check_file_using_lib(fname)
  File "./utils/check-package", line 146, in check_file_using_lib
    nwarnings += print_warnings(cf.check_line(lineno + 1, text))
  File "/home/thomas/projets/buildroot/utils/checkpackagelib/lib_hash.py", line 56, in check_line
    if not re.match("^{}  {}  {}.*$".format(htype, hexa, filename), text):
  File "/usr/lib64/python3.8/re.py", line 191, in match
    return _compile(pattern, flags).match(string)
  File "/usr/lib64/python3.8/re.py", line 304, in _compile
    p = sre_compile.compile(pattern, flags)
  File "/usr/lib64/python3.8/sre_compile.py", line 764, in compile
    p = sre_parse.parse(p, flags)
  File "/usr/lib64/python3.8/sre_parse.py", line 948, in parse
    p = _parse_sub(source, state, flags & SRE_FLAG_VERBOSE, 0)
  File "/usr/lib64/python3.8/sre_parse.py", line 443, in _parse_sub
    itemsappend(_parse(source, state, verbose, nested + 1,
  File "/usr/lib64/python3.8/sre_parse.py", line 671, in _parse
    raise source.error("multiple repeat",
re.error: multiple repeat at position 50
make: *** [Makefile:1203: check-package] Error 1


Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
