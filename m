From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 22:24:55 +0100
Subject: [Buildroot] [RFC 0/4] legal-info: save the external-toolchain
 source archive
In-Reply-To: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <54CFEB27.7060404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/01/15 12:43, Luca Ceresoli wrote:
[snip]
> The current solution works, but it shows some drawbacks.
> 
> First, the "actual source" is downloaded by 'make legal-info', not 'make
> source'. This might be good for most users: after all, you don't need the
> toolchain source code for daily development, only when releasing. These files
> are large, hundreds of MBs, so saving time and bandwidth seems nice. however,
> this diverges from the well-defined feature of 'make source', which is
> supposed to download everything needed to later work offline.

 I think that 'make legal-info' is indeed sufficiently different from the
'normal build' that it is OK for it to not be covered by 'make source'. So I
wouldn't worry about this drawback.



> Additionally, there's no "actual" version of FOO_EXTRA_DOWNLOADS. Thus
> Blackfin toolchains, which use that feature, cannot habdled in a complete way.
> Of course adding TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_EXTRA_DOWNLOADS is possible,
> but I wonder if we want to add so any variables to the package infra.

 I think it would be pretty easy for FOO_ACTUAL_SOURCE to be a list of files
rather than a single file, and that would nicely work around this issue.


> Finally, there is no provision for extracting the license files from the
> downloaded tarball, which would be a nice addition.

 But that's also something that could easily be added later. And actually, I
would expect that there would be a license file in the binary tarball already.
For instance, for the Sourcery toolchains it seems to be in
share/doc/<tuple>/LICENSE.txt - although that text turns out to be pretty bogus,
it doesn't even contain a reference to the GPL...


> 
> Overall, if we want this feature to complete and well-done, I feel it might
> be a bit awkward and complex. Especially because this is done for one package
> only.
> 
> It would be interesting to try a totally different implementation that does
> not touch the generic package infra, but does all in hooks inside the
> toolchain-external package. I haven't had a look at it, but it might be
> simpler and maybe implement EXTRA_DOWNLOADS in a nice way as well.

 Actually, yes, it would be a lot simpler with PRE_LEGAL_INFO_HOOKS. And then it
is also possible to extract the source tarball(s) in the build directory and
extract the license files.


 Regards,
 Arnout


> That's all folks, here's the code. Be aware that it still misses docs and some
> toolchains are not yet implemented (musl, Blackfin).
> 
> Regards,
> Luca
> 
> [1] http://www.elinux.org/Buildroot:DeveloperDaysELCE2014#State_of_legal-info_infrastructure.2C_improvements_to_be_made.3F
> 
> Luca Ceresoli (4):
>   legal-info: remove FOO_MANIFEST_TARBALL and FOO_MANIFEST_SITE defaults
>   legal-info: allow to declare the actual sources for binary packages
>   toolchain-externel: mass-define actual source tarball for known
>     patterns
>   toolchain-external: define actual sources for arago toolchains
> 
>  Makefile                                           |  1 -
>  package/pkg-generic.mk                             | 25 ++++++++++++++++------
>  toolchain/toolchain-external/toolchain-external.mk | 10 +++++++++
>  3 files changed, 28 insertions(+), 8 deletions(-)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
