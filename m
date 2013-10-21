From: Anirudha Bose <ani07nov@gmail.com>
Date: Mon, 21 Oct 2013 21:44:23 +0530
Subject: [Buildroot] Reproducing Autobuild errors
In-Reply-To: <CAAXf6LX=3wjYrQvYuCNX4m7hkkR2-bQPO-bThMLRGDyRE8gJ9g@mail.gmail.com>
References: <CA+XvPyxsJ==djC78T2VeP=eFPHSLLfoXxbNerAYSj2i0SPaaKg@mail.gmail.com>
 <CAAXf6LX=3wjYrQvYuCNX4m7hkkR2-bQPO-bThMLRGDyRE8gJ9g@mail.gmail.com>
Message-ID: <CA+XvPyyZkmrbXLW_nAn+0zw9g+oNfPg8ewoqGvf=HZ-uxX2Z2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 21, 2013 at 7:16 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Anirudha,
>
> On Mon, Oct 21, 2013 at 3:00 PM, Anirudha Bose <ani07nov@gmail.com> wrote:
> > Hello everyone.
> >
> > This is the first time I am posting in this mailing list so I would like
> to
> > introduce myself first. My name is Anirudha Bose, and I am an
> undergraduate
> > student doing my major in Computer Science. I am specifically interested
> in
> > contributing to Buildroot because I have done some similar work using M
> > Cross Environment (MXE) during Google Summer of Code 2013.
>
> Welcome! We're looking forward to your contributions...
>
> >
> > For a start I am trying to fix some Autobuild errors. For example if I am
> > trying to fix this error [1]. Here are the steps I did to reproduce the
> > error on my machine.
> >
> > 1. Downloaded the config file and saved it as .config in my buildroot
> dir.
> > 2. Downloaded the Power PC 603e toolchain from this [2] link.
> > 3. I still don't know where to extract and keep this tarball; and what
> > should be the path in the .config file. I also do not know what to do
> with
> > the defconfig file. Should I save it as .defconfig in the buildroot dir?
> > 4. make
>
> We currently have two sources of autobuild results, one from Peter and
> one from Thomas Petazzoni. The autobuild you are referring to is from
> Peter (see the file 'submitter' in the autobuild directory). In these,
> the toolchain is not configured as a 'toolchain to be downloaded'
> (which is the case for Thomas Petazzoni's autobuild results).
>
> In the last case (Thomas Petazzoni), you don't have to download the
> tarball manually. In this case, the easiest way (according to me) to
> reproduce an autobuild failure is to download the defconfig file, and
> start from that. For example:
>
> cd <your-buildroot-repo>
> wget
> http://autobuild.buildroot.org/results/912/91289fc77e7dc7ed6342414df91c35d78d7eabc2/defconfig
> make defconfig BR2_DEFCONFIG=defconfig
> <make menuconfig, or edit .config: you will need to change BR2_DL_DIR
> to point to something local)
> make
>
> In the case of Peter's autobuild, the above steps will be the same,
> except that you will indeed have to download the toolchain, extract it
> to some location, and update the .config file to point to that
> location in option BR2_TOOLCHAIN_EXTERNAL_PATH. After that you can hit
> 'make'.
>

Thanks a lot for the detailed explanation.

I am however facing some problems getting the right toolchain. Here is what
I did:

1. Downloaded the toolchain from
http://autobuild.buildroot.net/toolchains/tarballs/
2. Extracted it to the location
/home/ani/Downloads/br-powerpc-603e-basic-cpp-2013.05-1/
3. In the .config file I edited this:
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/ani/Downloads/br-powerpc-603e-basic-cpp-2013.05-1"
4. make toolchain trace-cmd

After this I get the following error:

>>> toolchain-external undefined Configuring
Cannot execute cross-compiler
'/home/ani/Downloads/br-powerpc-603e-basic-cpp-2013.05-1/bin/powerpc-linux-gcc'

I think I am using the wrong toolchain. Can you tell me what is the problem?

- Anirudha



> Assuming that the problem is not related to missing dependencies, you
> can get faster results by replacing the 'make' step with 'make
> toolchain <failing-package>', for example 'make toolchain trace-cmd'.
> This last command will only build the 'toolchain' package (that will
> download-if-needed and check the toolchain) and build the trace-cmd
> package and its dependencies. It avoids building other packages from
> the configuration that are not related.
> After the initial 'toolchain' run, you can rebuild trace-cmd from
> scratch (for example after making some changes to the .mk file) using
> 'make trace-cmd-dirclean trace-cmd'
>
>
> >
> > After this I expect to get the same error which I see in the log of
> > autobuild. I intend to fix this by compiling the package which failed
> with
> > an extra CFLAG. So, where am I supposed to make this change?
>
> This should probably be added in package/<pkg>/<pkg>.mk
> Have a look at the buildroot documentation about 'adding packages' for
> more information on this:
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages
>
>
> Note that specifically for trace-cmd, there is already a patch in the
> queue:
> http://patchwork.ozlabs.org/patch/285041/
> I'm not sure if it fixes the mentioned autobuild too, so it's best
> that you first try without that patch to see if you can reproduce the
> problem, then add the patch and see if the problem is gone (after
> cleaning as explained above). If this fixes the problem, then you
> don't need to do further work, but you can reply on that patch with
> 'Tested-by: Your name <e-mail>' to indicate that you tested the patch
> and it works for you. This helps the maintainer in knowing which
> patches are good or not.
>
> Please let us know if we can explain something further.
>
> Best regards,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131021/91ec6a31/attachment-0001.html>
