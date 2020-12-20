From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2020 09:40:01 +0100
Subject: [Buildroot] [PATCH v2 04/12]
 support/download/post-process-helpers: add helper function for post process
 scripts
In-Reply-To: <20201219153525.1361175-5-thomas.petazzoni@bootlin.com>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-5-thomas.petazzoni@bootlin.com>
Message-ID: <20201220084001.GL3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-19 16:35 +0100, Thomas Petazzoni spake thusly:
> download post process scripts will often need to unpack the source
> code tarball, do some operation, and then repack it. In order to help
> with this, post-process-helpers provide an unpack() function and a
> repack() function.

Sorry to come back yet once more on that one, but I may have found quite
an issue. Basically, your code does this:

    unpack() {
        tar -C ${dest} --strip-components=1 -xf ${tarball}
    }

    repack() {
        tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
            --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
        gzip -6 -n <new.tar >new.tar.gz
    }

So, it takes a tarball in whatever copression scheme and extract it, but
it will alwyas create a gzip-compressed tarball.

So, how would we hanfle a case where the upstream tarball is, say, a
.tar.bz2 ? For example;

    FOO_SOURCE = foo=1.2.3.tar.bz2
    FOO_SITE = http://foo.example.net/download
    FOO_SITE_METOD = wget
    $(eval $(go-package))

Besides the fact that the packager would see in DL_DIR a .tar.gz tarball
different from the .tar.bz2 he coded, the most problematic issue wil be
that we would have to list the .tar.gz inthe .hash file. This will be
very confusing to packagers and reviewers...

Furthermore, there is another discrepancy in the post-processing
scripts. For example, the go post-processor does, basically:

    if tarball already vendored:
        exit leaving the tarball as-is

    unpack
    vendor
    repack as .tar.gz

So some go tarballs will be left as they are upstream, while others will
be re-encoded. This is going to be quite confusing...

I think the post-processing script should always re-encode the tarball,
so that at least we have a consistent behaviour across the board. This
is pretty trivial to come up with, at the exepense of a bit of overhead
for those tarballs that are already vendored, but the majority of
packages will probably be git clones that need to be vendored, so it is
a small price to pay.

The big problem that's left, is how we handle the discrepancy between
the tarball listed in _SOURCE and the one listed in the .hash file...

I have to admit I do not have an easy solution for that for now...

Especially since with the pending series about changing the way we
assemble tarballs from git and svn: the tar format changes, and the
compression changes...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
