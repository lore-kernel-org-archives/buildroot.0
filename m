From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 20:13:00 -0200
Subject: [Buildroot] [PATCH 3/5] support/testing/infra/emulator.py:
 support aarch64
References: <1542150146-12188-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bef40ec4534b_55dd3fae540e463c159d7@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Thomas

On Tue, Nov 13, 2018 at 09:02 PM, Matt Weber wrote:

>  - Add the condition under the -kernel assignment for aarch64
>  - Tested with a defconfig simliar to qemu_aarch64_virt_defconfig

s/simliar/similar

> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/infra/emulator.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index 802e89d..8e5a7e9 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -62,7 +62,9 @@ class Emulator(object):
>                      kernel = infra.download(self.downloaddir,
>                                              "kernel-versatile")
>                      qemu_cmd += ["-M", "versatilepb"]
> -
> +            elif arch == "aarch64":
> +                kernel_cmdline.append("console=ttyAMA0")
> +                qemu_cmd += ["-M", "virt", "-cpu", "cortex-a53"]

We don't really need this code here.
You could do this in the test case:

self.emulator.boot(arch="aarch64",
                   kernel=kern,
                   kernel_cmdline=["console=ttyAMA0"],
                   options=["-M", "virt", "-cpu", "cortex-a53", "-m", "512", "-initrd", img])

If we think more and more test cases would need/want this we could add this
here, preferably as a "builtin" pre-compiled kernel for aarch64.

But for now, I suggest to move this code to the test case.


Regards,
Ricardo
