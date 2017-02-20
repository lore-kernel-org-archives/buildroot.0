From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Feb 2017 00:46:06 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170220094443.01a75e76@free-electrons.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219211718.42744cc8@free-electrons.com>
 <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
 <CAFSsvmrv9m80RA+tc5YMwgbLpHs8-R0hw4ivmxHiNo++Nnyujg@mail.gmail.com>
 <20170220094443.01a75e76@free-electrons.com>
Message-ID: <bb41bc83-c67e-0407-4847-3a004c4827e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-02-17 09:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 19 Feb 2017 17:41:07 -0500, Adam Duskett wrote:
[snip]
>> I was thinking, would it be possible to run pypi as a host?
> 
> Because:
> 
>  - No reproducibility (pypi downloads the latest available versions of
>    the modules, as far as I know)
> 
>  - No integration with our download logic: use of a primary mirror, use
>    of a backup mirror, local cache of downloads.
> 
>  - No integration with our legal information tooling.

 Note that none of these issues are unsolvable. If we would be able to make
direct use of pypi while overcoming these issues, I think that would be great.
However, there are a few other important things to consider:

- The infra should deal with dependencies, i.e. download all dependencies when
doing 'make source'.

- The infra should deal with non-python dependencies, i.e. select the
corresponding Buildroot package in .config and make sure it is built before.

- The infra should make sure that any C extensions contained in the package are
built with the proper cross-compiler and build option.


 I think it practice this will mean that the infra is going to be limited to
pure Python packages, and any package which has C code needs an explicit
Buildroot package.

 But even then, it's not easy because the PyPI metadata doesn't encode
dependencies by itself - this is only in the setup file. So the download step
has to extract the downloaded file to find out about dependencies and download
those as well...

 Bottom line: it's not simple :-)

 Note that

- the same story applies to other "language" package managers (luarocks, CPAN,
rebar, cargo, npm, ...);

- other distros are struggling with the similar issues, and for them it's easier
because they actually _can_ download and build on the target.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
