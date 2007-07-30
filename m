From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 14:43:23 +0200
Subject: [Buildroot] Qtopia4 fails building - target stage tries to
	run	target binaries on build machine
In-Reply-To: <1185796725.27015.7.camel@localhost.localdomain>
References: <1185796725.27015.7.camel@localhost.localdomain>
Message-ID: <20070730124323.GA25065@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 01:58:45PM +0200, Hans-Christian Egtvedt wrote:
>I am trying to look into how to "fix" Qtopia 4 in Buildroot, at least it
>does not compile for me (snapshot 20070717).
>
>The makefile seems to generate target specific binaries in build_<arch>
>directory, and host specific binaries in toolchain_build_<arch>.
>
>As I understand the toolchain_build_<arch> binaries should be installed
>to $(STAGING_DIR) and the build_<arch> binaries should be installed to
>$(TARGET_ROOT)?

I don't think that this is an accurate description.

<p>
The staging_dir is holding intermediate files (headers, libraries) that
are prerequisites of other packages.
The target_dir is the final root filesystem. The target_dir will usually
not contain headers nor intermediate libraries (.ar archives or
intermediate libs) that are not needed on the target.
</p>
Helper applications that are ment to be run on the host are compiled in
&lt;packagename&gt;-host while cross-compiled packages, libraries,
binaries are compiled in &lt;packagename&gt;.
<br>
The host-binaries will either be ran directly in the place they were
compile or will be installed into toolchain_build_ARCH/bin .
Applications that are ment to be run on the host but have prerequisites
that are built in buildroot shall use the &lt;packagename&gt;-host
directories for the prerequisite libraries, if possible (e.g.
<code>--with-gettext=/there/toolchain_build_i386/gettext-0.00-host</code>
)
If a prerequisite host-library has to be installed before it can be
used, then it should be installed into target_dir_ARCH/packagename
(e.g. libgmp which is needed for the cross-compiler:
--with-gmp=/there/toolchain_build_i386/gmp).
>
>Have I understood the build setup correctly?

See
http://buildroot.uclibc.org/buildroot.html
and look for "staging_dir"

Perhaps somebody will flesh out the above and add it to the
abovementioned URL (don't have time ATM).

HTH,
