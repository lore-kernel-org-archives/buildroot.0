From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 22 Mar 2019 11:06:34 +0100
Subject: [Buildroot] [PATCH v2 7/8] testing: test can use the locally
 generated qemu host tool
In-Reply-To: <3979fa63-09f6-c6a9-a90e-a1ba5fa27230@mind.be>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-7-git-send-email-etienne.carriere@linaro.org>
 <CAN5uoS9ZKu4ZS+1qz-Ow4PcNph+LUYJ_gVCBxOo2OEMojUeeMQ@mail.gmail.com>
 <3979fa63-09f6-c6a9-a90e-a1ba5fa27230@mind.be>
Message-ID: <CAN5uoS_LOam9qZ37TdOkfkwAEbuyZZ+nCgHcejEi3nxP00BjfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Mar 2019 at 23:03, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/03/2019 08:05, Etienne Carriere wrote:
> > I made this to allow test_optee to use the qemu config from the platform.
> > But I wonder if it would be more suitable to have an generic option to
> > script run-tests to build the emulator within the test config.
>
>  That would indeed be a better idea IMO.
>
> > -        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
> > +        if local:
> > +            basedir = os.path.join(self.builddir, "host/bin/")
> > +        else:
> > +            basedir = ""
> > +
> > +        qemu_cmd = [basedir + "qemu-system-{}".format(qemu_arch),
> >                      "-serial", "stdio",
> >                      "-display", "none"]
>
>  Instead of constructing it like this, I think it would be simpler to always add
> output/host/bin to PATH. Unfortunately, however, pexpect only respects the PATH
> setting of the env argument since version 4.2.0 [1], and we can't rely on the
> system-installed pexpect to have that version. So you have to mess about with
> os.environ (which you'd want to restore to the original after running qemu).

Playing with the PATH is not very handy and could make the test to use
other thing in output/host/bin than only qemu.
Please see proposal in v3 (here https://patchwork.ozlabs.org/patch/1061031/).

Regards,
etienne

>
>  Regards,
>  Arnout
>
> [1] https://github.com/pexpect/pexpect/pull/348
