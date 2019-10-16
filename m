From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Oct 2019 11:50:21 +0200
Subject: [Buildroot] [PATCH 1/4] support/testing: add builtin armv5
 kernel 4.19 with entropy
In-Reply-To: <87zhkqcsz0.fsf@dell.be.48ers.dk>
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
 <20190803052216.22292-2-ricardo.martincoski@gmail.com>
 <87zhkqcsz0.fsf@dell.be.48ers.dk>
Message-ID: <ea8a9022-cab0-a661-54a2-8f5f5b6af9fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Peter,

On 03/08/2019 14:51, Peter Korsgaard wrote:
>>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:
> 
>  > More and more packages being tested by the test infra, e.g. syslog-ng,
>  > need entropy at startup, usually reading from /dev/random.
> 
>  > Some test cases can also depend on a kernel version newer than the
>  > builtin ones already provided by the test infra:
>  >  - 3.11.0 for armv5;
>  >  - 4.0.0 for armv7.
> 
>  > Add a new builtin kernel to be used by such test cases.
>  > Add it for armv5 so most test cases that switch to use this kernel can
>  > keep using BASIC_TOOLCHAIN_CONFIG.
>  > Use the same kernel version and kernel config as qemu_arm_versatile plus
>  > HW_RANDOM_VIRTIO for VirtIORNG to be usable.
>  > Copy the actual binary file from the syslog-ng runtime test at current
>  > master @ 29e1cb8884.
>  > Since there is already a 'kernel-versatile' file and we must keep it
>  > with this name for reproducibility purposes, create a simple naming
>  > convention for newer builtin kernel images and dtb files:
>  > kernel-<defconfig>-<kernel_series_version>
>  > <dtb_name>-<kernel_series_version>.dtb
>  > Pass '-device virtio-rng-pci' to qemu when this kernel is used.
> 
>  > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>  > Cc: Arnout Vandecappelle <arnout@mind.be>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
>  > Cc: Romain Naour <romain.naour@gmail.com>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  >  support/testing/infra/emulator.py | 10 ++++++++++
>  >  1 file changed, 10 insertions(+)
> 
>  > diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
>  > index 3d3e1750c6..29008cb940 100644
>  > --- a/support/testing/infra/emulator.py
>  > +++ b/support/testing/infra/emulator.py
>  > @@ -63,6 +63,16 @@ class Emulator(object):
>  >                      kernel = infra.download(self.downloaddir,
>  >                                              "kernel-versatile")
>  >                      qemu_cmd += ["-M", "versatilepb"]
>  > +            elif kernel == "builtin-4.19":
>  > +                if arch == "armv5":
>  > +                    kernel_cmdline.append("console=ttyAMA0")
>  > +                    kernel = infra.download(self.downloaddir,
>  > +                                            "kernel-versatile-4.19")
>  > +                    dtb = infra.download(self.downloaddir,
>  > +                                         "versatile-pb-4.19.dtb")
>  > +                    qemu_cmd += ["-dtb", dtb]
>  > +                    qemu_cmd += ["-M", "versatilepb"]
>  > +                    qemu_cmd += ["-device", "virtio-rng-pci"]
> 
> Committed after changing the logic to use this for builtin/armv5
> instead, thanks.

 Could you backport this to 2019.02.x? Lots of runtime tests are still failing
due to timeout in 2019.02.6 [1] and I think that would be fixed with this commit.


 Regards,
 Arnout

[1] https://gitlab.com/buildroot.org/buildroot/pipelines/86342478
(take a long time to load!)
