From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Feb 2016 22:04:36 +0100
Subject: [Buildroot] Speeding up the build.
In-Reply-To: <CAJJ6jxtGOGWOrr9FE8yJSPcSv6ox0LsEHtuBD3LdC2ZS6uHY4Q@mail.gmail.com>
References: <CAJJ6jxtGOGWOrr9FE8yJSPcSv6ox0LsEHtuBD3LdC2ZS6uHY4Q@mail.gmail.com>
Message-ID: <56B50E64.908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-02-16 22:59, Steve Calfee wrote:
> Hi,
> 
> I know buy faster hardware...
> 
> We have the ability to share a common download directory, so multiple
> systems builds can have faster downloads.
> 
> We have the ability to install a pre-build toolchain - that really helps.
> 
> We can have multiple output directories, using the single downloaded
> buildroot directory. Saves git downloading and disk storage.
> 
> Is there any way to share the host built utilities? It could be done
> like using a pre-built toolchain, or some kind of special links for
> output/host. The problem is .../host is splatted right in the middle
> of the dynamic per build output directory. Do these files get changed
> much in normal buildroot use, so they should stay in output?

 Short answer: no it's not possible.

 First of all, at the moment there is no guarantee that the host utilities are
relocatable. There may be absolute paths to the libraries they link with
hardcoded in the binaries. There's a patch series that deals with that issue
(search for rpath on patchwork). It's not likely to get merged before 2016.02.

 Second, we currently have no way of detecting host tools that are already part
of the external toolchain. It is assumed that the external toolchain is nothing
more than gcc, binutils, libc, and kernel headers.

 You could do a hack where you make a tarball of output/build/host-* after
removing the .stamp_host_installed files. But then you run into the issue of
reproducible builds, of course: who guarantees that your host tools will be
built the same under a different configuration?

 It would already become a little more reliable with the per-package staging
patches, if they would be extended to per-package host directories as well. The
patches for that no longer appear in patchwork because they need to be reworked
completely to work with the toolchain wrapper. But Fabio doesn't seem to be
active on that series anymore. You could retrieve the series from [1] and take a
stab at it.

 That series also enables top-level parallel build. That is something that can
cut the build time roughly in half. You can even enable that now already, though
it is risky because you loose reproducible builds again. Search for NOTPARALLEL
in the top-level Makefile and read all the warnings.


 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/project/buildroot/list/?submitter=fabio&state=7



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
