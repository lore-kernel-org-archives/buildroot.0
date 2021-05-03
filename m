From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 3 May 2021 20:40:03 +0200
Subject: [Buildroot] [PATCH] support/download/hg: fix broken method
In-Reply-To: <20210428195122.GB2137340@scaer>
References: <20210427194544.15861-1-patrickdepinguin@gmail.com>
 <20210428195122.GB2137340@scaer>
Message-ID: <CAAXf6LVr_TxvnLLz4q82=yHLOJcG8ZuZ+m482VTLwWk-kOBMBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

El mi?, 28 abr 2021 a las 21:51, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2021-04-27 21:45 +0200, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Commit 54d3d94b6e3846447b5796ef8587b08b537cd348 broke the 'hg' download
> > method, in a similar way as it broke the 'git' download method (later fixed
> > with commit b70ce5665126246bd6b6bf804c6d9eea1fc599cf), by introducing extra
> > output on stdout in a case where the output is redirected.
> >
> > In the case of 'hg', the 'hg archive' step uses shell redirection rather
> > than directly letting hg write the output file, since commit
> > 76b51f90c0e393349dd0c71d7e6cf82fbc094282.
> >
> > As a result, the extra print added by the _hg function is prepended to the
> > actual archive, causing an invalid archive.
> >
> > Fix by using the _plain_hg function instead. The disadvantage is that the
> > command for 'hg archive' is no longer printed.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> As discussed on IRC, it would be better if we could keep the verbosity
> of the 'archive' step. But doing so would involve playing various
> tricks with filedescriptors, and this is a bit too much for the gain.
>
> An alternative would be to change the way the archives are generated, by
> using a sequence not unlike what we were using for git, i.e. roughly:
>
>     hg archive [opts] ${outputfile}.tmp
>     gzip -c -n -9 <${outputfile}.tmp >${outputfile}
>
> The 'hg archive' part is reproducible, and the generated (uncompressed)
> tarball is identical to the previous archive after decompression.
>
> The 'gzip' part itself is reproducible (thanks to the -n option, and to
> reading from stdin), but calling gzip manually generates a compressed
> archive that differs from the previous one. One difference is that the
> timestamp was previously set to the commit date (thus was reproducible),
> while 'gzip -n' sets it to 0 (zero, ie. 1970-01-01 00:00:00+0000, also
> reproducible). The manual gzip also injects additional data (additional
> headers?).
>
> As such, even though the gzip call is reproducible, it generates archives
> that are different from the previous ones, which would require us to
> introduce the hg-specific archive format:
>     BR_FMT_VERSION_hg = -br1
>
> A third option would be to use the mk_tar_gz() helper, as is used for
> git and svn.
>
> This is generating reproducible archives (that's the whole point for
> that helper to begin with), but those are again different from the
> previous ones, which would also require that we introduce
> BR_FMT_VERSION_hg.

Thanks for this analysis!

>
> All in all, we have only 4 packages that are downloaded from Hg:
>
>   - canfestival: does not have a hash, but fails to extract, nad we have
>     a few autobuild failures:
>         http://autobuild.buildroot.org/results/3fd/3fd118fb87299099e47026161c1d8c948eb9a5c1/build-end.log
>         http://autobuild.buildroot.org/results/bf4/bf42580e4c03015004975e03736d6d6a3a87b04d/build-end.log
>
>   - dvb-apps: has a hash, thus fails to download from upstream, and
>     falls back to downloading an old archive from s.b.o
>
>   - opentyrian: does not have a hash, but upstream is dead, so falls
>     back to downloading an old archive from s.b.o:
>         hg clone --noupdate 'https://bitbucket.org/opentyrian/opentyrian' 'opentyrian-9c9f0ec3532b'
>         abort: HTTP Error 404: Not Found
>
>   - python-pygame: has a hash *and* upstream is dead, so fails to
>     download from upstream, and falls back to downloading an old archive
>     from s.b.o.
>         hg clone --noupdate 'https://bitbucket.org/pygame/pygame' 'python-pygame-d61ea8eabd56'
>         abort: HTTP Error 404: Not Found
>

Note that the cases where upstream still exists, the 'fails to
extract' is exactly the problem this patch is fixing. It fails to
extract because the 'hg archive' step is adding a textual print as
part of the .tar.gz file, which corrupts it.
So this leaves us with:
- canfestival: should work now

- dvb-apps: only problem is that the hash file does not match the
archive generated. It's not clear to me why.
From your analysis, even the original hg download helper should
generate reproducible archives, right? When I try it several times
tonight, I observe following retrieved hash:

ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has
wrong sha256 hash:
ERROR: expected:
926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
ERROR: got     :
71cab442377987425aa05770d6e5724bcbcdd3ea144e54c63883be8fcebf5644

If there is still a problem with reproducibility for the hg helper, we
are back to fixing that, with the -br1 suffix.

- opentyrian: upstream is dead due to Bitbucket no longer supporting
hg. There seems to be a new (git) upstream:
https://github.com/opentyrian/opentyrian . Perhaps **Julien
Boibessot** is interested in fixing this?

- python-pygame: likewise, new upstream:
https://github.com/pygame/pygame . Also something that Julien could
look at?


> So, the situation with Hg is dire. Basically no one is using Hg *and*
> cares, but you. But as you said on IRC (quoting):
>    "I don't care *enough* about the verbosity of the archive generator"
>
> So...
>
> Applied to master, thanks.
>
> If you ever reconsider, feel free to poke me about the archive format
> version stuff. ;-)

Yes, I think we would better handle it at some point, but now is not a
good time for me.

Thanks,
Thomas
