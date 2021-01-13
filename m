From: Raul Hidalgo Caballero <deinok@deinok.com>
Date: Wed, 13 Jan 2021 08:25:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/dotnet-sdk: new package
In-Reply-To: <20210112161935.17a05101@windsurf.home>
References: <CABWPoFGENs+ze4jdFLHu7TNPTzRQ=D-QEs3gB0DuvmG_t4whow@mail.gmail.com>
 <20210112161935.17a05101@windsurf.home>
Message-ID: <CABWPoFH7vPERPFO6ubJX2Dx8XtRzFRutB5rCsxvdQ2_bAwnH5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I Thomas,

Regarding the Config.in.host being in the dotnet package.
In the future, I expect to add: dotnet-runtime and dotnet-aspnet. They all
share most of the configuration, like the RID (Runtime Identifier,
something like the target triplet) and end exposing the "dotnet" command.
Basically, dotnet-runtime is a subset of dotnet-aspnet, and dotnet-aspnet
is a subset of dotnet-sdk.
I took as a reference the rust packages.

Regarding the tests, I expect to add more tests in the future while I add
support for having the dotnet-sdk as a target package.
Also I expect to add more tests for a bit more complex cases.
So I would like to left the Tests as they are, except for the environment
things that you are right. I'd just took the rust tests as a reference and
I left that env variable.


On Tue, Jan 12, 2021 at 4:19 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Raul,
>
> On Tue, 12 Jan 2021 16:07:23 +0100
> Raul Hidalgo Caballero <deinok@deinok.com> wrote:
>
> > Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
> > ---
> >  DEVELOPERS                                    |  5 ++++
> >  package/Config.in.host                        |  1 +
> >  package/dotnet-sdk/dotnet-sdk.hash            |  3 ++
> >  package/dotnet-sdk/dotnet-sdk.mk              | 20 +++++++++++++
> >  package/dotnet/Config.in.host                 | 15 ++++++++++
>
> Why is this Config.in.host in package/dotnet/ and not
> package/dotnet-sdk/ ?
>
> > diff --git a/package/dotnet-sdk/dotnet-sdk.hash
> > b/package/dotnet-sdk/dotnet-sdk.hash
> > new file mode 100644
> > index 0000000000..a3016b2e49
> > --- /dev/null
> > +++ b/package/dotnet-sdk/dotnet-sdk.hash
> > @@ -0,0 +1,3 @@
> > +sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310
> >  LICENSE.txt
> > +sha256  01564961f8ca9744d0ecc5d3e72d7c1659df95898f3a077fd9140fd4023f3579
> >  ThirdPartyNotices.txt
> > +sha256  23df1eca7eb1302dfb10f4edce7edf7150e57698576f61b2dcb777c833cbd80c
> >  dotnet-sdk-5.0.101-linux-x64.tar.gz
>
> Note: your patch is line-wrapped. Could you use "git send-email" to
> send it ?
>
> > diff --git a/package/dotnet/Config.in.host
> b/package/dotnet/Config.in.host
> > new file mode 100644
> > index 0000000000..90b477a6a1
> > --- /dev/null
> > +++ b/package/dotnet/Config.in.host
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_HOST_DOTNET_ARCH_SUPPORTS
> > +       bool
> > +       default y if BR2_HOSTARCH = "x86_64"
> > +
> > +config BR2_PACKAGE_HOST_DOTNET_RID
> > +       string
> > +       default "linux-x64" if BR2_HOSTARCH = "x86_64"
> > +
> > +config BR2_PACKAGE_HOST_DOTNET_SDK
> > +       bool "host dotnet-sdk"
> > +       depends on BR2_PACKAGE_HOST_DOTNET_ARCH_SUPPORTS
> > +       help
> > +               Dotnet SDK
>
> This is a bit short :-)
>
> > +
> > +               https://dotnet.microsoft.com/
>
> The indentation for the help text is one tab + two spaces. You can run
> "make check-package" to find this kind of coding style details.
>
> > +class TestDotnetSdkBase(infra.basetest.BRTest):
>
> You don't need this "Base" class, since there's only one subclass using
> it.
>
> > +
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        """
> > +        BR2_TARGET_ROOTFS_CPIO=y
> > +        """
> > +
> > +class TestHostDotnetSdk(TestDotnetSdkBase):
>
> Just make this class inherit from infra.basetest.BRTest directly.
>
> > +    config = TestDotnetSdkBase.config + \
> > +        """
> > +        BR2_PACKAGE_HOST_DOTNET_SDK=y
> > +        """
>
> use:
>
>         config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>                 """
>                 BR2_PACKAGE_HOST_DOTNET_SDK=y
>                 BR2_TARGET_ROOTFS_CPIO=y
>                 """
>
> > +    def test_run(self):
> > +        env = os.environ.copy()
>
> Why do we have to do this ? You don't tweak any environment variable.
>
> > +        hostdir = os.path.join(self.builddir, 'host')
> > +        dotnet = os.path.join(hostdir, 'usr', 'bin', 'dotnet')
> > +        cmd = [dotnet, '--version']
> > +        exit_code = subprocess.call(cmd, stdout=self.b.logfile,
> > stderr=self.b.logfile, env=env)
> > +        self.assertEqual(exit_code, 0)
> > --
> > 2.25.1
>
> Otherwise, looks good. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210113/7d0e13b1/attachment.html>
