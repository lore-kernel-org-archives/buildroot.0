From: John Keeping <john@metanate.com>
Date: Thu, 12 Nov 2020 20:03:26 +0000
Subject: [Buildroot] [RFC PATCH] toolchain/toolchain-wrapper: remove
 --build-id=none option
In-Reply-To: <20201112110717.634931e0.john@metanate.com>
References: <20201111194840.2949984-1-john@metanate.com>
 <20201111205816.GD3971474@scaer>
 <20201112110717.634931e0.john@metanate.com>
Message-ID: <20201112200326.4e6f5708.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Nov 2020 11:07:17 +0000
John Keeping <john@metanate.com> wrote:

> On Wed, 11 Nov 2020 21:58:16 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > However, I would still doubt that build-ids are reproducible, even when
> > explicitly set to 'sha1', which has been the default since 2007 now, and
> > given that the commit referenced above was done because indeed they were
> > not reproducible...
> 
> The comment on that commit says it's about building in different output
> directories, but commit 71d6901 a month later added -ffile-prefix-map
> (or overrides of __FILE__/__BASE_FILE__ for older compilers), so perhaps
> that has resolved the problem that b285c80143 saw?
> 
> I ran two builds (admittedly of a minimal configuration - although it
> does include libmount.so.1.1.0 which is referenced in the snippet below)
> and the only differences I saw were in .pyc files which seems to be a
> result of https://bugs.python.org/issue37596 - I'm planning to
> experiment with exporting PYTHONHASHSEED when BR2_REPRODUCIBLE is set to
> see if that works around the issue here.

I've done some more testing on this and unfortunately building in a
different directory does lead to non-reproducible output, including of
build-ids.

For the build-id, the issue is that .symtab includes STT_FILE references
to crti.o & crtn.o (and possibly start.o and others for executables) by
absolute path.  These entries are removed by strip(1) so the end result
doesn't include it, but it seems that this is part of the content used
to generate the build-id.

Weirdly, I don't see that for x86_64 but I do for ARM32.

However, ignoring build-ids, building in a different directory (or at
least a directory with a different path length) leads to other
differences in the output.  I see output like:

	-  [ 6] .dynstr           STRTAB          00010f10 000f10 0006dc 00   A  0   0  1
	+  [ 6] .dynstr           STRTAB          00010f10 000f10 0006dd 00   A  0   0  1

where the size differs by one (because my build directories happened to
differ in length by one I think) and then the offsets of everything else
are shifted correspondingly.

The diff for .dynstr there is:

	# readelf --wide --decompress --hex-dump=.dynstr {}
	@@ -105,9 +105,9 @@
	   0x00011570 005f5f6c 6962635f 73746172 745f6d61 .__libc_start_ma
	   0x00011580 696e0073 7973636f 6e660047 4c494243 in.sysconf.GLIBC
	   0x00011590 5f322e34 00474c49 42435f32 2e323800 _2.4.GLIBC_2.28.
	   0x000115a0 00585858 58585858 58585858 58585858 .XXXXXXXXXXXXXXX
	   0x000115b0 58585858 58585858 58585858 58585858 XXXXXXXXXXXXXXXX
	   0x000115c0 58585858 58585858 58585858 58585858 XXXXXXXXXXXXXXXX
	   0x000115d0 58585858 58585858 58585858 58585858 XXXXXXXXXXXXXXXX
	-  0x000115e0 58585858 58585858 58585800          XXXXXXXXXXX.
	+  0x000115e0 58585858 58585858 58585858 00       XXXXXXXXXXXX.

So it looks like if the build path is different, then there will be
differences in the output independent of the build-id,

My conclusion from this is that BR2_REPRODUCIBLE is more broken than I
thought :-(   But build-id is not itself a problem as far as I can tell
- when the build-id is different then generally there is also some other
difference in the file (even when stripped).


John
