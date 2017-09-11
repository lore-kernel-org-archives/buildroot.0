From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Sep 2017 22:04:26 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <ddba8f8e-5c77-97ab-9e2c-2a5a00b8522d@jikos.cz>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan>
 <20170910092450.GC3536@scaer>
 <cab76ac0-716f-1f50-b04d-bb9caf0d3e94@jikos.cz>
 <20170910181806.GA21464@scaer>
 <ddba8f8e-5c77-97ab-9e2c-2a5a00b8522d@jikos.cz>
Message-ID: <20170911200426.GA3172@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

[note: please wrap your mails to ~72-80 chars]

On 2017-09-11 01:30 +0200, Petr Kulhavy spake thusly:
[--SNIP--]
> In the second case the sum is not calculated directly on the downloaded
> file(s). The files are downloaded to local (during which they might get
> corrupted, or different files are downloaded due to MITM or GIT repo
> changes).

As Thomas also pointed out, the tarballs may also come from a primary
site or a backup site.

For example, we have such a backup mirro that is publicly available:
    http://sources.buildroot.org/

In this case, we also want to ensure that the archive that is downlaoded
from there is what the user would have had if he did the clone.

> Then they are tared and gzipped. Then the sum is calculated.
> This method may produce false negatives.

Well, theoretically, that's true.

> So we have the chain: download -> tar -> gzip -> sha256-sum
> Do tar and gzip guarantee reproducible output on identical input
> across implementations? Or is the output version/implementation
> specific? Let's look at them closely.
> 
> Tar:
> - guarantees to produce a POSIX interchangeable format from the
>   input, as defined in POSIX 1003.1-1990
> - you force the gnu header format, sort the files, use numeric
>   owners, UID=GID=0, force the date to the checkout date -> these
>   are all good, but still don't guarantee a reproducible output
>   across implementations
> - because the standard does not specify what type of padding should
>   be used for strings (after the 0 character) and for files (the
>   last block of a file). These are implementation specific . GNU
>   tar seems to initialize them to 0.
> 
> Gzip:
> - RFCs 1950-1952 guarantee compatibility on the file format and
>   algorithm
> - the DEFLATE algorithm however has some free space for the
>   implementation to find the matching strings. This means a compatible
>   implementation might produce different output.
> - in GNU gzip these tweaks are controlled by the compression level in
>   gzip, which should be explicitly specified as you already realised
> - GNU gzip can change its implementation in the future
> - other implementation than GNU gzip might produce different output.
>   See [1]https://en.wikipedia.org/wiki/DEFLATE#Encoder.2Fcompressor

OK, so you did a more thourough research than I did! ;-)

> For instance the pigz based on zlib does produce a different output
> (pigz compresses slightly more even at the same level 6). Yet, you
> can perfectly compress with pigz and decompress with GNU gunzip.
> See your 3D film here ;-)? [2]https://zlib.net/pigz/

Damned! ;-)

> So the current hash calculation for cloned GIT repos depends on the
> tools used. Is that more clear now?

Yes ,I see that this is morfe complex than I originally thought...

> What to do then? I can see several options, with different reliability
> and practicality:

> 1) the 100% reliable solution is to calculate checksum of each
> individual file (raw) plus compare the file names. E.g.
> LC_ALL=C find . -type f -print0 | sort -z | xargs -r0 sha256sum | sha256sum

Nope.

> 2) another 100% reliable solution: bundle BR with a specific version
>    of tar and gzip (or download and build them) and use the current
>    method. However the same tools should be then use to create the
>    hash file.

Nope as well.

> 3) the almost 100% working solution is to remove the gzip step and
> calculate checksum of the tar. This depends just on the padding
> implementation in tar, and it is reasonable to assume zero-padding.
> Just for sure the Buildroot documentation should be updated that GNU
> tar is required.

That one is not 100%, so not an improvement over the existign one.

> 4) the implementation dependent solution is to use tar.gz as now,
> force the compression level, document that GNU gzip is required
> and cross fingers that gzip doesn't change its implementation in
> the future.

I think this is a safe bet, yes. I've built almost all gzip versions
available from upstream, and they all generate the exact same output.
The first was released in 1993, and the latest in 2016:

    $ gzip-${version} -n -6 <foo >foo.gzip-${version}.gz

and the result is:

    $ sha1sum *.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.2.4a.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.2.4.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.3.13.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.5.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.6.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.7.gz
    acdbbb3dfed79a24caeaf22a4c0201033ebe363b  foo.gzip-1.8.gz

So, clearly gzip does have a very stable output.

(note, 1.3.x, 1.3.12 and 1.4 were not tested, because they fail to build
on my machine).)

And we do use gzip, not any other variant, so I would say that we do
stick with the current state (exceot firce the compression level,
maybe).

Now, for tar, that was a bit more complex, because the versions older
than 1.27 do not build, or crash because of overflows. But for 1.27
(released in 2013) and later, the output is also reproducible:

    $ tar-${version} cf - \
         --numeric-owner --owner=0 --group=0 \
         --mtime=1970-01-01T00:00:00Z --format=gnu \
         -T foo.sorted >foo.tar-${version}.tar

and the result is:

    $ sha1sum *.tar
    378fd66d420af1ea18d58f4dece3e7a15588bbcf  foo.tar-1.27.1.tar
    378fd66d420af1ea18d58f4dece3e7a15588bbcf  foo.tar-1.27.tar
    378fd66d420af1ea18d58f4dece3e7a15588bbcf  foo.tar-1.28.tar
    378fd66d420af1ea18d58f4dece3e7a15588bbcf  foo.tar-1.29.tar

Again, pretty stable...

> In any case, if specific versions of the tools are assumed (and the
> current implementation does assume them), this should be very clearly
> documented.

Agreed. But it is not needed, as shown above: gzip is *very* *very*
stable in the output it generates; tar looks like it is also really
stable.

So, even though this is technically possible, I have a lot of doubt
that his would ever happen, at least not in the forseeable future.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
