From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 19:49:20 -0500
Subject: [Buildroot] [PATCH v2 6/6] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <20180810231852.70f9a004@windsurf>
References: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
 <20180810231852.70f9a004@windsurf>
Message-ID: <CANQCQpbZBRPam3wYMgWeFd7eEMwuCPrDTZ+nP7-U7o1iEZgGSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Fri, Aug 10, 2018 at 4:18 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 16 Jul 2018 22:04:20 -0500, Matt Weber wrote:
>
> > diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
> > new file mode 100644
> > index 0000000000..d3eb0941d3
> > --- /dev/null
> > +++ b/support/testing/tests/core/test_hardening.py
> > @@ -0,0 +1,112 @@
> > +import os
> > +import subprocess
> > +import json
> > +
> > +import infra.basetest
> > +
> > +HARD_DEFCONFIG = \
> > +    """
> > +    BR2_powerpc64=y
> > +    BR2_powerpc_e5500=y
> > +    BR2_TOOLCHAIN_EXTERNAL=y
> > +    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > +    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
> > +    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> > +    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> > +    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > +    BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > +    BR2_PACKAGE_LIGHTTPD=y
> > +    BR2_PACKAGE_HOST_CHECKSEC=y
> > +    # BR2_TARGET_ROOTFS_TAR is not set
> > +    """
> > +
> > +
> > +def checksec_run(builddir, target_file):
> > +    cmd = ["host/bin/checksec", "--output", "json", "--file", target_file]
>
> I'm even more confused now. I thought checksec didn't work in a
> cross-compiled situation. Could you clarify ?

It has some limitations related to FORTIFY checking when being used in
a cross compile configuration (needs to run in the actual filesystem
of the executable to look at the standard libraries).  I can add a
note to state that limitation.  Otherwise it is completely functional
for use against any type of binary as it is using readelf and shell
scripting for ASLR related items.   I'll address more detail in the
other patch adding the tool when we clean that up.

>
> > +    ret = subprocess.check_output(cmd,
> > +                                  stderr=open(os.devnull, "w"),
> > +                                  cwd=builddir,
> > +                                  env={"LANG": "C"})
> > +    return ret
>
> Perhaps this function should also do the json.loads and return only
> out["file"] to avoid duplicating this everywhere in the below classes ?
>
> Also, using inheritance would be better here:
>
> class TestHardeningBase(infra.basetest.BRTest):
>         config = """
> ... the base defconfig ...
> """
>
>         checksec_files = ["usr/sbin/lighttpd", "bin/busybox"]
>
>         def checksec_run(self, target_file):
>                 filepath = os.path.join(self.builddir, "target", target_file)
>                 ...
>
> class TestHardeningRelRo(TestHardeningBase):
>         config = TestHardeningBase.config +
> """
> ...
> """
>
>         def test_run():
>                 for f in checksec_files:
>                         out = self.checksec_run(f)
>                         self.assertEqual(out["relro"], "full")
>                         self.assertEqual(out["pie"], "yes")
>
> and ditto for the other tests.
>

Thanks for the suggestion, I'll take a look at reworking.  My python
intuition isn't the best :-)

Matt
